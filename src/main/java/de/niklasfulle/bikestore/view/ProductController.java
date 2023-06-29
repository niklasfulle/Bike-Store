package de.niklasfulle.bikestore.view;

import java.math.BigDecimal;
import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.brand.BrandService;
import de.niklasfulle.bikestore.business.store.StoreService;
import de.niklasfulle.bikestore.business.stocks.Stock;
import de.niklasfulle.bikestore.business.stocks.StockKeys;
import de.niklasfulle.bikestore.business.stocks.StockService;
import de.niklasfulle.bikestore.business.category.Category;
import de.niklasfulle.bikestore.business.category.CategoryService;
import de.niklasfulle.bikestore.business.product.Product;
import de.niklasfulle.bikestore.business.product.ProductService;

/**
 * This class is part of the view layer. The ProductController works with the
 * ProductService to provide the data of the product entity to the view.
 */
@Named
@RequestScoped
public class ProductController {
  // Services
  @Inject
  ProductService productService;

  @Inject
  BrandService brandService;

  @Inject
  CategoryService categoryService;

  @Inject
  StoreService storeService;

  @Inject
  StockService stockService;

  // Attributes
  @NotNull
  Integer productId;

  @NotNull
  @DecimalMin(value = "0.00")
  BigDecimal listPrice;

  @NotNull
  Integer modelYear;

  @NotNull
  String productName;

  @NotNull
  Integer brandId;

  @NotNull
  Integer categoryId;

  Integer stockQuantityStore1;

  Integer stockQuantityStore2;

  Integer stockQuantityStore3;

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

  public Integer getBrandId() {
    return brandId;
  }

  public void setBrandId(Integer brandId) {
    this.brandId = brandId;
  }

  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public Integer getStockQuantityStore1() {
    return stockQuantityStore1;
  }

  public void setStockQuantityStore1(Integer stockQuantityStore1) {
    this.stockQuantityStore1 = stockQuantityStore1;
  }

  public Integer getStockQuantityStore2() {
    return stockQuantityStore2;
  }

  public void setStockQuantityStore2(Integer stockQuantityStore2) {
    this.stockQuantityStore2 = stockQuantityStore2;
  }

  public Integer getStockQuantityStore3() {
    return stockQuantityStore3;
  }

  public void setStockQuantityStore3(Integer stockQuantityStore3) {
    this.stockQuantityStore3 = stockQuantityStore3;
  }
}
