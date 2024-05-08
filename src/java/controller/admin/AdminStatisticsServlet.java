package controller.admin;

import data.MovieDB;
import data.ShowTimeDB;
import data.TicketDB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminSeatClassServlet", urlPatterns = { "/admin/statistics" })
public class AdminStatisticsServlet extends HttpServlet {

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/statistics.jsp";

    // Calculate the total revenue from all tickets
    int totalRevenue = TicketDB.CountTotalRevenue();
    request.setAttribute("totalRevenue", totalRevenue);

    // Count the total number of tickets
    int totalTickets = TicketDB.CountTotalTickets();
    request.setAttribute("totalTickets", totalTickets);

    // Count the total number of showtimes
    int totalShowtimes = ShowTimeDB.countTotalShowtimes();
    request.setAttribute("totalShowtimes", totalShowtimes);

    // Count the total number of tickets
    int totalMovies = MovieDB.countTotalMovies();
    request.setAttribute("totalMovies", totalMovies);

    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    this.show(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

  }
}
