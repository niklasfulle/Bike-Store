package de.niklasfulle.bikestore.business.store;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

/**
 * The Entity Store represents the stores table in the database. Store is responsible for the
 * processing of the data of the Store objects in the database.
 */
@Entity
@Table(name = "stores")
public class Store {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "store_id")
  private Integer storeId;

  @Column()
  private String city;

  @Column()
  private String email;

  @Column()
  private String phone;

  @Column()
  private String state;

  @Column(name = "store_name")
  private String storeName;

  @Column()
  private String street;

  @Column(name = "zip_code")
  private String postalCode;

  public Store() {
  }

  public Store(String city, String email, String phone, String state, String storeName,
      String street, String postalCode) {
    this.city = city;
    this.email = email;
    this.phone = phone;
    this.state = state;
    this.storeName = storeName;
    this.street = street;
    this.postalCode = postalCode;
  }

  // Getter and Setter
  public Integer getStoreId() {
    return storeId;
  }

  public void setStoreId(Integer storeId) {
    this.storeId = storeId;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public String getStoreName() {
    return storeName;
  }

  public void setStoreName(String storeName) {
    this.storeName = storeName;
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
}
