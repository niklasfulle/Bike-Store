package de.niklasfulle.bikestore.view;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import jakarta.inject.Named;
import java.math.BigDecimal;
import jakarta.inject.Inject;
import java.math.RoundingMode;
import jakarta.faces.context.FacesContext;
import jakarta.faces.component.UIComponent;
import jakarta.validation.constraints.NotNull;
import jakarta.faces.application.FacesMessage;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.validator.ValidatorException;

import de.niklasfulle.bikestore.business.order.Order;
import de.niklasfulle.bikestore.business.product.Product;
import de.niklasfulle.bikestore.business.staff.StaffService;
import de.niklasfulle.bikestore.business.order.OrderService;
import de.niklasfulle.bikestore.business.store.StoreService;
import de.niklasfulle.bikestore.business.orderItem.OrderItem;
import de.niklasfulle.bikestore.business.product.ProductService;
import de.niklasfulle.bikestore.business.orderItem.OrderItemKeys;
import de.niklasfulle.bikestore.business.customer.CustomerService;
import de.niklasfulle.bikestore.business.orderItem.OrderItemService;

/**
 * This class is part of the view layer. The OrderController works with the OrderService to provide
 * the data of the order entity to the view.
 */
@Named
@RequestScoped
public class OrderController {

  private final String readirectString = "/sites/category/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  OrderService orderService;

  @Inject
  OrderItemService orderItemService;

  @Inject
  CustomerService customerService;

  @Inject
  StaffService staffService;

  @Inject
  StoreService storeService;

  @Inject
  ProductService productService;

  // Attributes
  @NotNull
  Integer orderId;

  @NotNull
  Date orderDate;

  @NotNull
  Integer orderStatus;

  Date requiredDate;

  Date shippedDate;

  @NotNull
  Date requiredDateUpdate;

  @NotNull
  Date shippedDateUpdate;

  @NotNull
  Integer customerId;

  @NotNull
  Integer staffId;

  @NotNull
  Integer storeId;

  @NotNull
  Integer productId1;

  @NotNull
  BigDecimal discount1;

  @NotNull
  Integer quantity1;

  Integer productId2;

  BigDecimal discount2;

  Integer quantity2;

  Integer productId3;

  BigDecimal discount3;

  Integer quantity3;

  Integer productId4;

  BigDecimal discount4;

  Integer quantity4;

  Integer productId5;

  BigDecimal discount5;

  Integer quantity5;

  // Methods

  /**
   * This method is used to save a new order.
   *
   * @return the view where the user is redirected
   */
  public String saveOrder() {
    Order order = new Order(customerService.getCustomer(customerId), staffService.getStaff(staffId),
        storeService.getStore(storeId), orderDate, requiredDate);

    Order savedOrder = orderService.save(order);
    saveOrderItems(savedOrder);
    return readirectString;
  }

  /**
   * This method is used to save the orderItems of a new order.
   *
   * @param savedOrder the order of the orderItems
   */
  public void saveOrderItems(Order savedOrder) {
    List<OrderItem> orderItems = new ArrayList<>();
    orderItems.add(checkOrderItem(savedOrder, 1, productId1, discount1, quantity1));
    orderItems.add(checkOrderItem(savedOrder, 2, productId2, discount2, quantity2));
    orderItems.add(checkOrderItem(savedOrder, 3, productId3, discount3, quantity3));
    orderItems.add(checkOrderItem(savedOrder, 4, productId4, discount4, quantity4));
    orderItems.add(checkOrderItem(savedOrder, 5, productId5, discount5, quantity5));

    for (OrderItem oi : orderItems) {
      if (oi != null) {
        orderItemService.save(oi);
      }
    }
  }

  /**
   * This method is used to check if the orderItem is valid.
   *
   * @param savedOrder the order of the orderItem
   * @param itemId     the id of the orderItem
   * @param productId  the id of the product
   * @return the orderItem if it is valid, otherwise null
   */
  public OrderItem checkOrderItem(Order savedOrder, Integer itemId, Integer productId,
      BigDecimal discount, Integer quantity) {
    if (productId != null && discount != null && quantity != null) {
      Product product = productService.getProduct(productId);
      OrderItemKeys orderItemKeys = new OrderItemKeys(itemId, savedOrder.getOrderId());
      return new OrderItem(orderItemKeys, savedOrder, product, discount, product.getListPrice(),
          quantity);
    }
    return null;
  }

  /**
   * This method is used to validate the selection of a product.
   *
   * @param context   the context of the faces
   * @param component the component of the faces
   * @param value     the value of the faces
   */
  public void validateSelectProduct(FacesContext context, UIComponent component, Object value) {
    if (value.equals(0)) {
      FacesMessage message = new FacesMessage("Sie müssen mindestens das erste Produkt auswählen.");
      throw new ValidatorException(message);
    }
  }

  /**
   * This method is used to update a order.
   *
   * @return the view where the user is redirected
   */
  public String updateOrder() {
    orderService.update(orderId, orderStatus, shippedDate, requiredDate);
    return readirectString;
  }

  /**
   * This method is used to remove a order.
   *
   * @return the view where the user is redirected
   */
  public String removeOrder() {
    if (removeCheck(orderId)) {
      orderService.remove(orderId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a order can be removed.
   *
   * @param orderId id of Order
   * @return true if the order can be removed
   */
  public boolean removeCheck(Integer orderId) {
    Order order = orderService.getOrder(orderId);
    return order.getOrderStatus() == 1;
  }

  /**
   * This method is used to check if a order can be updated.
   *
   * @param orderId id of Order
   * @return true if the order can be updated
   */
  public boolean updateCheck(Integer orderId) {
    Order order = orderService.getOrder(orderId);
    return order.getOrderStatus() < 3;
  }

  /**
   * This method is used to get a order by id
   *
   * @param orderId id of Order
   * @return the order
   */
  public Order getOrder(Integer orderId) {
    return orderService.getOrder(orderId);
  }

  /**
   * Receives all orders from the database.
   *
   * @return A list of all orders
   */
  public List<Order> getAllOrders() {
    return orderService.getAllOrders();
  }

  /**
   * Receives all orders from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the orders are sorted
   * @param search the search key
   * @return A list of all categories
   */
  public List<Order> getAllOrdersParameter(int page, int limit, String order, String search) {
    return orderService.getAllOrders(page, limit, order, search);
  }

  /**
   * Maps the order status to a css class
   *
   * @param orderStatus the status of the order
   * @return returns the css class
   */
  public String getOrderStatusBorder(int orderStatus) {
    return switch (orderStatus) {
      case 1 -> "card orderStatus1";
      case 2 -> "card orderStatus2";
      case 3 -> "card orderStatus3";
      case 4 -> "card orderStatus4";
      default -> "card";
    };
  }

  /**
   * The method is used to calculate the price of a product with the discount.
   *
   * @param orderItem the orderItem to calculate the price
   * @return returns the price of the product with the discount
   */
  public BigDecimal getProductPriceWithDiscount(OrderItem orderItem) {
    BigDecimal discount = new BigDecimal("1.00").subtract(orderItem.getDiscount());
    BigDecimal priceDiscounted = orderItem.getListPrice().multiply(discount);

    return priceDiscounted.setScale(2, RoundingMode.HALF_DOWN);
  }

  /**
   * Calculates the total price of the order
   *
   * @param orderId id of the order
   * @return returns the total price of the order
   */
  public BigDecimal getTotalOrderPrice(Integer orderId) {
    List<OrderItem> list = orderItemService.getAllOrderItemsById(orderId);
    BigDecimal totalPrice = new BigDecimal("0.00");

    for (OrderItem orderItem : list) {
      BigDecimal priceQuantity = getProductPriceWithDiscount(orderItem).multiply(
          new BigDecimal(orderItem.getQuantity()));
      totalPrice = totalPrice.add(priceQuantity);
    }

    return totalPrice.setScale(2, RoundingMode.HALF_DOWN);
  }

  /**
   * This method is used to get the status of a order as a string.
   *
   * @param status the status of the order as a number
   * @return returns the status of the order as a string
   */
  public String getOrderStatusString(String status) {
    return switch (status) {
      case "1" -> "Ausstehend";
      case "2" -> "wird bearbeitet";
      case "3" -> "Abgelehnt";
      case "4" -> "Vollendet";
      default -> "";
    };
  }

  // Getter and Setter
  public Integer getOrderId() {
    return orderId;
  }

  public void setOrderId(Integer orderId) {
    this.orderId = orderId;
  }

  public Date getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(Date orderDate) {
    this.orderDate = orderDate;
  }

  public Integer getOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(Integer orderStatus) {
    this.orderStatus = orderStatus;
  }

  public Date getRequiredDate() {
    return requiredDate;
  }

  public void setRequiredDate(Date requiredDate) {
    this.requiredDate = requiredDate;
  }

  public Date getShippedDate() {
    return shippedDate;
  }

  public void setShippedDate(Date shippedDate) {
    this.shippedDate = shippedDate;
  }

  public Date getRequiredDateUpdate() {
    return requiredDateUpdate;
  }

  public void setRequiredDateUpdate(Date requiredDateUpdate) {
    this.requiredDateUpdate = requiredDateUpdate;
  }

  public Date getShippedDateUpdate() {
    return shippedDateUpdate;
  }

  public void setShippedDateUpdate(Date shippedDateUpdate) {
    this.shippedDateUpdate = shippedDateUpdate;
  }

  public Integer getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer customerId) {
    this.customerId = customerId;
  }

  public Integer getStaffId() {
    return staffId;
  }

  public void setStaffId(Integer staffId) {
    this.staffId = staffId;
  }

  public Integer getStoreId() {
    return storeId;
  }

  public void setStoreId(Integer storeId) {
    this.storeId = storeId;
  }

  public Integer getProductId1() {
    return productId1;
  }

  public void setProductId1(Integer productId1) {
    this.productId1 = productId1;
  }

  public BigDecimal getDiscount1() {
    return discount1;
  }

  public void setDiscount1(BigDecimal discount1) {
    this.discount1 = discount1;
  }

  public Integer getQuantity1() {
    return quantity1;
  }

  public void setQuantity1(Integer quantity1) {
    this.quantity1 = quantity1;
  }

  public Integer getProductId2() {
    return productId2;
  }

  public void setProductId2(Integer productId2) {
    this.productId2 = productId2;
  }

  public BigDecimal getDiscount2() {
    return discount2;
  }

  public void setDiscount2(BigDecimal discount2) {
    this.discount2 = discount2;
  }

  public Integer getQuantity2() {
    return quantity2;
  }

  public void setQuantity2(Integer quantity2) {
    this.quantity2 = quantity2;
  }

  public Integer getProductId3() {
    return productId3;
  }

  public void setProductId3(Integer productId3) {
    this.productId3 = productId3;
  }

  public BigDecimal getDiscount3() {
    return discount3;
  }

  public void setDiscount3(BigDecimal discount3) {
    this.discount3 = discount3;
  }

  public Integer getQuantity3() {
    return quantity3;
  }

  public void setQuantity3(Integer quantity3) {
    this.quantity3 = quantity3;
  }

  public Integer getProductId4() {
    return productId4;
  }

  public void setProductId4(Integer productId4) {
    this.productId4 = productId4;
  }

  public BigDecimal getDiscount4() {
    return discount4;
  }

  public void setDiscount4(BigDecimal discount4) {
    this.discount4 = discount4;
  }

  public Integer getQuantity4() {
    return quantity4;
  }

  public void setQuantity4(Integer quantity4) {
    this.quantity4 = quantity4;
  }

  public Integer getProductId5() {
    return productId5;
  }

  public void setProductId5(Integer productId5) {
    this.productId5 = productId5;
  }

  public BigDecimal getDiscount5() {
    return discount5;
  }

  public void setDiscount5(BigDecimal discount5) {
    this.discount5 = discount5;
  }

  public Integer getQuantity5() {
    return quantity5;
  }

  public void setQuantity5(Integer quantity5) {
    this.quantity5 = quantity5;
  }
}