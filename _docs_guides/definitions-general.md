@### Associations (Rails) ###@
*   connection between two Active Record models
*   Makes common operations faster and easier in code
*   example: has_many :books, dependent: :destroy

#######################################################################################
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
#######################################################################################

@### Database key ###@
*   column name

@### Database Integrity ###@
*   guarantees that database is perfect and complete
*   Integrity types:
    *   Referential Integrity:   requires every value of 1 column of a table to exist as a value of
    *                            another column in a different (or the same) table   

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

@### Idempotence ###@
*    an action that is idempotent should deliver identical results if the action is repeated.
*    GET, PUT, and DELETE requests should be idempotent. POST requests, however, needn't be

@### Ladda ###@
*   A UI concept which merges loading indicators into the action that invoked them.
*   isight, for example, uses it in via the jQuery.ladda library

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
#######################################################################################

@### Resource (Rails) ###@
*   see Scaffold (Rails)

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
#######################################################################################

@### Secret (auth) ###@
*   connect auth in particular, but also encryption in general 
*   Essentially salt for the hash

@### Serialization ###@
*   converting an object into a stream of bytes in order to store the object or transmit
    it to memory, a database, or a file. Its main purpose is to save the state of an object
    in order to be able to recreate it when needed. The reverse process is called deserialization.

@### Stored procedure ###@
*   subroutine available to applications that access a relational database management system
*   stored in the database data dictionary
*   typical uses: data validation, access control mechanisms

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

