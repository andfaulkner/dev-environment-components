Search through project-level javascript, json, & other JS logic code only
=========================================================================
* search type: all files
* in 'where' box:

		<project>,-node_modules/**,-*.md,-Dockerfile,-*.yml,-*.csv,-.nodemonignore,-Makefile,-*.log,-*.css,-*.min.js,-*.java,-*.txt,-*.jmx,-*.xml,-*.wsdl,-*.xsl,-*.sql,-*.rb,-*.html,-*.htm,-.jshintrc,-.dockerignore,-.gitignore,-bower.json,-package.json,-*.properties,-*.sublime*,-.bowerrc,-.jscsrc,-.jshintignore,-.jshintrc,-gulpfile.js,-*.sh,-*.ico,-.npmignore,-LICENSE,-*.markdown,-*.py,-*.bat,-CHANGES,-Jakefile,-ckeditor/**,-*.less,-*.sass,-*.scss,-*.rst,-*.woff,-*.ico,-*.png,-*.jpg,-*.gif,-*.otf,-*.pegjs,-public/js/lib/vendor/**,-*.doc,-*.docx,-*.LICENSE,-.classpath,-.gitmodules,-*.cfg,-*.map,-*.svg,-*.min.map,-.editorconfig,-component.json,-*.project,-CNAME,-LICENSE-MIT,-jquery.js

##Also exclude scripts & tests (app logic only)
-----------------------------------------------
* search type: all files
* in 'where' box:

		<project>,-node_modules/**,-*.md,-Dockerfile,-*.yml,-*.csv,-.nodemonignore,-Makefile,-*.log,-*.css,-*.min.js,-*.java,-*.txt,-*.jmx,-*.xml,-*.wsdl,-*.xsl,-*.sql,-*.rb,-*.html,-*.htm,-.jshintrc,-.dockerignore,-.gitignore,-bower.json,-package.json,-*.properties,-*.sublime*,-.bowerrc,-.jscsrc,-.jshintignore,-.jshintrc,-gulpfile.js,-*.sh,-*.ico,-.npmignore,-LICENSE,-*.markdown,-*.py,-*.bat,-CHANGES,-Jakefile,-ckeditor/**,-*.less,-*.sass,-*.scss,-*.rst,-*.woff,-*.ico,-*.png,-*.jpg,-*.gif,-*.otf,-*.pegjs,-public/js/lib/vendor/**,-*.doc,-*.docx,-*.LICENSE,-.classpath,-test/**,-script/**,-.gitmodules,-*.cfg,-*.map,-*.svg,-*.min.map,-.editorconfig,-component.json,-*.project,-CNAME,-LICENSE-MIT,-jquery.js

--------------------------------------------------------------------------------------------------
Search through find results, match non- js, dust, json filenames
================================================================
* search type: in-single-file
* search context: 'Find Results' file

		\/home\/andfaulkner\/Projects(?!(.*js:)|(.*dust:)|(.*json:)$)
