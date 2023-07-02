package de.niklasfulle.bikestore.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.security.enterprise.authentication.mechanism.http.LoginToContinue;
import jakarta.security.enterprise.authentication.mechanism.http.CustomFormAuthenticationMechanismDefinition;

/**
 * AppConfig implements that a CustomFormMechanism is implemented. It is used to redirect to the
 * login page if the user is not logged in.
 */
@CustomFormAuthenticationMechanismDefinition(loginToContinue = @LoginToContinue(loginPage = "/index.xhtml", useForwardToLogin = false))
@ApplicationScoped
public class AppConfig {

}
