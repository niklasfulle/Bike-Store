package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.staff.StaffService;
import de.niklasfulle.bikestore.business.store.StoreService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;

/**
 * This class is part of the view layer. The StaffController works with the StaffService to provide
 * the data of the staff entity to the view.
 */
@Named
@RequestScoped
public class StaffController {

  // Services
  @Inject
  StaffService staffService;

  @Inject
  StoreService storeService;

  // Attributes
  @NotNull
  Integer staffId;

  @NotNull
  Integer active;

  @NotNull
  String email;

  @NotNull
  String firstName;

  @NotNull
  String lastName;

  @NotNull
  String phone;

  Integer managerId;

  @NotNull
  Integer storeId;

  // Getter and Setter
  public Integer getStaffId() {
    return staffId;
  }

  public void setStaffId(Integer staffId) {
    this.staffId = staffId;
  }

  public Integer getActive() {
    return active;
  }

  public void setActive(Integer active) {
    this.active = active;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
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

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Integer getManagerId() {
    return managerId;
  }

  public void setManagerId(Integer managerId) {
    this.managerId = managerId;
  }

  public Integer getStoreId() {
    return storeId;
  }

  public void setStoreId(Integer storeId) {
    this.storeId = storeId;
  }
}
