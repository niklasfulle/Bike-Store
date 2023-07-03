package bikestoretests;

import java.util.List;
import org.openqa.selenium.By;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.junit.jupiter.api.Assertions;
import org.openqa.selenium.firefox.FirefoxDriver;

/**
 * This class tests the product site. Tests the CRUD operations for the product site.
 */
public class ProductTest {

  private WebDriver driver;

  /**
   * Opens the website and logs in with the given role.
   *
   * @param role The role of the user.
   */
  private void openAndLogin(int role) {
    String[][] logins = {
        {"fabiola.jackson@bikes.shop", "555-5554"},
        {"mireya.copeland@bikes.shop", "555-5555"},
        {"genna.serrano@bikes.shop", "555-5556"},
        {"NotAUser", "NotAPassword"}
    };

    driver = new FirefoxDriver();
    driver.manage().window().setSize(new Dimension(5000, 5000));

    driver.get("http://localhost:8080/bike-store/");

    driver.findElement(By.className("btn")).click();
    driver.findElement(By.id("loginEmail")).sendKeys(logins[role][0]);
    driver.findElement(By.id("loginPasswort")).sendKeys(logins[role][1]);
    driver.findElement(By.name("loginButton")).click();

    driver.get("http://localhost:8080/bike-store/");
  }

  /**
   * Tests if the product site can be opened as admin.
   */
  @Test
  public void openProductSiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/product/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the product site can be opened as user1.
   */
  @Test
  public void openProductSiteAsUser1() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/product/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the product site can be opened as user2.
   */
  @Test
  public void openProductSiteAsUser2() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/product/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the product site can be opened as nouser.
   */
  @Test
  public void openProductSiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new product. Goal: Success, The product is created and
   * redirected to the product site.
   */
  @Test
  public void createProductAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    WebElement productName = driver.findElement(By.cssSelector("input[id*='productName']"));
    productName.sendKeys("AdminRad");

    WebElement modelYear = driver.findElement(By.cssSelector("input[id*='modelYear']"));
    modelYear.sendKeys("1997");

    WebElement listPrice = driver.findElement(By.cssSelector("input[id*='listPrice']"));
    listPrice.sendKeys("299.99");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    WebElement newProductName = lastCard.findElement(By.cssSelector("span[id*='productName1']"));
    String productNameString = newProductName.getText();
    WebElement newProductYear = lastCard.findElement(By.cssSelector("span[id*='modelYear1']"));
    String productYearString = newProductYear.getText();
    WebElement newProductPrice = lastCard.findElement(By.cssSelector("span[id*='listPrice1']"));
    String productNamePrice = newProductPrice.getText();

    Assertions.assertEquals("AdminRad", productNameString);
    Assertions.assertEquals("1997", productYearString);
    Assertions.assertEquals("299.99€", productNamePrice);
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new product. Goal: Failure, The product is not created and an
   * error message is shown.
   */
  @Test
  public void createProductAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();
    WebElement productName = driver.findElement(By.cssSelector("input[id*='productName']"));
    productName.sendKeys("");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement errorMsg = driver.findElement(By.cssSelector("span.errorMessage"));

    Assertions.assertEquals("Name darf nicht leer sein", errorMsg.getText());

    driver.quit();
  }

  /**
   * Tests if an Admin can update a product. Goal: Success, The product is updated and redirected
   */
  @Test
  public void editProductAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='productName']"));
    nameField.clear();
    nameField.sendKeys("UserRad1");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/product/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a product. Goal: Success, The product is deleted and redirected to
   * the product site.
   */
  @Test
  public void deleteNewlyCreatedProductAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/product/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a product. Goal: Failure, The product is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedProductAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(4).click();

    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement card = productCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User1 can create a new product. Goal: Success, The product is created and
   * redirected to the product site.
   */
  @Test
  public void createProductUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    WebElement productName = driver.findElement(By.cssSelector("input[id*='productName']"));
    productName.sendKeys("AdminRad");

    WebElement modelYear = driver.findElement(By.cssSelector("input[id*='modelYear']"));
    modelYear.sendKeys("1997");

    WebElement listPrice = driver.findElement(By.cssSelector("input[id*='listPrice']"));
    listPrice.sendKeys("299.99");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    WebElement newProductName = lastCard.findElement(By.cssSelector("span[id*='productName1']"));
    String productNameString = newProductName.getText();
    WebElement newProductYear = lastCard.findElement(By.cssSelector("span[id*='modelYear1']"));
    String productYearString = newProductYear.getText();
    WebElement newProductPrice = lastCard.findElement(By.cssSelector("span[id*='listPrice1']"));
    String productNamePrice = newProductPrice.getText();

    Assertions.assertEquals("AdminRad", productNameString);
    Assertions.assertEquals("1997", productYearString);
    Assertions.assertEquals("299.99€", productNamePrice);
    driver.quit();
  }

  /**
   * Tests if an User1 can create a new product. Goal: Failure, The product is not created and an
   * error message is shown.
   */
  @Test
  public void createProductUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();
    WebElement productName = driver.findElement(By.cssSelector("input[id*='productName']"));
    productName.sendKeys("");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement errorMsg = driver.findElement(By.cssSelector("span.errorMessage"));

    Assertions.assertEquals("Name darf nicht leer sein", errorMsg.getText());

    driver.quit();
  }

  /**
   * Tests if an User1 can update a product. Goal: Success, The product is updated and redirected
   */
  @Test
  public void editProductUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='productName']"));
    nameField.clear();
    nameField.sendKeys("UserRad1");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/product/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete a product. Goal: Success, The product is deleted and redirected to
   * the product site.
   */
  @Test
  public void deleteNewlyCreatedProductUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/product/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/product/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete a product. Goal: Failure, The product is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedProductUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(3).click();

    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement card = productCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/product/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User2 can create a new product. Goal: Success, The User is not allowed to create a
   * new product and no button is shown.
   */
  @Test
  public void NoAddProductButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(3).click();
    List<WebElement> button = driver.findElements(By.cssSelector("a[name='addBtn'].btn"));
    Assertions.assertEquals(0, button.size());
    driver.quit();
  }

  /**
   * Tests if an User2 can delete a product. Goal: Success, The User is not allowed to delete a new
   * product and no button is shown.
   */
  @Test
  public void NoEditDeleteProductButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(3).click();
    WebElement info = driver.findElement(By.cssSelector("div[class='info']"));
    String attribute = info.getAttribute("onclick");
    Assertions.assertNull(attribute);
    driver.quit();
  }
}