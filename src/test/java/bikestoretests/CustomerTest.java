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
 * This class tests the customer site. Tests the CRUD operations for the customer site.
 */
public class CustomerTest {

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
   * Tests if the customer site can be opened as admin.
   */
  @Test
  public void openCustomerSiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/customer/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the customer site can be opened as user1.
   */
  @Test
  public void openCustomerSiteAsUser1() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/customer/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the customer site can be opened as user2.
   */
  @Test
  public void openCustomerSiteAsUser2() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/customer/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the customer site can be opened as nouser.
   */
  @Test
  public void openCustomerSiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new customer. Goal: Success, The customer is created and
   * redirected to the customer site.
   */
  @Test
  public void createCustomerAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("customerFirstname")).sendKeys("Firstname");
    driver.findElement(By.id("customerLastname")).sendKeys("Lastname");
    driver.findElement(By.id("customerEmail")).sendKeys("Email");
    driver.findElement(By.id("customerPhone")).sendKeys("0");
    driver.findElement(By.id("customerStreet")).sendKeys("Street");
    driver.findElement(By.id("customerPostalCode")).sendKeys("0");
    driver.findElement(By.id("customerCity")).sendKeys("City");
    driver.findElement(By.id("customerState")).sendKeys("State");

    driver.findElement(By.id("saveButton")).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = customerCards.get(customerCards.size() - 1);

    WebElement newCustomerName = lastCard.findElement(By.cssSelector("span[id*='name1']"));
    String customerNameString = newCustomerName.getText();
    WebElement newCustomerEmail = lastCard.findElement(By.cssSelector("span[id*='email1']"));
    String customeremailString = newCustomerEmail.getText();
    WebElement newCustomerPhone = lastCard.findElement(By.cssSelector("span[id*='phone1']"));
    String CustomerPhoneString = newCustomerPhone.getText();

    Assertions.assertEquals("Firstname Lastname", customerNameString);
    Assertions.assertEquals("Email", customeremailString);
    Assertions.assertEquals("0", CustomerPhoneString);
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new customer. Goal: Failure, The customer is not created and an
   * error message is shown.
   */
  @Test
  public void createCustomerAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("customerFirstname")).sendKeys("Firstname");
    driver.findElement(By.id("customerLastname")).sendKeys("Lastname");
    driver.findElement(By.id("customerEmail")).sendKeys("Email");
    driver.findElement(By.id("customerPhone")).sendKeys("0");
    driver.findElement(By.id("customerStreet")).sendKeys("Street");
    driver.findElement(By.id("customerPostalCode")).sendKeys("0");
    driver.findElement(By.id("customerCity")).sendKeys("City");

    driver.findElement(By.id("saveButton")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("State darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an Admin can update a customer. Goal: Success, The customer is updated and redirected
   */
  @Test
  public void editCustomerAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = customerCards.get(customerCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='customerFirstname']"));
    nameField.clear();
    nameField.sendKeys("newName");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/customer/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a customer. Goal: Success, The customer is deleted and redirected
   * to the customer site.
   */
  @Test
  public void deleteNewlyCreatedCustomerAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = customerCards.get(customerCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/customer/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a customer. Goal: Failure, The customer is not deleted and an
   * error message is shown.
   */
  @Test
  public void deleteNewlyCreatedCustomerAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(3).click();

    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement card = customerCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User1 can create a new customer. Goal: Success, The customer is created and
   * redirected to the customer site.
   */
  @Test
  public void createCustomerUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("customerFirstname")).sendKeys("Firstname");
    driver.findElement(By.id("customerLastname")).sendKeys("Lastname");
    driver.findElement(By.id("customerEmail")).sendKeys("Email");
    driver.findElement(By.id("customerPhone")).sendKeys("0");
    driver.findElement(By.id("customerStreet")).sendKeys("Street");
    driver.findElement(By.id("customerPostalCode")).sendKeys("0");
    driver.findElement(By.id("customerCity")).sendKeys("City");
    driver.findElement(By.id("customerState")).sendKeys("State");

    driver.findElement(By.id("saveButton")).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement productCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> productCards = productCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = productCards.get(productCards.size() - 1);

    WebElement newCustomerName = lastCard.findElement(By.cssSelector("span[id*='name1']"));
    String customerNameString = newCustomerName.getText();
    WebElement newCustomerEmail = lastCard.findElement(By.cssSelector("span[id*='email1']"));
    String customeremailString = newCustomerEmail.getText();
    WebElement newCustomerPhone = lastCard.findElement(By.cssSelector("span[id*='phone1']"));
    String customerPhoneString = newCustomerPhone.getText();

    Assertions.assertEquals("Firstname Lastname", customerNameString);
    Assertions.assertEquals("Email", customeremailString);
    Assertions.assertEquals("0", customerPhoneString);
    driver.quit();
  }

  /**
   * Tests if an User1 can create a new customer. Goal: Failure, The customer is not created and an
   * error message is shown.
   */
  @Test
  public void createCustomerUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("customerFirstname")).sendKeys("Firstname");
    driver.findElement(By.id("customerLastname")).sendKeys("Lastname");
    driver.findElement(By.id("customerEmail")).sendKeys("Email");
    driver.findElement(By.id("customerPhone")).sendKeys("0");
    driver.findElement(By.id("customerStreet")).sendKeys("Street");
    driver.findElement(By.id("customerPostalCode")).sendKeys("0");
    driver.findElement(By.id("customerCity")).sendKeys("City");

    driver.findElement(By.id("saveButton")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("State darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an User1 can update a customer. Goal: Success, The customer is updated and redirected
   */
  @Test
  public void editCustomerUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = customerCards.get(customerCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='customerFirstname']"));
    nameField.clear();
    nameField.sendKeys("newName");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/customer/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a customer. Goal: Success, The customer is deleted and redirected
   * to the customer site.
   */
  @Test
  public void deleteNewlyCreatedCustomerUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();

    List<WebElement> paging = driver.findElements(By.cssSelector("div.data_paging div a"));
    String lastPage = paging.get(paging.size() - 1).getText();

    driver.get("http://localhost:8080/bike-store/sites/customer/View.xhtml?page=" + lastPage);
    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement lastCard = customerCards.get(customerCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/customer/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete a customer. Goal: Failure, The customer is not deleted and an
   * error message is shown.
   */
  @Test
  public void deleteNewlyCreatedCustomerUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(2).click();

    WebElement customerCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> customerCards = customerCard.findElements(By.cssSelector("div[class='card']"));
    WebElement card = customerCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/customer/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User2 can create a new customer. Goal: Success, The User is not allowed to create a
   * new customer and no button is shown.
   */
  @Test
  public void NoAddCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(2).click();
    List<WebElement> button = driver.findElements(By.cssSelector("a[name='addBtn'].btn"));
    Assertions.assertEquals(0, button.size());
    driver.quit();
  }

  /**
   * Tests if an User2 can delete a customer. Goal: Success, The User is not allowed to delete a new
   * customer and no button is shown.
   */
  @Test
  public void NoEditDeleteCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(2).click();
    WebElement info = driver.findElement(By.cssSelector("div[class='info']"));
    String attribute = info.getAttribute("onclick");
    Assertions.assertNull(attribute);
    driver.quit();
  }
}