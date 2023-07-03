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
 * This class tests the store site. Tests the CRUD operations for the store site.
 */
public class StoreTest {

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
   * Tests if the store site can be opened as admin.
   */
  @Test
  public void openStoreSiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/store/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the store site can be opened as user1.
   */
  @Test
  public void openStoreSiteAsUser1() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/store/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the store site can be opened as user2.
   */
  @Test
  public void openStoreSiteAsUser2() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/store/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the store site can be opened as nouser.
   */
  @Test
  public void openStoreSiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new store. Goal: Success, The store is created and redirected to
   * the store site.
   */
  @Test
  public void createStoreAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("storeName")).sendKeys("storeName");
    driver.findElement(By.id("storeEmail")).sendKeys("storeEmail");
    driver.findElement(By.id("storePhone")).sendKeys("0");
    driver.findElement(By.id("storeStreet")).sendKeys("storeStreet");
    driver.findElement(By.id("storePostalcode")).sendKeys("0");
    driver.findElement(By.id("storeCity")).sendKeys("storeCity");
    driver.findElement(By.id("storeState")).sendKeys("storeState");

    driver.findElement(By.id("saveButton")).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    WebElement newStoreName = lastCard.findElement(By.cssSelector("span[id*='storeName1']"));
    String storeNameString = newStoreName.getText();
    WebElement newStoreEmail = lastCard.findElement(By.cssSelector("span[id*='email1']"));
    String storeEmailString = newStoreEmail.getText();
    WebElement newStorePhone = lastCard.findElement(By.cssSelector("span[id*='phone1']"));
    String storePhonePrice = newStorePhone.getText();

    Assertions.assertEquals("storeName", storeNameString);
    Assertions.assertEquals("storeEmail", storeEmailString);
    Assertions.assertEquals("0", storePhonePrice);

    driver.quit();
  }

  /**
   * Tests if an Admin can create a new store. Goal: Failure, The store is not created and an error
   * message is shown.
   */
  @Test
  public void createStoreAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("storeName")).sendKeys("storeName");
    driver.findElement(By.id("storeEmail")).sendKeys("storeEmail");
    driver.findElement(By.id("storePhone")).sendKeys("0");
    driver.findElement(By.id("storeStreet")).sendKeys("storeStreet");
    driver.findElement(By.id("storePostalcode")).sendKeys("0");
    driver.findElement(By.id("storeCity")).sendKeys("storeCity");

    driver.findElement(By.id("saveButton")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("State darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an Admin can update a store. Goal: Success, The store is updated and redirected
   */
  @Test
  public void editStoreAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='storeName']"));
    nameField.clear();
    nameField.sendKeys("test");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/store/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a store. Goal: Success, The store is deleted and redirected to the
   * store site.
   */
  @Test
  public void deleteNewlyCreatedStoreAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/store/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a store. Goal: Failure, The store is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedStoreAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(2).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement card = storeCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User1 can create a new store. Goal: Success, The store is created and redirected to
   * the store site.
   */
  @Test
  public void createStoreUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("storeName")).sendKeys("storeName");
    driver.findElement(By.id("storeEmail")).sendKeys("storeEmail");
    driver.findElement(By.id("storePhone")).sendKeys("0");
    driver.findElement(By.id("storeStreet")).sendKeys("storeStreet");
    driver.findElement(By.id("storePostalcode")).sendKeys("0");
    driver.findElement(By.id("storeCity")).sendKeys("storeCity");
    driver.findElement(By.id("storeState")).sendKeys("storeState");

    driver.findElement(By.id("saveButton")).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    WebElement newStoreName = lastCard.findElement(By.cssSelector("span[id*='storeName1']"));
    String storeNameString = newStoreName.getText();
    WebElement newStoreEmail = lastCard.findElement(By.cssSelector("span[id*='email1']"));
    String storeEmailString = newStoreEmail.getText();
    WebElement newStorePhone = lastCard.findElement(By.cssSelector("span[id*='phone1']"));
    String storePhonePrice = newStorePhone.getText();

    Assertions.assertEquals("storeName", storeNameString);
    Assertions.assertEquals("storeEmail", storeEmailString);
    Assertions.assertEquals("0", storePhonePrice);

    driver.quit();
  }

  /**
   * Tests if an User1 can create a new store. Goal: Failure, The store is not created and an error
   * message is shown.
   */
  @Test
  public void createStoreUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("storeName")).sendKeys("storeName");
    driver.findElement(By.id("storeEmail")).sendKeys("storeEmail");
    driver.findElement(By.id("storePhone")).sendKeys("0");
    driver.findElement(By.id("storeStreet")).sendKeys("storeStreet");
    driver.findElement(By.id("storePostalcode")).sendKeys("0");
    driver.findElement(By.id("storeCity")).sendKeys("storeCity");

    driver.findElement(By.id("saveButton")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("State darf nicht leer sein", errorMsg);

    driver.close();
  }

  /**
   * Tests if an User1 can update a store. Goal: Success, The store is updated and redirected
   */
  @Test
  public void editStoreUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='storeName']"));
    nameField.clear();
    nameField.sendKeys("test");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/store/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a store. Goal: Success, The store is deleted and redirected to the
   * store site.
   */
  @Test
  public void deleteNewlyCreatedStoreUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = storeCards.get(storeCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/store/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete a store. Goal: Failure, The store is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedStoreUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement storeCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> storeCards = storeCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement card = storeCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/store/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User2 can create a new store. Goal: Success, The User is not allowed to create a
   * new store and no button is shown.
   */
  @Test
  public void NoAddCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(1).click();
    List<WebElement> button = driver.findElements(By.cssSelector("a[name='addBtn'].btn"));
    Assertions.assertEquals(0, button.size());
    driver.quit();
  }

  /**
   * Tests if an User2 can delete a store. Goal: Success, The User is not allowed to delete a new
   * store and no button is shown.
   */
  @Test
  public void NoEditDeleteCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(1).click();
    WebElement info = driver.findElement(By.cssSelector("div[class='info']"));
    String attribute = info.getAttribute("onclick");
    Assertions.assertNull(attribute);
    driver.quit();
  }
}