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
 * This class tests the logout function.
 */
public class UserTest {

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
        {"genna.serrano@bikes.shop", "555-5556"}
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
   * Tests if an Admin can Log in and Logout.
   */
  @Test
  public void checkLoginAndLogoutAsAdmin() {
    openAndLogin(0);
    Assertions.assertEquals("http://localhost:8080/bike-store/",
        driver.getCurrentUrl());
    WebElement logoutButton = driver.findElement(By.cssSelector("input[id*='logoutButton']"));
    Assertions.assertEquals("Abmelden",
        logoutButton.getAttribute("value"));

    driver.findElements(By.className("btn")).get(6).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/brand/View.xhtml",
        driver.getCurrentUrl());

    driver.findElement(By.cssSelector("input[id*='logoutButton']")).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an User1 can Log in and Logout.
   */
  @Test
  public void checkLoginAndLogoutAsUser1() {
    openAndLogin(1);
    Assertions.assertEquals("http://localhost:8080/bike-store/",
        driver.getCurrentUrl());
    WebElement logoutButton = driver.findElement(By.cssSelector("input[id*='logoutButton']"));
    Assertions.assertEquals("Abmelden",
        logoutButton.getAttribute("value"));

    driver.findElements(By.className("btn")).get(5).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/brand/View.xhtml",
        driver.getCurrentUrl());

    driver.findElement(By.cssSelector("input[id*='logoutButton']")).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }

  /**
   * Tests if an User2 can Log in and Logout.
   */
  @Test
  public void checkLoginAndLogoutAsUser2() {
    openAndLogin(2);
    Assertions.assertEquals("http://localhost:8080/bike-store/",
        driver.getCurrentUrl());
    WebElement logoutButton = driver.findElement(By.cssSelector("input[id*='logoutButton']"));
    Assertions.assertEquals("Abmelden",
        logoutButton.getAttribute("value"));

    driver.findElements(By.className("btn")).get(5).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/sites/brand/View.xhtml",
        driver.getCurrentUrl());

    driver.findElement(By.cssSelector("input[id*='logoutButton']")).click();
    Assertions.assertEquals("http://localhost:8080/bike-store/index.xhtml",
        driver.getCurrentUrl());
    driver.quit();
  }
}