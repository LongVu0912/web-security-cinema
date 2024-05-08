package data;

import business.Room;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class RoomDB {

  public static void insert(Room room) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(room);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(Room room) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(room);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(Room room) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(room));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static Room selectRoom(int roomNumber) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT r FROM Room r  "
            + "WHERE r.roomNumber = :roomNumber";
    TypedQuery<Room> q = em.createQuery(qString, Room.class);
    q.setParameter("roomNumber", roomNumber);

    try {
      Room room = q.getSingleResult();
      return room;
    } catch (Error e) {
      System.out.println(e);
      return null;
    } catch (NoResultException e) {
      System.out.println(e);
      return null;
    } finally {
      em.close();
    }
  }

  public static List<Room> selectRooms() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT r FROM Room r";
    TypedQuery<Room> q = em.createQuery(qString, Room.class);

    List<Room> rooms;
    try {
      rooms = q.getResultList();
      if (rooms == null || rooms.isEmpty()) {
        rooms = null;
      }
    } finally {
      em.close();
    }
    return rooms;
  }
}
