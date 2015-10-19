IMPORTANT
=========

look at pg_dump for preserving db examples:
http://www.postgresql.org/docs/9.1/static/app-pgdump.html

- it actually generates commands for you!!!!!




---------------------------------------------------------------------------------------------------
POSTGRES DATABASE INFO
======================
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
		\t 							-		'tuples' mode (you want it off)
		\a 							-		'aligned' mode (you want it on)


Postgres CLI 'info' commands
----------------------------
		\d 							-		list tables, views, sequences
    \dt[S+]         -   list tables
    \du  OR \dg     -   list roles (users)
    \l              -   list databases
    \db[+]          -   list tablespaces
    \dn             -   list schemas

    \dT             -   list data 'types'

    \s [filename]   -   output postgres query buffer (CLI command history) to file

    \d [tablename]	-		see table schema - handy-dandy


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


---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
DATABASES
=========

MAKE A DATABASE
---------------
*    Make a single, basic database:

        CREATE DATABASE nameofnewdb;

---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
DATA
====

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

---------------------------------------------------------------------------------------------------

