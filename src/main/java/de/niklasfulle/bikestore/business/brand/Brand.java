package de.niklasfulle.bikestore.business.brand;

import java.util.List;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import de.niklasfulle.bikestore.business.product.Product;

/**
 * The Entity Brand represents the brands table in the database.
 * Brand is responsible for the processing of the data of the Brand objects in
 * the database.
 */
@Entity
@Table(name = "brands")
public class Brand{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "brand_id")
  private Integer brandId;

  @Column(name = "brand_name")
  private String brandName;

  // One to Many-Association with the products table (or the Product entity)
  @OneToMany(mappedBy = "brand", fetch = FetchType.LAZY)
  private List<Product> products;

  public Brand() {
  }

  public Brand(String brandName) {
    this.brandName = brandName;
  }

  // Getter and Setter
  public Integer getBrandId() {
    return brandId;
  }

  public void setBrandId(Integer brandId) {
    this.brandId = brandId;
  }

  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }
}
