package data;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import business.Customer;
import business.Movie;

import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_DRIVER;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_PASSWORD;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_URL;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_USER;

public class PopulateDatabase {

  private static EntityManagerFactory emf;

  public static void insertProduct(Customer user) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(user);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      em.close();
    }
  }

  public static void insertMovie(Movie movie) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(movie);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      em.close();
    }
  }

  public static void main(String[] args) {
    Map<String, String> props = new HashMap<>();
    props.put(JDBC_DRIVER, "org.postgresql.Driver");
    props.put(JDBC_URL, "jdbc:postgresql://dpg-cohnb9ljm4es739bqi20-a.singapore-postgres.render.com/db_cinema_afxs");
    props.put(JDBC_USER, "admin");
    props.put(JDBC_PASSWORD, "SdHwgrWQ6HG8OLC0iivcdvAL3N0LHsda");

    emf = Persistence.createEntityManagerFactory("CinemaPU", props);
  }
}
