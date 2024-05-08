package data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import business.Ticket;

public class TicketDB {

  public static void insert(Ticket ticket) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    try {
      trans.begin();
      System.out.println("Try add Ticket");
      em.persist(ticket);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      if (trans.isActive()) {
        trans.rollback();
      }
    } finally {
      em.close();
    }
  }

  public static void update(Ticket ticket) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(ticket);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(Ticket ticket) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(ticket));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static List<Ticket> selectTickets() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT t FROM Ticket t";
    TypedQuery<Ticket> q = em.createQuery(qString, Ticket.class);

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

  public static List<Ticket> selectTicketsByInvoiceID(String InvoiceID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT t FROM Ticket t WHERE t.invoice.invoiceID = :InvoiceID";
    TypedQuery<Ticket> q = em.createQuery(qString, Ticket.class);
    q.setParameter("InvoiceID", InvoiceID);

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

  public static int CountTotalTickets() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT t FROM Ticket t";
    TypedQuery<Ticket> q = em.createQuery(qString, Ticket.class);

    List<Ticket> tickets;
    try {
      tickets = q.getResultList();
      if (tickets == null || tickets.isEmpty()) {
        tickets = null;
      }
    } finally {
      em.close();
    }
    return tickets.size();
  }

  public static int CountTotalRevenue() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT t FROM Ticket t";
    TypedQuery<Ticket> q = em.createQuery(qString, Ticket.class);

    List<Ticket> tickets;
    try {
      tickets = q.getResultList();
      if (tickets == null || tickets.isEmpty()) {
        tickets = null;
      }
    } finally {
      em.close();
    }
    int totalRevenue = 0;
    for (Ticket ticket : tickets) {
      totalRevenue += ticket.getShowtime().getPrice();
    }
    return totalRevenue;
  }
}
