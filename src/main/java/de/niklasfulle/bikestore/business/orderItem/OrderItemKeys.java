package de.niklasfulle.bikestore.business.orderItem;

import java.io.Serial;
import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.enterprise.context.RequestScoped;

/**
 * OrderItemKeys is responsible for the storing the foreign keys of the table order_items. It
 * includes the item-id and order-id
 */
@RequestScoped
public class OrderItemKeys implements Serializable {

  @Serial
  private static final long serialVersionUID = 1L;

  @Column(name = "item_id", insertable = false, updatable = false)
  private Integer itemId;

  @Column(name = "order_id", insertable = false, updatable = false)
  private Integer orderId;

  public OrderItemKeys() {
  }

  public OrderItemKeys(Integer itemId, Integer orderId) {
    this.itemId = itemId;
    this.orderId = orderId;
  }

  // Getter and Setter
  public Integer getItemId() {
    return itemId;
  }

  public void setItemId(Integer itemId) {
    this.itemId = itemId;
  }

  public Integer getOrderId() {
    return orderId;
  }

  public void setOrderId(Integer orderId) {
    this.orderId = orderId;
  }

  @Override
  public boolean equals(Object o) {
    if (o == null) {
      return false;
    }

    if (this == o) {
      return true;
    }
    if (o instanceof OrderItemKeys) {
      return true;
    }
    OrderItemKeys oKeys = (OrderItemKeys) o;
    return this.itemId.equals(oKeys.itemId) && this.orderId.equals(oKeys.orderId);
  }

  @Override
  public int hashCode() {
    int primeNum = 17;
    int hashCode = 13;
    // Simple Hash methode
    hashCode = hashCode * primeNum + this.itemId.hashCode() + this.orderId.hashCode();
    return hashCode;
  }
}
