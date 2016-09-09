I was able to get this to work in Rails 5 with the following steps:

1. Adding the following to your Gemfile (any that aren't present already):

        gem 'rails', '~> 5.0.0'
        gem 'sass-rails', '~> 5.0'
        gem 'bootstrap-sass'
        gem 'autoprefixer-rails'
        gem 'jquery-rails'
        gem 'turbolinks'         # but only if you're using turbolinks
        gem 'jquery-turbolinks'  # again, only if using turbolinks

    You may also need to remove @import

2. In the project root, run:

        bundle install

3. Add your bootstrap javascript features of interest to app/assets/javascripts/application.js. Also include jQuery (for best results) in the same file if you aren't already, and if you are also using turbolinks, use jquery.turbolinks and turbolinks itself (for best results). For example:

        //= require jquery
        //= require jquery.turbolinks
        //= require jquery_ujs
        //= require bootstrap/dropdown
        //= require turbolinks

4. Create app/assets/stylesheets/application.scss (if you haven't already), and add the following:

        @import 'bootstrap-sprockets';
        @import 'bootstrap';
        @import 'bootstrap/theme';

    Note that I also had to include this same code in my root route's scss file (in my case app/assets/stylesheets/home.scss), but ymmv.