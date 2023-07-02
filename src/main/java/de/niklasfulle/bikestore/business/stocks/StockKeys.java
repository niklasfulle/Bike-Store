package de.niklasfulle.bikestore.business.stocks;

import java.io.Serial;
import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.enterprise.context.RequestScoped;

/**
 * StockKeys is responsible for the storing the foreign keys of the table Stocks. It includes the
 * product-id and store-id
 */
@RequestScoped
public class StockKeys implements Serializable {

  @Serial
  private static final long serialVersionUID = 1L;

  @Column(name = "product_id", insertable = false, updatable = false)
  private Integer productId;

  @Column(name = "store_id", insertable = false, updatable = false)
  private Integer storeId;

  public StockKeys() {
  }

  public StockKeys(Integer productId, Integer storeId) {
    this.productId = productId;
    this.storeId = storeId;
  }

  // Setter and Getter
  public Integer getProductId() {
    return this.productId;
  }

  public void setProductId(Integer productId) {
    this.productId = productId;
  }

  public Integer getStoreId() {
    return this.storeId;
  }

  public void setStoreId(Integer storeId) {
    this.storeId = storeId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    StockKeys stockKeys = (StockKeys) o;

    if (!productId.equals(stockKeys.productId)) {
      return false;
    }
    return storeId.equals(stockKeys.storeId);
  }

  @Override
  public int hashCode() {
    int result = productId.hashCode();
    result = 31 * result + storeId.hashCode();
    return result;
  }
}
