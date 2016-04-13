When a URL is visited - say /static_pages/home - Rails automatically: 
-   looks for app/controllers/static_pages_controller.rb
		-   searches the file for a class StaticPagesController (inheriting from ApplicationController)
		-   searches class StaticPagesController for a method called 'home', and executes it
-   looks for a app/views/static_pages folder
		-   searches the folder for a home.html.erb file
		-		renders this file and serves it to the user

-   It knows where to look based solely on the route the GET request went to (/static_pages/home)

*   Empty methods (defs) in controllers (e.g. app/controllers/static_pages_controller.rb)

#ApplicationController
*   accessible everywhere e.g. the rails console
*   inheritance hierarchy:
				BasicObject
				Object
				AbstractController::Base
				ActionController::Metal
				ActionController::Base
				ApplicationController

#Custom controllers
*   also accessible everywhere
*   defined in your app/controllers folder & its child folders
*   parent class: ApplicationController
*   you can call any methods you define in the associated controller file as well

#Generating controllers
    rails generate controller Name action

*   example:
    
    rails generate controller User new
