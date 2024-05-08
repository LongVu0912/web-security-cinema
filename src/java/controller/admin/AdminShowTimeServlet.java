package controller.admin;

import business.Movie;
import business.Room;
import business.ShowTime;
import data.MovieDB;
import data.RoomDB;
import data.ShowTimeDB;
import java.io.IOException;

import java.util.List;
import java.sql.Time;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminShowTimeServlet", urlPatterns = { "/admin/showtimes" })
public class AdminShowTimeServlet extends HttpServlet {

  protected void update(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Navigate to edit movie page
    String url = "/admin/showtimes.jsp";
    String action = request.getParameter("action");

    request.setAttribute("action", action);
    request.getRequestDispatcher(url).forward(request, response);
  }

  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/showtimes.jsp";

    List<ShowTime> showTimes = ShowTimeDB.selectShowTimes();
    request.setAttribute("showTimes", showTimes);
    String movieName = request.getParameter("movieName");

    if (movieName != null) {
      showTimes = ShowTimeDB.selectShowTimesByName(movieName);
      request.setAttribute("showTimes", showTimes);      
      request.setAttribute("movieName", movieName);
      request.getRequestDispatcher(url).forward(request, response);
      return;
    }

    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void add(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/showtimes.jsp";

    // get value to choose room and movie
    List<Movie> movies = MovieDB.selectMovies();
    request.setAttribute("movies", movies);
    List<Room> rooms = RoomDB.selectRooms();
    request.setAttribute("rooms", rooms);

    request.setAttribute("action", "add");
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Handle add movie
  protected void addShowTime(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // get value
    String movieID = request.getParameter("movieID");
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    Date date = Date.valueOf(request.getParameter("date"));
    Time time = Time.valueOf(request.getParameter("time") + ":00");
    int price = Integer.parseInt(request.getParameter("price"));

    // set value
    ShowTime showTime = new ShowTime();
    showTime.setPrice(price);
    showTime.setDate(date);
    showTime.setStartTime(time);

    Movie movie = MovieDB.selectMovie(movieID);
    showTime.setMovie(movie);

    Room room = RoomDB.selectRoom(roomNumber);
    showTime.setRoom(room);

    ShowTimeDB.insert(showTime);
    // edirect to movies page
    String showTimePage = request.getRequestURI();
    response.sendRedirect(showTimePage);
  }

  // Handle update movie
  protected void updateShowTime(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // edirect to movies page
    String showTimePage = request.getRequestURI();
    response.sendRedirect(showTimePage);
  }

  // Handle delete movie
  protected void deleteShowTime(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String showTimeID = request.getParameter("showTimeID");

    // handle delete showtime
    ShowTime showTime = ShowTimeDB.selectShowTime(showTimeID);
    ShowTimeDB.delete(showTime);

    // redirect to movies page
    String showTimePage = request.getRequestURI();
    response.sendRedirect(showTimePage);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String action = request.getParameter("action");
    if (null == action) {
      this.show(request, response);
    } else {
      switch (action) {
        case "update" ->
          this.update(request, response);
        case "add" ->
          this.add(request, response);
        default -> {
        }
      }
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    if (null != action) {
      try {
        switch (action) {
          case "update" ->
            this.updateShowTime(request, response);
          case "delete" ->
            this.deleteShowTime(request, response);
          case "add" ->
            this.addShowTime(request, response);
          default -> {
          }
        }
      } catch (Exception e) {
        // Log the exception
        e.printStackTrace();

        request.setAttribute("state", "fail");
        String url = "/admin/showtimes.jsp";
        List<ShowTime> showTimes = ShowTimeDB.selectShowTimes();
        request.setAttribute("showTimes", showTimes);
        
        // Redirect to an error page or back to the form page
        request.getRequestDispatcher(url).forward(request, response);
      }
    }

  }
}
