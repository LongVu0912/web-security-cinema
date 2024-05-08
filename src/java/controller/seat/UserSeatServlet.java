package controller.seat;

import business.Customer;
import business.Invoice;
import business.SeatClass;
import business.ShowTime;
import business.Ticket;
import data.SeatClassDB;
import data.CustomerDB;
import data.InvoiceDB;

import data.ShowTimeDB;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserSeatServlet", urlPatterns = { "/showing/film/seat" })
public class UserSeatServlet extends HttpServlet {

  protected void bookingSeats(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // Check CSRF token
    String submittedToken = request.getParameter("csrfToken");
    String sessionToken = (String) request.getSession().getAttribute("csrfToken");

    if (sessionToken == null || !sessionToken.equals(submittedToken)) {
      // CSRF attack detected, reject the request
      response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF attack detected.");
      return;
    }

    // Get customer
    HttpSession session = request.getSession();
    final Object lock = request.getSession().getId().intern();

    // Get seats
    String numbersString = request.getParameter("seatNumbers");

    // ensure user choose at least seat
    if (numbersString.isEmpty()) {
      session.setAttribute("state", "empty_seat");
      response.sendRedirect(request.getHeader("Referer"));
      return;
    }

    String[] seatNumbersArray = numbersString.split(",");
    int[] seatNumbersInt = Arrays.stream(seatNumbersArray).mapToInt(Integer::parseInt).toArray();

    Customer customer;
    synchronized (lock) {
      customer = (Customer) session.getAttribute("customer");
    }

    // Not exist customer --> login
    if (customer == null) {
      // Redirect to home page
      response.sendRedirect(request.getHeader("Referer"));
      return;
    }

    // Get showtime
    String showtimeId = request.getParameter("showtimeId");
    ShowTime showtime = ShowTimeDB.selectShowTime(showtimeId);

    // Create invoice
    Invoice invoice = new Invoice();
    invoice.setCustomer(customer);
    invoice.setboughtDate(Date.valueOf(LocalDate.now(ZoneId.of("Asia/Ho_Chi_Minh"))));
    invoice.setTickets(new ArrayList<Ticket>());

    // Create ticket and add to the new invoice
    for (int seatNumber : seatNumbersInt) {
      Ticket ticket = new Ticket();
      ticket.setInvoice(invoice);
      ticket.setSeatNumber(seatNumber);
      ticket.setShowtime(showtime);

      // Determine seat class based on seat number
      int seatClassId = (seatNumber >= 31 && seatNumber <= 60) ? 3 : 2;
      SeatClass seatClass = SeatClassDB.selectSeatClass(seatClassId);
      ticket.setSeatClass(seatClass);

      invoice.getTickets().add(ticket);
    }

    List<Ticket> tickets = invoice.getTickets();

    // Insert tickets
    // Update the invoice with the tickets
    // Check if customer has enough balance
    try {
      // Check if customer has enough balance
      double total = invoice.getTotalPrice();
      if (customer.getBalance() >= total) {
        double newBalance = customer.getBalance() - total;
        customer.setBalance(newBalance);
        CustomerDB.update(customer);

        // add tickets to invoice
        invoice.setTickets(tickets);
        InvoiceDB.insert(invoice);

        session.setAttribute("state", "book_success");

        // Forward to the same page
      } else {
        tickets = null; // remove tickets
        invoice = null; // remove invoice
        session.setAttribute("state", "book_fail");
      }

      response.sendRedirect(request.getHeader("Referer"));

    } catch (Exception e) {
      // Log the exception
      e.printStackTrace();

      session.setAttribute("state", "seat_booked");
      // Redirect to home page
      response.sendRedirect(request.getHeader("Referer"));
    }

  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/seat.jsp";
    String showtimeId = request.getParameter("showtimeId");
    ShowTime showtime = ShowTimeDB.selectShowTime(showtimeId);

    if (showtime == null) {
      response.sendRedirect(request.getContextPath() + "/showing");
      return;
    }

    List<Ticket> chosenSeats = showtime.getTickets();

    request.setAttribute("showtime", showtime);
    request.setAttribute("chosenSeats", chosenSeats);
    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String csrfToken = UUID.randomUUID().toString();
    request.getSession().setAttribute("csrfToken", csrfToken);
    this.show(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getParameter("action");
    if ("bookingSeats".equals(action)) {
      this.bookingSeats(request, response);
    }
  }
}
