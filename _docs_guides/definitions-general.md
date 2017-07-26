Levels of beta:
*   internal private: Marlene, Chandhi
*   internal public: direct invites of select outsiders, inclusion on lists
*   external public: actual pushes into the app


Definitions - general
=====================

####################################################################################################
# 0 ###################################################################################
@### 0x-prefixed number e.g. 0x123, 0x1A4, 0xA2F
*    Hexadecimal numbers. The 0x simply serves as a marker to inform the compiler that it's
     dealing with a hexadecimal number
     *   In many cases there's otherwise no way to know which type of number is being used.
         E.g. 123 is a valid number in both decimal and hexadecimal form, but the number 123 in
         hexadecimal is equivalent to the number 291 in binary.

# A ###################################################################################
@### Active record pattern (ActiveRecord) ###@
*   An ORM-related architectural pattern for storing relational db in objects
*   each class in ActiveRecord is a table schema, and each instance is a row in that table. When
*   the interface of an object conforming to this pattern would include functions such as Insert,
    Update, and Delete (or Insert and Update could be merged into a single Save function), plus
    properties that correspond directly to the column in the underlying database table.
*   Variant form: when data is changed in one of the object instances, it immediately triggers a
    save in the db. Often a bad idea since this can result in piles of tiny expensive updates.
*   Side note: when data has been changed on the object but not saved in the db, the object is
    said to be 'dirty'

*   Example (in Rubyish pseudocode), where User is an ActiveRecord object:
        user = User.new
        user.username = 'meeka'
        user.save

*   JS-ish Example:
        const user = new User();
        user.username = 'meeka';
        user.save();

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

# C ###################################################################################
@### Cipher Block Chaining (CBC) ###@
*   mode of operation for block ciphers
*   each block of plaintext is XORed with the previous ciphertext block before being encrypted
    *   each ciphertext block depends on all plaintext blocks processed up to that point
    *   To make each message unique, an initialization vector is used in the first block

@### Clock (CPU) ###@
*   Essentially a pulser that "beats" at a fixed frequency (measured in Hz)
    *   This fixed frequency is known as the clock speed
*   Used to synchronize execution of instructions
    *   The CPU performs one operation (i.e. follows one instruction) per pulse

@### Closure table (database) ###@
*   Method of handling tree data in SQL
*   See https://www.slideshare.net/billkarwin/models-for-hierarchical-data
*   Have a table mapping ancestors and descendants.

EXAMPLE
*   This data tree:
        1
      /  \
    2     4
    |   /   \
    3  5     6
             |
             7

*   ...becomes this table:

        -------------------------
        | ancestor | descendant |          .          .            .
        -------------------------          .          .            .
        |    1     |     1      |          |    3     |     3      |
        |    1     |     2      |          |    4     |     4      |
        |    1     |     3      |          |    4     |     5      |
        |    1     |     4      |          |    4     |     6      |
        |    1     |     5      |          |    4     |     7      |
        |    1     |     6      |          |    5     |     5      |
        |    1     |     7      |          |    6     |     6      |
        |    2     |     2      |          |    6     |     7      |
        |    2     |     3      |          |    7     |     7      |
        .          .            .          -------------------------        


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
@### Data access object (DAO) ###@
*   object in your data layer responsible for persisting a separate entity in your domain
*   provides an abstract interface to some type of database or other persistence mechanism. By
    mapping application calls to the persistence layer, the DAO provides some specific data
    operations without exposing details of the database.
    *   similar to ActiveRecord, but not identical
        *   although this is debatable, because ActiveRecord objects arguably expose details of the
            database (i.e. each class in ActiveRecord is a table schema, and each instance is a row
            in that table, which one could argue === database detail exposure)

@### Data mapper (DataMapper) pattern ###@
*   ORM pattern (contrast with Active record pattern)
*   Data Mapper objects are plain objects with no knowledge of the database or how
    they're stored - i.e. they're just data
*   Data is persisted to the database using an entity manager
*   Example:
        const user = new User();
        user.username = 'meeka';
        EntityManager.persist(user);

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

@### Dereference ###@
*   Dereferencing a pointer means getting the value that is stored in the memory location pointed by the pointer.
*   In other words, it means reading the value being referenced. This resolves the pointer to
    instead be the actual value thus 'de-referencing' (since it's not longer a reference but an actual value).
*   In MobX:
    *   "reading" is dereferencing an object's property, which can be done through "dotting into" it (eg. user.name) or using bracket notation (eg. user['name'])
        *   This is largely analogous to what is done when you de-reference in C, because in MobX, your dereferencing means you're turning your "named pointer" to a data value (aka variable) into an actual value.

@### Directives ###@
*   An instruction solely for an interpreter, compiler, or assembler
*   i.e. it doesn't eventually translate to machine code, it instead modifies the behaviour
    of the interpreter, compiler, or assembler in some way
*   Example: Javascript's 'use strict'; directive restricts what features are allowed in the code.

@### Distributed lock manager ###@
*   purpose of a lock: ensure that among several nodes that might try to do the same 
    piece of work, only 1 actually does it. 2 main reasons we care about this:
    1.  efficiency: saves you from unnecessarily doing the same work twice;
    2.  correctness: stops concurrent processes from stepping on each others’ toes & 
        messing up the state of your system;
*   lock managers: used by OSes to organize and serialize access to resources (?)
*   distributed lock manager: lock manager that runs in every machine in a cluster,
    with an identical copy of a cluster-wide lock db
*   provides apps that are distributed across a cluster on multiple machines with a 
    way to sync their access of shared resources
*   can be done with Redis via the Redlock algorithm (but don't, it's slow & unsafe)

# E ###################################################################################
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

# F ###################################################################################
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

@### FOSS ###@
*   Free and open-source

# G ###################################################################################
@### gcc [COMPILER] ###@
*   GNU Compiler Collection
    *    integrated distribution of compilers for several major programming languages
*   allows you to compile:
    *   C
    *   C++
    *   Objective-C
    *   Fortran
    *   Ada
    *   Go
*   also provides front ends and libraries for each aforementioned language
*   originally the compiler for the GNU operating system
*   gcc front ends: the part of a compiler that is specific to a particular language
*   gcc back ends: the part that generates machine code for various processors

# H ###################################################################################
@### Health check URL ###@
*   Application health check URL is polled by a monitoring service on a given interval
*   expected to return a "200 OK" response - if it does, the service knows the app is up


@### Heap (low-level programming) ###@
*   stores reference type objects like strings or objects
    *   also stores the references themselves, as well as the data being referenced
*   all currently accessible data is connected in some way (by any number of connections) to the 'root'
    *   root ━▷ Obj1 ━▷ Obj4 ━▷ Obj5
        ┃ ┃
        ▽  `━▷ Obj3
       Obj2

*   objects on the heap can reference other objects on the heap
    *   some objects only connect to the 'root' via their connection to another object
        *   root ━▷ Object_A ━▷ Object_B
            *   Object_B only connects to the root via its connection to Object_A

*   Actions that place items on the heap:
    *   const someInstance = new SomePrototype
    *   AdminUser.prototype = Object.create(User.prototype), returning an object literal from a function,


@### Helper (class) [OOP] [FP] ###@
*   a helper class is used internally to perform low-level "boilerplate" work with no specific
    business domain meaning
    *   they tend to be hidden from the client
    *   Example: 
*   a helper function performs part of the computation of another function
    *   used to make your programs easier to read and maintain by:
        1)  giving descriptive names to computations; and
        2)  letting you reuse computations, thus reducing repeated code
    *   nice example here:
        *   https://web.cs.wpi.edu/~cs1101/a05/Docs/creating-helpers.html


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


@### HTTP Live Streaming (HLS) ###@
*   emerging standard in adaptive bitrate video
*   Adaptive bitrate video delivery is a combination of server and client software that detects a client's bandwidth capacity and adjusts the quality of the video stream between multiple bitrates and/or resolutions

@### HTTP Strict Transport Security (HSTS) ###@
Web security policy mechanism to help protect sites against protocol downgrade attacks & cookie hijacking
*   protocol downgrade attack:
    *   transparently converts a secure HTTPS connection into a plain HTTP connection
    *   user can see that it's HTTP, but has no way of knowing that it should be HTTPS
        *   many sites don't use HTTPS, so it's reasonable to think nothing is wrong despite seeing HTTP rather than https
    *   sslstrip tool automates the attack

HSTS Policy
    *   communicated by server to user agent via HTTP response header field "Strict-Transport-Security"
    *   specifies a period of time during which the user agent should only access the server in a secure fashion

# I ###################################################################################
@### Idempotence ###@
*    an action that is idempotent should deliver identical results if the action is repeated.
*    GET, PUT, and DELETE requests should be idempotent. POST requests, however, needn't be

@### Index (DB) (Relational DB) (RDB) (SQL###@
*   An index is a copy of selected columns of data from a table that can be searched very efficiently.
*   Includes low-level disk block address or direct link to full row of data it was copied from
*   Put another way: data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index data structure.
    *   used to quickly locate data without having to search every row in a database table every time a database table is accessed
    *   can be created using one or more columns of a database table, providing the basis for both rapid random lookups and efficient access of ordered records

# J ###################################################################################
@### JWK (JSON Web Key) [AUTH] [JWT] ###@
*   JSON object that represents a cryptographic key
*   members of the object represent properties of the key, including its value
*   also contains members that are key type-specific

@### JWT (JSON Web Token) [AUTH] [JWT] ###@
*   [JWT spec](https://tools.ietf.org/html/rfc7519)
*   JOSE Header
    *   typ: Type header
    *   cty: Content type header
    *   alg: Algorithm
*   JWT "claims" aka properties:
    *   sub: Subject {optional}
        *   identifies the principal that is the subject of the JWT
        *   claims in a JWT are normally statements about the subject
        *   case-sensitive string containing a StringOrURI value
        *   must either be:
            *   scoped to be locally unique in the context of the issuer or;
            *   globally unique
    *   iss: Issuer {optional}
        *   identifies the principal that issued the JWT
    *   aud: Audience {optional}
        *   array of case-sensitive strings, each containing a StringOrURI value
        *   identifies the recipients that the JWT is intended for
        *   Each principal intended to process the JWT MUST identify itself with a 
            value in the audience claim
            *   JWT must be rejected otherwise
        *   very app-specific
    *   exp: Expiry
        *   In the form of a Unix timestamp
    *   iat: Issuedat"
        *   Again, as a Unix timestamp
    *   jti: JWT ID {optional}
        *   provides a unique identifier for the JWT
        *   can be used to prevent the JWT from being replayed
        *   MUST be assigned in a manner that ensures there's a negligible probability 
            that the same val will be accidentally assigned to a different data object



# K ###################################################################################
@### "kid" (Key ID) parameter [AUTH] [JWT] ###@
*   aspect of JSON web tokens
*   used to choose among a set of keys in a JWK set during key rollover.
*   When "kid" values are used within a JWK Set, different keys within the JWK Set
    SHOULD use distinct "kid" values
*   When used with JWS or JWE, used to match a JWS or JWE "kid" Header Parameter value


# L ###################################################################################
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

@### Mode of operation ###@
*   algorithm that uses a block cipher to provide an information service such as confidentiality or authenticity
    *   block cipher:  deterministic algorithm operating on fixed-length groups of bits, called blocks, with an unvarying transformation that is specified by a symmetric key
*   Example: a block cipher encryption algorithm might take a 128-bit block of plaintext as input, & output a corresponding 128-bit block of ciphertext. 

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

# N ####################################################################################
@### NAT (Network Address Translation) ###@
*   process where a network device, usually a firewall, assigns a public address to a computer or group of computers in a private network
    *   main use: limit the number of public IP addresses an organization must use
*   method of remapping an IP address space into another by modifying network address info in IP datagram packet headers while they're in transit across a traffic routing device
*   most common form: large private network using addresses in a private range
    *   Routers inside the network can route traffic between private addresses with no trouble. 
    *   However, to access resources outside the network (e.g. Internet), these computers need a public address for responses to their requests to return to them.
    *   The resource on the Internet thinks it is sending data to the firewall address
        *   The firewall then routes the requested data to the specific user that requested it, once it arrives

@### NTP (Network Time Protocol) ###@
*   networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks
*   intended to synchronize all participating computers to within a few milliseconds of Coordinated Universal Time (UTC)
*   can usually maintain time to within tens of milliseconds over the public Internet, and can achieve better than one millisecond accuracy in local area networks under ideal conditions

@### Nominal typing / Nominal type system ###@
*   type system where compatibility and equivalence of data types is determined by explicit
    declarations and/or the name of the types
*   used to determine if types are equivalent, as well as if a type is a subtype of another
*   in nominal typing, two variables are type-compatible if and only if their declarations name the
    same type
*   often a component of a nominal type system: nominal subtyping
    *   ...meaning that one type is a subtype of another if and only if it's explicitly declared
        to be so in its definition
*   Note: Typescript does not introduce this kind of type system.

@### Nonce ###@
*   arbitrary number that may only be used once
*   often a random or pseudo-random number
*   often issued in an auth protocol to ensure old communications can't be reused in replay attacks

# O ###################################################################################
@### Operand ###@
*   the quantity on which an operation is to be done
*   Expressions (comprised of operators and operands) can themselves be operands
*   Example:
       4 + 8
       *   + is the operation
       *   4 and 8 are the operands
*   Nested example:
       (9 + 4) ** 6
       ||== operands:
       ||     |-- (9 - 4)
       ||     |   ||== operands:
       ||     |   ||    |-- 9
       ||     |   ||    \-- 4
       ||     |   ||
       ||     |   ||== operation:
       ||     |         \-- +
       ||     \-- 6
       ||
       ||== operation:
             \-- **

# P ###################################################################################
@### Pointers [C] [Memory management] [low-level programming] ###@
*   variable whose value is the address of another variable
*   you must declare a pointer before using it to store any variable address
*   Syntax:     type *var-name;
*   Examples:
        int    *ip;    /* pointer to an integer */
        char   *ch     /* pointer to a character */
        double *dp;    /* pointer to a double */
*   actual data type of the value of pointers is always the same: a long
    hexadecimal number that represents a memory address
*   Store the address of a regular variable in a pointer variable like this:
        ip = &var
    *   e.g.:
            int  numVar = 20;
            int  *pointerTonumVar;
            pointerTonumVar = &numVar

@### Polymorphic type ###@
*   A type that can take on different forms
*   Most common form: generic type
    *   e.g. (in Typescript) the type "T" below is a polymorphic type:

    function identity<T>(arg: T): T {
        return arg;
    }

@### Punycode ###@
*   way to represent International Domain Names with the limited character set (A-Z, 0-9) supported by the domain name system
*   e.g. "münich" would be encoded as "mnich-kva"
*   JS implementation: https://github.com/bestiejs/punycode.js

# Q ###################################################################################
@### Quine ###@
*   non-empty program that takes no input & outputs a copy of its own source code

# R ###################################################################################
@### Redis [DB] ###@
*   Great session store database
*   stores data mainly key-value pairs, but also as:
    *   hashmaps ( hashname => { hashkey : value })
    *   sets (setName => { val1, val2, val3, val4... })
        *   no order, all values unique
        *   very fast to search and get from
    *   lists (listName => (val1, val2, val3, val4...))
        *   ordered, not all values necessarily unique
        *   slower than sets for searching through
*   best use-case: situations where you want to share some transient, approximate, 
    fast-changing data between servers, and where it’s not a big deal if you
    occasionally lose that data for whatever reason

@### Register (CPU) [[noun - as in 'a register' not 'to register']] ###@
*   Special storage locations in the CPU for holding small amounts of data
*   Data in registers can be acted on ultra-rapidly, but CPUs have a very limited # of registers
    *   thus only currently used data should be placed in registers

@### Relationship: One-to-one (SQL / DBs) ###@
*   relationship between 2 entities A and B in which an element of A can only be linked to one element of B, and vice-versa
        A<--->B
*   example: husband-to-wife (in mainstream Western culture)

@### Relationship: One-to-many (SQL / DBs) ###@
*   relationship between 2 entities (see also entity–relationship model) A and B in which an element of A may be linked to many elements of B, but a member of B is linked to only one element of A
        A---->B
        |---->B
        |---->B
*   Example: mother-to-children.
    *   one mother can have many children, but a child can only have one biological mother


@### Relationship: Many-to-many (SQL / DBs) ###@
*    relationship between 2 entities A and B in which A may may contain a parent instance for which there are many children in B and vice versa
        B      A------B  B-------A
        |      |      | /
        A------B------A----B-----A
        |              
        |------B------A----B
        |           / | \
        |------B   B  B  B

*   Example: authors-to-books
    *   an author can write many books. Also, a book can have many authors


@### Relationship: One-to-One (SQL / DBs) ###@


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

@### RTMP - Real-Time Messaging Protocol ###@
*   Multimedia streaming and remote procedure call protocol primarily used in Adobe Flash
*   Or more specifically, a protocol for streaming audio, video and data over the Internet
    *   namely between a Flash player and a server
    *   uses port 1935

@### RTT - Round-trip delay time ###@
How long it takes for a client to receive a resource from a network called
*   measured from the moment it sends a request to the moment the requested resource returns

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
*   A service class/interface provides a way for a client to interact with some functionality in an
    app. This is typically public, with some business meaning. E.g. a TicketingService interface
    might allow you to buyTicket, sellTicket, etc.
*   Services describe system interactions.
    *   ...especially those involving more than one model
*   Example: "Forgot password" functionality. Involves a User model encapsulating a password, which
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

@### SOLID (aka SOLID principles) [OOP] ###@
*   Single responsibility principle: a class should have only a single responsibility
*   Open/Closed principle: entities should be open for extension, but closed for modification
*   Liskov substitution principle: objects in a program should be replaceable with instances of
    their subtypes without altering the correctness of that program
*   Interface segregation principle: many client-specific interfaces are better than one
    general-purpose interface
*   Dependency inversion principle: One should depend upon Abstractions, not 'concretions'

@### Single responsibility principle (SRP) [OOP] ###@
*   states that every module or class should have responsibility over a single part of the 
    functionality provided by a piece of software, and that responsibility should be entirely
    encapsulated by the class.
*   Put another way: "A class should have only one reason to change".
    *   A responsiblity is a "reason to change"
*   This reduces "brittleness" and minimizes the amount of an application that is exposed to
    potentially "breaking" when a code change is made.
Example
*   consider a module that compiles and prints a report, and imagine that there are only 2 reasons why it might need to change:
    1)  the formatting of the report changes; or
    2)  the content of the report changes
*   The reasons for each chagne are different: the first is substantive, the second is cosmetic.
    *   The SRP states that they are thus 2 different responsibilities, and should be in separate classes or modules.
        *   E.g. the first in a Formatter module, the second in a ContentProvider module
            *   (Note that in practice you would probably split it up even further, with different
                parts of the content handled by different modules, and the ContentProvider composed
                of smaller modules implementing sub-components of the content generation &
                acquisition)
    *   The reasons why each would change are distinct. E.g. if the marketing department puts out
        a new set of standard company colours, you would have to change the Formatter, but not the
        ContentProvider. On the flipside, if the business development department requested that a
        new set of analytics not previously being displayed should be included on the report, you
        would have to change the ContentProvider, but not the Formatter.

@### Stack (Docker) ###@
*   set of services that make up an application
*   in a stackfile (equivalent to a docker compose file) you can define a bunch of diff services 
    to all boot and deploy at once it is 

@### stdio (aka STDIO, aka std/IO, aka stdIO, aka std/io) ###@
*   "stdio" stands for "standard input output".

@### strcpy ###@
*   common C function used to copy a string from a given source to a given destination
    *   returns a pointer to the destination string.
*   really only needed if you actually care where things are stored in memory
    *   ...so really only needed in C

@### Stored procedure ###@
*   subroutine available to applications that access a relational database management system
*   stored in the database data dictionary
*   typical uses: data validation, access control mechanisms

@### Structural typing / Structural type system [OOP] [TYPE_SYS] ###@
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

@### Subnet ###@
*   short for 'subnetwork'
*   logical subdivision of an IP network
    *   identifiably separate part of the network
    *   may represent all the machines at 1 geographic location, in 1 building, or on the same LAN
    *   lets a whole organization be connected to the internet w/ a single shared network address
*   dividing a network into 2 or more networks is called subnetting

@### SUID ###@
*   Set owner User ID up on execution
*   special type of file permissions given to a file
*   Normally in Unix when a program runs, it inherits access permissions from the logged in user
*   Avoid in script files
*   Example:
        chmod u+s file1.txt


# T ###################################################################################
@### Testing: black-box testing ###@
*   one of 3 main testing "methods" (black-box testing, white-box testing, grey-box testing)
*   testing without having any knowledge of the interior workings of the application
*   tester is oblivious to the system architecture and does not have access to the source code
*   while performing a black-box test, a tester interacts with the system's UI by providing inputs
    and examining outputs without knowing how and where the inputs are worked on
*   Contrast:
    *   white-box testing: a detailed investigation of internal logic & structure of an app's code
    *   grey-box testing: test an app with limited knowledge (but not none) of its internal workings

@### TLS (Transport Layer Security) ###@
*   cryptographic protocols that provide communications security over a network
*   aims primarily to provide privacy and data integrity between two communicating applications
*   properties of a TLS connection:
    *   private/secure due to symmetric cryptography
    *   identity of the communicating parties can be authenticated using public-key cryptography
    *   ensures integrity because each message transmitted includes a message integrity check using a message authentication code to prevent undetected loss or alteration of the data

@### Tokens [AUTH] ###@
*   specially crafted pieces of data that carry just enough info to either:
    *   authorize the user to perform an action, or
    *   allow a client to get additional info about the auth process to then complete it
*   i.e. pieces of info that allow auth to be performed
*   important related specs:
    *   JWS (JSON Web Signature): allows the token to be validated so it cannot be tampered with;
    *   JWE (JSON Web Encryption): allows the token to be encrypted so it it's opaque to the client

*   Two major types of tokens:

    1.  access tokens: carry the necessary info to access a resource directly
        *   when a client passes an access token to a server managing a resource, that server can
            use the info in the token to decide if the client is authorized or not.
        *   Access tokens usually have an expiration date and are short-lived
        *   direct authorization checks are usually possible against an access token
            (no server communication required)
        *   

    2.  Refresh tokens: carry the info needed to get a new access token.
        *   when an access token is required to access a specific resource, a client may use a 
            refresh token to get a new access token issued by the authentication server
        *   common use cases:
            *   getting new access tokens after old ones have expired
            *   getting access to a new resource for the first time
        *   can also expire, but tend to live a long time
        *   How does this help?
            *   refresh tokens can be blacklisted by the authorization server
            *   refresh tokens tend to have extremely intensive storage requirements
            *   https://cdn.auth0.com/blog/refresh-token/diag2.png

# U ###################################################################################
@### UDP (User Datagram Protocol) ###@
*   alternative communications protocol to Transmission Control Protocol (TCP)
*   used mainly for establishing low-latency & loss tolerating connections between Internet apps
*   core member of the Internet protocol suite


# V ###################################################################################
@### V8 ###@
*   JS engine that powers NodeJS, Chrome, Electron, MongoDB, Opera, and Couchbase.
*   Actual line-by-line running of the JS code.
*   Contains no Web APIs, NodeJS modules, etc.

@### Volume (Docker) ###@
*   something that gets mounted into a container
*   e.g. if using Mongo, you define a volume called "Mongo data", whioh persists between launches
    of the container.
    *   you could also mount a directory from your host into a container - this is also a volume
*   something mountable is a volume

@### VPC (Virtual private cloud) ###@
*   virtual network in your own isolated section of a cloud platform (such as AWS)

@### VPS (Virtual private server) ###@
*   virtual machine sold as a service by an Internet hosting service
*   runs its own copy of an OS
*   may give superuser-level access to the installed OS
    *   allows installing almost any software that runs on that OS
*   E.g. Amazon Lightsail

# W ###################################################################################
# X ###################################################################################
# Y ###################################################################################
# Z ###################################################################################
####################################################################################################


############################ HTTP REQUESTS ################################
@### PUT requests ###@        AND        @### POST requests ###@
*   ...vs. POST requests: A POST indicates what location on the server will handle the process, but
    doesn’t necessarily map to any one particular resource.
    *   A PUT request, by contrast, should refer to one (and only one) resource in particular.
*   A POST indicates what location on the server will handle the process, but doesn’t
    necessarily map to any one particular resource.
    *   A PUT request, by contrast, should refer to one (and only one) resource in particular.
*  PUT requests are Idempotent, while POST requests are not
