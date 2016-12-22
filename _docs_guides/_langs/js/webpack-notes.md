consuming loaders
=================
sass-loader
-----------
### Options
*   indentedSyntax:    if true, use the whitespace-based SASS syntax rather than the braces-based 
                       SCSS syntax

sass-imports
------------
### Options
*   context: absolute path to foldre


Writing loaders
===============
base loader
-----------
*   empty loader with no actual transformation done:
        module.exports = function(source) {
            return source;
        }

Options available on this inside exported loader module
-------------------------------------------------------
### this.cacheable()
*   makes the output of the loader cacheable if this is called. e.g.
        module.exports = function(source) {
            this.cacheable && this.cacheable(); //<<< this addition makes the whole module cacheable
            return source;
        }

Main webpack config options
===========================
output config
-------------
### publicPath (output.publicPath)
*   tells webpack at what URL route the package will be accessible at via the browser
*   used by file-loader and url-loader. Important for code splitting - look into it again if your 
    build size gets too large
