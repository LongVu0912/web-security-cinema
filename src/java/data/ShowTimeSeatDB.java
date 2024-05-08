package data;

import business.Ticket;
import business.SeatClass;
import javax.persistence.EntityManager;
import java.util.List;
import javax.persistence.TypedQuery;

public class ShowTimeSeatDB {

  public static List<Ticket> getSeatsOfShowTime(String showTimeID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM Ticket s "
        + "WHERE s.showtime.showtimeId = :showTimeID";

    TypedQuery<Ticket> q = em.createQuery(qString, Ticket.class);
    q.setParameter("showTimeID", showTimeID);

    List<Ticket> tickets;
    try {
      tickets = q.getResultList();
      if (tickets == null || tickets.isEmpty()) {
        tickets = null;
      }
    } finally {
      em.close();
    }
    return tickets;
  }

  public static SeatClass getSeatClass(int seatClassID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM SeatClass s "
        + "WHERE s.id = :seatClassID";

    TypedQuery<SeatClass> q = em.createQuery(qString, SeatClass.class);
    q.setParameter("seatClassID", seatClassID);

    SeatClass seatclass;
    try {
      seatclass = q.getSingleResult();
      if (seatclass == null) {
        seatclass = null;
      }
    } finally {
      em.close();
    }
    return seatclass;
  }
}
