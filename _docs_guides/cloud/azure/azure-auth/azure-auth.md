Authentication in azure
=======================
*   Azure's role in authentication: identity provider
    *   responsible for verifying the identity of users & apps that exist in an organization’s directory
    *   issuing security tokens upon successful authentication of those users & apps

*   an app that wants to outsource auth to Azure AD must be registered in Azure AD
    *   this registers and uniquely identifies the app in the directory

*   Once a user has been authenticated, the app must validate the user’s security token to ensure the authentication was successful for the intended parties.
    *   can use the provided auth libraries to handle validation of any token from Azure AD
        *   including JSON Web Tokens (JWT) or SAML 2.0.
    *   can be performed manually if you wish

