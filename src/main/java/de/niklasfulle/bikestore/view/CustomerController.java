package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.customer.Customer;
import de.niklasfulle.bikestore.business.customer.CustomerService;

/**
 * This class is part of the view layer. The CustomerController works with the CustomerService to
 * provide the data of the customer entity to the view.
 */
@Named
@RequestScoped
public class CustomerController {

  private final String readirectString = "/sites/customer/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  CustomerService customerService;

  // Attributes
  @NotNull
  Integer customerId;
  @NotNull
  String firstName;
  @NotNull
  String lastName;
  @NotNull
  String email;
  @NotNull
  String phone;
  @NotNull
  String street;
  @NotNull
  String postalCode;
  @NotNull
  String city;
  @NotNull
  String state;

  // Methods

  /**
   * This method is used to save a new customer.
   *
   * @return the view where the user is redirected
   */
  public String saveCustomer() {
    Customer customer = new Customer(firstName, lastName, email, phone, street, postalCode, city,
        state);
    customerService.save(customer);
    return readirectString;
  }

  /**
   * This method is used to update a customer.
   *
   * @return the view where the user is redirected
   */
  public String updateCustomer() {
    customerService.update(customerId, firstName, lastName, email, phone, street, postalCode, city,
        state);
    return readirectString;
  }

  /**
   * This method is used to remove a customer.
   *
   * @return the view where the user is redirected
   */
  public String removeCustomer() {
    if (removeCheck(customerId)) {
      customerService.remove(customerId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a customer can be removed.
   *
   * @param customerId id of Customer
   * @return true if the customer can be removed
   */
  public boolean removeCheck(Integer customerId) {
    return customerService.getReferenceCount(customerId) == 0;
  }

  /**
   * This method is used to get a customer by id
   *
   * @param customerId id of Customer
   * @return the customer
   */
  public Customer getCustomer(Integer customerId) {
    return customerService.getCustomer(customerId);
  }

  /**
   * Receives all customers from the database.
   *
   * @return A list of all customers
   */
  public List<Customer> getAllCustomers() {
    return customerService.getAllCustomers();
  }

  /**
   * Receives all customers from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the customers are sorted
   * @param search the search key
   * @return A list of all customers
   */
  public List<Customer> getAllCustomersParameter(int page, int limit, String order, String search) {
    return customerService.getAllCustomers(page, limit, order, search);
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

  public void setCity(String city) {
    this.city = city;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }
}
