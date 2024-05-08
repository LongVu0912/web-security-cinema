package controller.admin;

import business.Movie;
import data.MovieDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.time.LocalTime;

@WebServlet(name = "AdminMovieServlet", urlPatterns = { "/admin/movies" })
public class AdminMovieServlet extends HttpServlet {

  protected void update(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Navigate to edit movie page
    String url = "/admin/movies.jsp";

    String movieID = request.getParameter("movieID");
    Movie movie = MovieDB.selectMovie(movieID);

    request.setAttribute("movie", movie);
    request.setAttribute("action", "update");

    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/movies.jsp";

    List<Movie> movies = MovieDB.selectMovies();
    request.setAttribute("movies", movies);

    String movieName = request.getParameter("movieName");

    if (movieName != null) {
      movies = MovieDB.selectMoviesByName(movieName);
      request.setAttribute("movies", movies);
      request.setAttribute("movieName", movieName);
      request.getRequestDispatcher(url).forward(request, response);
      return;
    }
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void add(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/movies.jsp";

    request.setAttribute("action", "add");
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Handle add movie
  protected void addMovie(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // handle logic
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String mainActor = request.getParameter("mainActor");
    String genre = request.getParameter("genre");
    int mins = Integer.parseInt(request.getParameter("duration"));
    String description = request.getParameter("description");
    String img = request.getParameter("img");

    // handle change min to hh::mm::ss
    Time duration = Time.valueOf(LocalTime.of(mins / 60, mins % 60));

    // update movie
    Movie movie = new Movie();
    movie.setTitle(title);
    movie.setDirector(director);
    movie.setGenre(genre);
    movie.setMainActor(mainActor);
    movie.setImg(img);
    movie.setDuration(duration);
    movie.setDescription(description);

    // commit change
    MovieDB.insert(movie);

    // redirect to movies page
    String moviesPage = request.getRequestURI();
    response.sendRedirect(moviesPage);
  }

  // Handle update movie
  protected void updateMovie(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // handle logic
    String movieID = request.getParameter("movieID");
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String mainActor = request.getParameter("mainActor");
    String genre = request.getParameter("genre");
    int mins = Integer.parseInt(request.getParameter("duration"));
    String description = request.getParameter("description");
    String img = request.getParameter("img");

    // handle change min to hh::mm::ss
    Time duration = Time.valueOf(LocalTime.of(mins / 60, mins % 60));

    // update movie
    Movie movie = MovieDB.selectMovie(movieID);
    movie.setTitle(title);
    movie.setDirector(director);
    movie.setGenre(genre);
    movie.setMainActor(mainActor);
    movie.setImg(img);
    movie.setDuration(duration);
    movie.setDescription(description);

    // commit change
    MovieDB.update(movie);

    String moviesPage = request.getRequestURI();
    response.sendRedirect(moviesPage);
  }

  // Handle delete movie
  protected void deleteMovie(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String movieID = request.getParameter("movieID");
    Movie movie = MovieDB.selectMovie(movieID);

    MovieDB.delete(movie);

    String moviesPage = request.getRequestURI();
    response.sendRedirect(moviesPage);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String action = request.getParameter("action");

    if (null == action) {
      this.show(request, response);
    } else
      switch (action) {
        case "update" -> this.update(request, response);
        case "add" -> this.add(request, response);
        default -> {
        }
      }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    if (null != action)
      switch (action) {
        case "update" -> this.updateMovie(request, response);
        case "delete" -> this.deleteMovie(request, response);
        case "add" -> this.addMovie(request, response);
        default -> {
        }
      }
  }
}
