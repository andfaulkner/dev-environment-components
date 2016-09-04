Design the app state tree
=========================
-   describes what's going on in your app at any given time
-   have multiple states the tree can be in

Install dependencies
====================

## ES6 features
npm install --save-dev babel-core babel-cli babel-preset-es2015

## Testing
npm install --save-dev mocha chai

## Immutables
npm install --save immutable
npm install --save-dev chai-immutable

Testing scripts
===============

		scripts: {
	    "test": "mocha --compilers js:babel-core/register --recursive"
	    ...
	  }

    	* ...in package.json: recursively find & run all tests in project, with ES6 transpiled

		scripts: {
			...
	    "test:watch": "npm run test -- --watch"
	  }

    	* ...in package.json: watch for changes in our code & re-run the tests on each change

Babel presets
=============
*   Add this to you package.json:

    "babel": {
      "presets": ["es2015"]
    }

    *   Other babel settings can be defined in the babel field.
    *   a set of sane defaults for JS2015 are defined in the preset (babel-preset-es2015)

Immutable
=========
*   module providing a set of immutable data structures for us to use
*   chai-immutable extends Chai to support comparing Immutable data structures
