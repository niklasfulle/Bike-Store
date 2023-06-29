package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.stocks.Stock;
import de.niklasfulle.bikestore.business.stocks.StockService;

/**
 * This class is part of the view layer. The StockController works with the
 * StockService to provide the data of the stock entity to the view.
 */
@Named
@RequestScoped
public class StockController {
  // Services
  @Inject
  private StockService stockService;

  // Attributes
  @NotNull
  String stockId;

  @NotNull
  Integer productId;

  @NotNull
  Integer storeId;

  @NotNull
  int quantity;

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
