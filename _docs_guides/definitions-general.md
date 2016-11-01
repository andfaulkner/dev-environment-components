@### 0x-prefixed number e.g. 0x123, 0x1A4, 0xA2F
*    Hexadecimal numbers. The 0x simply serves as a marker to inform the compiler that it's
     dealing with a hexadecimal number
     *   In many cases there's otherwise no way to know which type of number is being used.
         E.g. 123 is a valid number in both decimal and hexadecimal form, but the number 123 in
         hexadecimal is equivalent to the number 291 in binary.

@### Array-like objects / Array-Like values (Javascript) ###@
*   An array-like object / value is a JS object or value that looks like an array, but isn't.
*   More specifically, this means it has a length property & indexed access, but lacks the
    standard array methods 
*   Many examples exist in the core Javascript language and standard APIs e.g. the following are
    array-like objects or array-like values:
    *   the special arguments object automatically created in every function's scope
    *   Browser DOM Node lists (returned by e.g. document.getElementsBy* functions)
    *   Javascript strings
*   This is a major source of confusion, and it causes a lot of bugs.
*   Most common solution: convert it to an actual array. In ES6 this can be done with Array.from().

@### Associations (Rails) ###@
*   connection between two Active Record models
*   Makes common operations faster and easier in code
*   example: has_many :books, dependent: :destroy

@### Autoredeploy (Docker/Dockerhub/Docker-cloud) ###@
*   If a service that uses an image stored in Docker Hub is set to "autoredeploy", it will
    automatically deploy again whenever a new image is pushed or built to Docker Hub
*   The concept is the same everywhere: automatically deploy again whenever the code changes

@### Clock (CPU) ###@
*   Essentially a pulser that "beats" at a fixed frequency (measured in Hz)
    *   This fixed frequency is known as the clock speed
*   Used to synchronize execution of instructions
    *   The CPU performs one operation (i.e. follows one instruction) per pulse

# C ###################################################################################
@### Constraints (database) ###@
*   conditions forced on the columns of the (db) table to meet the data integrity
*   types of constraints:
    *   NOT NULL:        forces the column to have non-null value
    *   UNIQUE:          forces the column to have a unique value for each row
    *   PRIMARY KEY: forces column to have unique value w/ which we can uniquely determine each row
    *   FOREIGN KEY: helps to map two or more tables in the database. [See "Foreign key" definition]
    *   DEFAULT:     specifies default value for a column when no value is given
                      CREATE TABLE STUDENT (STUDENT_ID NUMBER (10) NOT NULL, 
                                            ..., 
                                            CREATED_DATE DATE DEFAULT SYSDATE)

@### Container Component and Presentational Component (React + Redux) ###@
*   aka smart and dumb components
*   a container component is just a React component that uses store.subscribe() to read a part of
    the redux state tree, and supply props to the presentational component it renders.
*   can be generated with Redux's connect() function, which also benefits performance
*   see http://redux.js.org/docs/basics/UsageWithReact.html
*   presentational component: purely presentational. They accept props and return a React component.
    *   often stateless functional components
    *   example presentational component:

        const Post = ({ title, content }) => (
            <div>
                <h1>{title}</h1>
                <div>{content}</div>
            </div>
        );

# D ###################################################################################
@### Database key ###@
*   column name

@### Database Integrity ###@
*   guarantees that database is perfect and complete
*   Integrity types:
    *   Referential Integrity:   requires every value of 1 column of a table to exist as a value of
    *                            another column in a different (or the same) table   

@### Data Structures ###@
*   way of organizing data in a computer so that it can be used efficiently
*   scaffolding for data to be stored in ways that allow searches, inserts, removals,
    and updates to take place quickly and dynamically
*   common data structures:
        Stacks
        Queues
        Linked Lists
        Sets
        Trees
        Graphs
        Hash Tables // think JS objects
        Doubly-linked lists
        b-trees
        priority queues

@### Directives ###@
*   An instruction solely for an interpreter, compiler, or assembler
*   i.e. it doesn't eventually translate to machine code, it instead modifies the behaviour
    of the interpreter, compiler, or assembler in some way
*   Example: Javascript's 'use strict'; directive restricts what features are allowed in the code.

#######################################################################################
@### Etag ###@
*   opaque identifier assigned by a web server to a specific version of a resource found at
		a URL. If the resource representation at that URL ever changes, a new and different ETag
		is assigned. Used in this manner ETags are similar to fingerprints, and they can be
		quickly compared to determine whether two representations of a resource are the same.

@### ER-model ###@
*   entity–relationship model
*   defines the conceptual view of a database
*   a way of graphically representing the logical relationships of entities (or objects) in order to create a database
*   graphical representation of entities and their relationships to each other
*   http://www.webopedia.com/TERM/E/entity_relationship_diagram.html

#######################################################################################
@### Foreign key ###@
*   a type of database constraint
*   helps to map two or more tables in the database
*   enforces parent-child relationship in the database
*   Foreign key in the child table is the column which is a primary key in the parent table
*   e.g. each employee works for some department
        *   we need to map employee and department tables
        *   to do this, we must have DEPARMENT_ID column of DEPARTMENT table in EMPLOYEE table
        *   i.e. DEPARTMENT table has column DEPARTMENT_ID. Here it is the Primary key.
                   EMPLOYEE table has column DEPARTMENT_ID. Here it is the Foreign key.
        *   Parent table: DEPARTMENT
        *   Child table:  EMPLOYEE

#######################################################################################
@### Hertz ###@
*    1Hz is one cycle per second
*    Often used to measure CPU 'clock rate' - i.e. operations per second
*    1 cycle is essential one operation
     *    Thus Hz gives you the number of operations the CPU can do per second
*    1kHz is ~1000 cycles per second
*    1MHz is ~1,000,000 cycles per second
*    1GHz is ~1,000,000,000 cycles per second

@### Higher-order component ###@
*   Function that takes a component and returns a component
    *   Can take arguments as well
*   How they work: "secretly" wrapping the input component inside a container component



# I ###################################################################################
@### Idempotence ###@
*    an action that is idempotent should deliver identical results if the action is repeated.
*    GET, PUT, and DELETE requests should be idempotent. POST requests, however, needn't be

@### Ladda ###@
*   A UI concept which merges loading indicators into the action that invoked them.
*   isight, for example, uses it in via the jQuery.ladda library

@### Lexical Environment ###@
*   a specification type used to define the association of identifiers to
    specific vars & fns based on the lexical nesting structure of the code.
*   consists of an Environment Record and a possibly null reference to an outer Lexical Environment.
*   sort of like scope, but not precisely the same

# M ####################################################################################
@### Memoization ###@
*   technique to increase a function's performance by caching its previously computed results
*   Each time a memoized function is called, its parameters are used to index the cache. If the
    data is present, then it can be returned, without executing the entire function.
    *   However, if the data is not cached, then the function is executed, and the result is added
        to the cache.
*   Basically exists to prevent re-computation

@### Mutex ###@
*	program object that allows multiple program threads to share the same resource, such as file
	access, but not simultaneously. When a program is started, a mutex is created with a unique name

*   Perfect answer on SO:
	When I am having a big heated discussion at work, I use a rubber chicken which I keep in my
	desk for just such occasions. The person holding the chicken is the only person who is allowed
	to talk. If you don't hold the chicken you cannot speak. You can only indicate that you want
	the chicken and wait until you get it before you speak. Once you have finished speaking, you
	can hand the chicken back to the moderator who will hand it to the next person to speak. This
	ensures that people do not speak over each other, and also have their own space to talk.
	Replace Chicken with Mutex and person with thread and you basically have the concept of a mutex.
	Read this at office: http://stackoverflow.com/questions/34524/what-is-a-mutex

*   key point: a mutually exclusive flag. The flag gets set when the resource gets accessed
	by a thread, and unset when the thread stops accessing it. It is not possible to access the
	resource while the flag is set. The mutex is the flag.

@### Nominal typing / Nominal type system###@
*   type system where compatibility and equivalence of data types is determined by explicit
    declarations and/or the name of the types
*   used to determine if types are equivalent, as well as if a type is a subtype of another
*   in nominal typing, two variables are type-compatible if and only if their declarations name the
    same type
*   often a component of a nominal type system: nominal subtyping
    *   ...meaning that one type is a subtype of another if and only if it's explicitly declared
        to be so in its definition
*   Note: Typescript does not introduce this kind of type system.

#######################################################################################
@### Register (CPU) [[noun - as in 'a register' not 'to register']] ##@
*   Special storage locations in the CPU for holding small amounts of data
*   Data in registers can be acted on ultra-rapidly, but CPUs have a very limited # of registers
    *   thus only currently used data should be placed in registers

@### Resource (Rails) ###@
*   see Scaffold (Rails)

@### Resource (REST) ###@
*   main building blocks of REST architecture
*   anything that can be named. Examples:
    *   web page
    *   image
    *   person
    *   weather service report
    *   immunization record
*   defines:
    *   what the services are going to be about
    *   the type of information that is going to be transferred; and
    *   their related actions
*   Structure:
    *   Representations: any way of representing data (binary, JSON, XML, etc.). A single
                         resource can have multiple representations
    *   Identifier: URL that retrieves only 1 specific resource at any given time
        *   WARNING: something like /books/series/harry-potter/most-recent is not a valid
            identifier, because the most recent book will change if a new one is released.
            Thus, this path won't consistently return the same resource. Instead, we'd want
            something like this:
                /books/series/harry-potter/harry-potter-and-the-deathly-hollows
            Instead use query param for retrieving special values like "most recent". e.g.
                /books/series/harry-potter?limit=1&sort=created_at 
    *   Metadata: Content-type, last-modified time, etc.
    *   Control data: Is-modifiable-since, cache-control

# S ###################################################################################
@### Scaffold (Rails) ###@
*   Model:     rails g scaffold Test name:text
    -   model file test.rb in models dir
    -   migration file timestamp_create_tests.rb in db/migrate
    -   a model test (potentially) in your spec folder
*   Resource:   rails g resource Test name:text
    -   model test.rb in models dir
    -   migration file timestamp_create_tests.rb in db/migrate
    -   a model test (potentially) in your spec folder
    -   tests_controller.rb in controllers dir - empty
    -   controller test in spec folder (potentially)
    -   resources :tests in routes.rb file
*   Scaffolds:   rails g scaffold Test name:text
    -   model test.rb in models dir
    -   migration file timestamp_create_tests.rb in db/migrate
    -   a model test (potentially) in your spec folder
    -   tests_controller.rb in controllers dir, with 7 public and 2 private CRUD methods.
    -   7 view files (1/pub method) in views dir:  (a) _form.html.erb, (b) edit.html.erb, (e) new.html.erb,
    -   (c) index.html.erb, (d) index.json.jbuilder, (f) show.html.erb and (g) show.json.jbuilder 
    -   resources :tests in routes.rb file
    -   controller test in spec folder (potentially)
    -   resources :tests in routes.rb file

@### Secret (auth) ###@
*   connect auth in particular, but also encryption in general 
*   Essentially salt for the hash

@### Serialization ###@
*   converting an object into a stream of bytes in order to store the object or transmit
    it to memory, a database, or a file. Its main purpose is to save the state of an object
    in order to be able to recreate it when needed. The reverse process is called deserialization.

@### Services (aka Service Objects) [Server-side. Rails, NodeJS] ###@
*   services describe system interactions.
    *   especially those involving more than one model
*   example: "Forgot password" functionality. Involves a User model encapsulating a password, which
    sends an email to reset it.
    *   In this scenario, the service is responsible for locating the user, sending the reset
        password email, and reporting back to the controller from which the request originated
*   Service objects implement individual services. e.g. in the example, there might be a service
    object called ForgottenPassword. This object is instantiated and called on by a controller
*   Most important: Service objects do one thing, and one thing only
*   Benefits:
    1)  Service objects show what an application actually does;
    2)  Controllers and models shrink, and also become much cleaner. This is important, because
        these tend to get very bloated and messy as an application grows
    3)  They are easy to test
    4)  They are extremely reusable: callable from anywhere, and almost completely uncoupled
        from models, controllers, routes, etc..  

@### SOLID (aka SOLID principles) [object-oriented design] ###@
*   Single responsibility principle: a class should have only a single responsibility
*   Open/Closed principle: entities should be open for extension, but closed for modification
*   Liskov substitution principle: objects in a program should be replaceable with instances of
    their subtypes without altering the correctness of that program
*   Interface segregation principle: many client-specific interfaces are better than one
    general-purpose interface
*   Dependency inversion principle: One should depend upon Abstractions, not 'concretions'

@### Stack (Docker) ###@
*   set of services that make up an application
*   in a stackfile (equivalent to a docker compose file) you can define a bunch of diff services 
    to all boot and deploy at once it is 

@### stdio (aka STDIO, aka std/IO, aka stdIO, aka std/io) ###@
*   "stdio" stands for "standard input output".

@### Stored procedure ###@
*   subroutine available to applications that access a relational database management system
*   stored in the database data dictionary
*   typical uses: data validation, access control mechanisms

@### Structural typing / Structural type system ###@
*   in structural type systems, compatibility and equivalence of types is determined by the type's
    actual structure or definition, rather than explicit type declarations
*   like most type systems, it's used to determine if types are equivalent and whether a type is
    a subtype of another.
*   in structual typing an element is considered to be compatible with another if, for each feature 
    within 2nd element's type, a corresponding & identical feature exists in 1st element's type.
    *   It thus has a lot in common with duck typing
*   permits creation of ad hoc types and protocols
*   permits creation of a type which is a supertype of an existing type, without modifying the 
    definition of the latter
*   used by e.g. Typescript, OCaml, C++ template functions, Haxe, Haskell, and parts of Go
*   contrast with nominal typing, where every type has to be explicity declared. Structural typing
    is significantly less verbose.
#######################################################################################

@### Testing: black-box testing ###@
*   one of 3 main testing "methods" (black-box testing, white-box testing, grey-box testing)
*   testing without having any knowledge of the interior workings of the application
*   tester is oblivious to the system architecture and does not have access to the source code
*   while performing a black-box test, a tester interacts with the system's UI by providing inputs
    and examining outputs without knowing how and where the inputs are worked on
*   Contrast:
    *   white-box testing: a detailed investigation of internal logic & structure of an app's code
    *   grey-box testing: test an app with limited knowledge (but not none) of its internal workings

############################ HTTP REQUESTS ################################
@### PUT requests ###@        AND        @### POST requests ###@
*   ...vs. POST requests: A POST indicates what location on the server will handle the process, but
    doesn’t necessarily map to any one particular resource.
    *   A PUT request, by contrast, should refer to one (and only one) resource in particular.
*   A POST indicates what location on the server will handle the process, but doesn’t
    necessarily map to any one particular resource.
    *   A PUT request, by contrast, should refer to one (and only one) resource in particular.
*  PUT requests are Idempotent, while POST requests are not
#######################################################################################
@### Volume (Docker) ###@
*   something that gets mounted into a container
*   e.g. if using Mongo, you define a volume called "Mongo data", whioh persists between launches
    of the container.
    *   you could also mount a directory from your host into a container - this is also a volume
*   something mountable is a volume

