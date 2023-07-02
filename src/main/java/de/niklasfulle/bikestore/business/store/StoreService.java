package de.niklasfulle.bikestore.business.store;

import java.util.List;
import java.util.Objects;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * The StoreService class is responsible for the processing of the data of the Store Entity. It is
 * used to communicate with the database.
 */
@Stateless
public class StoreService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Store in the database through the EntityManager.
   *
   * @param store the Store to be saved
   */
  public void save(Store store) {
    em.persist(store);
  }

  /**
   * Updates Store in the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The store is updated by setting the new values. The EntityManager
   * is flushed to save the changes. If the store is not found, it will not be updated.
   *
   * @param storeId id of Store to be updated
   */
  public void update(Integer storeId, String name, String email, String phone, String street,
      String postalCode, String city, String state) {
    Store toUpdate = em.find(Store.class, storeId);

    try {
      em.merge(toUpdate);
      toUpdate.setStoreName(name);
      toUpdate.setEmail(email);
      toUpdate.setPhone(phone);
      toUpdate.setStreet(street);
      toUpdate.setPostalCode(postalCode);
      toUpdate.setCity(city);
      toUpdate.setState(state);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the staff");
    }
  }

  /**
   * Removes Store from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param storeId id of Store
   */
  public void remove(Integer storeId) {
    Store toBeRemoved = em.find(Store.class, storeId);

    try {
      em.merge(toBeRemoved);
      em.remove(toBeRemoved);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the brand");
    }
  }

  /**
   * Gets the Store from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param storeId id of Store
   */
  public Store getStore(Integer storeId) {
    return em.find(Store.class, storeId);
  }

  /**
   * Receives all stores from the database.
   *
   * @return A list of all stores
   */
  public List<Store> getAllStores() {
    return em.createQuery("SELECT s FROM Store s ORDER BY s.storeId ASC", Store.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all stores from the database page and offset needed to calculate the final offset. If
   * the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the stores are sorted
   * @param search the search key
   * @return A list of all stores
   */
  public List<Store> getAllStores(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapStoreOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT s FROM Store s WHERE s.storeName LIKE :searchTerm ORDER BY "
                  + orderBy,
              Store.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT s FROM Store s ORDER BY " + orderBy, Store.class)
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
  private String mapStoreOrderBy(String order) {
    return switch (order) {
      case "name" -> "s.storeName";
      case "email" -> "s.email";
      case "phone" -> "s.phone";
      case "street" -> "s.street";
      case "postalCode" -> "s.postalCode";
      case "city" -> "s.city";
      case "state" -> "s.state";
      default -> "s.storeId";
    };
  }

  /**
   * Counts the stores in the database.
   *
   * @param search the search key
   * @return the count of stores
   */
  public long getStoresCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery("SELECT COUNT(s) FROM Store s WHERE s.storeName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(s) FROM Store s", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }

  /**
   * Counts the orders where the store is used as foreign key
   *
   * @param storeId id of Store
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer storeId) {
    Store store = getStore(storeId);
    return em.createQuery("SELECT COUNT(o) FROM Order o WHERE o.store = :store", Long.class)
        .setParameter("store", store)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }

}