----

NOTE: TEMPORARY LOCATION. WILL BE MOVED INTO OWN REPO OR A BETTER-SUITED REPO IN THE NEAR FUTURE

HERE FOR EDITING CONVENIENCE PRIOR TO SETTLING ON FINAL LOCATION

----

Awesome collection
==================
*   Collection of useful components, snippets, libraries, and miscellaneous bric-a-brac. Reference for mHealth app creation.

----

Libraries / Modules
===================

JS utility libraries - essential
--------------------------------
*   [lodash](https://lodash.com/)
    *   the granddaddy of all JS utility libraries for JS. Absolutely essential,
        never do a project without it. Gives JS the STL it always deserved.
        *   particularly effective for working with collections
    *   If you've never used this library, go learn it now - seriously. It's
        that good, and that essential.
    *   commonly used functions:
        *   *reduce*, *map*, some, every, find, filter, reject, without, each
        *   *chain* (run composed functions in friendly.looking.chains.like.thisOne)
        *   tail, head, take, takeRight, drop, dropRight
        *   flatten, flattenDeep, chunk, compact, uniq, difference, xor
        *   defaultsDeep, get, has, pick, toPairs
        *   camelCase, snakeCase, kebabCase, capitalize, pad, padStart, padEnd, trim
        *   isObject, isArray, isUndefined, isPlainObject, isError, isFunction, isString,
            isNumber, isInteger, isDate, isBoolean
        *   partial, rearg, flip, once, debounce, throttle, memoize

*   [class-transformer](https://github.com/pleerock/class-transformer)
    *   conversion between different JS different conceptions of objects & related utils.. e.g.
        -   convert regular objects into JS classes (plainToClass)
        -   convert classes into classes (i.e. deep clone a class) (classToClass)
        -   convert classes into regular objects (classToPlain)
        -   serialize classes into JSON (serialize)
        -   deserialize JSON into classes and arrays
        -   bonus:
            -   basic conditional filtering of props in previous operations, including
                ACL-based filtering
            -   object and class versioning
            -   define additional transformations done when doing any of the
                preceding conversions
            -   provide explicit types to properties

*   [pretty-error](https://www.npmjs.com/package/pretty-error)
    *   create beautiful errors

React components
----------------
*   [Griddle](http://griddlegriddle.github.io/Griddle/index.html)
    *   data grid component: automatically spits out a grid given a data collection
    *   infinite scrolling or pagination
    *   allows nested subgrids if needed, including baked-in accordions
    *   sane defaults, but designed to allow custom formatting, styling, data filtering, paging

        npm install griddle-react --save

*   [react-ios-switch](http://clari.github.io/react-ios-switch/)
    *   switch / toggle component directly modeled after iOS switches

*   mobx-react-form: automatically bind forms to the app's client-side MobX data store
    *   [how-to mobx-react-form](https://medium.com/@foxhound87/automagically-manage-react-forms-state-with-mobx-and-automatic-validation-2b00a32b9769#.rph70ngxs): really good explanatory article

*   [mobx-react-devtools](https://github.com/mobxjs/mobx-react-devtools)
    *   perform runtime analyses of React apps, track rendering behaviour and data dependencies
        from the UI (creates onscreen utility-running widget)

*   [react-selectize](http://furqanzafar.github.io/react-selectize/#/)
    *   Extremely powerful select components, allowing (for example):
        *   multiselect - including with & without # of maximum values
        *   selector tags (like StackOverflow or Github's), including both selection & creation
        *   animated dropdowns
        *   cursor (regarding selection location) position handling
        *   disabling and enabling dropdowns
        *   custom rendering (think Slack's auto-rendering of Emojis for certain text groups)

*   [react-music](https://github.com/FormidableLabs/react-music)
    *   Make beats with React. Just for fun :)

*   [react-dock](http://alexkuz.github.io/react-dock/demo/)
    *   "dockable" and resizable React component.
    *   Basically a component that can be easily forced to stick to one of the edges of a page,
        akin to a slideout menu 
        *   however, allows dynamic repositioning (on a different edge) and dynamic resizing
            *   ...including animations to smooth the transitions between sizes & positions

*   [react-json-tree](https://github.com/alexkuz/react-json-tree)
    *   Display a pretty JSON "tree" onscreen
    *   ...including custom styling the tree
    *   easy way to display object content onscreen (probably best used in debugging)

*   [Ant design](https://ant.design)
    *   Clean, modern set of React components

*   [react-component-gallery](https://github.com/KyleAMathews/react-component-gallery)
    *   create an evenly spaced gallery of child components. I.E. kind of like this:
            ____ ____ ____
            |__| |__| |__|
            ____ ____ ____
            |__| |__| |__|

*   [react-ladda](https://github.com/jsdir/react-ladda)
    *   React wrapper to create ladda buttons (in-element load indicators, basically)
     
React components to check out
-----------------------------
*   [react-sticky](https://github.com/captivationsoftware/react-sticky)
    *   Glue elements to specific locations on the page with a React component.
*   [react-absolute-grid](https://github.com/jrowny/react-absolute-grid)
    *   An absolute layout grid with animations, filtering, zooming, and drag and drop support
    *   seems to be really powerful and flexible, without too much learning curve
*   [timeago-react](https://github.com/hustcc/timeago-react)
    *   Render date with "*** time ago" statements e.g. "2 hours ago", "5 days ago", etc.
    *   See also [react-smart-time-ago](https://github.com/KyleAMathews/react-smart-time-ago)
*   [react-cookie](https://github.com/thereactivestack/react-cookie)
    *   Save and load user coookies with a react component
*   [react-bootstrap-typeahead](http://ericgio.github.io/react-bootstrap-typeahead/)
    *   Typeahead box in Bootstrap style, particularly suited for use with React-bootstrap
*   [react-user-tour](https://github.com/socialtables/react-user-tour)
    *   Like ShowcaseView for Android. Give users a tour around the app using arrows pointing
        to selector-picked DOM elements, etc.

*   [omniscient](http://omniscientjs.github.io/)
    *   fast top-down rendering of React views, with fully functional programming approach

React utilities
---------------
*   [immuntability-helper](https://github.com/kolodny/immutability-helper)
    *   Mutate a copy of an object without changing the original
    *   Drop-in replacement for React Immuntability helpers, so the
        [officialdocs](https://facebook.github.io/react/docs/update.html) for it are still relevant

*   [why-did-you-update](https://github.com/garbles/why-did-you-update): lets you know when
    your code is getting React to do unnecessary re-renders.
    *   Removing these unneeded re-renders will improve performance.

*   [react-stamp](https://github.com/stampit-org/react-stamp)
    *   prototypical inheritance utilities for react components
    *   create react components with composable factory functions
    *   [Some context regarding stampit, react-stamp's parent library](https://medium.com/javascript-scene/3-different-kinds-of-prototypal-inheritance-es6-edition-32d777fa16c9#.dc5cjb1iw)
    *   See also:
        *   [stamp-utils](https://github.com/stampit-org/stamp-utils)

*   [react-bluekit](http://bluekit.blueberry.io/)
    *   automatically generates a library from your React components with editable props and live
        preview. Point it to folders with React components and it makes a library for you. Changes
        to code can be seen live. 

*   [react-styleguide](https://github.com/jmfurlott/react-styleguide)
    *   Generate a styleguide for your project's React components
    *   "component that takes in other components & organizes them into an easy to use styleguide"
    *   [Example generated styleguide](http://jmfurlott.github.io/react-styleguide/)

*   [Reactotron](https://github.com/reactotron/reactotron)
    *   Desktop app for inspecting ReactJS (and React Native) apps. Shows app state, API requests &
        responses, error messages, actions dispatched, logs, etc.. Lets you do benchmarks and track
        changing state over time, as well as artificially alter the state for experiments. Can
        also "subscribe" to parts of the app state and get more detailed information when these
        parts change. Etc.

*   [Hypernova](https://github.com/airbnb/hypernova)
    *   server-side render Javascript views (in particular ReactJS views)

*   [React mixin](https://github.com/brigand/react-mixin)
    *   Use mixins with ES6 classes

Non-React JS UI libraries 
-------------------------
*   [ValidatorJS](https://github.com/skaterdav85/validatorjs)
    *   declarative validation logic for forms in JS

CLI tool creation
-----------------
*   [Commander](https://github.com/tj/commander.js)
    *   node.js CLI tool microframework
    *   does almost everything you need here: option parsing, subcommand handling, type coercion,
        regex parsing, versioning, mandatory vs. optional arguments, both automatic & custom help
        output management, command aliasing, scrapable (by help output) command descriptions, etc.
    *   [Commander API](http://tj.github.io/commander.js/)
*   [Inquirer.js](https://github.com/SBoudrias/Inquirer.js/)
    *   Command line input user interfaces & interface utilities
    *   Handles:
        *   error feedback
        *   asking questions
        *   (interactive) input parsing
        *   input validation
        *   hierarchical prompt management
    *   use in tandem with comman or vorpal

Code generation utilities
-------------------------
*   [plop](https://github.com/amwmedia/plop): generator creation framework
    *   easily create uniform files with minimal fiddling and tweaking
    *   do near-automatically what was initlaly done with minimal support in
        the boilerplate (the component and component container file generators)
    *   advantages over / differences from Yeoman
        *   one repo for all project files including project-specific generators
        *   easy workflow to add & modify generators (no secondary repo with deployment,
            publishing, etc. required)
        *   focus is on in-project generators; while Yeoman's focus is on creating from-scratch
            project boilerplates. 
    *   docs, guides, tutorials, examples:
        *   [nicoespeon's excellent plop tutorial](http://www.nicoespeon.com/en/2015/11/plop-micro-generator-boilerplate-yeoman-alternative/)
        *   [Boilerplate with good plop generator examples](https://github.com/sapientglobalmarkets/react-mobx-seed/tree/master/generators)
    *   example pre-made generators / generator collections:
        *   [plop-generator-redux](https://www.npmjs.com/package/plop-generator-redux)
        *   [plop-node-express](https://github.com/calcaide/plop-node-express)
            *   Plop generator for Node + Express apps with ES6
            *   a new app creator with plop - relatively complex, so a good example repo
        *   [plop-react-webpack](https://www.npmjs.com/package/plop-react-webpack)
            *   generates new React apps using Webpack as the build tool
            *   another great example for slightly more advanced plop concepts
        *   [UI development with Riot.js and ES6 JS part 7: Reactor pattern pt 1](http://newbranch.cn/ui-development-with-riot-js-and-es6-javascript-part-xii-reactor-pattern-part-1/)
            *   includes extended section on implementing Reactor pattern generators in plop
                *   numerous practical examples
        *   [react-boilerplate (app generators collection section)](https://github.com/mxstbr/react-boilerplate/tree/master/internals/generators)
            *   large list of practical react file generators, integrated into a large ReactJS
                boilerplate
            *   includes numerous generators for intl-js, components, and containers


React "frameworks"
==================
*   [next.js](https://github.com/zeit/next.js)
    *   framework for server-rendered isomorphic JS with React. Extremely opinionated, with
        tons of automatic work done for you simply based on e.g. the file system location you
        placed a certain file.
    *   "Convention not configuration"
    *   routing built right in with the <Link> component
    *   sane default error handling including showing a 404 page
    *   worth looking into for rapid bootstrapping
    *   issue: currently uses inline styles, although they're working on changing this

*   [create-react-app](https://github.com/facebookincubator/create-react-app)
    *   lets you create a react app with no configuration, using a highly opinionated
        CLI generator: e.g.:
                `create-react-app name-of-my-app`
    *   automatically runs with built in npm start command
    *   automatic production build with npm run build
    *   framework "opinions" can be tossed with an "eject" command that unlocks full flexibility
        for a project created with this tool

*   [Gatsby](https://github.com/gatsbyjs/gatsby)
    *   static blog auto-generation tool.
    *   creates full React-based dynamic blogs & websites out of plain text
    *   out-of-the-box can generate a usable blog website with no configuration, and lets
        you unlimitedly add blog entries by dropping text files in the project's /pages dir

Routing
=======
*   [react-router](https://github.com/ReactTraining/react-router)
    *   Now on the avoid list
    *   too many breaking API changes
*   [Director](https://github.com/flatiron/director)
    *   Tiny isomorphic URL router
    *   Fairly feature-rich
    *   One of the Facebook-recommended solutions
    *   integrates reasonably well with React
    *   Andrew has used it previously, in a Cordova project - some familiarity
    *   Route matches trigger functions
        *   matches can include regex matches
        *   matching items passed into triggered function as an argument
    *   "adhoc routing" where routing is added right beside components
        *   i.e. routing table can be split up
    *   can set up functions to call on ALL route matches within a scope
        *   as well as global route matches
        *   This includes pre- and post- match routes
        *   Along with 'notfound' routes
    *   has asynchronous routing akin to Express
    *   Works with History API
    *   can attach properties to 'this' on given routes
    *   convenience instance methods available to manually set routes
[React Mini-router](https://github.com/larrymyers/react-mini-router)
    *   very simple React routing solution
    *   provides a mixin that can be integrated into a root level component
        *   see react-mixin for the ability to use this with ES6 classes
    *   calls methods on the object shown instead of directly creating components
    *   supports History API
    *   tiny: 10kb minified, 4kb minified and gzipped
    *   route matching on a routes method on React classes
    *   programmatically trigger navigation with navigate method
    *   nested routers
    *   return matches to matching functions
[React-Router-Component](https://github.com/STRML/react-router-component)
    *   Define routes in component hierarchy
        *   e.g. <Location path="/" handler={MainPage} />
    *   has both hash and History routing
    *   regex matches
    *   transitions
        *   onBeforeNavigation & onNavigation callbacks, called before & after nav (respectively)
    *   contextual routers: i.e. routers that can be mounted on other routers
    *   [Custom link components](http://strml.viewdocs.io/react-router-component/recipes/custom-link/)
    *   [Allows simultaneous definition of multiple routers at once, even on the same page](http://strml.viewdocs.io/react-router-component/multiple/)
    *   [Create custom router components](http://strml.viewdocs.io/react-router-component/recipes/custom-router/)
        *   e.g. to create traditional routing where routes are defined on a component's class attribute
    *   isomorphic
    *   handles no-match conditions
    *   [Handles regular <a> elements](http://strml.viewdocs.io/react-router-component/a-elements/)
        *   Uses CaptureClicks component, which hears clicks on all nested <a> components
            *   this will work well with React-Toolbox

Misc JS utils
=============


Build tools
===========

Webpack
-------
### Guides / tutorials
    *   [Beginner’s guide to Webpack](https://medium.com/@dabit3/beginner-s-guide-to-webpack-b1f1a3638460#.m9tixbzf4)
    *   [Why Can’t Anyone Write a Simple Webpack Tutorial?](https://medium.com/@dtothefp/why-can-t-anyone-write-a-simple-webpack-tutorial-d0b075db35ed#.v77gcpl9z)

### Webpack plugins
*   [strip-loader](https://github.com/yahoo/strip-loader): strip arbitrary functions out of your production code (such as 'console.log')
    *   after using strip-loader, use webpack.NormalModuleReplacementPlugin to replace any stripped out
        function with an empty function
*   [css-loader](https://github.com/webpack/css-loader)
    *   import CSS code with imports & urls resolved.
    *   also lets you enable the [CSS modules](https://github.com/css-modules/css-modules) spec, which turns on locally scoped CSS
    *   provides sourcemaps & minification
*   [style-loader](https://github.com/webpack/style-loader)
    *   Adds CSS to the DOM by injecting a <style> tag.
    *   Perfect for use with css-loader: css-loader grabs CSS files and converts them to strings,
        then style-loader adds those strings to the DOM in a <script> tag
*   [postcss-loader](https://github.com/postcss/postcss-loader)
    *   does post-processing on your CSS code. Loads postCSS plugins you pass it, and does the
        transformations each includes on the CSS. Used in tandem with css-loader and style-loader.
*   [awesome-typescript-loader](https://github.com/s-panferov/awesome-typescript-loader/tree/v2.0.1)
    *   A considerably faster typescript loader
*   etc...

### Webpack misc tools
*   [webpack-configurator](https://github.com/lewie9021/webpack-configurator)
    *   set of utilities to create and extend Webpack's config structures easily
    *   TODO look into this for improving your webpack "module" setup

*   [babel-react-optimize](https://github.com/thejameskyle/babel-react-optimize)
    *   Babel preset and plugins for optimizing React code, in terms of runtime performance
    *   i.e. improves the responsiveness of the application
    *   [More info](https://medium.com/doctolib-engineering/improve-react-performance-with-babel-16f1becfaa25#.yp1efskht)
        *   Description

Typescript's tsc
----------------
*   compiles Typescript to browser-readable JS
*   our main frontend language
*   Articles
    *   [Typescript won](https://medium.com/@basarat/typescript-won-a4e0dfde4b08#.x2mplg80x) (info on its adoption status)
    *   [When to use Typescript](https://medium.freecodecamp.com/when-should-i-use-typescript-311cb5fe801b#.trvoytqlm)

Babel
-----
*   Converts ES6 and ES7 Javascript to ES5 Javascript
    *   ES5 is near-universally supported, whereas support for ES6 and ES7 is poor, so it in effect
        lets you use ES6 and ES7 everywhere so long as Babel is run first
*   Can be used in tandem with Typescript's tsc compiler to provide additional features to
    Typescript (toolchain: [raw TS source]---[tsc]-->)
*   [Official Babel documentation, info, config](https://babeljs.io/)
*   (less important - tsc handles most of it for us, with a few exceptions such as React-Intl's
    translation extractor which still needs babel.)

PostCSS
-------
*   our main CSS preprocessor
*   build your own CSS solution from the ground up by choosing plugins corresponding to which
    features you want your CSS to have. Infinitely extensible.
*   common plugins provide autoprefixing, CSS modules, transpilation of not-yet-widely-supported
    CSS features and future CSS features, etc.
*   [PostCSS plugin collection](http://postcss.parts/)
*   [Official PostCSS documentation](http://postcss.org/)

###PostCSS plugins
*   [LostGrid / lost](https://github.com/peterramsing/lost) - adds an incredibly powerful grid system to CSS
*   [cssnext](http://cssnext.io/) - transpile the most recent CSS syntax into browser-compatible CSS. 
    Also does autoprefixing out of the box
*   [postcss-simple-vars](http://example.com/link/path)
*   [postcss-center](https://github.com/jedmao/postcss-center) - automatic centering of CSS elements 
    *   (TODO test this out, see if it actually works effectively)

Version and package management
==============================
*   [Greenkeeper](https://greenkeeper.io/)
    *   "real-time monitoring and automatic updates for npm dependencies"
    *   tracks npm dependencies & triggers project test suite w each new version to come in
    *   If an update of one of the project's dependencies breaks the project, it opens an
        issue in the dependency's github repo

*   [updtr](https://github.com/peerigon/updtr)
    *   near-automatically updates a project's npm modules, w/ auto-rollbacks on update fails
    *   runs the test suite of each module that gets updated (rollback if module tests fail)

*   [yarn](https://yarnpkg.com/)
    *   Ultra-fast npm alternative
    *   [Why you should switch](https://medium.com/statuscode/roundup-of-yarn-links-npm-javascript-abad6a5ddbf6#.c7fud9ol0)

NodeJS shell scripting tutorials
--------------------------------
*   [Write your shell scripts in JavaScript, via Node.js](http://www.2ality.com/2011/12/nodejs-shell-scripting.html)

### Example NodeJS CLI tools (for reference)
*   [Neo](https://github.com/mozilla/neo) - a React app generator
*   [nwb](https://github.com/insin/nwb) - another React app generator. Much higher complexity than Neo

Articles / Guides / Docs
========================
CSS info
--------
*   [CSS for people who hate CSS (8 essential best practices)](http://paulcpederson.com/articles/css-for-people-who-hate-css/)
    *   essential, universal rules

*   [The 100$ Correct way to do CSS Breakpoints](https://medium.freecodecamp.com/the-100-correct-way-to-do-css-breakpoints-88d6a5ba1862#.piiosqpbf)
    *   Guide to setting CSS breakpoints properly

*   [Visual guide to CSS' most popular layout features](http://cssreference.io/?utm_source=mybridge&utm_medium=email&utm_campaign=read_more)
    *   Description

React info
----------
*   [React lifecycle diagram](http://codepen.io/eduardoboucas/full/jqWbdb)
    *   Amazing interactive diagram outlining a React component's lifecycle and
        explaining each step

*   [React FAQ](https://github.com/timarney/react-faq?utm_source=reactnl&utm_medium=email)
    *   Pulls together all good reference material on React into a central location

*   ReactCasts: Context
    *   [pt1](https://www.youtube.com/watch?v=lxq938kqIss)
    *   [pt2](https://www.youtube.com/watch?v=mwYHDXS6uSc)
    *   Video explanation of React's most confusing concept: Context

*   [ReactCasts: Higher-order components](https://www.youtube.com/watch?v=LTunyI2Oyzw)
    *   video explanation of higher-order components

*   [Container components](https://medium.com/@learnreact/container-components-c0e67432e005#.xtocvz833)
    *   A must-use design pattern in ReactJS that we strictly enforce. Required reading.
    *   summary: each "component" is broken into 2 parts:
        *   container components / containers / "smart" components perform data fetching and
            transformation of returned data into UI elements (e.g. wrapping returned translations
            into a usable tag). No UI rendering allowed whatsoever - the only thing it's allowed
            to render is its corresponding presentational component.
        *   presentational components / "dumb" components are for pure layout and UI rendering,
            and contain no logic. Each receives prepared data from its corresponding container.

*   [Presentational and container components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0#.t8hlit171)
    *   Additional details, info, examples, and explanations regarding container components
        pattern described in [Container components](https://medium.com/@learnreact/container-components-c0e67432e005#.xtocvz833)

*   [The importance of component keys in React.js](https://coderwall.com/p/jdybeq/the-importance-of-component-keys-in-react-js)
    *   summary: use unique constant keys.
        *   Do not pass index to your dynamic children.
        *   Do not use a re-generating UUID or Math.random
    *   [demo](http://jsfiddle.net/frosas/S4Dju/)

### React design patterns
*   [React patterns](http://reactpatterns.com/): set of design patterns usable for ReactJS apps
    *   Essential: [Container component](http://reactpatterns.com/#Container component)
    *   Essential: [Stateless function](http://reactpatterns.com/#Stateless function)

*   [React functional CSS protips](https://github.com/chibicode/react-functional-css-protips)
    *   Outlines an interesting approach to CSS in React projects, using tiny CSS classes that
        only perform one change to the element to which they're applied

*   [React Higher Order Components in depth](https://medium.com/@franleplant/react-higher-order-components-in-depth-cf9032ee6c3e#.cmztv0ftn)
    *   In-depth explanation of higher-order components
        *   (Higher-order component = a React Component that wraps another)
            *   hocFactory:: W: React.Component => E: React.Component

### State stores (MobX, Redux)
*   [Extensive MobX boilerplate projects list](https://mobxjs.github.io/mobx/faq/boilerplates.html)

### Authentication
*   [How to Build a React.js Application with User Login & Authentication](https://stormpath.com/blog/build-a-react-app-with-user-authentication)

### Routing
*   [Do I even need a routing library?](http://jamesknelson.com/even-need-routing-library/?utm_source=reactnl&utm_medium=email)
    *   Explanation of how routing libraries work, how to roll your own, and why you may
        not actually need something like react-router


Code style and cleanliness
--------------------------
*   [Make Your React Components Pretty](https://medium.com/walmartlabs/make-your-react-components-pretty-a1ae4ec0f56e#.m2x28vwpn) (by WalmartLabs)


Javascript core language info / learning
-----------------------------------
*   [JS prototypes in plain English](http://javascriptissexy.com/javascript-prototype-in-plain-detailed-language/)
    *   friendly, detailed explanation of prototypal inheritance in JS
*   [OOP in Javascript: what you need to know](http://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/)
    *   fairly in-depth about how prototypal inheritance works in JS. Good explanations
        of JS' conceptions of objects, prototypes, constructors, Object.create, new, and
        instantiation; along with a bit of info on 'this' & functions in relation to objects
*   [3 types of prototypal inheritance](https://medium.com/javascript-scene/3-different-kinds-of-prototypal-inheritance-es6-edition-32d777fa16c9#.dc5cjb1iw)

Unit testing / monitoring / logging / debugging
============
*   [5 common misconceptions about TDD unit tests](https://medium.com/javascript-scene/5-common-misconceptions-about-tdd-unit-tests-863d5beb3ce9#.pnsmcgocg)
    *   Must-read - makes a very strong case for test-first as a long-term strategy,
        and rebuts DHH's now-famous [anti-test-first dev article](http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html)

*   [Node Hero - Node.js Unit Testing Tutorial](https://blog.risingstack.com/node-hero-node-js-unit-testing-tutorial/)
    *   It's huge and comprehensive

*   [Node.js monitoring done right](https://hackernoon.com/node-js-monitoring-done-right-70418ecbbff9#.su0fy4t27)
    *   Full guide to monitoring Node.js applications

Authentication
==============
*   [Node Hero - Node.js Authentication using Passport.js](https://blog.risingstack.com/node-hero-node-js-authentication-passport-js/)
    *   guide to implementing Node.js authentication using Passport.js and Redis


API querying
============
[GraphQL](http://graphql.org/learn/)

GraphQL clients
---------------
*   [Apollo](http://dev.apollodata.com/) - the most popular GraphQL client
    *   converts GraphQL code written into JS strings into actual emitted queries consumable
        by a GraphQL-providing server endpoint
        *   [example of what this actually means](http://dev.apollodata.com/#code-snippets)


Collection repos
================
*   [awesome-react: mega-collection](https://github.com/enaqx/awesome-react)
*   [js.coach](https://js.coach)
    *   Searchable collection of JS & React packages uable in React projects

Essentials - core tools (WIP, merge with an earlier section)
============================================================
Client
------
*   React: main UI framework
*   [MobX](https://mobxjs.github.io/mobx/index.html)
    *   client-side state store - akin to redux but more similar to a classical object-oriented 
        environment (e.g. Java) - whereas Redux is more akin to functional programming.
    *   [mobx-react](https://www.npmjs.com/package/mobx-react): easily bind React to MobX store
*   [React-Intl](https://github.com/yahoo/react-intl): thin React wrapper around [FormatJS internationalization framework](http://formatjs.io/github/)
    *   [essential boilerplate for getting this to work together with MobX and react-router](https://github.com/jamiehill/react-router-intl-routing/tree/master/src/intl)
    *   [Another reference boilerplate for this purpose](https://github.com/oreqizer/reactizer-mobx/tree/master/src/browser)
    *   [Third boilerplate example](https://github.com/vinej/react-portal/tree/master/src)

*   [React-Bootstrap](https://react-bootstrap.github.io/): readymade UI component collection / UI framework. Considerable number of React-Bootstrap components are used in OHRI-mHealth projects. e.g. modals, dropdown menus, form fields, wells, grids, dropdowns, navigation bars, panels, cards, buttons, 'jumbotrons', lists, list groups, tables, Glyphicons, badges, labels, tooltips, popovers, menus, carousels, alerts/toasts, accordions/collapses, etc..

ORMs
----
*   [TypeORM](https://typeorm.github.io)
    *   Interface with any db, using Typescript syntax
    *   Heavy on classes and decorators
    *   Extremely feature-rich
    *   Includes CLI tools for generating entities etc.
        *   (however they don't seem to be very good)
    *   Handles table creation, storage and deletion of data, and querying/data return.
    *   Provides a mechanism for migrations

Server
------
*   ExpressJS: main NodeJS server framework

Build
-----
*   npm
*   tsc
*   Babel
*   Webpack
*   PostCSS
*   Commander
*   Gulp (less important)


DISCARDED / UNSUITABLE / UNNEEDED LIBS
======================================
*   [Liftoff](https://github.com/js-cli/js-liftoff)
    *   manage details of launching Node code from the CLI, including option parsing, config files,
        process titling, 
        *   the only interesting part is its config file handling, which is excellent. Otherwise
            it's so-so at best
    *   [Official Liftoff tutorial](https://bocoup.com/weblog/building-command-line-tools-in-node-with-liftoff)
    *   [Nice third-party tutorial](http://enginerds.craftsy.com/blog/2015/08/commanding-the-cli-with-node.html) 

*   [react-flexbox-grid](http://roylee0704.github.io/react-flexbox-grid/) (layout grid)
    *   promises a more effective layouts system than the one baked into React-Bootstrap.
    *   It was not significantly better, and posed its own problems

*   [jake](http://jakejs.com/docs)
    *   someone basically rebuilt Ruby's rake for Node.JS
    *   no real benefit otherwise

*   [React Topcoat](http://kjda.github.io/react-topui/)
    *   Collection of UI elements that's actually really ugly

*   [mobx-react-form](https://github.com/foxhound87/mobx-react-form)
    *   supposedly a declarative method of building forms in the UI with validation etc.
    *   an abstraction layer over regular React forms
    *   However, the abstraction is more complex than what it's replacing.
        *   one of those JS repos that's like..."You won't believe how easy it is! With Mobx-React-Form, it's as simple as 1-2-3-4-5-6-7-8-9-10-11-12-13-...-46! As soon as you've completed the steps, you'll be asking yourself...was that it? Am I done already? With Mobx-React-Form, what used to take 10 repetitive, boilerplate-heavy steps can be done in a mere 50!"
    *   I seriously have no idea what the advantage is, especially if you're using 
        typescript (since any argument for providing 'type safety' becomes void)
        *   ...unless I'm misunderstanding something. Still, I recommend avoiding it - it ended up being a fruitless time suck.

*   [react-router](https://github.com/ReactTraining/react-router)
    *   Gold-standard client-side routing solution for ReactJS
        *   Basically *THE* router for React - you need this if your app is multi-page
    *   Tutorials / docs:
        *   [Beginner's guide to react-router](https://medium.com/@dabit3/beginner-s-guide-to-react-router-53094349669#.rlysxfyux)
        *   [Official docs: route configuration](https://github.com/ReactTraining/react-router/blob/master/docs/guides/RouteConfiguration.md)
        *   [Official docs: component lifecycle](https://github.com/ReactTraining/react-router/blob/master/docs/guides/ComponentLifecycle.md)
    *   Issues & fixes:
        *   [Solution to typing problems](https://github.com/DefinitelyTyped/DefinitelyTyped/issues/9928)
    *   Avoid
