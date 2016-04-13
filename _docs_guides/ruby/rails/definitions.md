# MODEL
- High-level: captures the behavior of the app in terms of its problem domain, independent of UI
- create in rails with a generator? Example:
		bin/rails generate model Article title:string text:text


# CONTROLLER
- A controller's purpose is to receive specific requests for the application

# ROUTING
- decides which controller receives which requests

# ACTIONS
- Each action's purpose is to collect information to provide it to a view
- different routes can be served by different actions

# binstubs
- wrapper scripts around executables (sometimes called binaries, though they don't have to be
  compiled) whose purpose is to prep the environment before dispatching the call to the
  original executable
- most common binstubs: the ones RubyGems generates after installing a gem containing executables