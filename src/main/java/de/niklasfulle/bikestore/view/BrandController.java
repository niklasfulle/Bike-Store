package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.brand.Brand;
import de.niklasfulle.bikestore.business.brand.BrandService;

/**
 * This class is part of the view layer. The BrandController works with the BrandService to provide
 * the data of the brand entity to the view.
 */
@Named
@RequestScoped
public class BrandController {

  private final String readirectString = "/sites/brand/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  BrandService brandService;

  // Attributes
  @NotNull
  Integer brandId;

  @NotNull
  String brandName;

  // Methods

  /**
   * This method is used to save a new brand.
   *
   * @return the view where the user is redirected
   */
  public String saveBrand() {
    Brand brand = new Brand(brandName);
    brandService.save(brand);

    return readirectString;
  }

  /**
   * This method is used to remove a brand.
   *
   * @return the view where the user is redirected
   */
  public String removeBrand() {
    if (removeCheck(brandId)) {
      brandService.remove(brandId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a brand can be removed.
   *
   * @param brandId id of Brand
   * @return true if the brand can be removed
   */
  public boolean removeCheck(Integer brandId) {
    return brandService.getReferenceCount(brandId) == 0;
  }

  /**
   * This method is used to get a brand by id
   *
   * @param brandId id of Brand
   * @return the brand
   */
  public Brand getBrand(Integer brandId) {
    return brandService.getBrand(brandId);
  }

  /**
   * Receives all brands from the database.
   *
   * @return A list of all brands
   */
  public List<Brand> getAllBrands() {
    return brandService.getAllBrands();
  }

  /**
   * This method is used to get all brands with pagination and sorting. Page and offset needed to
   * calculate the final offset.
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the brands are sorted
   * @param search the search key
   * @return A list of all brands
   */
  public List<Brand> getAllBrandsParameter(int page, int limit, String order, String search) {
    return brandService.getAllBrands(page, limit, order, search);
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
