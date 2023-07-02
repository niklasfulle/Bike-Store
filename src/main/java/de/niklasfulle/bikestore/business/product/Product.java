package de.niklasfulle.bikestore.business.product;

import java.util.List;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.CascadeType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.validation.constraints.Digits;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.stocks.Stock;
import de.niklasfulle.bikestore.business.category.Category;
import de.niklasfulle.bikestore.business.orderItem.OrderItem;

/**
 * The Entity Product represents the products table in the database. Product is responsible for the
 * processing of the data of the Product objects in the database.
 */
@Entity
@Table(name = "products")
public class Product implements Serializable {

  @Serial
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "product_id")
  private Integer productId;

  @Column(name = "list_price")
  @Digits(integer = 19, fraction = 2)
  private BigDecimal listPrice;

  @Column(name = "model_year")
  private Integer modelYear;

  @Column(name = "product_name")
  private String productName;

  // Many To One-Association with table brands (or the Brand entity)
  @ManyToOne(cascade = CascadeType.MERGE)
  @JoinColumn(name = "brand_id")
  private Brand brand;

  // Many To One-Association with table catergories (or the Category entity)
  @ManyToOne(cascade = CascadeType.MERGE)
  @JoinColumn(name = "category_id")
  private Category category;

  // One to Many-Association with the order_items table (or the OrderItem entity)
  @OneToMany(mappedBy = "product", cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
  private List<OrderItem> orderItems;

  // One to Many-Association with the stocks table (or the Order Stock)
  @OneToMany(mappedBy = "product", cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
  private List<Stock> stocks;

  public Product() {
  }

  public Product(
      BigDecimal listPrice, Integer modelYear, String productName, Brand brand, Category category) {
    this.listPrice = listPrice;
    this.modelYear = modelYear;
    this.productName = productName;
    this.brand = brand;
    this.category = category;
  }

  // Getter and Setter
  public Integer getProductId() {
    return productId;
  }

  public void setProductId(Integer productId) {
    this.productId = productId;
  }

  public BigDecimal getListPrice() {
    return listPrice;
  }

  public void setListPrice(BigDecimal listPrice) {
    this.listPrice = listPrice;
  }

  public Integer getModelYear() {
    return modelYear;
  }

  public void setModelYear(Integer modelYear) {
    this.modelYear = modelYear;
  }

  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public Brand getBrand() {
    return brand;
  }

  public void setBrand(Brand brand) {
    this.brand = brand;
  }

  public Category getCategory() {
    return category;
  }

  public void setCategory(Category category) {
    this.category = category;
  }

  public List<OrderItem> getOrderItems() {
    return orderItems;
  }

  public void setOrderItems(List<OrderItem> orderItems) {
    this.orderItems = orderItems;
  }

  public List<Stock> getStocks() {
    return stocks;
  }

  public void setStocks(List<Stock> stocks) {
    this.stocks = stocks;
  }
}
