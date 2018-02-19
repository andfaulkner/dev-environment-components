----------------------------------------------------------------------------------------------------
Consuming loaders
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

style-loader
------------
*   inject a pile of data into DOM in a <style> tag

css-loader
----------
*   load a .css file. Can also load CSS data that is "streamed" into it (e.g. via sass-loader)



----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
Main webpack config options
===========================
output config
-------------
### publicPath (output.publicPath)
*   tells webpack at what URL route the package will be accessible at via the browser
*   used by file-loader and url-loader. Important for code splitting - look into it again if your 
    build size gets too large

----------------------------------------------------------------------------------------------------
CommonsChunkPlugin notes
------------------------
*   The magic order for including outputted scripts in the index.html page:
    *   manifest (.js)
    *   app (.js)
    *   vendor (.js)

DllPlugin
---------
*   inside new webpack.DllPlugin({ path, manifest, context }):
    *   manifest: Gives other Webpack configs a map to your already built modules. Very important.
    *   context: root path of client source code
    *   name: name of the entry file containing all the modules

----------------------------------------------------------------------------------------------------
Performance
===========
*   cache: true
*   cacheDirectory:true in query
*   use includes in all loaders
*   Set devtool to eval

Starting point:
initial build: ~9-10s
incrementals: ~1-2s


initial build: ~9-10s
incrementals: ~0.5s