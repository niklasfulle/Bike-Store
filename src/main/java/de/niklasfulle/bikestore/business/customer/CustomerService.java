package de.niklasfulle.bikestore.business.customer;

import java.util.List;
import java.util.Objects;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * The CustomerService class is responsible for the processing of the data of
 * the Customer Entity. It is used to communicate with the database.
 */
@Stateless
public class CustomerService {
  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Customer in the database through the EntityManager.
   *
   * @param customer the Customer to be saved
   */
  public void save(Customer customer) {
    em.persist(customer);
  }

  /**
   * Updates Customer in the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity. The customer is updated by
   * setting the new values. The EntityManager is flushed to save the changes. If
   * the customer is not found, it will not be updated.
   * 
   * @param customerId id of Customer to be updated
   */
  public void update(Integer customerId, String firstName, String lastName, String email,
      String phone, String street, String postalCode, String city, String state) {
    Customer toUpdate = em.find(Customer.class, customerId);

    try {
      em.merge(toUpdate);
      toUpdate.setFirstName(firstName);
      toUpdate.setLastName(lastName);
      toUpdate.setEmail(email);
      toUpdate.setPhone(phone);
      toUpdate.setStreet(street);
      toUpdate.setPostalCode(postalCode);
      toUpdate.setCity(city);
      toUpdate.setState(state);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the customer");
    }
  }

  /**
   * Removes Customer from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param customerId id of Customer
   */
  public void remove(Integer customerId) {
    Customer toBeRemoved = em.find(Customer.class, customerId);

    try {
      em.merge(toBeRemoved);
      em.remove(toBeRemoved);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the customer");
    }
  }

  /**
   * Gets the Customer from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param customerId id of Customer
   */
  public Customer getCustomer(Integer customerId) {
    return em.find(Customer.class, customerId);
  }

  /**
   * Receives all customers from the database.
   *
   * @return A list of all customers
   */
  public List<Customer> getAllCustomers() {
    return em.createQuery("SELECT c FROM Customer c ORDER BY c.customerId ASC", Customer.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all customers from the database, page and offset needed to calculate
   * the final offset. If the Limit is 0 then it will be set 24. If the offset is
   * smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the customers are sorted
   * @param search the search key
   * @return A list of all customers
   */
  public List<Customer> getAllCustomers(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapCustomerOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
          "SELECT c FROM Customer c WHERE c.firstName LIKE :searchTerm OR c.lastName LIKE :searchTerm ORDER BY "
              + orderBy,
          Customer.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT c FROM Customer c ORDER BY " + orderBy, Customer.class)
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    }
  }

  /**
   * Maps the order parameter to the correct column name.
   *
   * @param order the order parameter
   * @return the column name
   */
  private String mapCustomerOrderBy(String order) {
    return switch (order) {
      case "firstName" -> "c.firstName ASC";
      case "lastName" -> "c.lastName ASC";
      case "email" -> "c.email ASC";
      case "phone" -> "c.phone ASC";
      case "street" -> "c.street ASC";
      case "postalCode" -> "c.postalCode ASC";
      case "city" -> "c.city ASC";
      case "state" -> "c.state ASC";
      default -> "c.customerId ASC";
    };
  }

  /**
   * Counts the customers in the database.
   *
   * @param search the search key
   * @return the count of customers
   */
  public long getCustomersCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery(
          "SELECT COUNT(c) FROM Customer c WHERE c.firstName LIKE :searchTerm OR c.lastName LIKE :searchTerm",
          Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(c) FROM Customer c", Long.class).getSingleResult();
    }
  }

  /**
   * Counts the orders where the customer is used as foreign key
   *
   * @param customerId id of Customer
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer customerId) {
    Customer customer = getCustomer(customerId);
    return em.createQuery("SELECT COUNT(o) FROM Order o WHERE o.customer = :customer", Long.class)
        .setParameter("customer", customer)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }
}
