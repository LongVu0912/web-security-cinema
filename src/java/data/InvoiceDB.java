package data;

import business.Invoice;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class InvoiceDB {

  public static void insert(Invoice invoice) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    try {
      trans.begin();
      em.persist(invoice);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void update(Invoice invoice) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.merge(invoice);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(Invoice invoice) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(invoice));
      em.getEntityManagerFactory().getCache().evictAll();
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static Invoice selectInvoice(String invoiceID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT i FROM Invoice i  "
        + "WHERE i.invoiceID = :invoiceID";
    TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
    q.setParameter("invoiceID", invoiceID);

    try {
      Invoice invoice = q.getSingleResult();
      return invoice;
    } catch (NoResultException e) {
      return null;
    } finally {
      em.close();
    }
  }

  public static List<Invoice> selectInvoices() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT i FROM Invoice i";
    TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);

    List<Invoice> invoices;
    try {
      invoices = q.getResultList();
      if (invoices == null || invoices.isEmpty()) {
        invoices = null;
      }
    } finally {
      em.close();
    }
    return invoices;
  }

  public static List<Invoice> selectInvoices(String customerId) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT i FROM Invoice i WHERE i.customer.customerId = :customerId";
    TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);

    q.setParameter("customerId", customerId);

    List<Invoice> invoices;
    try {
      invoices = q.getResultList();
      if (invoices == null || invoices.isEmpty()) {
        invoices = null;
      }
    } finally {
      em.close();
    }
    return invoices;
  }
}
