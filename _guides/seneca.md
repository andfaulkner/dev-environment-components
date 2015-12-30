---------------------------------------------------------------------------
SENECA
======
---------------------------------------------------------------------------

DATA ENTITIES
=============

Data entity 'types'
-------------------
*   a data entity type is a Javascript object roughly corresponding to a single table in a database
*   each assignable property the data entity type has === a defined column of the table
*   the name of the data entity type === the name of the table
    *   'data entity types' thus do not need to be explicitly created - they're defined via tables 
        in the underlying store (e.g. postgres). i.e. the name of a 'data entity type' is the name
        of the table. Each table in the store automatically === its own data entity type.

Data entities (data entity instances)
-------------------------------------
*   a single 'data entity' is an 'instance' of a 'data entity type'. Each 'data entity' roughly
    corresponds to a row in the table corresponding to the 'data entity type'.
*   values given to assignable properties are the values that will populate the new row

###Construct a data entity
*   data entities are constructed with calls to seneca.make
*   example:

        var user_info = this.make('user_info');

        *   a data entity has now been made that ties to a table named user_info.
        *   the allowable properties are the columns already defined in the table in the
            underlying database store (e.g. postgres)
        *   a table named 'user_info' must already exist in the store, or this won't work

####Add data to a data entity
*   example:

        user_info.firstname = 'Meeka';
        user_info.lastname = 'Peeka-Faulkner';
        user_info.username = 'meekapeeka';
        user_info.email = 'meekapeeka@gmail.com';


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

NOTES
=====

*   plugin definition is synchronous

##Module this
*   this keyword in plugin definition file only intended to be used to call seneca.add via this.add
*   Actions needs {\[sic - needed?\]} for plugin initialization should happen in the init action

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Seneca API
==========
seneca.delegate {Function}
--------------------------
*   assigns "fixed arguments" to Seneca instance, returning a 'Seneca w/ fixedargs' Seneca object
*   example:

        var senecaWithFixedArgs = seneca.delegate({ foo: 'bar' });
        console.log(senecaWithFixedArgs.fixedargs.foo); //--> 'bar'

*   a way to attach arguments to the seneca instance, and pass them around so they're accessible
    to all plugins, actions, etc.
*   non-destructive: doesnt modify Seneca instance it was derived from (i.e. 'this' stays the same)
    *   also, newSenecaInstance.root will always return the top-level (pristine?) seneca object

###params:
*   {Object} newFixedArgs: properties in here get merged into seneca.fixedargs
        *   if newFixedArgs has a prop already in seneca's fixedargs, new val overwrites original

###returns:
*   {Object} Seneca obj w passed-in properties merged into fixedargs property (seneca.fixedargs)

seneca.parent {Function}
------------------------
*   Identical to seneca.prior. However, seneca.parent is deprecated.

seneca.root {Object}
--------------------
*   Seems to return the top-level seneca function
*   i.e. follows the prototype chain all the way up to the uppermost seneca
*   example:

        modifiedSenecaInstance.root.fixedargs; //--> {}

        *   modifiedSenecaInstance.root is the same as a newly required seneca instance
