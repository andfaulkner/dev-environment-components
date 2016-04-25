When a URL is visited - say /static_pages/home - Rails automatically: 
-   looks for app/controllers/static_pages_controller.rb
		-   searches the file for a class StaticPagesController (inheriting from ApplicationController)
		-   searches class StaticPagesController for a method called 'home', and executes it
-   looks for a app/views/static_pages folder
		-   searches the folder for a home.html.erb file
		-		renders this file and serves it to the user

-   It knows where to look based solely on the route the GET request went to (/static_pages/home)

*   Empty methods (defs) in controllers (e.g. app/controllers/static_pages_controller.rb)


Title again
-----------

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

*   example 2:

		rails generate controller Sessions new

*   in both cases, this also generates


Methods available in controllers
================================

redirect_to
-----------
*   examples:

		redirect_to some_hash
				*   extracts id and action from the hash to determine redirect. Optionally also status.
				*   examples:

```ruby
	 				redirect_to "id"=>5, "action"=>"show"
						#  pass id=12 to action show in this controller
					redirect_to "id"=>@user[:id], "action"=>"show"
						#   pass whatever value is at key id in hash user ---to--> controller def show
					redirect_to "id"=>@user[:id], "action"=>"show", status: 200
						#   same as last example, with status 200 (already the default)
```


		redirect_to "http://some-address.com"
				*   redirect to the exact path given
				*   examples:
						redirect_to "http://www.google.com"
						*   pass whatever value is at key id in hash user ---to--> controller def show

		redirect_to :back
				*   same as pressing the back button

		redirect_to @user, flash: { success: "User successfully created! Welcome #{@user[:name]}!" }
				*   if @user contains id=4 & action="show"; current controller is users_controller, 
						port is 3000; and hostname is localhost, this redirects to:
								localhost:3000/users/4
				*   ...and displays a little info box containing (if user: meeka):
						User successfully created! Welcome afefefefefe!


# before_filter



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

*   named flashes are generally called 'alert' or 'notice'
		*   redirect_to actually has special accessors for these names

###flash.now <<< ESSENTIAL VARIABLE
*   the contents of a flash persist for 1 request
		*   ...but with a normal flash, rerendering a template with render doesn’t count as a request
				*   result: flash messages will persist one request longer than we want
				*   solution: use flash.now, with flash.now rerendering a template does count as a request


render
------


----

FILTERS
=======
*	methods that run before, after, or around a controller action

before_filter
-------------
```ruby
class SpiceCupboardController < ActionController::Base
	before_filter :needs_spices?
	before_filter :open_door, 		except: [:sprinkle_salt, :grind_pepper]
	before_filter :has_mask?, 		only: 	:grab_pepper_spray

	def get_paprika
		#...
	end
	#...
	private
		def open_door
			if magic_phrase == 'open and give me sesame'
				@door_state = open
			else
				flash[:error] = "That is not the magic phrase, miscreant!"
				redirect_to a_less_tasty_place_url # halts request cycle
				# if the redirect_to gets called in open_door when 
			end
		end
		#...
end

class SpiceSpinnerCupboardController < SpiceCupboardController
	skip_before_filter :open_door  # y'know, because spice spinners don't have doors :)
	#...
end
```

### basic before_filter
*   must complete running before any action in the controller can run
		before_filter :some_method
		*   ...where some_method is a method on the same class

*   if a redirect (redirect_to) or render occurs before a before_filter returns, it prevents
	execution of the actual action. This is thus effective for authentication.

### modifiers: only, except, skip_before_filter
*   :except				used to skip the filter it's declared on for the actions it's given as args
							before_filter: :require_login, except: [:login_page, :contact_page]

*   :only				only require the filter to run before the given methods
							before_filter: :require_2_step_verify, only: :admin_page

*   skip_before_filter	don't run the given filter on the given actions, or on any actions in the
	   					class, if no actions are given. Used mostly in controllers that inherit
   						from others, but don't want all of the same filters to run.
							skip_before_filter :is_baking?, only: [:salt, :pepper, :cinnamon]





