<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
  <#if section = "header">
    <h1 id="kc-page-title" class="${properties.kcformHeaderTitleClass}">
      ${msg("emailForgotTitle")}
    </h1>
    <p class="${properties.kcformHeaderMessageClass}">
      ${msg("emailInstruction")}
    </p>
  <#elseif section = "form">
    <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
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
          <input type="text" id="username" name="username" class="${properties.kcInputClass!}" 
            autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
          />
          <#if messagesPerField.existsError('username')>
            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
              ${kcSanitize(messagesPerField.get('username'))?no_esc}
            </span>
          </#if>
        </div>
      </div>
      <div class="${properties.kcFormFooterClass}">
        <div id="kc-form-buttons" class="${properties.kcFormButtonGroupClass!}">
          <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}" 
            type="submit" value="${msg("doSubmit")}"
          />
        </div>
          <div id="kc-form-options" class="${properties.kcActionGroupClass!}">
            <a href="${url.loginUrl}" class="${properties.kcFormLinkBackClass!}">
              ${kcSanitize(msg("backToLogin"))?no_esc}
            </a>
        </div>
      </div>
    </form>
  <#elseif section = "info" >
    
  </#if>
</@layout.registrationLayout>