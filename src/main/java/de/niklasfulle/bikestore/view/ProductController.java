package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.brand.BrandService;
import de.niklasfulle.bikestore.business.category.Category;
import de.niklasfulle.bikestore.business.category.CategoryService;
import de.niklasfulle.bikestore.business.product.Product;
import de.niklasfulle.bikestore.business.product.ProductService;
import de.niklasfulle.bikestore.business.stocks.Stock;
import de.niklasfulle.bikestore.business.stocks.StockKeys;
import de.niklasfulle.bikestore.business.stocks.StockService;
import de.niklasfulle.bikestore.business.store.StoreService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

/**
 * This class is part of the view layer. The ProductController works with the ProductService to
 * provide the data of the product entity to the view.
 */
@Named
@RequestScoped
public class ProductController {

  private final String readirectString = "/sites/product/View.xhtml?faces-redirect=true";

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

  // Methods

  /**
   * This method is used to save a new product. It also can creates the stock for the product. If
   * the stock quantity is null or 0, no stock will be created.
   *
   * @return the view where the user is redirected
   */
  public String saveProduct() {
    Product product = new Product(listPrice, modelYear, productName, brandService.getBrand(brandId),
        categoryService.getCategory(categoryId));
    Product savedProduct = productService.save(product);

    if (stockQuantityStore1 != null && stockQuantityStore1 > 0) {
      StockKeys id = new StockKeys(savedProduct.getProductId(), 1);
      Stock stock1 = new Stock(id, stockQuantityStore1, savedProduct, storeService.getStore(1));
      stockService.save(stock1);
    }

    if (stockQuantityStore2 != null && stockQuantityStore2 > 0) {
      StockKeys id = new StockKeys(savedProduct.getProductId(), 2);
      Stock stock2 = new Stock(id, stockQuantityStore2, savedProduct, storeService.getStore(2));
      stockService.save(stock2);
    }

    if (stockQuantityStore3 != null && stockQuantityStore3 > 0) {
      StockKeys id = new StockKeys(savedProduct.getProductId(), 3);
      Stock stock3 = new Stock(id, stockQuantityStore3, savedProduct, storeService.getStore(3));
      stockService.save(stock3);
    }

    return readirectString;
  }

  /**
   * This method is used to update a product.
   *
   * @return the view where the user is redirected
   */
  public String updateProduct() {
    Category category = categoryService.getCategory(categoryId);
    Brand brand = brandService.getBrand(brandId);
    productService.update(productId, productName, brand, category, modelYear, listPrice);
    return readirectString;
  }

  /**
   * This method is used to remove a product.
   *
   * @return the view where the user is redirected
   */
  public String removeProduct() {
    if (removeCheck(productId)) {
      productService.remove(productId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a product can be removed.
   *
   * @param productId id of product
   * @return true if the product can be removed
   */
  public boolean removeCheck(Integer productId) {
    return productService.getReferenceCount(productId) == 0;
  }

  /**
   * This method is used to get a product by id
   *
   * @param productId id of Product
   * @return the product
   */
  public Product getProduct(Integer productId) {
    return productService.getProduct(productId);
  }

  /**
   * Receives all products from the database.
   *
   * @return A list of all products
   */
  public List<Product> getAllProducts() {
    return productService.getAllProducts();
  }

  /**
   * Receives all products from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the products are sorted
   * @param search the search key
   * @return A list of all products
   */
  public List<Product> getAllProductsParameter(int page, int limit, String order, String search) {
    return productService.getAllProducts(page, limit, order, search);
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
