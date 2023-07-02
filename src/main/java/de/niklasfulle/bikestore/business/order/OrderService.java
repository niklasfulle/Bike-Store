package de.niklasfulle.bikestore.business.order;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * The OrderService class is responsible for the processing of the data of the Order Entity. It is
 * used to communicate with the database.
 */
@Stateless
public class OrderService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Order in the database through the EntityManager.
   *
   * @param order the Order to be saved
   */
  public Order save(Order order) {
    em.persist(order);
    return order;
  }

  /**
   * Updates Order in the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The order is updated by setting the new values. The EntityManager
   * is flushed to save the changes. If the order is not found, it will not be updated.
   *
   * @param orderId id of Order to be updated
   */
  public void update(Integer orderId, Integer orderStatus, Date shippedDate, Date requiredDate) {
    Order toUpdate = em.find(Order.class, orderId);

    try {
      em.merge(toUpdate);
      toUpdate.setOrderStatus(orderStatus);
      if (shippedDate != null) {
        toUpdate.setShippedDate(shippedDate);
      }
      if (requiredDate != null) {
        toUpdate.setRequiredDate(requiredDate);
      }
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the order");
    }
  }

  /**
   * Removes Order from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param orderId id of Order
   */
  public void remove(Integer orderId) {
    Order toRemove = em.find(Order.class, orderId);

    try {
      em.merge(toRemove);
      toRemove.setOrderStatus(3);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the order");
    }
  }

  /**
   * Gets the Order from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param orderId id of Order
   */
  public Order getOrder(Integer orderId) {
    return em.find(Order.class, orderId);
  }

  /**
   * Receives all orders from the database.
   *
   * @return A list of all orders
   */
  public List<Order> getAllOrders() {
    return em.createQuery("SELECT o FROM Order o ORDER BY o.orderId ASC", Order.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all orders from the database, page and offset needed to calculate the final offset. If
   * the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the orders are sorted
   * @param search the search key
   * @return A list of all orders
   */
  public List<Order> getAllOrders(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // The order is mapped to the correct column name.
    String orderBy = mapOrderOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT o FROM Order o WHERE o.customer.firstName LIKE :searchTerm OR o.customer.lastName LIKE :searchTerm OR o.staff.firstName LIKE :searchTerm OR o.staff.lastName LIKE :searchTerm ORDER BY "
                  + orderBy,
              Order.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT o FROM Order o ORDER BY " + orderBy, Order.class)
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
  private String mapOrderOrderBy(String order) {
    return switch (order) {
      case "customer" -> "o.customer ASC";
      case "staff" -> "o.staff ASC";
      case "status" -> "o.orderStatus DESC";
      case "store" -> "o.store ASC";
      default -> "o.orderId ASC";
    };
  }

  /**
   * Counts the orders in the database.
   *
   * @param search the search key
   * @return the count of orders
   */
  public long getOrdersCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT COUNT(o) FROM Order o WHERE o.customer.firstName LIKE :searchTerm OR o.customer.lastName LIKE :searchTerm OR o.staff.firstName LIKE :searchTerm OR o.staff.lastName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(o) FROM Order o", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }
}
