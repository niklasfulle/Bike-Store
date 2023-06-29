package de.niklasfulle.bikestore.business.staff;

import de.niklasfulle.bikestore.business.store.Store;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/**
 * The Entity Staff represents the staffs table in the database. Staff is responsible for the
 * processing of the data of the Staff objects in the database.
 */
@Entity
@Table(name = "staffs")
public class Staff {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "staff_id")
  private Integer staffId;

  @Column()
  private Integer active;

  @Column()
  private String email;

  @Column(name = "first_name")
  private String firstName;

  @Column(name = "last_name")
  private String lastName;

  @Column()
  private String phone;

  // Many To One-Association with table staffs (or the Staff entity)
  @ManyToOne
  @JoinColumn(name = "manager_id")
  private Staff manager;

  // Many To One-Association with table stores (or the Store entity)
  @ManyToOne
  @JoinColumn(name = "store_id")
  private Store store;

  public Staff() {
  }

  public Staff(Integer active, String email, String firstName, String lastName, String phone,
      Staff manager, Store store) {
    this.active = active;
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.phone = phone;
    this.manager = manager;
    this.store = store;
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

  public Staff getManager() {
    return manager;
  }

  public void setManager(Staff manager) {
    this.manager = manager;
  }

  public Store getStore() {
    return store;
  }

  public void setStore(Store store) {
    this.store = store;
  }

  public String getRole() {
    if (manager == null) {
      return "ADMIN";
    } else {
      if (manager.staffId == 1) {
        return "USER1";
      } else {
        return "USER2";
      }
    }
  }
}
