package de.niklasfulle.bikestore.view;

import de.niklasfulle.bikestore.business.staff.StaffService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.SecurityContext;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.credential.Credential;
import jakarta.security.enterprise.credential.Password;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.constraints.NotNull;
import java.io.IOException;

/**
 * LoginController handles the login form. It is used to authenticate the user.
 */
@Named
@RequestScoped
public class LoginController {

  @Inject
  private SecurityContext securityContext;

  @Inject
  private FacesContext facesContext;

  @Inject
  private StaffService staffService;

  @NotNull
  private String email;

  @NotNull
  private String phone;

  /**
   * Handles current login form
   */
  public void login() {
    Credential credential = new UsernamePasswordCredential(email, new Password(phone));
    ExternalContext externalContext = facesContext.getExternalContext();

    AuthenticationStatus status = securityContext.authenticate(
        (HttpServletRequest) externalContext.getRequest(),
        (HttpServletResponse) externalContext.getResponse(),
        AuthenticationParameters.withParams().credential(credential));

    // Redirects the user to the index page if the login was successful
    switch (status) {
      case SEND_CONTINUE:
        facesContext.responseComplete();
        break;
      case SEND_FAILURE, NOT_DONE:
        break;
      case SUCCESS:
        try {
          getExternalContext().redirect(
              getExternalContext().getRequestContextPath() + "/index.xhtml");
        } catch (IOException e) {
          throw new RuntimeException(e);
        }
        break;
    }
  }

  private ExternalContext getExternalContext() {
    return facesContext.getExternalContext();
  }

  /**
   * Logs the user out
   *
   * @return the index page
   */
  public String logout() {
    FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
    return "View.xhtml?faces-redirect=true";
  }

  /**
   * Gets the current http session
   *
   * @return the current http session
   */
  private HttpSession getHttpSession() {
    return (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
  }

  /**
   * Checks if the user is logged in
   *
   * @return true if the user is logged in, false otherwise
   */
  public boolean getLoginStatus() {
    return getStaffRole() != null;
  }

  /**
   * Gets the email of the logged in user
   *
   * @return the email of the logged in user
   */
  public String getStaffEmail() {
    if (getHttpSession() == null) {
      return null;
    }
    Object staffEmail = getHttpSession().getAttribute("staffEmail");
    if (staffEmail != null) {
      return staffEmail.toString();
    } else {
      return null;
    }
  }

  /**
   * Gets the role of the logged in user
   *
   * @return the role of the logged in user
   */
  public String getStaffRole() {
    if (getHttpSession() == null) {
      return null;
    }
    Object staffRole = getHttpSession().getAttribute("role");
    if (staffRole != null) {
      return staffRole.toString();
    } else {
      return null;
    }
  }

  /**
   * Gets the name of the logged in user
   *
   * @return the name of the logged in user
   */
  public String getStaffName() {
    if (getHttpSession().getAttribute("firstName") != null
        && getHttpSession().getAttribute("lastName") != null) {
      return getHttpSession().getAttribute("firstName") + " " + getHttpSession().getAttribute(
          "lastName");
    } else {
      return "";
    }
  }

  // Getter and Setters

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }
}
