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

