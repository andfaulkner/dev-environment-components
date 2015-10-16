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