package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.orderItem.OrderItem;
import de.niklasfulle.bikestore.business.orderItem.OrderItemService;

/**
 * This class is part of the view layer. The OrderItemController works with the OrderItemService to
 * provide the data of the orderItem entity to the view.
 */
@Named
@RequestScoped
public class OrderItemController {

  // Services
  @Inject
  OrderItemService orderItemService;

  // Methods

  /**
   * This method is used to save a new orderItem.
   */
  public void saveOrderItem(OrderItem orderItem) {
    orderItemService.save(orderItem);
  }

  /**
   * This method is used to remove a orderItem.
   */
  public void removeOrderItem(Integer orderItemId) {
    orderItemService.remove(orderItemId);
  }

  /**
   * Gives all orderItems of an order.
   *
   * @param orderId id of Order
   * @return all orderItems of an order
   */
  public List<OrderItem> getAllOrderItemsById(int orderId) {
    return orderItemService.getAllOrderItemsById(orderId);
  }
}
