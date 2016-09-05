
1. Update Rails 5 beta 3 to the release version, and include react-rails in the Gemfile:

        gem 'rails', '~> 5.0.0'
        gem 'react-rails' # use whatever version you want here.

2. Run these terminal commands in the project root line:

        bundle install
        rails g react:install

At this point, a new error appeared when running rails s - then once I'd fixed that, a browser error showed up. I was able to fix everything with a few additional steps:

3. Add the following to app/assets/javascripts/application.js. If you are using require_tree ., ensure you place it before this line:

        //= require react
        //= require react_ujs
        //= require components
        //= require_tree .

4. Create app/assets/javascripts/components/components.js.

5. Add this line to config/assets.rb:

        Rails.application.config.assets.paths << "#{Rails.root}/app/assets/javascripts/components"

6. Add this to config/environments/development.rb:

        config.react.variant = :development

7. Add this to config/environments/production.rb

        config.react.variant = :production

At this point I had react-rails working.