Example
-------

*   You should have almost no logic in view files. This is what helpers & controllers are for.

###Code before cleanup with a view file:

*   Helper file:
			module SiteHelper
			end

*   in site.html.erb view file:
			<% if @user && @user.email.present? %>
				  <%= @user.email %>
			<% end %>

###Code after cleanup with a view file:

*   Helper file:
			module SiteHelper
				  def user_email(user)
					    user.email if user && user.email.present?
				  end
			end

*   in site.html.erb view file:
			<%= user_email(@user) %>


Making view helpers available in controllers
--------------------------------------------

###Example (file: app/controllers/application_controller.rb):
		class ApplicationController < ActionController::Base
		  protect_from_forgery with: :exception
		  include SessionsHelper							# <<<< this makes the helper available 
		end

*   makes app/helpers/sessions_helper.rb available in app/controllers/application_controller.rb

