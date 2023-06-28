package de.niklasfulle.bikestore.business.brand;

import java.util.List;
import java.util.Objects;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * The BrandService class is responsible for the processing of the data of the
 * Brand Entity. It is used to communicate with the database.
 */
@Stateless
public class BrandService {
  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Brand in the database through the EntityManager.
   *
   * @param brand the Brand to be saved
   */
  public void save(Brand brand) {
    em.persist(brand);
  }

  /**
   * Removes Brand from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param brandId id of Brand
   */
  public void remove(Integer brandId) {
    Brand toBeRemoved = em.find(Brand.class, brandId);

    // If the brand is not found, it will not be removed
    try {
      em.merge(toBeRemoved);
      em.remove(toBeRemoved);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the brand");
    }
  }

  /**
   * Gets the Brand from the database through the EntityManager. It uses the
   * EntityManagers' find function to fetch the Entity.
   *
   * @param brandId id of Brand
   */
  public Brand getBrand(Integer brandId) {
    return em.find(Brand.class, brandId);
  }

  /**
   * Receives all brands from the database.
   *
   * @return A list of all brands
   */
  public List<Brand> getAllBrands() {
    return em.createQuery("SELECT b from Brand b ORDER BY b.brandId ASC", Brand.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all brands from the database, page and offset needed to calculate
   * the final offset. If the Limit is 0 then it will be set 24. If the offset is
   * smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the brands are sorted
   * @param search the search key
   * @return A list of all brands
   */
  public List<Brand> getAllBrands(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapBrandOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
          "SELECT b from Brand b WHERE b.brandName LIKE :searchTerm ORDER BY " + orderBy,
          Brand.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT b from Brand b ORDER BY " + orderBy, Brand.class)
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    }
  }

  /**
   * Maps the order to the correct column.
   *
   * @param order the order
   * @return the column
   */
  private String mapBrandOrderBy(String order) {
    if (Objects.equals(order, "name")) {
      return "b.brandName";
    }
    return "b.brandId";
  }

  /**
   * Counts the brands in the database.
   *
   * @param search the search key
   * @return the count of brands
   */
  public long getBrandsCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery("SELECT COUNT(b) FROM Brand b WHERE b.brandName LIKE :searchTerm",
          Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(b) FROM Brand b", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }

  /**
   * Counts the products where the brand is used as foreign key.
   *
   * @param brandId id of Brand
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer brandId) {
    Brand brand = getBrand(brandId);
    // Count the products where the brand is used as foreign key.
    return em.createQuery("SELECT COUNT(p) FROM Product p WHERE p.brand = :brand", Long.class)
        .setParameter("brand", brand)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }
}
