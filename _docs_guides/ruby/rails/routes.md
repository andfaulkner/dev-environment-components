config/routes.rb
================

*  file that handles all (most) routing


Basic routes
------------
*   directly declare relative path that accepts a get request. Generic example:

    get 'path1/path2'

    *  accessible via http://[origin]/path1/path2
    *  by default this route:
        *   calls up controller 'path1' in app/controllers/path1_controller.rb
        *   in the controller, runs method path2  <<< as in def path2

    *   example:
		get 'static_pages/help'

        *   directs the user to app/views/static_pages/help.html.erb (if you're using erb)
		    when user visits http[s]://[origin]/static_pages/help

###Root route
*   declare receiving controller and method for the app's root url (with no paths)
*   syntax:

    root :to => 'controller_name#method_to_run'

*   controller_name defines what controller file to run (based on rest of filename before _controller) 
*   method_to_run defines what method to automatically run in the controller file

*   example:

    root :to => 'pages#home'

    *   requests sent to http://[origin] now get sent to method home on controller pages

Resources
---------
*   create automatic endpoints for GET, POST, PUT, and DELETE

*   generate on the terminal via:
    rails generate resources ResourceName data1:string data2:integer data_n:boolean data_last:date

*   in routes.rb: 
    resources :some_resource

Named routes
------------
*   example:

    get 'help => 'static_page#help'

*   magically creates 2 vars you can now use to link to page views/static_pates/help.html.erb:
    *  help_path: pointing to the relative path;  or
    *  help_url:  pointing to the full path.

*   E.g. this is now allowed in a .html.erb file:
    <%= link_to "About", help_path %>



# http://guides.rubyonrails.org/routing.html