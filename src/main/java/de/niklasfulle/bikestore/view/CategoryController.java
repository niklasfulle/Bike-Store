package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.category.Category;
import de.niklasfulle.bikestore.business.category.CategoryService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.validation.constraints.NotNull;
import java.util.List;

/**
 * This class is part of the view layer. The CategoryController works with the CategoryService to
 * provide the data of the category entity to the view.
 */
@Named
@RequestScoped
public class CategoryController {

  private final String readirectString = "/sites/category/View.xhtml?faces-redirect=true";

  // Services
  @Inject
  CategoryService categoryService;

  // Attributes
  @NotNull
  Integer categoryId;

  @NotNull
  String categoryName;

  // Methods

  /**
   * This method is used to save a new category.
   *
   * @return the view where the user is redirected
   */
  public String saveCategory() {
    Category category = new Category(categoryName);
    categoryService.save(category);
    return readirectString;
  }

  /**
   * This method is used to remove a category.
   *
   * @return the view where the user is redirected
   */
  public String removeCategory() {
    if (removeCheck(categoryId)) {
      categoryService.remove(categoryId);
    }
    return readirectString;
  }

  /**
   * This method is used to check if a category can be removed.
   *
   * @param categoryId id of Category
   * @return true if the category can be removed
   */
  public boolean removeCheck(Integer categoryId) {
    return categoryService.getReferenceCount(categoryId) == 0;
  }

  /**
   * This method is used to get a category by id
   *
   * @param categoryId id of Category
   * @return the category
   */
  public Category getCategory(Integer categoryId) {
    return categoryService.getCategory(categoryId);
  }

  /**
   * Receives all categories from the database.
   *
   * @return A list of all categories
   */
  public List<Category> getAllCategories() {
    return categoryService.getAllCategories();
  }

  /**
   * Receives all categories from the list. page and offset needed to calculate the final offset
   *
   * @param page   the page where the user is located
   * @param limit  the limit of records per page
   * @param order  how the categories are sorted
   * @param search the search key
   * @return A list of all categories
   */
  public List<Category> getAllCategoriesParameter(int page, int limit, String order,
      String search) {
    return categoryService.getAllCategories(page, limit, order, search);
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
}
