package controller;

import business.Movie;
import data.MovieDB;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserShowingServlet", urlPatterns = { "/showing" })
public class UserShowingServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "/showing.jsp";

    String movieName = request.getParameter("movieName");

    if (movieName != null) {
      // Validate the CSRF token
      String submittedToken = request.getParameter("csrfToken");
      String sessionToken = (String) request.getSession().getAttribute("csrfToken");

      System.out.println(submittedToken);
      System.out.println(sessionToken);

      if (sessionToken == null || !sessionToken.equals(submittedToken)) {
        // CSRF attack detected, reject the request
        response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF attack detected.");
        return;
      }

      List<Movie> movies = MovieDB.selectComingMoviesByName(movieName);
      request.setAttribute("movies", movies);
      request.setAttribute("movieName", movieName);
      request.getRequestDispatcher(url).forward(request, response);
      return;
    }

    // Generate a CSRF token and store it in the session
    String csrfToken = UUID.randomUUID().toString();
    request.getSession().setAttribute("csrfToken", csrfToken);

    List<Movie> movies = MovieDB.selectComingMovies();

    request.setAttribute("movies", movies);

    request.getRequestDispatcher(url).forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

  }
}
