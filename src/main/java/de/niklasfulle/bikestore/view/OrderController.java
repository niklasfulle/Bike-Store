package de.niklasfulle.bikestore.view;

import java.util.List;
import java.util.Date;
import java.util.ArrayList;
import java.math.BigDecimal;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import java.math.RoundingMode;
import jakarta.faces.context.FacesContext;
import jakarta.faces.component.UIComponent;
import jakarta.faces.application.FacesMessage;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.validator.ValidatorException;
import jakarta.validation.constraints.NotNull;

import de.niklasfulle.bikestore.business.staff.Staff;
import de.niklasfulle.bikestore.business.staff.StaffService;
import de.niklasfulle.bikestore.business.store.Store;
import de.niklasfulle.bikestore.business.store.StoreService;
import de.niklasfulle.bikestore.business.order.Order;
import de.niklasfulle.bikestore.business.order.OrderService;
import de.niklasfulle.bikestore.business.product.Product;
import de.niklasfulle.bikestore.business.product.ProductService;
import de.niklasfulle.bikestore.business.customer.Customer;
import de.niklasfulle.bikestore.business.customer.CustomerService;
import de.niklasfulle.bikestore.business.orderItem.OrderItem;
import de.niklasfulle.bikestore.business.orderItem.OrderItemService;

/**
 * This class is part of the view layer. The OrderController works with the
 * OrderService to provide the data of the order entity to the view.
 */
@Named
@RequestScoped
public class OrderController {
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
