package de.niklasfulle.bikestore.business.customer;

import java.util.List;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import de.niklasfulle.bikestore.business.order.Order;

/**
 * The Entity Customer represents the customers table in the database.
 * Customer is responsible for the processing of the data of the Customer
 * objects in the database.
 */
@Entity
@Table(name = "customers")
public class Customer {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "customer_id")
  private Integer customerId;

  @Column(name = "first_name")
  private String firstName;

  @Column(name = "last_name")
  private String lastName;

  @Column()
  private String email;

  @Column()
  private String phone;

  @Column()
  private String street;

  @Column(name = "zip_code")
  private String postalCode;

  @Column()
  private String city;

  @Column()
  private String state;

  // One to Many-Association with the orders table (or the Order entity)
  @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
  private List<Order> orders;

  public Customer() {
  }

  public Customer(String firstName, String lastName, String email, String phone, String street,
      String postalCode, String city, String state) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.phone = phone;
    this.street = street;
    this.postalCode = postalCode;
    this.city = city;
    this.state = state;
  }

  // Getter and Setter
  public Integer getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer customerId) {
    this.customerId = customerId;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    if (phone == null) {
      return "-";
    }
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getStreet() {
    return street;
  }

  public void setStreet(String street) {
    this.street = street;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String location) {
    this.city = location;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }
}
