package de.niklasfulle.bikestore.business.category;

import java.util.List;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import de.niklasfulle.bikestore.business.product.Product;

/**
 * The Entity Category represents the categories table in the database.
 * Category is responsible for the processing of the data of the Category
 * objects in the database.
 */
@Entity
@Table(name = "categories")
public class Category {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "category_id")
  private Integer categoryId;

  @Column(name = "category_name")
  private String categoryName;

  // One to Many-Association with the products table (or the Product entity)
  @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
  private List<Product> products;

  public Category() {
  }

  public Category(String categoryName) {
    this.categoryName = categoryName;
  }

  // Getter and Setter
  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  public List<Product> getProducts() {
    return products;
  }

  public void setProducts(List<Product> products) {
    this.products = products;
  }
}
