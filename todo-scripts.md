Ruby scripts to create
======================

-   save your git branch history to a file. Output them to the cli when a command is given. 
    Store a specific number based on a config file. Have a default number of past branches to
    output, along with an option for this in the config. Allow display of a specific number based
    on a property given to the script

-   create the same branch on both main and base. First check out develop on each, then if both 
    checkouts succeed, create a branch with the given name on each. Otherwise return an error.

-   use table display for showing files lists (in lsr.rb)

-   recursive file list

-   detector of files containing '>>>>', '<<<<', '====', etc. - git merge conflict artifacts 

-   extract all translations from a project, display them 

General scripting tasks
=======================
-   Figure out how to get Clojure up and running



TODO learning Ruby better
=========================
- singleton methods?
- trust
- taint
- allocate


TODO Learn rspec + factory_girl + Ruby
======================================
- Lifecycle callbacks - custom
- stateful objects (factories?)
- context vs describe
- learn to wrap every method in another class (delegated from)
	- to allow "locking" of a method 
- learn to 
X callcc
! initialize rake without rails - make basic task
	- doc this
- let! - rspec
- rake namespaces
	- rake task list
- Threads
- delegate call to a module
- alias
- better class snippet
- rake plugins?
	- rake gem handling?   									https://github.com/mojombo/rakegem
	- rake completions?
	- rake-todo?
	- rake-hooks?					 									https://github.com/guillermo/rake-hooks
	- rake-pipeline?			 									https://github.com/livingsocial/rake-pipeline
	- rake-notes?					 									https://github.com/fgrehm/rake-notes
	- misc extras?				 									https://github.com/thoughtbot/limerick_rake
	- rake-progressbar?		 									https://github.com/ondrejbartas/rake-progressbar
	- rake-roll - for autotagging releases? https://github.com/thelazycamel/rake_roll
	- rake-growl? (tells U when task done)	https://github.com/porras/rakegrowl

- Ruby Queue


- require all in a dir


- autotest
- filewatcher
- cells: https://github.com/apotonick/cells
	  *   encapsulate parts of your UI into components into view models
    *   Cells aka View models: simple ruby classes that can render templates
	      *   they also allow proper OOP, polymorphic builders, nesting, view inheritance, use
	     		  of Rails helpers, asset packaging to bundle JS+CSS+images, simple distribution of
	     		  model components via gems or Rails engines, encapsulated testing, caching, etc.

Consider arbre to make html in ruby syntax is regular ruby files
Arbre: 	https://github.com/activeadmin/arbre
e.g. 
html = Arbre::Context.new do
  h2 "Why is Arbre awesome?"

  ul do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
  end
end

puts html.to_s # =>


