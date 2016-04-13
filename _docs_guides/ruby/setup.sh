# Ruby: environment setup and utils
# =================================

# Ruby repl
# ---------
#	Open the Ruby repl: type this in the terminal::

		irb

#	Exit the Ruby repl:

#		exit

## get your .irbrc file, stored online (note: check this)
cp ~/.irbrc ~/.irbrc_bk
curl https://raw.githubusercontent.com/andfaulkner/sublime-nodejs-dev-environment-snippets/master/dev-env/.irbrc > ~/.irbrc

##############################################################################################
######################################## SYSTEM SETUP ########################################
##############################################################################################

#%%%%%%%%%%%%%% FOLLOWING SECTION MOSTLY DEPRECATED DUE TO USE OF RVM %%%%%%%%%%%%%%%%#
#--------- RVM ----------------------------------------------------------------------------------
# NOTE: DEPRECATED SECTION: use rbenv instead of rvm if possible:
				# \curl -sSL https://get.rvm.io | bash -s stable --ruby
				# install ruby with rvm
				rvm install ruby-2.3.0
				rvm use 2.3.0 --default
				# generate ruby docs
				rvm docs generate-ri
				# add this to bottom of .bashrc (or .bash_profile, rather) file # CONFIRM THIS ONE
				[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
				### possibly this too:
				source ~/.profile
				# rvm fixes...
				command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
				rvm get stable --auto-dotfiles

				# then...
				/bin/bash --login
				rvm use 2.3.0 --default

				gem install bundler
				rvm @global do sudo gem install bundler


				## edit Gemfile - change 'require "debugger"' to 'require "byebug"' ??? <<< possibly
				rvm @global do sudo gem install byebug

				rvm alias create default 2.3.0

				rvm current

				# to get your ruby gems folder
				rvm gemdir

				# load change to path made by rvm install
				. ~/.bashrc
				. ~/.bash_profile
#-------------------------------------------------------------------------------------------------
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#

################################ ONLINE REGEX TESTER FOR RUBY #################################
# bookmark it: 		http://rubular.com/

######################################## INSTALL RBENV #########################################
sudo apt-get install rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

############################################# GEMS #############################################
# update rubygems
sudo gem install rubygems-update
sudo update_rubygems

# get "rerun" module, to allow insta-rerunning of ruby scripts (a la nodemon) <<< ESSENTIAL
sudo gem install rerun

# Rails <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ESSENTIAL
sudo gem install rails

# cross-session history for irb <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ESSENTIAL
sudo gem install wirble

# filesize gem
sudo gem install filesize

sudo gem install debugger-ruby_core_source

# rush module - more filesystem control
sudo gem install rush2

# output array of arrays to cli in table format - VERY simple - no wrapping
sudo gem install terminal-table
# table = Terminal::Table.new :rows=>my_array_of_arrays_here

# output array of arrays to cli in table format - wrapping, more complex
sudo gem install tty-table

# to make rerun work smoothly
sudo gem install rb-fsevent

# color terminal output 
sudo gem install colorize

###################################################################################################
# --------------------------------------------- RAILS --------------------------------------------#
### get  sqlite for rails: default db ###
sudo apt-get install sqlite3

### RAILS GEMS ###
sudo gem install oauth2
sudo gem install cancan
sudo gem install sass-rails
sudo gem install rabl
sudo gem install rails_12factor
sudo gem install sdoc
sudo gem install rails
# sudo gem install doorkeeper # << ackroo uses an in-house modified version
sudo gem install devise
sudo gem install delayed_job
sudo gem install squeel
sudo gem install ice_cube
sudo gem install skylight
sudo gem install grape 			# this may be required::  gem install grape -v '0.16.2
sudo gem install roo
sudo gem install draper
sudo gem install rails -v 3.2.12
sudo gem install sdoc
sudo gem install pry
sudo gem install sqlite3
# sudo gem install unirest		<< Ruby 2.0+ only
sudo gem install sprockets-es6
sudo gem install rails_12factor
sudo gem install bundler
sudo gem install sprockets

sudo gem install haml
sudo gem install json -v 1.8.0

######################## TESTING #########################
sudo gem install rspec
sudo gem install rspec-core
sudo gem install factory_girl

####### GUARD - AUTORELOAD TESTS, COMPILATION, ETC #######
sudo gem install guard # << essential! It lets you watch fs & run things on change; no VM boot
                       # 		time. Usually for rerunning tests when the codebase changes.

#------------------------------------------------------------------------------------------------#
# END RAILS #
##################################################################################################


## POSTGRES
sudo gem install pg 		# <<< only works if postgres is installed


################################################################################################
############################## SQLITEBROWSER: installation script ##############################
sudo apt-get install cmake
sudo apt-get install build-essential
sudo apt-get install qt4-default
sudo apt-get install libsqlite3-dev

pushd ./
cd ~
mkdir bin
cd bin
curl 'https://codeload.github.com/sqlitebrowser/sqlitebrowser/tar.gz/v3.8.0' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-GB,en-US;q=0.8,en;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://sqlitebrowser.org/' -H 'Cookie: _octo=GH1.1.1345911844.1449026501; logged_in=yes; dotcom_user=andfaulkner; _ga=GA1.2.1507902864.1449026501' -H 'Connection: keep-alive' -H 'Cache-Control: no-cache' --compressed > v3.8.0.tar.gz
tar -xvf v3.8.0.tar.gz
cd ~/bin/sqlitebrowser-3.8.0
cmake .
make
sudo make install
cp -n ~/.bashrc ~/.bashrc__bk__presqlite
(eval echo "export PATH='\"\$PATH:$(pwd)\"'") >> ~/.bashrc
echo 'alias sqlitebrowser="(sqlitebrowser &> /dev/null &)"' >> ~/.bashrc
echo "backup of bashrc made: ~/.bashrc__bk__presqlite"
popd

# on mac: 	brew install sqlitebrowser
################################################################################################


####################
# Sinatra
####################
sudo gem install sinatra
sudo gem install sinatra-contrib
################################


###### Gem version installs - generic format ######
# 			gem install gemname -v 0.8


