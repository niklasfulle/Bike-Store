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
 * This class tests the staff site. Tests the CRUD operations for the staff site.
 */
public class StaffTest {

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
   * Tests if the staff site can be opened as admin.
   */
  @Test
  public void openStaffSiteAsAdmin() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();
    System.out.println(driver.findElements(By.className("btn")).get(1).getText());
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/staff/View.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if the staff site can be opened as user1.
   */
  @Test
  public void openStaffSiteAsUser1() {
    openAndLogin(1);
    WebElement button = driver.findElements(By.className("btn")).get(0);
    Assertions.assertNotEquals("Mitarbeiter",
        button.getText());
    driver.quit();
  }

  /**
   * Tests if the staff site can be opened as user2.
   */
  @Test
  public void openStaffSiteAsUser2() {
    openAndLogin(2);
    WebElement button = driver.findElements(By.className("btn")).get(0);
    Assertions.assertNotEquals("Mitarbeiter",
        button.getText());
    driver.quit();
  }

  /**
   * Tests if the staff site can be opened as nouser.
   */
  @Test
  public void openStaffSiteAsNoUser() {
    openAndLogin(3);
    Assertions.assertNotEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new staff. Goal: Success, The product is created and redirected
   * to the staff site.
   */
  @Test
  public void createStaffAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("staffFirstname")).sendKeys("staffFirstname");
    driver.findElement(By.id("staffLastname")).sendKeys("staffLastname");
    driver.findElement(By.id("staffEmail")).sendKeys("staffEmail");
    driver.findElement(By.id("staffPhone")).sendKeys("0");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement staffCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> staffCards = staffCard.findElements(
        By.cssSelector("div[class='card active']"));
    WebElement lastCard = staffCards.get(staffCards.size() - 1);

    WebElement newStaffName = lastCard.findElement(By.cssSelector("span[id*='staff_name']"));
    String staffNameString = newStaffName.getText();
    WebElement newStaffEmail = lastCard.findElement(By.cssSelector("span[id*='email']"));
    String staffEmailString = newStaffEmail.getText();
    WebElement newStaffPhone = lastCard.findElement(By.cssSelector("span[id*='phone']"));
    String staffPhonePrice = newStaffPhone.getText();

    Assertions.assertEquals("staffFirstname staffLastname", staffNameString);
    Assertions.assertEquals("staffEmail", staffEmailString);
    Assertions.assertEquals("0", staffPhonePrice);
    driver.quit();
  }

  /**
   * Tests if an Admin can create a new staff. Goal: Failure, The staff is not created and an error
   * message is shown.
   */
  @Test
  public void createStaffAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();
    driver.findElement(By.cssSelector("a[name='addBtn'].btn")).click();

    driver.findElement(By.id("staffFirstname")).sendKeys("staffFirstname");
    driver.findElement(By.id("staffLastname")).sendKeys("staffLastname");
    driver.findElement(By.id("staffEmail")).sendKeys("staffEmail");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    WebElement errorMsg = driver.findElement(By.cssSelector("span.errorMessage"));

    Assertions.assertEquals("Telefonnummer darf nicht leer sein", errorMsg.getText());

    driver.quit();
  }

  /**
   * Tests if an Admin can update a staff. Goal: Success, The staff is updated and redirected
   */
  @Test
  public void editStaffAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement staffCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> staffCards = staffCard.findElements(
        By.cssSelector("div[class='card active']"));
    WebElement lastCard = staffCards.get(staffCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/staff/Update.xhtml?update=" + id[0]);

    WebElement nameField = driver.findElement(By.cssSelector("input[id*='staffFirstname']"));
    nameField.clear();
    nameField.sendKeys("staffFirstname1");

    driver.findElement(By.cssSelector("input[id*='saveButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/staff/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a staff. Goal: Success, The staff is deleted and redirected to the
   * staff site.
   */
  @Test
  public void deleteNewlyCreatedStaffAdminSuccess() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement staffCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> staffCards = staffCard.findElements(
        By.cssSelector("div[class='card active']"));
    WebElement lastCard = staffCards.get(staffCards.size() - 1);

    String href = lastCard.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/staff/Delete.xhtml?delete=" + id[0]);

    driver.findElement(By.cssSelector("input[id*='removeButton']")).click();

    Assertions.assertEquals(
        "http://localhost:8080/bike-store/sites/staff/View.xhtml", driver.getCurrentUrl());

    driver.close();
  }

  /**
   * Tests if an Admin can delete a staff. Goal: Failure, The staff is not deleted and an error
   * message is shown.
   */
  @Test
  public void deleteNewlyCreatedStaffAdminFailure() {
    openAndLogin(0);
    driver.findElements(By.className("btn")).get(1).click();

    WebElement staffCard = driver.findElement(By.cssSelector("div[class='cards']"));
    List<WebElement> staffCards = staffCard.findElements(
        By.cssSelector("div[class='card active']"));
    WebElement card = staffCards.get(0);

    String href = card.findElements(By.className("btn")).get(0)
        .getAttribute("onclick");
    String[] attributes = href.split("=");
    String[] id = attributes[2].split("'");
    driver.get("localhost:8080/bike-store/sites/staff/Delete.xhtml?delete=" + id[0]);

    Assertions.assertFalse(
        driver.findElement(By.cssSelector("input[id*='removeButtonDisabled']")).isEnabled());

    driver.close();
  }
}