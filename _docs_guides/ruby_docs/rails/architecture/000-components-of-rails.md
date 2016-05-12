MAIN COMPONENTS
===============
Action Pack:			 contains Action Controller, Action View and Action Dispatch
Action Controller: processes incoming requests to a Rails app, extracts params, & dispatches them
									 to the intended action
Action Dispatch:	 handles routing of requests & dispatches them as you want, either to your app
									 or another Rack app
Action View:			 manages the views of your Rails application. Manages rendering templates. Has
									 built in AJAX support.
Action Mailer:		 framework for building e-mail services
Active Model:			 defined interface betw Action Pack gem services & ORM gems e.g. Active Record
									 Lets Rails to use ORM frameworks other than Active Record if your app needs this
Active Record:		 base for models in a Rails app. Provides db independence, ability to relate
									 models to 1 another, basic CRUD functionality, advanced finding capabilities, etc
Active Resource:	 framework for managing connection betw business objects & RESTful web services.
									 implements a way to map web-based resources to local objects w/ CRUD semantics.
Active Support:		 utility classes.
Railties:					 core Rails code that builds new Rails apps, & glues the various frameworks &
									 plugins together in any Rails app

Extras
======
Rake:							 task runner for Ruby, akin to Gulp
Server:						 thin, Mongrel, WEBrick
Rack:              list of middlewares every request goes thru to build a response


Details, extras
===============


# Active Support 						 http://guides.rubyonrails.org/v3.2/active_support_core_extensions.html
*   provides Ruby language extensions, utilities, and other transversal stuff
*		loading
		*   load core extensions via 													 require 'active_support/core_ext'
		*   OR make all of it available via 									 require 'active_support/all'
				*   often better to just load what you need e.g.	 require 'active_support/core_ext/object'
								* ...which loads all extensions to Ruby's object module


#Action Pack
*   the "VC" in "MVC"
*   framework for handling and responding to web requests
*   provides mechanisms for:
		*   routing (mapping request URLs to actions)
		*   defining controllers that implement actions
		*   generating responses by rendering views
*   Components:
		*   Action Dispatch:   parses info about a web request, handles routing, does adv http-related
												   processing e.g. MIME-type negotiation, decoding params in POST/PUT
												   bodies, handling HTTP caching logic, cookies, & sessions
		*   Action Controller: base controller class. Subclass to implement filters & actions to handle
										       requests. Result of an action is typically content generated from views.
										       **** ONLY THIS ONE IS EXPLICITLY USED BY A TYPICAL RAILS DEV **** 
		*   Action View:       handles view template lookup and rendering, provides view helpers that
		                       assist when building HTML forms etc.. Takes ERB template format.

#Rack
*   webserver interface. Editable list of components every request goes thru to build a response
*   stack of middlewares (like ExpressJS)

#Action Dispatch
*   handles tasks such as routing, parameter parsing, cookies, and sessions
*   encompasses "VC" in MVC
*   handles routing, controller definitions, view rendering

#Server
*   several choices: thin, Mongrel, WEBrick

#Active Record
*   the "M" (Model) in MVC.

*   Rails' ORM (object relational mapping system)
*   Layer of the system for representing business data & logic.
*   helps create & use business objects whose data requires persistent db storage
*   implements Active Record design pattern

#Rails Router 												http://guides.rubyonrails.org/v3.2/routing.html
*   recognizes URLs and dispatches them to a controller's action.
*   can also generate paths and URLs
		*   prevents need to hardcode strings in your views

#Action Controller 									http://guides.rubyonrails.org/action_controller_overview.html
*   the "C" in MVC.

*   does most of the groundwork for handling & producing the appropriate output from requests
*   invoked after routing is completed - i.e. router determines which controller to use

#Active Job 													http://guides.rubyonrails.org/v3.2/active_job_basics.html
*   framework for declaring jobs and making them run on a variety of queueing backends
*   examples of jobs: regularly scheduled clean-ups, billing charges, mailings.
		*   Anything that can be chopped up into small units of work and run in parallel

#Action Mailer
*   lets you send emails from your app via mailer classes & views.
*   Mailers:
		*   are similar to controllers.
		*   inherit from ActionMailer::Base 
		*   live in app/mailers & have associated views that appear in app/views

#Asset Pipeline 											http://guides.rubyonrails.org/v3.2/asset_pipeline.html
*   framework to preprocess JS & CSS assets
*   enabled by default


#Action View 													http://guides.rubyonrails.org/v3.2/form_helpers.html
*   the "V" in MVC
*   

#Engines 															http://guides.rubyonrails.org/v3.2/engines.html
*   mini-apps that provide functionality to their host apps
*   close relative of plugins
*   can be isolated from host apps
*   Examples of what engines might do:
		*   provide blogging functionality to host app, & allow new article & comment creation
		*   