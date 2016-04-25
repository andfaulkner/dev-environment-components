Languages
=========

Ruby
----
###Pros
-   beautiful syntax
-   expressive: easy to do complex things with small amounts of code while remaining readable
-   excellent standard library: not really missing any expected modern features
-   flexible and powerful: there's virtually no programming construct not built in that can't be
		implemented in Ruby (with a few exceptions e.g. truly hygeinic macros, full homoiconicity)
-   Decent package manager, but among the best available because (with the exception of npm, and
    possibly lein & cpan) they're total crap in most languages
-   fairly creative community
-   fantastic string processing & regular expressions inbuilt, beating even Perl (and rendering
    Perl obsolete)
*   runs most places, even the browser to some extent through transpiling
*   Startup time

###Cons
-   SLOW SLOW SLOW
				-   ...but usually fast enough
-   the aforementioned minor limitations on expressiveness are annoying if you want these features
		-   I basically never do
-   community way too centred around Rails, which pigeonholes it a bit (if you're doing Rails this
    is not a negative)
    -   the community is very creative regardless

Javascript
==========
###Pros
*   Runs LITERALLY everywhere that doesn't require a highly specialized runtime
		*   the only language that runs in the browser without transpiling, automatically making it
		    run in mountains of places nothing else can.
		*   iniitially almost a con, but with NodeJS, Rhino, PhantomJS, React Native, Cordova, etc. it
		    now has access to all the common (and many not-so-common!) execution environments available
		    to other languages
*   Flexible & powerful: there's virtually no programming construct that can't be implemented in JS
*   wealth of existing libraries and modules
*   fantastic package manager: npm
*   helpful, friendly, and extremely creative community
*   Fast - arguably the fastest scripting language
*   Friendly to guest languages
*   Startup time

###Cons
*   pisspoor standard library
		*   (fully alleviated by using jQuery and lodash) 
*   no module system natively
		*   (fully alleviated with a great module system in ECMA6/7, & bolted on systems like CommonJS
				which are possible because the language is so insanely flexible) 
*   lots of syntactic warts - a linter is always required
		*   (this is not a major issue, and some of this encourages better practices anyway)

Java
----
###Pros
*   runs most places...except the browser (which it's so garbage for that I don't even consider
    anything it does there to qualify as "running") & iOS.
*   takes "batteries included" to a whole other level - built-in & standard libraries so
    exhaustive that packages are mostly only needed for very specialized tasks
*   Excellent IDEs and development tooling
*   Very fast
*   The JVM is the creme de la creme of VMs - highly optimized and fast, runs everywhere, and very
    friendly to guest languages
*   ubiquitous, so almost everything can interface with it, and lots of help available for issues

###Cons
*   really inflexible & rigid. absolutely awful for metaprogramming, and a nightmare as soon as you
    need a construct the language doesn't have
    *   these situations require the use of overconvoluted design patterns as workarounds
*   verbose and ceremony-heavy
*   total overreliance on class-based object-orientation, to the point of shoehorning things into
    it that that make no absolutely sense as (class-instantiated) objects and require bizarre
    abstractions to implement (true story: AbstractRunnableStreamBuilderFactoryFactory), making
    understanding difficult
*   startup time.
    *   (a bit unfair since this is a semi-compiled language)


Databases
=========

Postgres
--------

