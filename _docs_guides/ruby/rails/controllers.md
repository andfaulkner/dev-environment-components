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


Methods available in controllers 
================================

redirect_to
-----------
*   examples:

		redirect_to some_hash
				*   extracts id and action from the hash to determine redirect.
				*   examples:
						redirect_to "id"=>5, "action"=>"show"
						*   pass id=12 to action show in this controller
						redirect_to "id"=>@user[:id], "action"=>"show"
						*   pass whatever value is at key id in hash user ---to--> controller def show

		redirect_to "http://some-address.com"
				*   redirect to the exact path given
				*   examples:
						redirect_to "http://www.google.com"
						*   pass whatever value is at key id in hash user ---to--> controller def show


		redirect_to :back
				*   same as pressing the back button


flash
-----
*   Show a temporary onscreen message, generally in its own little box
*   Example:
		*   In the controller (somewhere):
				flash[:success] = "New user successfully created! Welcome #{@user[:name]}!"
		*   In the controller (elsewhere. optional):
				flash[:success] = "Failed to create new user, see error message"
		*   In the view:
			    <% flash.each do |message_type, message| %>
			      <% flash_classes="alert alert-#{message_type}" %>
			      <div class="<%= flash_classes %>" id="flash_msg"> <%= message %> </div>
			    <% end %>
