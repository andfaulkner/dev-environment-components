IMPORTANT
=========

look at pg_dump for preserving db examples:
http://www.postgresql.org/docs/9.1/static/app-pgdump.html

- it actually generates commands for you!!!!!




---------------------------------------------------------------------------------------------------
POSTGRES DATABASE INFO
======================
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

EXAMPLE POSTGRES INITIALIZATION
===============================
sudo -u postgres psql postgres

Create a local db with user 'postgres'
======================================

    "initdb --pgdata=/home/andfaulkner/Projects/testbed/express-backbone-testbed-3/dbstore --username=postgres

or try...

    "initdb --pgdata=/home/andfaulkner/Projects/testbed/express-backbone-testbed-3/dbstore --use postgres --coordinator -D /home/andfaulkner/Projects/testbed/express-backbone-testbed-3/dbstore


Kill a running db
=================
example:  kill a db running in /home/andfaulkner/Projects/testbed/express-backbone-testbed-3/dbstore/

    PGDATA=/home/andfaulkner/Projects/testbed/express-backbone-testbed-3/dbstore/ pg_ctl stop


Open a db (named postgres, with user postgres)
============================================

    sudo -u postgres psql postgres


Terminal access to postgres
===========================
It always starts with one of these

*   pg_ctl
*   postmaster
*   psql
*   postgres

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

POSTGRES DATABASE SERVER CONNECTION INFO
========================================

Determine if postgres server is running
---------------------------------------
*   from CLI:

    netstat -na | grep postgres

    *   if there's a LISTENING row returned, the server is running


Determine postgres port
-----------------------
*   from CLI (again):

    netstat -na | grep postgres

    * #### in /.s.PGSQL.#### at the end of the rows returned gives you the port. Usually 5432.

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

DEFINTIONS
==========

Schema
------
> named collection of tables. Can also contain views, indexes, sequences, data types, operators, &
> functions. Analogous to folders (at the OS level): except schemas can't be nested. Create via:

    CREATE SCHEMA nameofschema;

Tablespace
----------
> storage location where the actual data underlying database objects can be kept/
> In other words, it's an actual place on the hard disk holding the db data. To make one:

    CREATE TABLESPACE nameoftablespace LOCATION '/path/to/tablespace/folder';

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

Postgres CLI
============

Postgres CLI 'help' commands
----------------------------
    \?              -   psql command help
    \h              -   sql command help
    \q              -   exit postgres

Postgres CLI format commands
----------------------------
	\t				-	'tuples' mode (you want it off)
	\a				-	'aligned' mode (you want it on)


Postgres CLI 'info' commands
----------------------------
	\d				-	list tables, views, sequences
    \dt[S+]         -   list tables
    \du  OR \dg     -   list roles (users)
    \l              -   list databases
    \db[+]          -   list tablespaces
    \dn             -   list schemas

    \dT             -   list data 'types'

    \s [filename]   -   output postgres query buffer (CLI command history) to file

    \d [tablename]	-	see table schema - handy-dandy
                    -   i.e. see all columns names, equivalent of Object.keys

SQL-based info command essentials
---------------------------------
	SELECT * from [tablename];	-		view all data in the table.

Postgres CLI 'select current database'
--------------------------------------
*   Switch to a different database - i.e. make a different db the current db:

        \c nameofdbtoselect

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

USERS
=====

ADD NEW USER (ROLE)
-------------------
*    Make a new superuser

        CREATE ROLE andrew WITH SUPERUSER;

*    Make a new superuser who has to log in (with password '1q2w3e4r')

        CREATE ROLE andfaulkner WITH SUPERUSER LOGIN PASSWORD '1q2w3e4r';


DELETE USER (ROLE)
------------------
*   Delete a user (role):

        DROP ROLE nameofuser;

*   Delete a user (role), without throwing error if user doesn't exist

        DROP ROLE IF EXISTS nameofuser;


ALTER A USER (ROLE)
-------------------

*   Provide a user with the ability to log in:

        ALTER ROLE nameofuser WITH LOGIN

*   Give user all the powers:

        ALTER ROLE nameofuser CREATEROLE
        ALTER ROLE nameofuser CREATEDB
        ALTER ROLE nameofuser REPLICATION;

    *  ...and confirm it worked with:

        \du

Access rights
-------------

GRANT usage on schema public to postgres

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

ENVIRONMENT
===========

Set an environment variable
---------------------------
*   use `SET` command
*   Examples:

        SET default_tablespace = '';
        SET default_with_oids = false;
        SET statement_timeout = 0;
        SET search_path = public, pg_catalog;


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

DATABASES
=========

MAKE A DATABASE
---------------
*    Make a single, basic database:

        CREATE DATABASE nameofnewdb;


CONNECT TO A DATABASE
---------------------
*    from within the CLI:

        \c name_of_database_to_connect_to


---------------------------------------------------------------------------------------------------

ADD DATA
========

Data types
----------
1.  `CHARACTER VARYING` - a string, of variable length 	-	also goes by `VARCHAR`
2.  `CHARACTER` - a single character (unless VARYING is added as a qualifier)
3.  `NUMERIC` - a real number - allows reasonably large numbers
4.  `INTEGER` - standard integer - positive or negative whole number
5.  `TEXT` - a string of any length at all - fully infinite; however, not SQL standard
6.  `BOOLEAN` - true or false value.
        *   These evaluate to true: TRUE, 't', 'true', 'y', 'yes' 'on', '1'
        *   These evaluate to false: FALSE, 'f', 'false', 'n', 'no' 'off', '0'
5.  Date - usually in YYYY-MM-DD format
6.  Real - a numeric value allowing decimals


MAKE A SCHEMA
-------------
*   Create a schema with a given name:

        CREATE SCHEMA nameofschema;

MAKE A TABLESPACE
-----------------
*   Create a tablespace at a given location:

        CREATE TABLESPACE nameoftablespace
            LOCATION '/path/to/tablespace/folder'

MAKE A TABLE
------------
*   Make 2 column table named test_table_2, in currently selected database:

        CREATE TABLE test_table_2 (
            test_column_1 TEXT PRIMARY KEY,
            test_column_2 TEXT
        );

*   Example:

        CREATE TABLE starter_data (
            first_name TEXT PRIMARY KEY,
            last_name TEXT,
            colour TEXT,
            favorite_bear TEXT,
            rar BOOLEAN
        );


---------------------------------------------------------------------------------------------------

MODIFY DATA TABLES
==================

Add column to table
-------------------

*   use `ALTER TABLE` command
*   generic:

        ALTER TABLE name_of_table
            ADD COLUMN name_of_column {{insertTypeHere}};

*   example:

        ALTER TABLE test_entity_1
            ADD COLUMN omnomnomnom CHARACTER VARYING;

        ALTER TABLE starter_data ADD COLUMN id TEXT;


Rename a column
---------------
*   example:

    ALTER TABLE test_entity_1 RENAME COLUMN entnum TO ent_num;

*   generic:

    ALTER TABLE name_of_table RENAME COLUMN original_col_name TO new_col_name;


Remove a table
--------------
*   use `DROP TABLE` command
*   Example:

        DROP TABLE films;

    *   destroys table files

---------------------------------------------------------------------------------------------------

ADD DATA
========

Insert data into table, at specific columns
-------------------------------------------
*   example:

        INSERT INTO test_entity_1 (
            omnom,
            name,
            price,
            ent_num,
            id
        ) VALUES (
            'omnomnomnom',
            'omnomnomnom man',
            '1.423',
            '5',
            'd6c95a2b-bd81-4e7b-a0f8-d15d8f28d097'
        );

*   generic:


---------------------------------------------------------------------------------------------------

VIEW DATA
=========

DISPLAY ENTIRE TABLE
-----------------------
*   example:

        SELECT * FROM sys_user;

*   generic:

        SELECT * FROM name_of_table;


GET ALL DATA FROM A COLUMN
--------------------------
*   example:

        SELECT roles FROM sys_user;

*   generic:

        SELECT name_of_column FROM name_of_table;


GET ALL DATA FROM MULTIPLE COLUMNS
----------------------------------
*   example:

        SELECT employment,roles FROM sys_user;

*   generic:

        SELECT name_of_col,name_of_another_col FROM name_of_table;


---------------------------------------------------------------------------------------------------

GET DATA FROM JSON
==================

GET DATA FROM A KEY IN A JSON OBJECT STORED IN A COLUMN OF TYPE json
--------------------------------------------------------------------
*   example:

        SELECT perm->'roles' AS rls FROM sys_user;

* generic:

        SELECT json_column->'key' AS genericnametogivecol FROM table_name;


GET TOP-LEVEL OBJECT KEYS FROM JSON COLUMN
------------------------------------------
*   example:

        SELECT json_object_keys(perm) FROM sys_user;

*   generic:

        SELECT json_object_keys(json_col) FROM name_of_table;


GET DATA FROM ARRAY STORED AT SPECIFIC KEY IN JSON COL
------------------------------------------------------
*   example:

        SELECT employment,json_array_elements(perm->'roles') FROM sys_user;

* generic:

        SELECT some_other_col,json_array_elements(json_col->'key_with_array_val') FROM table_name;


GET LENGTH OF ARRAY STORED A SPECIFIC KEY IN JSON COL
-----------------------------------------------------
*   example:

        SELECT employment,json_array_length(perm->'roles') FROM sys_user;

*   generic:

        SELECT some_other_col,json_array_length(json_col->'array_col') FROM table_name;


CONDITIONALLY GET DATA FROM ARRAY STORED AT SPECIFIC KEY IN JSON COL
--------------------------------------------------------------------
*   ...based on value of another col
*   example:

        SELECT employment,json_array_elements(perm->'roles') FROM sys_user WHERE employment='Analyst';

* generic:

        SELECT some_col,json_array_elements(json_col->'key') FROM table_name WHERE some_col='some_value';