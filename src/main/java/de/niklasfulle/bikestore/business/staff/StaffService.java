package de.niklasfulle.bikestore.business.staff;

import de.niklasfulle.bikestore.business.store.Store;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.Objects;

/**
 * The StaffService class is responsible for the processing of the data of the Staff Entity. It is
 * used to communicate with the database.
 */
@Stateless
public class StaffService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Staff in the database through the EntityManager.
   *
   * @param staff the Staff to be saved
   */
  public void save(Staff staff) {
    em.persist(staff);
  }

  /**
   * Updates Staff in the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The staff is updated by setting the new values. The EntityManager
   * is flushed to save the changes. If the staff is not found, it will not be updated.
   *
   * @param staffId id of Staff to be updated
   */
  public void update(Integer staffId, String firstName, String lastName, String email, String phone,
      Staff manager, Store store, Integer active) {
    Staff toUpdate = em.find(Staff.class, staffId);

    try {
      em.merge(toUpdate);
      toUpdate.setFirstName(firstName);
      toUpdate.setLastName(lastName);
      toUpdate.setEmail(email);
      toUpdate.setPhone(phone);
      if (manager != null) {
        toUpdate.setManager(manager);
      }
      toUpdate.setStore(store);
      toUpdate.setActive(active);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the staff");
    }
  }

  /**
   * Removes Staff from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param staffId id of Staff
   */
  public void remove(Integer staffId) {
    Staff toUpdate = em.find(Staff.class, staffId);

    try {
      em.merge(toUpdate);
      toUpdate.setActive(0);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the staff");
    }
  }

  /**
   * Gets the Staff from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param staffId id of Staff
   */
  public Staff getStaff(Integer staffId) {
    return em.find(Staff.class, staffId);
  }

  /**
   * Gets the Staff from the database through the EntityManager by the email. It uses the
   * EntityManagers' createQuery function to fetch the Entity.
   *
   * @param email email of Staff
   */
  public Staff getStaffByEmail(String email) {
    System.out.println(1);
    return em.createQuery("SELECT s FROM Staff s WHERE s.email = :email", Staff.class)
        .setParameter("email", email)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }

  /**
   * Receives all staffs from the database.
   *
   * @return A list of all staffs
   */
  public List<Staff> getAllStaffs() {
    return em.createQuery(
            "SELECT s FROM Staff s ORDER BY s.staffId ASC", Staff.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all staffs from the database page and offset needed to calculate the final offset. If
   * the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the staffs are sorted
   * @param search the search key
   * @return A list of all staffs
   */
  public List<Staff> getAllStaffs(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapStaffOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT s FROM Staff s WHERE s.firstName LIKE :searchTerm OR s.lastName LIKE :searchTerm ORDER BY "
                  + orderBy,
              Staff.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT s FROM Staff s ORDER BY " + orderBy, Staff.class)
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    }
  }

  /**
   * Maps the order parameter to the correct column name.
   *
   * @param order the order parameter
   * @return the column name
   */
  private String mapStaffOrderBy(String order) {
    return switch (order) {
      case "firstName" -> "s.firstName ASC";
      case "lastName" -> "s.lastName ASC";
      case "email" -> "s.email ASC";
      case "phone" -> "s.phone ASC";
      case "store" -> "s.store ASC";
      case "role" -> "s.managerId DESC";
      default -> "s.staffId ASC";
    };
  }

  /**
   * Counts the staffs in the database.
   *
   * @param search the search key
   * @return the count of staffs
   */
  public long getStaffsCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT COUNT(s) FROM Staff s WHERE s.firstName LIKE :searchTerm OR s.lastName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(s) FROM Staff s", Long.class).getSingleResult();
    }
  }

  /**
   * Counts the orders where the staff is used as foreign key
   *
   * @param staffId id of Staff
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer staffId) {
    Staff staff = getStaff(staffId);
    return em.createQuery("SELECT COUNT(o) FROM Order o WHERE o.staff = :staff", Long.class)
        .setParameter("staff", staff)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }
}
