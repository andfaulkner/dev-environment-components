# config/routes.rb

*  file that handles all (most) routing

## Basic form of route in routes.rb
*   example:
		get 'static_pages/help'

    *   directs the user to app/views/static_pages/help.html.erb (if you're using erb)
		    when user visits http[s]://[origin]/static_pages/help

## root route
*   example:

    root :to => 'static_pages#home'

    *   sets the root (e.g. http://localhost:3000) to point to app/views/static_pages/home.html.erb
        with the controller app/controllers/static_pages_controller.rb

## named routes
*   example:

    get 'help => 'static_page#help'

    *   you can now link to the page at app/views/static_pates/help.html.erb via the help_path var
        var, which has been magically created; or the help_url var, which points to the full path.
    *   E.g. this is now allowed in a .html.erb file:
		
        <%= link_to "About", help_path %>



