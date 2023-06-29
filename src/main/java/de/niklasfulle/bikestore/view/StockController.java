package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.stocks.Stock;
import de.niklasfulle.bikestore.business.stocks.StockService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * This class is part of the view layer. The StockController works with the StockService to provide
 * the data of the stock entity to the view.
 */
@Named
@RequestScoped
public class StockController {

  private final String readirectString = "/sites/stocks/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  StockService stockService;

  // Attributes
  @NotNull
  String stockId;
  @NotNull
  Integer productId;
  @NotNull
  Integer storeId;
  @NotNull
  int quantity;

  // Methods

  /**
   * This method is used to update a stock.
   *
   * @return the view where the user is redirected
   */
  public String updateStock() {
    stockService.update(stockId, quantity);
    return readirectString;
  }

  /**
   * This method is used to get a stock by id, the id is a combination of the id's of the product
   * and the store. The id is in the format: productId_storeId (e.g. 1_1). Id's needed to be
   * converted to Integer before they can be used.
   *
   * @param stockId id of Stock
   * @return the stock
   */
  public Stock getStock(String stockId) {
    String[] keys = stockId.split("_");
    Integer productId = Integer.parseInt(keys[0]);
    Integer storeId = Integer.parseInt(keys[1]);

    return stockService.getStock(productId, storeId);
  }

  /**
   * Receives all stocks from the database.
   *
   * @return A list of all stocks
   */
  public List<Stock> getAllStocks() {
    return stockService.getAllStocks();
  }

  /**
   * Receives all stocks from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the stocks are sorted
   * @param search the search key
   * @return A list of all stocks
   */
  public List<Stock> getAllStocksParameter(int page, int limit, String order, String search) {
    return stockService.getAllStocks(page, limit, order, search);
  }

  // Getter and Setter
  public String getStockId() {
    return stockId;
  }

  public void setStockId(String stockId) {
    this.stockId = stockId;
  }

  public Integer getProductId() {
    return productId;
  }

  public void setProduct(Integer productId) {
    this.productId = productId;
  }

  public Integer getStoreId() {
    return storeId;
  }

  public void setStore(Integer storeId) {
    this.storeId = storeId;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
}
