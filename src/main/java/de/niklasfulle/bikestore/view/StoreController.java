package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.store.Store;
import de.niklasfulle.bikestore.business.store.StoreService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * This class is part of the view layer. The StoreController works with the StoreService to provide
 * the data of the stock store to the view.
 */
@Named
@RequestScoped
public class StoreController {

  private final String readirectString = "/sites/store/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  StoreService storeService;

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

  // Methods

  /**
   * This method is used to save a new store.
   *
   * @return the view where the user is redirected
   */
  public String saveStore() {
    Store store = new Store(city, email, phone, state, storeName, street, zipCode);
    storeService.save(store);
    return readirectString;
  }

  /**
   * This method is used to update a store.
   *
   * @return the view where the user is redirected
   */
  public String updateStore() {
    storeService.update(storeId, storeName, email, phone, street, zipCode, city, state);
    return readirectString;
  }

  /**
   * This method is used to remove a store.
   *
   * @return the view where the user is redirected
   */
  public String removeStore() {
    if (removeCheck(storeId)) {
      storeService.remove(storeId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a store can be removed.
   *
   * @param storeId id of Store
   * @return true if the store can be removed
   */
  public boolean removeCheck(Integer storeId) {
    return storeService.getReferenceCount(storeId) == 0;
  }

  /**
   * This method is used to get a store by id
   *
   * @param storeId id of Store
   * @return the store
   */
  public Store getStore(Integer storeId) {
    return storeService.getStore(storeId);
  }

  /**
   * Receives all stores from the database.
   *
   * @return A list of all stores
   */
  public List<Store> getAllStores() {
    return storeService.getAllStores();
  }

  /**
   * Receives all stores from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the stores are sorted
   * @param search the search key
   * @return A list of all stores
   */
  public List<Store> getAllStoresParameter(int page, int limit, String order, String search) {
    return storeService.getAllStores(page, limit, order, search);
  }

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
