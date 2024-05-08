package data;

import business.Movie;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class MovieDB {

  public static void insert(Movie movie) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(movie);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(Movie movie) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(movie);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(Movie movie) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(movie));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static Movie selectMovie(String movieID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m  "
        + "WHERE m.movieID = :movieID";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);
    q.setParameter("movieID", movieID);

    try {
      Movie invoice = q.getSingleResult();
      return invoice;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static Movie selectMovie_byTitle(String title) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m  "
        + "WHERE m.title = :title";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);
    q.setParameter("title", title);

    try {
      Movie movie = q.getSingleResult();
      return movie;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static List<Movie> selectComingMovies() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT DISTINCT s.movie FROM ShowTime s "
        + "WHERE (s.date > :currentDate AND s.date < :nextWeek) "
        + "OR (s.date = :currentDate AND s.startTime >= :currentTime)";

    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);

    q.setParameter("currentDate", Date.valueOf(LocalDate.now()));
    q.setParameter("nextWeek", Date.valueOf(LocalDate.now().plusWeeks(1)));
    q.setParameter("currentTime", Time.valueOf(LocalTime.now()));

    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies;
  }

  public static List<Movie> selectMovies() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);

    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies;
  }

  public static List<Movie> selectMoviesByName(String movieName) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m WHERE m.title LIKE :movieName";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);
    q.setParameter("movieName", "%" + movieName + "%");

    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies;
  }

  public static List<Movie> selectTop8Movies() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);
    q.setMaxResults(8);
    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies;
  }

  public static List<Movie> selectComingMoviesByName(String movieName) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT DISTINCT s.movie FROM ShowTime s "
        + "WHERE ((s.date > :currentDate AND s.date < :nextWeek) "
        + "OR (s.date = :currentDate AND s.startTime >= :currentTime)) "
        + "AND LOWER(s.movie.title) LIKE LOWER(:movieName)";

    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);

    q.setParameter("currentDate", Date.valueOf(LocalDate.now()));
    q.setParameter("nextWeek", Date.valueOf(LocalDate.now().plusWeeks(1)));
    q.setParameter("currentTime", Time.valueOf(LocalTime.now()));
    q.setParameter("movieName", "%" + movieName + "%");

    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies;
  }
  public static int countTotalMovies() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT m FROM Movie m";
    TypedQuery<Movie> q = em.createQuery(qString, Movie.class);

    List<Movie> movies;
    try {
      movies = q.getResultList();
      if (movies == null || movies.isEmpty()) {
        movies = null;
      }
    } finally {
      em.close();
    }
    return movies.size();
  }
}
