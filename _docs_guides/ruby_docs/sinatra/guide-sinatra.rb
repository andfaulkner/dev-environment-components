require 'sinatra'

puts '------------------------------------------------------------------------------------------'
###########################################
#          SERVING STATIC ASSETS          #
###########################################
puts '***************** SERVING STATIC ASSETS *****************'

# place them in the [proj root]/public folder -- that's it
# to serve more assets under sub-paths: add folders to the public folder
    # each added folder will add to the subpath. 
    # e.g. public/javascripts/index.js would be accessible via http://your-origin:4567/javascripts/index.js

puts ' ----- Static asset conflicts -----'
# e.g. if there's already a file called public.html in the public folder...
get '/public.html' do
  'This is what gets delivered via the route.'
end

# *   defined routes always clobber static files in the public folder

puts ' ----- Define a different location for assets -----'
set :public_folder, File.dirname(__FILE__) + '/app' # this puts it in the app folder like it's rails

puts '------------------------------------------------------------------------------------------'
###########################
#          VIEWS          #
###########################
puts '***************** VIEWS *****************'
# *   HTML templates that can optionally contain data passed from the application
# *   generally erb

puts ' ----- Inline templates -----'

get '/index' do
  erb :index
end

# change default view file
set :views, File.dirname(__FILE__) + '/app/views'

puts '------------------------------------------------------------------------------------------'
#####################################
#          CONFIGURE BLOCK          #
#####################################
puts '***************** CONFIGURE BLOCK *****************'
