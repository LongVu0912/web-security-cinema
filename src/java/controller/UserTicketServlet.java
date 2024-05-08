package controller;

import business.Customer;
import business.Invoice;
import data.CookieUtil;
import data.CustomerDB;
import data.InvoiceDB;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

@WebServlet(name = "UserTicketServlet", urlPatterns = { "/ticket" })
public class UserTicketServlet extends HttpServlet {

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/ticket.jsp";

    // Get user from session
    HttpSession session = request.getSession();
    final Object lock = request.getSession().getId().intern();
    Customer customer;

    // Get customer from session
    synchronized (lock) {
      customer = (Customer) session.getAttribute("customer");
    }

    // Dont have in session? check in cookie
    if (customer == null) {
      // Get all cookies
      Cookie[] cookies = request.getCookies();
      String customerId = CookieUtil.getCookieValue(cookies, "customerId");

      if (customerId.isEmpty() || customerId == null) {
        // check if customerId not exist in cookie --> redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
        return;
      } else {
        // if contain cookie --> move to page
        customer = CustomerDB.selectCustomer_byId(customerId);
      }
    }

    String customerId = customer.getCustomerId();
    // Select all ticket with this customerId
    List<Invoice> invoices = InvoiceDB.selectInvoices(customerId);

    // Query all ticket with this customerId
    request.setAttribute("invoices", invoices);

    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void refund(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/ticket.jsp";

    Customer customer = (Customer) request.getSession().getAttribute("customer");
    String InvoiceID = request.getParameter("InvoiceID");
    Invoice invoice = InvoiceDB.selectInvoice(InvoiceID);

    if (invoice == null) {
      response.sendRedirect(request.getContextPath() + "/ticket");
      return;
    }

    // compare with current date
    Date showtimeDate = invoice.getTickets().get(0).getShowtime().getDate();

    // Get the date two days from now
    LocalDate twoDaysFromNow = LocalDate.now().plusDays(2);

    // cannot refund if exceed 2 days before
    if (showtimeDate.before(Date.valueOf(twoDaysFromNow))) {
      request.setAttribute("state", "fail");
      request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
      request.getRequestDispatcher("/ticket.jsp").forward(request, response);
      return;
    }

    double refundTotal = invoice.getTotalPrice();
    InvoiceDB.delete(invoice);

    customer.setBalance(customer.getBalance() + refundTotal);
    CustomerDB.update(customer);

    request.setAttribute("state", "success");
    request.setAttribute("invoices", InvoiceDB.selectInvoices(customer.getCustomerId()));
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
    this.refund(request, response);
  }
}
