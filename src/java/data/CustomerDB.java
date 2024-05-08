package data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import business.Customer;

public class CustomerDB {

  public static void insert(Customer customer) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(customer);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(Customer customer) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(customer);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(Customer customer) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(customer));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static Customer selectCustomer(String username, String password) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT c FROM Customer c "
        + "WHERE c.username = :username AND c.password = :password";
    TypedQuery<Customer> q = em.createQuery(qString, Customer.class);
    q.setParameter("username", username);
    q.setParameter("password", password);

    try {
      Customer customer = q.getSingleResult();
      return customer;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static Customer selectCustomer_byId(String customerId) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT c FROM Customer c "
        + "WHERE c.customerId = :customerId";
    TypedQuery<Customer> q = em.createQuery(qString, Customer.class);
    q.setParameter("customerId", customerId);

    try {
      Customer customer = q.getSingleResult();
      return customer;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static List<Customer> selectCustomers() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT c FROM Customer c";
    TypedQuery<Customer> q = em.createQuery(qString, Customer.class);

    List<Customer> customers;
    try {
      customers = q.getResultList();
      if (customers == null || customers.isEmpty()) {
        customers = null;
      }
    } finally {
      em.close();
    }
    return customers;
  }

  public static void updateBalance(Customer customer, double newBalance) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    try {
      trans.begin();
      customer.setBalance(newBalance);
      em.merge(customer);
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

  public static Customer selectCustomerByEmail(String email) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT c FROM Customer c "
        + "WHERE c.email = :email";
    TypedQuery<Customer> q = em.createQuery(qString, Customer.class);
    q.setParameter("email", email);

    try {
      Customer customer = q.getSingleResult();
      return customer;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static Customer selectCustomerByUsername(String userName) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT c FROM Customer c "
        + "WHERE c.username = :userName";
    TypedQuery<Customer> q = em.createQuery(qString, Customer.class);
    q.setParameter("userName", userName);

    try {
      Customer customer = q.getSingleResult();
      return customer;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }
}
