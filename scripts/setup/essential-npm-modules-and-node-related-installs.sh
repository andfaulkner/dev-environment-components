##########################################################################################
################################ ESSENTIAL GLOBAL MODULES ################################
##########################################################################################
# sort npm dependencies
sudo npm install -g npm-sort
# in project dir:
# 	npm-sort

# view pretty visual graph-based process usage
sudo npm install -g vtop
# then run:
vtop

sudo npm install -g md2html
sudo npm install -g gulp
sudo npm install -g dustjs-linkedin
sudo npm install -g yo
sudo npm install -g yeoman
sudo npm install -g forever
sudo npm install -g nodemon
sudo npm install -g pm2
sudo npm install -g mimosa
sudo npm install -g broccoli broccoli-cli
sudo npm install -g node-sass
sudo npm install -g brunch
sudo npm install -g webpack
sudo npm install -g babel babel-core babel-loader node-babel babel-cli
sudo npm install -g less
sudo npm install -g eslint
sudo npm install -g jshint
sudo npm install -g jslint
sudo npm install -g babel-eslint
sudo npm install -g jscs
sudo npm install -g express
sudo npm install -g knex
sudo npm install -g js-beautify
sudo npm install -g winston
sudo npm install -g backbone
sudo npm install -g seneca
sudo npm install -g cordova
sudo npm install -g structor
sudo npm install -g concurrently # run multiple commands at once e.g. concurrent 'cmd 1' 'cmd 2'
sudo npm install -g babel-node
sudo npm install -g mocha

# ESSENTIAL FOR VERSION SWITCHING
sudo npm install -g avn avn-nvm
avn setup

##########################################################################################
############################# GULP PLUGINS NEEDED (MINIMUM) ##############################
##########################################################################################
#npm install --save-dev gulp-debug gulp-dev gulp-display-help gulp-dust gulp-exit
#npm install ---save-dev gulp-filter gulp-if-else gulp-newer gulp-plumber
#npm install --save-dev gulp-print gulp-rename gulp-replace gulp-rimraf
#npm install --save-dev gulp-sass gulp-shell gulp-size gulp-stats fs-extra
#npm install --save-dev gulp-tap gulp-webpack lazypipe run-sequence gulp-wait
#npm install --save-dev gulp-util gulp-wait gulp-livereload shelljs gulp-packages
#npm install --save-dev merge2 del async tcp-port-used colors rootpath yargs

#npm install --save clarify trace

##########################################################################################
########################### COOL GLOBAL MODULES (explore more) ###########################
##########################################################################################
# move stuff to a 'trash can' - like rm but safer. https://github.com/sindresorhus/trash
sudo npm install -g trash-cli
# Usage:		trash <path|glob>							
# trash ./bear-photo.png ./bear-photo-2.jpg		<< delete bear-photo.png & bear-photo-2.jpg
# trash '*.png' '!bears.png'									<< delete all png photos, except bears.png
# 			try:	 alias rm=trash 

# empty the trash. Works alongside trash-cli
sudo npm install -g empty-trash-cli
# Usage:		empty-trash
# https://github.com/sindresorhus/empty-trash-cli

# check if internet is up
sudo npm install -g is-online-cli
# Usage:		is-online
# https://github.com/sindresorhus/is-online-cli

# get your public ip address					Usage:	public-ip
sudo npm install -g public-ip
# https://github.com/sindresorhus/public-ip

# get current wifi password 					Usage: wifi-password
sudo npm install -g wifi-password

# TERMINAL TO GIF RECORDER!!!					Usage: 	ttystudio output.gif --log 		# stop rec w/ ctrl-q
sudo npm install -g ttystudio 
# https://github.com/chjj/ttystudio

# jsinspect: find duplicate/repetitive code			Usage: jsinspect [options] <paths ...>
sudo npm install -g jsinspect
# e.g.		jsinspect -t 30 -i --ignore "Test.js" ./path/to/src
# comes with gulp plugin.
# https://github.com/danielstjules/jsinspect

# pipe terminal output through an in-terminal js script		Usage: pjs [options] [files ...]
sudo npm install -g pipeable-js
# e.g. 		(echo 'foo' && echo 'foobar') | pjs -jm '{name: $, length: length}'
# =>						[{"name":"foo","length":3},
# 	 						{"name":"foobar","length":6}]
# e.g2:		ls -1 | pjs -f 'length > 5'													  # return all lines > 5 chars
# e.g3:		ls -1 | pjs -m '"  " + toUpperCase()'								  # make uppercase & pad each line
# e.g4:		ls -1 | pjs -f 'length > 5' -m 'replace(/\d/g, "")'   # ret lines > 5 char, rm all digits
# https://github.com/danielstjules/pjs

# read any module's README in cli		Usage: modhelp name-of-module
sudo npm install -g modhelp
# https://github.com/runvnc/modhelp

# check if a website is up   				Usage: is-up some-site 			e.g.	is-up google.com
sudo npm install -g is-up-cli
# https://github.com/sindresorhus/is-up-cli

# Change screen brightness 					Usage: brightness 0.8;	 brightness; <--opens interactive tool
sudo npm install -g brightness-cli

# screenshots of websites from the command line
sudo npm install -g pageres-cli
# e.g. pageres todomvc.com 1024x768   --> 1 screenshots: 1 site at 1024x768
# pageres todomvc.com yeoman.io 1024x768   --> 2 screenshots: 2 sites, both at 1024x768
# https://github.com/sindresorhus/pageres-cli

# get current web speed 						Usage: speed-test
sudo npm install -g speed-test
# https://github.com/sindresorhus/speed-test

# kill things powerfully						Usage: fkill <pid|pname> ...
sudo npm install -g fkill-cli
# e.g. fkill 1337; fkill Safari; fkill 1337 Safari;
# examples: fkill 1337				fkill Safari			fkill 1337 Safari;		
# just 'fkill' shows an interactive interface. 		
# https://github.com/sindresorhus/fkill-cli

# 
# TURN NODE PROCESS INTO A CLI!		<< must try at isight
# 
sudo npm install -g vantage
# https://github.com/dthree/vantage

##########################################################################################
############################### ESSENTIAL PROJECT MODULES ################################
##########################################################################################

# styling, templating
# npm install --save dustjs-linkedin node-sass

# ES6
# npm install --save babel babel-preset-react babel-preset-es2015
# npm install --save-dev babel-loader babel-runtime babel-eslint babel-core
#npm install --save-dev eslint-plugin-babel eslint-plugin-react

# server framework
#npm install --save koa koa-router koa-compose koa-static

# logging
#npm install --save winston

# utils
#npm install --save jquery lodash

# db
#npm install --save bookshelf pg 

# control flow
#npm install --save co
#npm install --save async

# Build
#npm install --save-dev broccoli webpack eslint babel redux-devtools

# React & redux
#npm install --save react redux babel-preset-react react-dom react-router

# Config handling
#npm install --save config json5 #json5, because screw having no comments etc.

# make every non-module require relative to project root
#npm install --save app-module-path

############################## INSTALL METEOR FRAMEWORK ##############################
curl https://install.meteor.com/ | sh
