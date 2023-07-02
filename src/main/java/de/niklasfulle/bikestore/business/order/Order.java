package de.niklasfulle.bikestore.business.order;

import java.util.Date;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.Temporal;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.TemporalType;
import jakarta.persistence.GenerationType;
import jakarta.persistence.GeneratedValue;

import de.niklasfulle.bikestore.business.staff.Staff;
import de.niklasfulle.bikestore.business.store.Store;
import de.niklasfulle.bikestore.business.customer.Customer;

/**
 * The Entity Order represents the orders table in the database. Order is responsible for the
 * processing of the data of the Order objects in the database.
 */
@Entity
@Table(name = "orders")
public class Order {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "order_id")
  private Integer orderId;

  @Temporal(TemporalType.DATE)
  @Column(name = "order_date")
  private Date orderDate;

  @Column(name = "order_status")
  private Integer orderStatus;

  @Temporal(TemporalType.DATE)
  @Column(name = "required_date")
  private Date requiredDate;

  @Temporal(TemporalType.DATE)
  @Column(name = "shipped_date")
  private Date shippedDate;

  // Many To One-Association with table customers (or the Customer entity)
  @ManyToOne
  @JoinColumn(name = "customer_id")
  private Customer customer;

  // Many To One-Association with table staffs (or the Staff entity)
  @ManyToOne
  @JoinColumn(name = "staff_id")
  private Staff staff;

  // Many To One-Association with table stores (or the Store entity)
  @ManyToOne
  @JoinColumn(name = "store_id")
  private Store store;

  public Order() {
  }

  public Order(Customer customer, Staff staff, Store store, Date orderDate, Date requiredDate) {
    this.customer = customer;
    this.staff = staff;
    this.store = store;
    this.orderDate = orderDate;
    this.requiredDate = requiredDate;
    this.orderStatus = 1;
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

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public Staff getStaff() {
    return staff;
  }

  public void setStaff(Staff staff) {
    this.staff = staff;
  }

  public Store getStore() {
    return store;
  }

  public void setStore(Store store) {
    this.store = store;
  }
}
