package data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import business.ShowTime;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class ShowTimeDB {

  public static void insert(ShowTime showtime) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(showtime);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(ShowTime showTime) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(showTime));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(ShowTime showTime) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(showTime);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static ShowTime selectShowTime(String showTimeID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s "
        + "WHERE s.showtimeId = :showTimeID";

    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);
    q.setParameter("showTimeID", showTimeID);

    try {
      ShowTime showTime = q.getSingleResult();
      return showTime;
    } catch (Error | NoResultException e) {
      System.out.println(e);
      return null;
    } finally {
      em.close();
    }
  }

  public static List<Date> selectComingDate_byMovieId(String movieID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT DISTINCT s.date FROM ShowTime s "
        + "WHERE (s.movie.movieID = :movieID AND s.date > :currentDate AND s.date < :nextWeek) "
        + "OR (s.movie.movieID = :movieID AND s.date = :currentDate AND s.startTime >= :currentTime)"
        + "ORDER BY s.date";

    TypedQuery<Date> q = em.createQuery(qString, Date.class);
    q.setParameter("movieID", movieID);
    q.setParameter("currentDate", Date.valueOf(LocalDate.now()));
    q.setParameter("currentTime", Time.valueOf(LocalTime.now()));

    q.setParameter("nextWeek", Date.valueOf(LocalDate.now().plusWeeks(1)));

    List<Date> dates;

    try {
      dates = q.getResultList();
      if (dates == null || dates.isEmpty()) {
        dates = null;
      }
    } finally {
      em.close();
    }
    return dates;
  }

  public static List<ShowTime> selectComingShowTime_ByMovieID(String movieID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT DISTINCT s FROM ShowTime s "
        + "WHERE (s.movie.movieID = :movieID AND s.date > :currentDate AND s.date < :nextWeek) "
        + "OR (s.movie.movieID = :movieID AND s.date = :currentDate AND s.startTime >= :currentTime) "
        + "ORDER BY s.date, s.startTime";

    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);
    q.setParameter("movieID", movieID);
    q.setParameter("currentDate", Date.valueOf(LocalDate.now()));
    q.setParameter("nextWeek", Date.valueOf(LocalDate.now().plusWeeks(1)));
    q.setParameter("currentTime", Time.valueOf(LocalTime.now()));

    List<ShowTime> showtimes;
    try {
      showtimes = q.getResultList();
      if (showtimes == null || showtimes.isEmpty()) {
        showtimes = null;
      }
    } finally {
      em.close();
    }
    return showtimes;
  }

  public static List<ShowTime> selectShowTimes() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s";
    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);

    List<ShowTime> showTimes;
    try {
      showTimes = q.getResultList();
      if (showTimes == null || showTimes.isEmpty()) {
        showTimes = null;
      }
    } finally {
      em.close();
    }
    return showTimes;
  }

  public static List<ShowTime> selectShowTimesByName(String movieName) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s JOIN s.movie m WHERE m.title LIKE :movieName";
    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);
    q.setParameter("movieName", "%" + movieName + "%");

    List<ShowTime> showTimes;
    try {
      showTimes = q.getResultList();
      if (showTimes == null || showTimes.isEmpty()) {
        showTimes = null;
      }
    } finally {
      em.close();
    }
    return showTimes;
  }

  public static int countTotalShowtimes() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s";
    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);

    List<ShowTime> showtimes;
    try {
      showtimes = q.getResultList();
      if (showtimes == null || showtimes.isEmpty()) {
        showtimes = null;
      }
    } finally {
      em.close();
    }
    return showtimes.size();
  }
}
