# Asset pipeline
*   Preprocessing pipeline that preps stylesheets, images, javascripts, etc. for
		serving to the frontend
*   rails knows what kind of preprocessing to do based on the file extension 
		*   preprocessing can be chained to do multiple steps by appending more file extensions
				*   e.g. filename.js.erb.coffee goes through the coffeescript compiler, then ERB
								 before becoming a JS file.

## Major categories of assets covered by the asset pipeline:
*   app/assets:			assets specific to the present application
*   lib/assets:			assets for libraries written by your dev team
*   vendor/assets:	assets from third-party vendors


## app/assets
### app/assets/stylesheets/
*   any stylesheets in here automatically get included as part of the application.css file
		included in the site layout

#####Manifest: app/assets/stylesheets/application.css

*   Manifest: via the Sprockets gem, tell Rails how to combine stylesheets to form single files

		*= require_tree
		
				*   ensures all CSS files in the app/assets/stylesheets dir (including
						the tree subdirectories) are included into the app CSS

		*= require_self

				*   specifies where in the loading sequence any CSS in application.css gets included

### app/assets/javascripts/
### app/assets/images/
*  these are self-explanatory I think

#

# Include Bootstrap (using SASS!)
*   In Gemfile:
			gem 'bootstrap-sass', '3.2.0.0'

* 	On CLI (in project root directory):
			gem install bootstrap-sass -v 3.2.0.0
			bundle install

*   In app/assets/stylesheets/customi.css.scss:
			@import "config";
			@import "bootstrap-sprockets";
			@import "bootstrap";

*   In config.css.scss (create it if it doesn't exist), add:
			@import "bootstrap/variables";

## Bootstrap components
### <div class="jumbotron">
*   A giant block that Makes everything inside it big.
*   Titles get puffed to mega-size. Subtitles get expanded as well. Font sizes go up in general
*   Groups everything inside it together


