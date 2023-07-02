package de.niklasfulle.bikestore.business.stocks;

import java.util.List;
import java.util.Objects;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

/**
 * The StockService class is responsible for the processing of the data of the Stock Entity. It is
 * used to communicate with the database.
 */
@Stateless
public class StockService {

  // The EntityManager is used to communicate with the database.
  @PersistenceContext
  EntityManager em;

  /**
   * Saves the Stock in the database through the EntityManager.
   *
   * @param stock the Stock to be saved
   */
  public void save(Stock stock) {
    em.persist(stock);
  }

  /**
   * Updates Stock in the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The stock is updated by setting the new values. The EntityManager
   * is flushed to save the changes. If the stock is not found, it will not be updated.
   *
   * @param stockId id of Stock to be updated
   */
  public void update(String stockId, Integer quantity) {
    String[] keys = stockId.split("_");
    Integer productId = Integer.parseInt(keys[0]);
    Integer storeId = Integer.parseInt(keys[1]);
    StockKeys sid = new StockKeys(productId, storeId);
    Stock toUpdate = em.find(Stock.class, sid);

    try {
      em.merge(toUpdate);
      toUpdate.setQuantity(quantity);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to update the stock");
    }
  }

  /**
   * Removes Stock from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity.
   *
   * @param sid StockKeys of Stock to be removed
   */
  public void remove(StockKeys sid) {
    Stock toRemove = em.find(Stock.class, sid);
    try {
      em.merge(toRemove);
      toRemove.setProduct(null);
      toRemove.setStore(null);
      em.remove(toRemove);
      em.flush();
    } catch (Exception e) {
      System.out.println("Impossible to delete the stock");
    }
  }

  /**
   * Gets the Stock from the database through the EntityManager. It uses the EntityManagers' find
   * function to fetch the Entity. The StockKeys need to be created before calling this function.
   *
   * @param storeId   id of Stock
   * @param productId id of Stock
   */
  public Stock getStock(Integer productId, Integer storeId) {
    StockKeys sid = new StockKeys(productId, storeId);
    return em.find(Stock.class, sid);
  }

  /**
   * Receives all stocks from the database.
   *
   * @return A list of all stocks
   */
  public List<Stock> getAllStocks() {
    return em.createQuery("SELECT s FROM Stock s", Stock.class)
        .setHint("org.hibernate.readOnly", true)
        .getResultList();
  }

  /**
   * Receives all stocks from the database page and offset needed to calculate the final offset. If
   * the Limit is 0 then it will be set 24. If the offset is smaller than 0 it will be set to 0.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the stocks are sorted
   * @param search the search key
   * @return A list of all stocks
   */
  public List<Stock> getAllStocks(int page, int limit, String order, String search) {
    if (limit == 0) {
      limit = 24;
    }
    int offset = (page - 1) * limit;
    if (offset < 0) {
      offset = 0;
    }

    // Map the order to the correct column.
    String orderBy = mapSocksOrderBy(order);
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT s FROM Stock s WHERE s.product.productName LIKE :searchTerm OR s.store.storeName LIKE :searchTerm ORDER BY "
                  + orderBy,
              Stock.class)
          .setParameter("searchTerm", search + "%")
          .setFirstResult(offset)
          .setMaxResults(limit)
          .setHint("org.hibernate.readOnly", true)
          .getResultList();
    } else {
      return em.createQuery("SELECT s FROM Stock s ORDER BY " + orderBy, Stock.class)
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
  private String mapSocksOrderBy(String order) {
    return switch (order) {
      case "product" -> "s.product ASC";
      case "store" -> "s.store ASC";
      default -> "s.id ASC";
    };
  }

  /**
   * Counts the stocks in the database.
   *
   * @param search the search key
   * @return the count of stocks
   */
  public long getStocksCount(String search) {
    if (!Objects.equals(search, "")) {
      return em.createQuery(
              "SELECT COUNT(s) FROM Stock s WHERE s.product.productName LIKE :searchTerm OR s.store.storeName LIKE :searchTerm",
              Long.class)
          .setParameter("searchTerm", search + "%")
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    } else {
      return em.createQuery("SELECT COUNT(s) FROM Stock s", Long.class)
          .setHint("org.hibernate.readOnly", true)
          .getSingleResult();
    }
  }
}
