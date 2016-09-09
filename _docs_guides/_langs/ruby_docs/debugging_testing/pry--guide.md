
Pry
===
*   A powerful alternative to irb

Setup
=====
*   install with

				sudo gem install pry

* run with

				pry

Main commands in runtime
========================

cd  -- change "scope" 
---------------------
		cd any_object_even_a_literal

*   puts you in the scope of the object
*   self becomes the object you're inside

*   e.g.

		cd "asdf"
		cd 5
		cd ActiveRecord
		cd Object
		cd Pry
		cd Object.class

*   to go up one level of scope:

		cd ..

ls  --  view everything (objects) in scope
------------------------------------------
*   Basic use:
        ls

*   view objects in & info about the current scope

*   view objects in & info about a specific object. e.g.

    ls 4
    ls Object
    ls Rails

*   separates output into categories e.g. for ls Rails, the categories given are:
		*   constants
		*   ActiveSupport::Autoload#methods
		*   Rails.methods
		*   instance variables

*   can give more extensive details about an object, mainly by including info about items all the
    way up class hierarchy from the object ls is invoked on (it exposes extra categories). E.g.

        ls -v
        ls -v Rails

history  --  view command history in the pry repl
=================================================
*   basic - gives output akin to the terminal's history command:
		history				OR 				hist

*   filter outputted lines:

    history --grep something_to_search_for


#########################
#          pry          #
#########################
# A powerful alternative to irb
# install with 		sudo gem install pry
# run with 				pry

# commands:
# 
# cd any_object_even_a_literal			e.g.			cd "asdf"
# -    puts you in the scope of the object
# 
# cd ..	
# -    go up one level of scope

`ls -alL`.split("\n").map{|item| item.split(/[0-9][0-9]\:[0-9][0-9]/).last }.drop 1

