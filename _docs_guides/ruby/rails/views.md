#Location: app/views/**/*.html.erb
##Magic methods that can go into erb tags

###<%= %>
*   assigns return value of anything inside the braces to the location in the html document

###<% %>
*   executes Ruby code within the braces

###<%= link_to "Text", "relative/path/to/location" %>
*   create a link, pointing to relative/path/to/location, with text "Text"


### <nav>
*   formally unneccessary. Purpose: more clearly communicate the purpose of a set of nav links

### <div class="container">
*   special meaning to bootstrap (if you're using it)

### <%= image_tag("relative/path/to/img.png", alt: "alt text here", "http://www.root.path.com/") %>
*   create an image tag
*   path at the end is the path the relative path at he beginning is relative to
		*   optional


### <%= form_for (current_form) do |current_form| =>
*   creates a form
*   example:

				<%= form_for (@user) do |f| %>

					<%= render 'shared/error_messages' %>

					<%= f.label :name %>
					<%= f.text_field :name,												class: 'form-control' %>

					<%= f.label :email %>
					<%= f.email_field :email,											class: 'form-control' %>

					<%= f.label :password,												"Password" %>
					<%= f.password_field :password, 							class: 'form-control' %>

					<%= f.label :password_confirmation,						"Confirmation" %>
					<%= f.password_field :password_confirmation, 	class: 'form-control' %>

					<%= f.submit "Create my account", class: "btn btn-primary" %>
				<% end %>

