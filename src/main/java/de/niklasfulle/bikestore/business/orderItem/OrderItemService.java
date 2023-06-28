package de.niklasfulle.bikestore.business.orderItem;

import java.util.List;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import de.niklasfulle.bikestore.business.order.Order;

/**
 * The OrderItemService class is responsible for the processing of the data of
 * the OrderItem Entity. It is used to communicate with the database.
 */
@Stateless
public class OrderItemService {
  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the OrderItem in the database through the EntityManager.
   *
   * @param orderItem the OrderItem to be saved
   */
  public void save(OrderItem orderItem) {
    em.persist(orderItem);
  }

  /**
   * Removes OrderItem from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param orderItemId id of OrderItem
   */
  public void remove(Integer orderItemId) {
    OrderItem toRemove = em.find(OrderItem.class, orderItemId);
    try {
      em.remove(toRemove);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the orderItem");
    }
  }

  /**
   * Gets the OrderItem from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param orderItemId id of OrderItem
   */
  public OrderItem getOrderItem(Integer orderItemId) {
    return em.find(OrderItem.class, orderItemId);
  }

  /**
   * Returns all OrderItems from the Order with the given id. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param orderId id of Order
   * @return List of OrderItems
   */
  public List<OrderItem> getAllOrderItemsById(int orderId) {
    Order order = em.find(Order.class, orderId);
    // Count the orders with the orderItem is used as foreign key
    return em.createQuery("select oi FROM OrderItem oi WHERE oi.order = :order", OrderItem.class)
        .setParameter("order", order)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

}
