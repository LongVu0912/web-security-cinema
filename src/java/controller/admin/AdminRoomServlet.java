package controller.admin;

import business.Room;
import data.RoomDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminRoomServlet", urlPatterns = { "/admin/rooms" })
public class AdminRoomServlet extends HttpServlet {

  // Navigate to update room page
  protected void update(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/rooms.jsp";

    // get room
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    Room room = RoomDB.selectRoom(roomNumber);

    // put to attribute
    request.setAttribute("room", room);
    request.setAttribute("action", "update");

    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void show(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/rooms.jsp";

    List<Room> rooms = RoomDB.selectRooms();
    request.setAttribute("rooms", rooms);

    request.getRequestDispatcher(url).forward(request, response);
  }

  // Navigate to add movie page
  protected void add(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "/admin/rooms.jsp";

    request.setAttribute("action", "add");
    request.getRequestDispatcher(url).forward(request, response);
  }

  // Handle add movie
  protected void addRoom(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // handle logic
    int maxSeats = Integer.parseInt(request.getParameter("maxSeats"));
    String screenQuality = request.getParameter("screenQuality");

    // set new values
    Room room = new Room();
    room.setMaxSeats(maxSeats);
    room.setScreenQuality(screenQuality);

    // add to DB
    RoomDB.insert(room);

    // redirect to rooms page
    String roomsPage = request.getRequestURI();
    response.sendRedirect(roomsPage);
  }

  // Handle update room
  protected void updateRoom(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String roomsPage = request.getRequestURI();

    // get values
    int roomNumer = Integer.parseInt(request.getParameter("roomNumber"));
    int maxSeats = Integer.parseInt(request.getParameter("maxSeats"));
    String screenQuality = request.getParameter("screenQuality");

    // set new values
    Room room = RoomDB.selectRoom(roomNumer);
    room.setMaxSeats(maxSeats);
    room.setScreenQuality(screenQuality);

    // commit
    RoomDB.update(room);

    response.sendRedirect(roomsPage);
  }

  // Handle delete room
  protected void deleteRoom(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String roomsPage = request.getRequestURI();

    // get values
    int roomNumer = Integer.parseInt(request.getParameter("roomNumber"));
    Room room = RoomDB.selectRoom(roomNumer);

    // delete
    RoomDB.delete(room);

    response.sendRedirect(roomsPage);
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
      switch (action) {
        case "update" ->
          this.updateRoom(request, response);
        case "delete" ->
          this.deleteRoom(request, response);
        case "add" ->
          this.addRoom(request, response);
        default -> {
        }
      }
    }
  }
}
