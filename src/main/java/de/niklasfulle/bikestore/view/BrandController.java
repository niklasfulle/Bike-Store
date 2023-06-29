package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.brand.BrandService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;

/**
 * This class is part of the view layer. The BrandController works with the BrandService to provide
 * the data of the brand entity to the view.
 */
@Named
@RequestScoped
public class BrandController {

  // Attributes
  @NotNull
  Integer brandId;
  @NotNull
  String brandName;
  // Services
  @Inject
  private BrandService brandService;

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
