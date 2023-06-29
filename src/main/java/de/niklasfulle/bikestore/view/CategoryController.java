package de.niklasfulle.bikestore.view;

import java.util.List;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotNull;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.category.Category;
import de.niklasfulle.bikestore.business.category.CategoryService;

/**
 * This class is part of the view layer. The CategoryController works with the
 * CategoryService to provide the data of the category entity to the view.
 */
@Named
@RequestScoped
public class CategoryController {
  // Services
  @Inject
  private CategoryService categoryService;

  // Attributes
  @NotNull
  Integer categoryId;

  @NotNull
  String categoryName;

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
