Debug panel
===========

*   Displays contents of an object and its name in a panel on the page

##Insert debug panel with:
		<%= debug(object_you_want_to_view) if Rails.env.development? %>

				**  if Rails.env.development?    :  ensures debug panel doesn't show in development
				**  object_you_want_to_view      :  replace with any Ruby object

##Example output:
		--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
		action: help
		controller: static_pages

##Style debug panel with:
		.debug_dump {
		  clear: both;
		  float: left;
		  width: 100%;
		  margin-top: 45px;
		  @include box_sizing;
		}

##See what controller & action rendered the page

    <%= debug(params) if Rails.env.development? %>

##See EVERYTHING

    <%= debug(self) if Rails.env.development? %>


Inspect object values in view
=============================

## Display object values as a string anywhere on the page:
		<%= any_object.inspect %>

##See every available "global" variable in the view
    <%= methods.inspect %>

    		*   i.e. what simplying placing a single "word" in a tag will call. E.g. <% params %>

##See every available 
self.class.descendants


RailsPanel plugin
=================

##Setup

*   Add meta_request gem to 'group :development' in your Gemfile:

				group :development do
				  gem 'meta_request'
				end

*   Install the meta_request gem

				gem install meta_request

*  [Install the RailsPanel Chrome plugin](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg)]
*   

*  asdf