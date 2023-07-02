package de.niklasfulle.bikestore.view;

import java.util.Objects;
import jakarta.inject.Named;
import jakarta.inject.Inject;
import jakarta.enterprise.context.RequestScoped;

import de.niklasfulle.bikestore.business.brand.BrandService;
import de.niklasfulle.bikestore.business.order.OrderService;
import de.niklasfulle.bikestore.business.staff.StaffService;
import de.niklasfulle.bikestore.business.store.StoreService;
import de.niklasfulle.bikestore.business.stocks.StockService;
import de.niklasfulle.bikestore.business.product.ProductService;
import de.niklasfulle.bikestore.business.customer.CustomerService;
import de.niklasfulle.bikestore.business.category.CategoryService;

/**
 * DataPagingController provides the functions for data paging
 *
 * @author Niklas Fulle
 */
@Named
@RequestScoped
public class DataPagingController {

  @Inject
  BrandService brandService;
  @Inject
  CategoryService categoryService;
  @Inject
  CustomerService customerService;
  @Inject
  OrderService orderService;
  @Inject
  ProductService productService;
  @Inject
  StaffService staffService;
  @Inject
  StoreService storeService;
  @Inject
  StockService stockService;

  /**
   * generate the buttons for the data paging
   *
   * @param page     the page where the user is located
   * @param limit    the limit of records per page
   * @param pageName to select the right service class
   * @param search   the search key
   * @return int are the generated buttons for data paging
   */
  public int dataPagingButtonsCheck(int page, int limit, String pageName, String search) {
    int maxPage = maxPage(limit, pageName, search);

    if (maxPage == 1) {
      return 1;
    } else if (page <= 1 && maxPage == 2) {
      return 2;
    } else if (page == 2 && maxPage == 2) {
      return 3;
    } else if (page == 1 && maxPage == 3) {
      return 4;
    } else if (page <= 1 && maxPage >= 3) {
      return 5;
    } else if (page == 2 && maxPage == 3) {
      return 6;
    } else if (page == 3 && maxPage == 3) {
      return 7;
    } else if (page == 2 && maxPage >= 3) {
      return 8;
    } else if (page > 2 && page < maxPage && page + 1 == maxPage) {
      return 9;
    } else if (page > 2 && page < maxPage) {
      return 10;
    } else if (page > 3 && page == maxPage) {
      return 11;
    } else {
      return 0;
    }
  }

  /**
   * Counts how many objects of the type there are
   *
   * @param pageName The viewed page
   * @param search   the search key
   * @return The number of objects
   */
  public int getCount(String pageName, String search) {
    return switch (pageName) {
      case "staff" -> (int) staffService.getStaffsCount(search);
      case "store" -> (int) storeService.getStoresCount(search);
      case "customer" -> (int) customerService.getCustomersCount(search);
      case "product" -> (int) productService.getProductsCount(search);
      case "brand" -> (int) brandService.getBrandsCount(search);
      case "category" -> (int) categoryService.getCategoriesCount(search);
      case "order" -> (int) orderService.getOrdersCount(search);
      case "stocks" -> (int) stockService.getStocksCount(search);
      default -> 0;
    };
  }

  /**
   * calculates the max page for the entity
   *
   * @param limit    the limit per page
   * @param pageName name of the page
   * @param search   the search key
   * @return returns the max page
   */
  public int maxPage(int limit, String pageName, String search) {
    int count = getCount(pageName, search);
    int maxPage;

    if (limit != 0) {
      maxPage = count / limit;
      if (count > maxPage * limit) {
        maxPage++;
      }
    } else {
      maxPage = count / 24;
      if (count > maxPage * 24) {
        maxPage++;
      }
    }
    return maxPage;
  }

  /**
   * creates the link for the data paging button
   *
   * @param limit  the limit per page
   * @param order  the selected order
   * @param search the search key
   * @return returns the link for the button
   */
  public String linkString(int limit, String order, String search) {
    String linkString = "";
    if (limit > 0) {
      linkString = linkString + "&limit=" + limit;
    }

    if (!Objects.equals(order, "")) {
      linkString = linkString + "&order=" + order;
    }

    if (!Objects.equals(search, "")) {
      linkString = linkString + "&search=" + search;
    }

    return linkString;
  }
}
