##########################################################################################
################################ ESSENTIAL GLOBAL MODULES ################################
##########################################################################################
# sort npm dependencies
npm install -g npm-sort
# in project dir:
# 	npm-sort

npm install -g md2html
npm install -g gulp
npm install -g dustjs-linkedin
npm install -g yo
npm install -g yeoman
npm install -g forever
npm install -g nodemon
npm install -g pm2
npm install -g mimosa
npm install -g broccoli broccoli-cli
npm install -g node-sass
npm install -g brunch
npm install -g webpack
npm install -g babel babel-core babel-loader node-babel babel-cli
npm install -g less
npm install -g eslint
npm install -g jshint
npm install -g jslint
npm install -g babel-eslint
npm install -g jscs
npm install -g express
npm install -g knex
npm install -g js-beautify
npm install -g winston
npm install -g backbone
npm install -g seneca
npm install -g cordova
npm install -g structor
npm install -g concurrently # run multiple commands at once e.g. concurrent 'cmd 1' 'cmd 2'
npm install -g babel-node
npm install -g mocha

# ESSENTIAL FOR VERSION SWITCHING
npm install -g avn avn-nvm
avn setup

##########################################################################################
########################### COOL GLOBAL MODULES (explore more) ###########################
##########################################################################################
# move stuff to a 'trash can' - like rm but safer. https://github.com/sindresorhus/trash
npm install --global trash-cli
# Usage:		trash <path|glob>							
# trash ./bear-photo.png ./bear-photo-2.jpg		<< delete bear-photo.png & bear-photo-2.jpg
# trash '*.png' '!bears.png'									<< delete all png photos, except bears.png
# 			try:	 alias rm=trash 

# empty the trash. Works alongside trash-cli
npm install -g empty-trash-cli
# Usage:		empty-trash
# https://github.com/sindresorhus/empty-trash-cli

# check if internet is up
npm install -g is-online-cli
# Usage:		is-online
# https://github.com/sindresorhus/is-online-cli

# get your public ip address					Usage:	public-ip
npm install -g public-ip
# https://github.com/sindresorhus/public-ip

# get current wifi password 					Usage: wifi-password
npm install -g wifi-password

# TERMINAL TO GIF RECORDER!!!					Usage: 	ttystudio output.gif --log 		# stop rec w/ ctrl-q
npm install -g ttystudio 
# https://github.com/chjj/ttystudio

# jsinspect: find duplicate/repetitive code			Usage: jsinspect [options] <paths ...>
npm install -g jsinspect
# e.g.		jsinspect -t 30 -i --ignore "Test.js" ./path/to/src
# comes with gulp plugin.
# https://github.com/danielstjules/jsinspect

# pipe terminal output through an in-terminal js script		Usage: pjs [options] [files ...]
npm install -g pipeable-js
# e.g. 		(echo 'foo' && echo 'foobar') | pjs -jm '{name: $, length: length}'
# =>						[{"name":"foo","length":3},
# 	 						{"name":"foobar","length":6}]
# e.g2:		ls -1 | pjs -f 'length > 5'													  # return all lines > 5 chars
# e.g3:		ls -1 | pjs -m '"  " + toUpperCase()'								  # make uppercase & pad each line
# e.g4:		ls -1 | pjs -f 'length > 5' -m 'replace(/\d/g, "")'   # ret lines > 5 char, rm all digits
# https://github.com/danielstjules/pjs

# read any module's README in cli		Usage: modhelp name-of-module
npm install -g modhelp
# https://github.com/runvnc/modhelp

# check if a website is up   				Usage: is-up some-site 			e.g.	is-up google.com
npm install -g is-up-cli
# https://github.com/sindresorhus/is-up-cli

# Change screen brightness 					Usage: brightness 0.8;	 brightness; <--opens interactive tool
npm install -g brightness-cli

# screenshots of websites from the command line
npm install --global pageres-cli
# e.g. pageres todomvc.com 1024x768   --> 1 screenshots: 1 site at 1024x768
# pageres todomvc.com yeoman.io 1024x768   --> 2 screenshots: 2 sites, both at 1024x768
# https://github.com/sindresorhus/pageres-cli

# get current web speed 						Usage: speed-test
npm install --global speed-test
# https://github.com/sindresorhus/speed-test

# kill things powerfully						Usage: fkill <pid|pname> ...
npm install --global fkill-cli
# e.g. fkill 1337; fkill Safari; fkill 1337 Safari;
# examples: fkill 1337				fkill Safari			fkill 1337 Safari;		
# just 'fkill' shows an interactive interface. 		
# https://github.com/sindresorhus/fkill-cli

# 
# TURN NODE PROCESS INTO A CLI!		<< must try at isight
# 
npm install -g vantage
# https://github.com/dthree/vantage

##########################################################################################
############################### ESSENTIAL PROJECT MODULES ################################
##########################################################################################

# styling, templating
npm install --save dustjs-linkedin node-sass

# ES6
npm install --save babel babel-preset-react babel-preset-es2015
npm install --save-dev babel-loader babel-runtime babel-eslint babel-core
npm install --save-dev eslint-plugin-babel eslint-plugin-react

# server framework
npm install --save koa koa-router koa-compose koa-static

# logging
npm install --save winston

# utils
npm install --save jquery lodash

# db
npm install --save bookshelf pg 

# control flow
npm install --save co
npm install --save async

# Build
npm install --save-dev broccoli webpack eslint babel redux-devtools

# React & redux
npm install --save react redux babel-preset-react react-dom react-router

# Config handling
npm install --save config json5 #json5, because screw having no comments etc.

# make every non-module require relative to project root
npm install --save app-module-path
