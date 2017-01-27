Azure: categories of services
=============================


----------------------------------------------------------------------------------------------------
Azure ActiveDirectory (AD)
==========================
*   new Azure AD directory instance is created for your organization when you first sign up for a
    Microsoft cloud service

## Active Directory Application: global representation of your application
*   contains the application credentials (application ID + either a password or certificate)

## Multiple directories
*   each directory you create is logically independent from all other directories you create
    *   directories have a peer relationship

## Azure-provisioned Default directory
*   a directory is automatically created when you sign up for Azure and your subscription is
    associated with that directory - this is the Default directory
*   a free resource

## Active Directory Access Control namespace:
*   provides unique scope for addressing Access Control resources from within your app

##Azure Active Directory tenant
*   dedicated instance of the Azure AD service that an organization receives and owns when it
    signs up for a Microsoft cloud service such as Azure, Office 365, or Microsoft InTune
    *   Side note: in a broader sense within cloud services, a tenant is a client or organization
        that owns and manages a specific instance of that cloud service

*   houses the users in a company and the information about them

AD B2C
------
*   secure a web API by using OAuth 2.0 access tokens
*   To set it up:
    1)  Register an application with Azure AD.
    2)  Set up app to use Passport's azure-ad-passport plug-in
    3) 

Creating an ActiveDirectory B2C app
*   


Resource groups
===============
Resources
    *   ActiveDirectory is a resource
    *   A web app is a resource
    *   Apps are deployed into app service plans    
        *   App service plans define the amount of infrastructure to the apps deployed into that service plan
    *   b2c tenant is the ActiveDirectory that we're going to try to use as our identity provider
    *   one can register a web service app on a b2c tenant

*   Side note: a web service is a type of app service

### Policies
*   In Azure AD B2C, every user experience is defined by a policy


Links
-----
*   [Create an ActiveDirectory service principle with the azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)


----------------------------------------------------------------------------------------------------
Cognitive Services
------------------
*   natural language processing in your apps
*   automatic text translation (see Translations section)

CDNs (CDN profiles?)
--------------------
https://azure.microsoft.com/en-us/services/cdn/


Access control
--------------
*   [Create a service principal to access resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal)
*   2 options for authenticating an ActiveDirectory application: 1) password; 2) certificate.
    *  They recommend password authentication if you're logging in to Azure from NodeJS



Batch accounts
--------------
???



Scheduler
=========
*   Run jobs on recurring schedules (allows for some fairly complex ones)
*   jobs:
    *   http requests
        *   can include auth information as well as headers
        *   error handler can be included to declare the on-error action:
            *   available error actions: same types of jobs that can be scheduled
    *   Storage queue
*   schedules
    *   once: run the job once, on a specific date and time
    *   recurring: run the job multiple times on the given schedule:
        *   Run every X number of minutes, hours, days, weeks, months
        *   Stop re-running the job on the given schedule when either:
                a) it has run a given # of times;
                b) a certain date is reached
            *   You can also opt to never stop re-running a job
    *   schedules are not reactive. Complex intervals can be specified, but the schedule
        cannot adjust in response to events - it is always a set, static interval.




Translations
============
*   https://azure.microsoft.com/en-gb/services/cognitive-services/translator-text-api/
*   accessed through Cognitive Services
*   provides automatic (machine learning-based) text translation
    *   Microsoft Translator Text API: a cloud-based automatic translation service.
        *   "conduct real-time text translation with a REST API call"

*   pricing: https://azure.microsoft.com/en-gb/pricing/details/cognitive-services/translator-text-api/
    *   2,000,000 free characters per month

*   Translator can be used to build applications, websites, tools or any solution requiring multi-language support



Resource manager
================
*   
