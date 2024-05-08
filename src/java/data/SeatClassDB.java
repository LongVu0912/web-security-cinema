package data;

import business.SeatClass;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class SeatClassDB {

  public static void insert(SeatClass seatClass) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(seatClass);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(SeatClass seatClass) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(seatClass);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(SeatClass seatClass) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(seatClass));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static SeatClass selectSeatClass(int id) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM SeatClass s  "
        + "WHERE s.id = :id";
    TypedQuery<SeatClass> q = em.createQuery(qString, SeatClass.class);
    q.setParameter("id", id);

    try {
      SeatClass seatClass = q.getSingleResult();
      return seatClass;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static SeatClass selectSeatClass_byCategory(String category) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM SeatClass s  "
        + "WHERE s.category = :category";
    TypedQuery<SeatClass> q = em.createQuery(qString, SeatClass.class);
    q.setParameter("category", category);

    try {
      SeatClass seatClass = q.getSingleResult();
      return seatClass;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static List<SeatClass> selectSeatClasses() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM SeatClass s";
    TypedQuery<SeatClass> q = em.createQuery(qString, SeatClass.class);

    List<SeatClass> seatClasses;
    try {
      seatClasses = q.getResultList();
      if (seatClasses == null || seatClasses.isEmpty()) {
        seatClasses = null;
      }
    } finally {
      em.close();
    }
    return seatClasses;
  }
}
