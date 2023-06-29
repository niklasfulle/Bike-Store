package de.niklasfulle.bikestore.business.product;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.category.Category;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 * The ProductService class is responsible for the processing of the data of the Product Entity. It
 * is used to communicate with the database.
 */
@Stateless
public class ProductService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Product in the database through the EntityManager.
   *
   * @param product the Product to be saved
   */
  public Product save(Product product) {
    em.persist(product);
    return product;
  }

  /**
   * Updates Product in the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The product is updated by setting the new values. The
   * EntityManager is flushed to save the changes. If the product is not found, it will not be
   * updated.
   *
   * @param productId id of Product to be updated
   */
  public void update(Integer productId, String productName, Brand brand, Category category,
      Integer modelYear, BigDecimal listPrice) {
    Product toUpdate = em.find(Product.class, productId);

    try {
      em.merge(toUpdate);
      toUpdate.setProductName(productName);
      toUpdate.setBrand(brand);
      toUpdate.setCategory(category);
      toUpdate.setModelYear(modelYear);
      toUpdate.setListPrice(listPrice);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the product");
    }
  }

  /**
   * Removes Product from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param productId id of Product
   */
  public void remove(Integer productId) {
    Product toBeRemoved = em.find(Product.class, productId);

    try {
      em.merge(toBeRemoved);
      em.remove(toBeRemoved);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the product");
    }
  }

  /**
   * Gets the Product from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param productId id of Product
   */
  public Product getProduct(int productId) {
    return em.find(Product.class, productId);
  }

  /**
   * Receives all products from the database.
   *
   * @return A list of all products
   */
  public List<Product> getAllProducts() {
    return em.createQuery("SELECT p FROM Product p ORDER BY p.productId ASC", Product.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all products from the database page and offset needed to calculate the final offset.
   * If the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the products are sorted
   * @param search the search key
   * @return A list of all products
   */
  public List<Product> getAllProducts(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapProductOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT p FROM Product p WHERE p.productName LIKE :searchTerm ORDER BY " + orderBy,
              Product.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT p FROM Product p ORDER BY " + orderBy, Product.class)
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
  private String mapProductOrderBy(String order) {
    return switch (order) {
      case "name" -> "p.productName ASC";
      case "priceMin" -> "p.listPrice ASC";
      case "priceMax" -> "p.listPrice DESC";
      case "modelYearNew" -> "p.modelYear DESC";
      case "modelYearOld" -> "p.modelYear ASC";
      case "brand" -> "p.brand ASC";
      case "category" -> "p.category ASC";
      default -> "p.productId ASC";
    };
  }

  /**
   * Counts the products in the database.
   *
   * @param search the search key
   * @return the count of products
   */
  public long getProductsCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery("SELECT COUNT(p) FROM Product p WHERE p.productName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(p) FROM Product p", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }

  /**
   * Counts the order-items where the product is used as foreign key
   *
   * @param productId id of Product
   * @return the count of foreign keys
   */
  public long getReferenceCount(Integer productId) {
    Product product = getProduct(productId);
    // Count the order-items where the product is used as foreign key
    Long orderCheck = em.createQuery("SELECT COUNT(o) FROM OrderItem o WHERE o.product = :product",
            Long.class)
        .setParameter("product", product)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();

    // Count the stocks where the product is used as foreign key
    Long stockCheck = em.createQuery("SELECT COUNT(s) FROM Stock s WHERE s.product = :product",
            Long.class)
        .setParameter("product", product)
        .setHint("org.hibernate.readOnly", true)
        .getSingleResult();

    if (orderCheck > 0) {
      return orderCheck;
    } else {
      return stockCheck;
    }
  }
}
