package de.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.security.enterprise.authentication.mechanism.http.CustomFormAuthenticationMechanismDefinition;
import jakarta.security.enterprise.authentication.mechanism.http.LoginToContinue;

/**
 * AppConfig implements that a CustomFormMechanism is implemented.
 *
 */
@CustomFormAuthenticationMechanismDefinition(loginToContinue = @LoginToContinue(loginPage = "/index.xhtml", useForwardToLogin = false))
@ApplicationScoped
public class AppConfig {

}
