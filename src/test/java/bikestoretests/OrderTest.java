package bikestoretests;

import java.util.List;
import org.openqa.selenium.By;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.junit.jupiter.api.Assertions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.firefox.FirefoxDriver;

/**
 * This class tests the order site. Tests the CRUD operations for the order site.
 */
public class OrderTest {

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
    List<WebElement> loginInputs = driver.findElements(By.tagName("input"));
    loginInputs.get(1).sendKeys(logins[role][0]);
    loginInputs.get(2).sendKeys(logins[role][1]);
    loginInputs.get(3).click();

    driver.get("http://localhost:8080/bike-store/");
  }

  /**
   * Tests if the order site can be opened as admin.
   */
  @Test
  public void openOrderSiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(8).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/order/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the order site can be opened as user1.
   */
  @Test
  public void openOrderSiteAsUser1() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/order/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the order site can be opened as user2.
   */
  @Test
  public void openOrderSiteAsUser2() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/order/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the order site can be opened as nouser.
   */
  @Test
  public void openOrderSiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new order. Goal: Success, The order is created and redirected to
   * the order site.
   */
  @Test
  public void createOrderAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(8).click();
    driver.findElement(By.className("options")).findElement(By.className("btn")).click();

    List<WebElement> orderInputs = driver.findElements(By.tagName("input"));

    orderInputs.get(4).sendKeys("2023-05-22");
    orderInputs.get(5).sendKeys("2023-05-23");

    List<WebElement> productSelects = driver.findElements(By.tagName("select"));

    Select product1 = new Select(productSelects.get(3));
    product1.selectByVisibleText("Trek 820 - 2016");
    orderInputs.get(6).sendKeys("0.00");
    orderInputs.get(7).sendKeys("1");
    orderInputs.get(16).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/order/View.xhtml?page=" + lastPage);
    WebElement orderCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> orderCards = orderCard.findElements(
        By.cssSelector("div[class='card orderStatus1']"));
    WebElement lastCard = orderCards.get(orderCards.size() - 1);

    WebElement newOrderCustomerName = lastCard.findElement(
        By.cssSelector("span[id*='customerName1']"));
    String orderCustomerNameString = newOrderCustomerName.getText();
    WebElement newOrderStaffName = lastCard.findElement(By.cssSelector("span[id*='staffName1']"));
    String orderStaffNameString = newOrderStaffName.getText();
    WebElement newOrderStoreName = lastCard.findElement(By.cssSelector("span[id*='storeName1']"));
    String orderStoreNameString = newOrderStoreName.getText();

    Assertions.assertEquals("newName Burks", orderCustomerNameString);
    Assertions.assertEquals("Fabiola Jackson", orderStaffNameString);
    Assertions.assertEquals("Santa Cruz Bikes", orderStoreNameString);
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new order. Goal: Failure, The order is not created and an error
   * message is shown.
   */
  @Test
  public void createOrderAdminFailed() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(8).click();
    driver.findElement(By.className("options")).findElement(By.className("btn")).click();

    List<WebElement> orderInputs = driver.findElements(By.tagName("input"));

    orderInputs.get(4).sendKeys("2023-05-22");

    List<WebElement> productSelects = driver.findElements(By.tagName("select"));

    Select product1 = new Select(productSelects.get(3));
    product1.selectByVisibleText("Trek 820 - 2016");
    orderInputs.get(6).sendKeys("0.00");

    orderInputs.get(16).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("Benötigt Datum darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an Admin can delete an order. Goal: Success, The order is deleted and redirected to
   * the order site.
   */
  @Test
  public void deleteNewlyCreatedOrderAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(8).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/order/View.xhtml?page=" + lastPage);
    WebElement orderCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> orderCards = orderCard.findElements(
        By.cssSelector("div[class='card orderStatus1']"));
    WebElement lastCard = orderCards.get(orderCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/order/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/order/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete an order. Goal: Failure, The order is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedOrderAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(8).click();

    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(
        By.cssSelector("div[class='card orderStatus4']"));
    WebElement card = customerCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/order/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User1 can create a new order. Goal: Success, The order is created and redirected to
   * the order site.
   */
  @Test
  public void createOrderUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();
    driver.findElement(By.className("options")).findElement(By.className("btn")).click();

    List<WebElement> orderInputs = driver.findElements(By.tagName("input"));

    orderInputs.get(4).sendKeys("2023-05-22");
    orderInputs.get(5).sendKeys("2023-05-23");

    List<WebElement> productSelects = driver.findElements(By.tagName("select"));

    Select product1 = new Select(productSelects.get(3));
    product1.selectByVisibleText("Trek 820 - 2016");
    orderInputs.get(6).sendKeys("0.00");
    orderInputs.get(7).sendKeys("1");
    orderInputs.get(16).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/order/View.xhtml?page=" + lastPage);
    WebElement orderCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> orderCards = orderCard.findElements(
        By.cssSelector("div[class='card orderStatus1']"));
    WebElement lastCard = orderCards.get(orderCards.size() - 1);

    WebElement newOrderCustomerName = lastCard.findElement(
        By.cssSelector("span[id*='customerName1']"));
    String orderCustomerNameString = newOrderCustomerName.getText();
    WebElement newOrderStaffName = lastCard.findElement(By.cssSelector("span[id*='staffName1']"));
    String orderStaffNameString = newOrderStaffName.getText();
    WebElement newOrderStoreName = lastCard.findElement(By.cssSelector("span[id*='storeName1']"));
    String orderStoreNameString = newOrderStoreName.getText();

    Assertions.assertEquals("newName Burks", orderCustomerNameString);
    Assertions.assertEquals("Fabiola Jackson", orderStaffNameString);
    Assertions.assertEquals("Santa Cruz Bikes", orderStoreNameString);
    driver.quit();
  }

  /**
   * Tests if an User1 can create a new order. Goal: Failure, The order is not created and an error
   * message is shown.
   */
  @Test
  public void createOrderUser1Failed() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();
    driver.findElement(By.className("options")).findElement(By.className("btn")).click();

    List<WebElement> orderInputs = driver.findElements(By.tagName("input"));

    orderInputs.get(4).sendKeys("2023-05-22");

    List<WebElement> productSelects = driver.findElements(By.tagName("select"));

    Select product1 = new Select(productSelects.get(3));
    product1.selectByVisibleText("Trek 820 - 2016");
    orderInputs.get(6).sendKeys("0.00");

    orderInputs.get(16).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("Benötigt Datum darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an User1 can delete an order. Goal: Success, The order is deleted and redirected to
   * the order site.
   */
  @Test
  public void deleteNewlyCreatedOrderUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/order/View.xhtml?page=" + lastPage);
    WebElement orderCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> orderCards = orderCard.findElements(
        By.cssSelector("div[class='card orderStatus1']"));
    WebElement lastCard = orderCards.get(orderCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/order/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/order/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete an order. Goal: Failure, The order is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedOrderUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(7).click();

    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(
        By.cssSelector("div[class='card orderStatus4']"));
    WebElement card = customerCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/order/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User2 can create a new order. Goal: Success, The User is not allowed to create a
   * new order and no button is shown.
   */
  @Test
  public void NoAddOrderButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(2).click();
    List<WebElement> button = driver.findElements(By.cssSelector("a[name='addBtn'].btn"));
    Assertions.assertEquals(0, button.size());
    driver.quit();
  }

  /**
   * Tests if an User2 can delete an order. Goal: Success, The User is not allowed to delete a new
   * order and no button is shown.
   */
  @Test
  public void NoEditDeleteOrderButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(2).click();
    WebElement info = driver.findElement(By.cssSelector("div[class='info']"));
    String attribute = info.getAttribute("onclick");
    Assertions.assertNull(attribute);
    driver.quit();
  }
}