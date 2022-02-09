<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
      <h1 id="kc-page-title" class="${properties.kcformHeaderTitleClass}">
        ${msg("loginAccountTitle")}
      </h1>
      <p class="${properties.kcformHeaderMessageClass}">
        ${msg("loginAccountMessage")}
      </p>
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
          <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormBodyClass}">
              <div class="${properties.kcFieldClass!}">
                <label for="username" class="${properties.kcLabelClass!}">
                  <#if !realm.loginWithEmailAllowed>
                    ${msg("username")}
                  <#elseif !realm.registrationEmailAsUsername>
                    ${msg("usernameOrEmail")}
                  <#else>
                    ${msg("email")}
                  </#if>
                </label>
                <#if usernameEditDisabled??>
                  <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                <#else>
                  <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                  />
                  <#if messagesPerField.existsError('username','password')>
                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                      ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                    </span>
                  </#if>
                </#if>
              </div>
              <div class="${properties.kcFieldClass!}">
                <label for="password" class="${properties.kcLabelClass!}">
                  ${msg("password")}
                </label>
                <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                  aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                />
              </div>
              <#if realm.rememberMe && !usernameEditDisabled??>
                <div id="kc-form-options" class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                  <label class="${properties.kcFormRememberMeClass!}">
                    <#if login.rememberMe??>
                      <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                    <#else>
                      <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                    </#if>
                  </label>
                </div>
              </#if>
            </div>
            <div class="${properties.kcFormFooterClass}">
              <div id="kc-form-buttons" class="${properties.kcFormButtonGroupClass!}">
                <input type="hidden" id="id-hidden-input" name="credentialId" 
                  <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>
                />
                <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}" name="login" id="kc-login" type="submit" value="${msg('doLogIn')}"/>
              </div>
              <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                  <#if realm.resetPasswordAllowed>
                    <span class="${properties.kcFormResetPasswordWrapperClass!}">
                      ${msg("forgotPasswordMessage")}
                      <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="${properties.kcFormResetPasswordLinkClass!}">
                        ${msg("doForgotPassword")}
                      </a>
                    </span>
                  </#if>
              </div>
            </div>
          </form>
        </#if>
      </div>
      <#if realm.password && social.providers??>
        <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
          <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
            <#list social.providers as p>
              <a id="social-${p.alias}" class="${properties.kcButtonClass!} ${properties.kcButtonProviderClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                type="button" href="${p.loginUrl}">
                <#if p.iconClasses?has_content>
                  <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                  <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                <#else>
                  <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                </#if>
                </a>
            </#list>
          </ul>
        </div>
      </#if>
    </div>
    <#elseif section = "info" >
      <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div id="kc-registration-container" class="${properties.kcInfoClass!}">
          <div id="kc-registration" class="${properties.kcActionGroupClass!}">
            <span class="${properties.kcActionMessageClass!}">
              ${msg("noAccount")} 
              <a tabindex="6" href="${url.registrationUrl}" class="${properties.kcActionLinkClass!}">
                ${msg("doRegister")}
              </a>
            </span>
          </div>
        </div>
      </#if>
    </#if>

</@layout.registrationLayout>