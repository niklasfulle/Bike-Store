package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.orderItem.OrderItem;
import de.niklasfulle.bikestore.business.orderItem.OrderItemService;

/**
 * This class is part of the view layer. The OrderItemController works with the
 * OrderItemService to provide the data of the orderItem entity to the view.
 */
@Named
@RequestScoped
public class OrderItemController {
  // Services
  @Inject
  private OrderItemService orderItemService;
}
