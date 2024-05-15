package controller;

import business.Customer;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.Movie;
import data.CookieUtil;
import data.CustomerDB;

import data.MovieDB;

import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserServlet", urlPatterns = { "" })
public class UserServlet extends HttpServlet {

  protected void logOut(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    // delete customerId cookies
    Cookie c = new Cookie("customerId", "");
    c.setMaxAge(0);
    c.setHttpOnly(true);
    response.addCookie(c);

    // delete all session
    session.invalidate();

    response.sendRedirect(request.getContextPath() + "/");
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    // Check cookie and assign to session
    Cookie[] cookies = request.getCookies();
    String customerId = CookieUtil.getCookieValue(cookies, "customerId");
    if (customerId != null && !customerId.isEmpty()) {
      // If exist customer Id in cookie ==> create customer obj
      Customer customer = CustomerDB.selectCustomer_byId(customerId);
      session.setAttribute("customer", customer);
      customer = CustomerDB.selectCustomer_byId(customerId);
    }

    String url = "/index.jsp";

    List<Movie> movies = MovieDB.selectTop8Movies();

    request.setAttribute("movies", movies);
    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void addedBalance(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    Customer customer = (Customer) session.getAttribute("customer");

    // Check if customer object is null
    if (customer == null) {
      response.sendRedirect(request.getContextPath() + "/login.jsp");
      return;
    }

    try {
      int addedBalance = Integer.parseInt(request.getParameter("balance"));
      customer.setBalance(customer.getBalance() + addedBalance);

      CustomerDB.update(customer);

      response.sendRedirect(request.getContextPath() + "/");
    } catch (Exception e) {
      // Handle the exception gracefully
      // Log the error for your reference
      e.printStackTrace();
      response.sendRedirect(request.getContextPath() + "/error.jsp");
    }
  }

  protected void changePassword(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    Customer customer = (Customer) session.getAttribute("customer");
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmNewPass = request.getParameter("confirmNewPass");

    try {
      if (!currentPassword.equals(customer.getPassword())) {
        session.setAttribute("state", "inCorrectCurrentPassword");
        response.sendRedirect(request.getHeader("Referer"));

        return;
      } else if (!newPassword.equals(confirmNewPass)) {
        session.setAttribute("state", "inCorrectConfirmPassword");
        response.sendRedirect(request.getHeader("Referer"));

        return;
      } else if (newPassword.equals(currentPassword)) {
        session.setAttribute("state", "samePassword");
        response.sendRedirect(request.getHeader("Referer"));

        return;
      } else {
        customer.setPassword(newPassword);
        session.setAttribute("state", "successChangedPassword");
        CustomerDB.update(customer);
        response.sendRedirect(request.getHeader("Referer"));
      }
    } catch (Exception e) {
      // Log the exception for internal use and debugging
      session.setAttribute("state", "error");
      response.sendRedirect(request.getHeader("Referer"));
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String action = request.getParameter("action");
    String csrfToken = UUID.randomUUID().toString();
    request.getSession().setAttribute("csrfToken", csrfToken);
    // if invoke action logout
    if (action == null) {
      this.show(request, response);
    } else {
      switch (action) {
        case "out" ->
          this.logOut(request, response);
        default -> {
        }
      }
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String action = request.getParameter("action");

    // Check CSRF token
    String submittedToken = request.getParameter("csrfToken");
    String sessionToken = (String) request.getSession().getAttribute("csrfToken");

    if (sessionToken == null || !sessionToken.equals(submittedToken)) {
      // CSRF attack detected, reject the request
      response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF attack detected.");
      return;
    }

    if (null != action) {
      switch (action) {
        case "addBalance" -> {
          this.addedBalance(request, response);
        }
        case "changePassword" -> {
          this.changePassword(request, response);
        }
        default -> {

        }
      }
    }
  }
}
