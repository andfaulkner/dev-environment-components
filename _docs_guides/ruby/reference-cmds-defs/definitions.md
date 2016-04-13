----------------------------------------------------------------------------------------------
# DEFINITIONS
----------------------------------------------------------------------------------------------

Blocks
------
*   blocks are essentially unnamed methods
*   Often given to iterators such as collect
*   Akin to lambdas

Iterators
---------
*   commands such as collect / map, each, reduce / inject, and reject
*   they act once on each item in a collection given to them

Messages
--------
*   request sent from a sender object, to:
		*   run a message on the receiver object
		*   access a property on the receiver object

Methods
-------
*   subroutines. They are run when a message is received by another object that 
    requests that it be run
*   Results are returned to the sender object
*   They are essentially verbs

Names
-----
*   These provide access to objects 
*   Each object has a name (except for "primitive" objects...which are still objects: e.g. 5)
		*   You have no direct access to objects, the object's name is used to access it instead.

Database index (or just index)
------------------------------
*   used to quickly locate data without having to search every row in a database
    table every time the table is accessed
*   copy of select columns of data from a table that can be searched very efficiently
*   SQLite3 index:
				CREATE INDEX index_name ON table_name;
*   Postgres index:
				CREATE UNIQUE INDEX title_idx ON films (title);
						*   create a B-tree index on the column title in the table films
				CREATE INDEX ON films ((lower(title)));
						*    create index on expression lower(title) for efficient case-insensitive searches

Fixtures
--------
*   sample data for a test database
*   in rails, found in test/fixtures/model_names.yml 																			 [[PATH]]
		*   e.g. test/fixtures/users.yml
				*   an 's' is added to the end of the model name, and model name is changed to snake_case

Single responsibility principle
-------------------------------
*   every module or class should have responsibility over a single part of the functionality
	  provided by an app. That responsibility should be fully encapsulated by the class / module.
*   conceptualization: a 'responsibility' can be viewed as a "reason for the class to change"
		*   e.g. imagine a class defining reports. If both the content of the report & the format of
						 the report can be changed by this class, then it should be split into 2 classes
						 