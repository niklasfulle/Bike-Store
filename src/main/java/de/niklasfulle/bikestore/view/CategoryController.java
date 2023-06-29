package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.category.CategoryService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;

/**
 * This class is part of the view layer. The CategoryController works with the CategoryService to
 * provide the data of the category entity to the view.
 */
@Named
@RequestScoped
public class CategoryController {

  // Attributes
  @NotNull
  Integer categoryId;
  @NotNull
  String categoryName;
  // Services
  @Inject
  private CategoryService categoryService;

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
}
