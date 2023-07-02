package de.niklasfulle.bikestore.business.orderItem;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.JoinColumn;
import jakarta.validation.constraints.Digits;

import de.niklasfulle.bikestore.business.order.Order;
import de.niklasfulle.bikestore.business.product.Product;

/**
 * The Entity OrderItem represents the order_items table in the database. OrderItem is responsible
 * for the processing of the data of the OrderItem objects in the database.
 */
@Entity
@Table(name = "order_items")
public class OrderItem implements Serializable {

  @Serial
  private static final long serialVersionUID = 1L;

  @EmbeddedId
  private OrderItemKeys id;

  @Column()
  @Digits(integer = 19, fraction = 2)
  private BigDecimal discount;

  @Column(name = "list_price")
  @Digits(integer = 19, fraction = 2)
  private BigDecimal listPrice;

  @Column()
  private Integer quantity;

  // Many To One-Association with the orders table (or the Order entity)
  @ManyToOne
  @JoinColumn(name = "order_id", insertable = false, updatable = false)
  private Order order;

  // Many To One-Association with table products (or the Product entity)
  @ManyToOne
  @JoinColumn(name = "product_id", updatable = true)
  private Product product;

  public OrderItem() {
  }

  public OrderItem(OrderItemKeys id, Order order, Product product, BigDecimal discount,
      BigDecimal listPrice, Integer quantity) {
    this.id = id;
    this.order = order;
    this.product = product;
    this.discount = discount;
    this.listPrice = listPrice;
    this.quantity = quantity;
  }

  // Getter and Setter
  public OrderItemKeys getId() {
    return id;
  }

  public void setId(OrderItemKeys id) {
    this.id = id;
  }

  public BigDecimal getDiscount() {
    return discount;
  }

  public void setDiscount(BigDecimal discount) {
    this.discount = discount;
  }

  public BigDecimal getListPrice() {
    return listPrice;
  }

  public void setListPrice(BigDecimal listPrice) {
    this.listPrice = listPrice;
  }

  public Integer getQuantity() {
    return quantity;
  }

  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
  }

  public Order getOrder() {
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }
}
