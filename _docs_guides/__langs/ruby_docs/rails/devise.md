DEVISE VIEW GENERATE
====================

CLI TOOLS TO GENERATE DEVISE VIEWS
----------------------------------
###Generate all views
    rails generate devise:views

###Generate all but excluded views
    rails generate devise:views -v registrations confirmations

###Generate view just for a specific model
    rails generate devise:views users

FOLDERS IN APP AFTER DEVISE VIEW GENERATE
-----------------------------------------
*   confirmations: new.html.erb view is endered when user requests to resend confirmation e-mail
*   mailer: all email templates stored here
*   passwords: views with forms to req password, reset email, and change pwd
*   registrations: new.html.erb in here is rendered whebn a user registers on the site
                   edit.html.erb contains form to update profile
*   sessions: 1 view: login for the site
*   shared: one partial here, containing links displayed on each Devise page
						e.g. 'Forgot your password?', 'Re-send confirmation email'
*   unlocks: 1 view, w/ a form to request an email w/ an unlock link

