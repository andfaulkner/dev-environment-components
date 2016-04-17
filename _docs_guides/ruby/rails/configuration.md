Enabling ssl
------------

*   in config/environments/production.rb
		config.force_ssl = true
		*   can be used in any environment

*   encrypts all relevant information before it leaves the local browser
*   Setting up a production site to use SSL involves purchasing & configuring an SSL
		certificate for your domain
		*   ...but on Heroku, we can just use Heroku's
