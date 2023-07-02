package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.staff.Staff;
import de.niklasfulle.bikestore.business.store.Store;
import de.niklasfulle.bikestore.business.staff.StaffService;
import de.niklasfulle.bikestore.business.store.StoreService;

/**
 * This class is part of the view layer. The StaffController works with the StaffService to provide
 * the data of the staff entity to the view.
 */
@Named
@RequestScoped
public class StaffController {

  private final String readirectString = "/sites/staff/View.xhtml?faces-redirect=true";

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

  // Methods

  /**
   * This method is used to save a new staff.
   *
   * @return the view where the user is redirected
   */
  public String saveStaff() {
    Staff manager = staffService.getStaff(managerId);
    Store store = storeService.getStore(storeId);
    Staff staff = new Staff(1, email, firstName, lastName, phone, manager, store);
    staffService.save(staff);
    return readirectString;
  }

  /**
   * This method is used to update a staff.
   *
   * @return the view where the user is redirected
   */
  public String updateStaff() {
    if (managerId != null) {
      Staff manager = staffService.getStaff(managerId);
      Store store = storeService.getStore(storeId);
      staffService.update(staffId, firstName, lastName, email, phone, manager, store, active);
    } else {
      Store store = storeService.getStore(storeId);
      staffService.update(staffId, firstName, lastName, email, phone, null, store, active);
    }
    return readirectString;
  }

  /**
   * This method is used to remove a staff.
   *
   * @return the view where the user is redirected
   */
  public String removeStaff() {
    if (removeCheck(staffId)) {
      staffService.remove(staffId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a staff can be removed.
   *
   * @param staffId id of Staff
   * @return true if the staff can be removed
   */
  public boolean removeCheck(Integer staffId) {
    return staffService.getReferenceCount(staffId) == 0;
  }

  /**
   * This method is used to get a staff by id
   *
   * @param staffId id of Staff
   * @return the staff
   */
  public Staff getStaff(int staffId) {
    return staffService.getStaff(staffId);
  }

  /**
   * Receives all staffs from the database.
   *
   * @return A list of all staffs
   */
  public List<Staff> getAllStaffs() {
    return staffService.getAllStaffs();
  }

  /**
   * Receives all staffs from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the staffs are sorted
   * @param search the search key
   * @return A list of all staffs
   */
  public List<Staff> getAllStaffsParameter(int page, int limit, String order, String search) {
    return staffService.getAllStaffs(page, limit, order, search);
  }

  /**
   * This method is used to get the manager name of a staff.
   *
   * @param staff the staff to get the manager name from
   * @return the manager name
   */
  public String getManagerName(Staff staff) {
    if (staff.getManager() == null) {
      return "-";
    } else {
      return staff.getManager().getFirstName() + " " + staff.getManager().getLastName();
    }
  }

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
