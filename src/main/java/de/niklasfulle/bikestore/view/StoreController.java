package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.store.StoreService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;

/**
 * This class is part of the view layer. The StoreController works with the StoreService to provide
 * the data of the stock store to the view.
 */
@Named
@RequestScoped
public class StoreController {

  // Attributes
  @NotNull
  Integer storeId;
  @NotNull
  String storeName;
  @NotNull
  String city;
  @NotNull
  String email;
  @NotNull
  String phone;
  @NotNull
  String street;
  @NotNull
  String zipCode;
  @NotNull
  String state;
  // Services
  @Inject
  private StoreService storeService;

  // Getter and Setter
  public Integer getStoreId() {
    return storeId;
  }

  public void setStoreId(Integer storeId) {
    this.storeId = storeId;
  }

  public String getStoreName() {
    return storeName;
  }

  public void setStoreName(String storeName) {
    this.storeName = storeName;
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

  public String getStreet() {
    return street;
  }

  public void setStreet(String street) {
    this.street = street;
  }

  public String getZipCode() {
    return zipCode;
  }

  public void setZipCode(String zipCode) {
    this.zipCode = zipCode;
  }
}
