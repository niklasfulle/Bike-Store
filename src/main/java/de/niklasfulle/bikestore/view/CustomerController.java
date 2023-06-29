package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.customer.Customer;
import de.niklasfulle.bikestore.business.customer.CustomerService;

/**
 * This class is part of the view layer. The CustomerController works with the
 * CustomerService to provide the data of the customer entity to the view.
 */
@Named
@RequestScoped
public class CustomerController {
  // Services
  @Inject
  private CustomerService customerService;

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
