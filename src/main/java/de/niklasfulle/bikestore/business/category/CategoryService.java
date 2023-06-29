package de.niklasfulle.bikestore.business.category;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.Objects;

/**
 * The CategoryService class is responsible for the processing of the data of the Category Entity.
 * It is used to communicate with the database.
 */
@Stateless
public class CategoryService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Category in the database through the EntityManager.
   *
   * @param category the Category to be saved
   */
  public void save(Category category) {
    em.persist(category);
  }

  /**
   * Removes Category from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param categoryId id of Category
   */
  public void remove(Integer categoryId) {
    Category toBeRemoved = em.find(Category.class, categoryId);

    // If the category is not found, it will not be removed
    try {
      em.merge(toBeRemoved);
      em.remove(toBeRemoved);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the category");
    }
  }

  /**
   * Gets the Category from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param categoryId id of Category
   */
  public Category getCategory(int categoryId) {
    return em.find(Category.class, categoryId);
  }

  /**
   * Receives all categories from the database.
   *
   * @return A list of all categories
   */
  public List<Category> getAllCategories() {
    return em.createQuery("SELECT c FROM Category c ORDER BY c.categoryId ASC", Category.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all categories from the database, page and offset needed to calculate the final
   * offset. If the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be
   * set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the categories are sorted
   * @param search the search key
   * @return A list of all categories
   */
  public List<Category> getAllCategories(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column
    String orderBy = mapCategoryOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT c from Category c WHERE c.categoryName LIKE :searchTerm ORDER BY " + orderBy,
              Category.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT c from Category c ORDER BY " + orderBy, Category.class)
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
  private String mapCategoryOrderBy(String order) {
    if (Objects.equals(order, "name")) {
      return "c.categoryName";
    }
    return "c.categoryId";
  }

  /**
   * Counts the categories in the database.
   *
   * @param search the search key
   * @return the count of categories
   */
  public long getCategoriesCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery("SELECT COUNT(c) FROM Category c WHERE c.categoryName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(c) FROM Category c", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }

  /**
   * Counts the products where the category is used as foreign key.
   *
   * @param categoryId id of Category
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer categoryId) {
    Category category = getCategory(categoryId);
    // Count the products where the brand is used as foreign key.
    return em.createQuery("SELECT COUNT(p) FROM Product p WHERE p.category = :category", Long.class)
        .setParameter("category", category)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();
  }
}
