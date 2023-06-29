package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.orderItem.OrderItemService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;

/**
 * This class is part of the view layer. The OrderItemController works with the OrderItemService to
 * provide the data of the orderItem entity to the view.
 */
@Named
@RequestScoped
public class OrderItemController {

  // Services
  @Inject
  private OrderItemService orderItemService;
}
