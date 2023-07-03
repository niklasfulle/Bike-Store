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
 * This class tests the category site. Tests the CRUD operations for the category site.
 */
public class CategoryTest {

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
    driver.findElement(By.cssSelector("input[id*='loginEmail']")).sendKeys(logins[role][0]);
    driver.findElement(By.cssSelector("input[id*='loginPasswort']")).sendKeys(logins[role][1]);
    driver.findElement(By.cssSelector("input[id*='loginButton']")).click();

    driver.get("http://localhost:8080/bike-store/");
  }

  /**
   * Tests if the category site can be opened as admin.
   */
  @Test
  public void openCategorySiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(7).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/category/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the category site can be opened as user1.
   */
  @Test
  public void openCategorySiteAsUser1() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/category/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the category site can be opened as user2.
   */
  @Test
  public void openCategorySiteAsUser2() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/category/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the category site can be opened as nouser.
   */
  @Test
  public void openCategorySiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new category. Goal: Success, The category is created and shown
   * on the category site.
   */
  @Test
  public void createCategoryAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(7).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("categoryName")).sendKeys("TestCategoryAdmin");
    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(By.cssSelector("div[class='card']"));

    WebElement categoryName = categoryCards.get(categoryCards.size() - 1)
        .findElement(By.cssSelector("span[id*='categoryName']"));
    String categoryNameString = categoryName.getText();
    Assertions.assertEquals("TestCategoryAdmin", categoryNameString);
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new category. Goal: Failure, The category is not created and an
   * error message is shown.
   */
  @Test
  public void createCategoryAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(7).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("categoryName")).sendKeys("");
    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("Name darf nicht leer sein", errorMsg);
    driver.quit();
  }

  /**
   * Tests if an Admin can delete a category. Goal: Success, The category is deleted and not shown
   * on the category site.
   */
  @Test
  public void deleteNewlyCreatedCategoryAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(7).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = categoryCards.get(categoryCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(1)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/category/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/category/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a category. Goal: Failure, The category is not deleted and an
   * error message is shown.
   */
  @Test
  public void deleteCategoryAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(7).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement card = categoryCards.get(1);

    String href = card.findElements(By.className("btn")).get(1)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/category/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User1 can create a new category. Goal: Success, The category is created and shown
   * on the category site.
   */
  @Test
  public void createCategoryUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("categoryName")).sendKeys("TestCategoryAdmin");
    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(By.cssSelector("div[class='card']"));

    WebElement categoryName = categoryCards.get(categoryCards.size() - 1)
        .findElement(By.cssSelector("span[id*='categoryName']"));
    String categoryNameString = categoryName.getText();
    Assertions.assertEquals("TestCategoryAdmin", categoryNameString);
    driver.quit();
  }

  /**
   * Tests if an User1 can create a new category. Goal: Failure, The category is not created and an
   * error message is shown.
   */
  @Test
  public void createCategoryUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("categoryName")).sendKeys("");
    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    String errorMsg = driver.findElement(By.cssSelector("span[class*='errorMessage']")).getText();
    Assertions.assertEquals("Name darf nicht leer sein", errorMsg);
    driver.quit();
  }

  /**
   * Tests if an User1 can delete a category. Goal: Success, The category is deleted and not shown
   * on the category site.
   */
  @Test
  public void deleteNewlyCreatedCategoryUser1Success() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement lastCard = categoryCards.get(categoryCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(1)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/category/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/category/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an User1 can delete a category. Goal: Failure, The category is not deleted and an
   * error message is shown.
   */
  @Test
  public void deleteCategoryUser1Failure() {
    openAndLogin(1);
    driver.findElements(By.className("btn")).get(6).click();

    WebElement categoryCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> categoryCards = categoryCard.findElements(
        By.cssSelector("div[class='card']"));
    WebElement card = categoryCards.get(1);

    String href = card.findElements(By.className("btn")).get(1)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/category/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }

  /**
   * Tests if an User2 can create a new category. Goal: Success, The User is not allowed to create a
   * new category and no button is shown.
   */
  @Test
  public void NoAddCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(6).click();
    List<WebElement> button = driver.findElements(By.cssSelector("a[name='addBtn'].btn"));
    Assertions.assertEquals(0, button.size());
    driver.quit();
  }

  /**
   * Tests if an User2 can delete a category. Goal: Success, The User is not allowed to delete a new
   * category and no button is shown.
   */
  @Test
  public void NoEditDeleteCategoryButtonUser2() {
    openAndLogin(2);
    driver.findElements(By.className("btn")).get(6).click();
    WebElement info = driver.findElement(By.cssSelector("div[class='info']"));
    String attribute = info.getAttribute("onclick");
    Assertions.assertNull(attribute);
    driver.quit();
  }
}