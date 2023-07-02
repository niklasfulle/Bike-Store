package de.niklasfulle.bikestore.security;

import java.util.HashSet;
import jakarta.inject.Inject;
import java.util.Collections;
import jakarta.servlet.http.HttpSession;
import jakarta.faces.context.FacesContext;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.security.enterprise.credential.Credential;
import jakarta.security.enterprise.identitystore.IdentityStore;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;

import de.niklasfulle.bikestore.business.staff.Staff;
import de.niklasfulle.bikestore.business.staff.StaffService;

/**
 * BikeStoreIdentityStore implements the IdentityStore interface. It is used to validate the
 * credentials of the user.
 */
@ApplicationScoped
public class BikeStoreIdentityStore implements IdentityStore {

  @Inject
  private StaffService staffService;

  /**
   * Validates the credentials of the user. It uses the StaffService to fetch the Staff from the
   * database. If the Staff is not found, the result is invalid. Otherwise, the password is compared
   * to the password of the Staff. If the password is correct, the result is valid. Otherwise, the
   * result is invalid.
   *
   * @param credential the credential to be validated
   * @return the result of the validation
   */
  @Override
  public CredentialValidationResult validate(Credential credential) {
    UsernamePasswordCredential usernamePasswordCredential = (UsernamePasswordCredential) credential;

    Staff staff;

    // If the Staff is not found, the result is invalid
    try {
      staff = staffService.getStaffByEmail(usernamePasswordCredential.getCaller());
    } catch (Exception e) {
      return CredentialValidationResult.INVALID_RESULT;
    }

    // If the password is correct, the result is valid
    if (((UsernamePasswordCredential) credential).compareTo(staff.getEmail(),
        staff.getPhone().split(" ")[1])) {
      HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext()
          .getSession(false);

      String role = staff.getRole();

      session.setAttribute("firstName", staff.getFirstName());
      session.setAttribute("lastName", staff.getLastName());
      session.setAttribute("staffEmail", staff.getEmail());
      session.setAttribute("role", role);

      return new CredentialValidationResult(staff.getRole(), new HashSet<>(
          Collections.singleton(role)));
    }

    // Otherwise, the result is invalid
    return CredentialValidationResult.INVALID_RESULT;
  }
}
