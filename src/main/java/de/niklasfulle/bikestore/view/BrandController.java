package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.brand.BrandService;

/**
 * This class is part of the view layer. The BrandController works with the
 * BrandService to provide the data of the brand entity to the view.
 */
@Named
@RequestScoped
public class BrandController {
  // Services
  @Inject
  private BrandService brandService;

  // Attributes
  @NotNull
  Integer brandId;

  @NotNull
  String brandName;

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
