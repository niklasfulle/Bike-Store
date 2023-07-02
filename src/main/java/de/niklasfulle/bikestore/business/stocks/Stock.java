package de.niklasfulle.bikestore.business.stocks;

import java.io.Serial;
import java.io.Serializable;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.JoinColumn;

import de.niklasfulle.bikestore.business.store.Store;
import de.niklasfulle.bikestore.business.product.Product;

/**
 * The Entity Stock represents the stocks table in the database. Stock is responsible for the
 * processing of the data of the Stock objects in the database.
 */
@Entity
@Table(name = "stocks")
public class Stock implements Serializable {

  @Serial
  private static final long serialVersionUID = 1L;

  @EmbeddedId
  private StockKeys id;

  private Integer quantity;

  // Many To One-Association with table products (or the Product entity)
  @ManyToOne
  @JoinColumn(name = "product_id", insertable = false, updatable = false)
  private Product product;

  // Many To One-Association with table stores (or the Store entity)
  @ManyToOne
  @JoinColumn(name = "store_id", insertable = false, updatable = false)
  private Store store;

  public Stock() {
  }

  public Stock(StockKeys id, Integer quantity, Product product, Store store) {
    this.id = id;
    this.quantity = quantity;
    this.product = product;
    this.store = store;
  }

  // Setter and Getter
  public StockKeys getId() {
    return id;
  }

  public void setId(StockKeys id) {
    this.id = id;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  public Store getStore() {
    return store;
  }

  public void setStore(Store store) {
    this.store = store;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(Integer quantity) {
    this.quantity = quantity;
  }
}
