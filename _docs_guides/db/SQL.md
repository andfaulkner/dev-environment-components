***************************************************************************
SQL BASICS
==========
***************************************************************************

Key terms/concepts
==================

Relational Database
-------------------
*   db that organizes information into one or more tables

Table
-----
*   collection of data organized into rows and columns

Column
------
*   set of data values of a particular type, such as
    *   id
    *   name
    *   age

Types
-----
1.  Integer - a positive or negative whole number
2.  Text - a string
3.  Date - usually in YYYY-MM-DD format
4.  Real - a numeric value allowing decimals

Relationship Types
------------------
### one-to-one
*   e.g. if each address can belong to only one customer, this relationship is "One to One"

### One to Many
*   e.g. Each customer may have zero, one or multiple orders, but anorder can only belong to
    1 customer

### Many to Many
*   e.g. each order can contain multiple items, and each item can also be in multiple orders

Foreign Keys
------------
*   Way to reference data in another table

Joins
-----
*   Used to retrieve data from DBs with relationships

###Cross Joins
*   Default JOIN type
*   each row from the first table is matched with each row of the second table
*   basically useless

###Natural Join
*   tables need to have a matching column name
*   join the records only when the value of this column is matching on two records

    SELECT * FROM customers NATURAL JOIN orders;

USING
-----
*   If a column is the same name on both tables, we can specify it here
    *   for joining the tables together
*   much like the NATURAL JOIN
*   extremely useful


---------------------------------------------------------------

Creating tables
===============

CREATE TABLE table_name (
    column_1 data_type,
    column_2 data_type,
    column_3 data_type
);

Basic commands
==============
*   `CREATE TABLE`  creates a new table.
*   `INSERT INTO`   adds a new row to a table.
*   `SELECT`        queries data from a table.
*   `UPDATE`        edits a row in a table.
*   `ALTER TABLE`   changes an existing table.
*   `DELETE FROM`   deletes rows from a table.

---------------------------------------------------------------
SET
===
*   Set an environment variable
*   Examples

        SET default_tablespace = '';
        SET default_with_oids = false;
        SET statement_timeout = 0;
        SET search_path = public, pg_catalog;

DROP TABLE
==========

*   Destroy a table
*   Examples

        DROP TABLE films;
            * destroys table files

ALTER TABLE
===========
*   generic:

        ALTER TABLE name_of_table
            ADD COLUMN name_of_column {{insertTypeHere}};

*   example:

        ALTER TABLE test_entity_1
            ADD COLUMN omnomnomnom CHARACTER VARYING;


OWNER
=====

IF keyword
==========

TO keyword
==========

EXISTS
======

ADD CONSTRAINT
==============

PRIMARY
=======

KEY
===

PRIMARY KEY
===========

ONLY
====

CREATE INDEX
============

ON keyword
==========

UNIQUE constraint
=================
Create column that only allows one of each value.


INSERT
======


Misc
====
autoincrement value in table
----------------------------
	SEQUENCE role_id_seq
    ALTER TABLE roles ALTER id SET DEFAULT NEXTVAL('role_id_seq');

*  henceforth, the default value of column 'id' will be [previous row's id] + 1.

Remove a column of a table
------------------------

		ALTER TABLE roles DROP COLUMN starter_id;
