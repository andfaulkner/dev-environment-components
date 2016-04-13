Possible issues
===============
1.   From the mysql docs: On Unix platforms, MySQL ignores configuration files
     that are world-writable. This is intentional as a security measure.

     * ensure you give the right permissions to everyone. Good luck with that one :(

2.  Correct install location?

    sudo tar zxvf ~/Downloads/mysql/mysql-5.7.9-linux-glibc2.5-i686.tar.gz

Things to try
=============
1.  everything this page (trouble connecting) suggests regarding permissions etc:
     https://dev.mysql.com/doc/refman/5.7/en/problems-connecting.html

    *   also this one: (file permission issue handling): https://dev.mysql.com/doc/refman/5.7/en/file-permissions.html

    *   and this one on resetting permissions: https://dev.mysql.com/doc/refman/5.7/en/resetting-permissions.html

    *   THIS IS KEY: https://dev.mysql.com/doc/refman/5.7/en/privilege-changes.html
        *   particularly about how to set permissions when --skip-grant-tables is on - flushing is essential:

            FLUSH PRIVILEGES;

    *   this link is also a must: https://dev.mysql.com/doc/refman/5.7/en/grant-table-structure.html
    *   and this one: https://dev.mysql.com/doc/refman/5.7/en/account-names.html

2.  vim ~/.bash_profile
    *   within the file, add:

        export MYSQL_HOME="path/to/somewhere/main/root/my.cnf"

3.  touch [path/to/somewhere/main/root/my.cnf]

        * look into if there's anything you can add to this or other option files to alleviate your issue
             https://dev.mysql.com/doc/refman/5.5/en/option-files.html

4.   make an 'unsecured' database

5.   use  --log-warnings flag on things

6.   start adding password itself to commands using this flag (at the end)

        -p passwordgoeshere

    *   see https://dev.mysql.com/doc/refman/5.5/en/password-too-long.html


AUTH
====
See what privileges a given account has
---------------------------------------

    SHOW GRANTS FOR 'joe'@'office.example.com';




Determination of which dbs to use (and for what purposes) on each app
---------------------------------------------------------------------
  *   selected approach: pass an environment variable IDing your 'main' database. If none is
      passed, defaults to attempting to use postgres. Benefits:
        *   direct control over where the data goes
        *   easy to test: can have all dbs running at once, & change env vars to decide what goes
            where,
        *   we're likely going to know what dbs are present & what they're used for in every config
            we do in the foreseeable future

  *   Alternative 1: auto-detect which dbs are present on the system, determine what they should
      be used for, store data accordingly. Issues:
        *   extremely difficult, if not impossible
        *   multiple dbs can be present for different reasons besides usage with the app (e.g.
            local dbs for reason etc.), and even those the user placed on the system for the
            app can have different & hard-to-detect roles to play (e.g. redis can actually
            function as a main store)
            *   i.e. really doesn't scale in the short or long term

  *   Alternative 2: have seneca attempt to save into every possible db it knows how to deal
      with, storing in all that accept it. (has many of the same issues as alternative 1)

Concerns
========
1.  JSON
    * solved: not a problem - mySQL supports JSON data

2.  large objects - can mysql handle them?


Separate components of new db support
=====================================
1.  making existing postgres-specific bootstrapping, test, etc. scripts & data
    work with mysql as well.
    *   Scope:
        *   basically every *.sql file
        *   anything invoking postgres cli tools

    *   Involves:
        *   syntax translation - they're slightly different languages
        *   feature reduction

2.  keeping scripts up-to-date between postgres & mysql without requiring 2 separate configurations.
    *   Solutions:
        1.  automatic conversion of postgres syntax to mysql syntax
            *  e.g. have a makefile action for this
            *  a number of scripts exist for exactly this.
        2.  write all SQL indirectly in Javascript, using a library like Knex to abstract
            db differences away (i.e. let the library handle it).

3.  dev-ops: config, launching, etc. of mysql server. Getting it installed and workign for the
    first time. Scope:
    *  Dockerfile
    *  Travis
    *  /docs folder
    *  Jira, confluence, etc. notes
    *  config files for mySQL - specifically my.cnf

4.  smoothing incompatibilities in the code
    *  removing direct references to postgres and postgres-specific actions

5.  environment variables & global options ('/config/**') to allow db-specific configuration



Look at:
postgrator npm module -- Node.js SQL migration tool:: Postgres <--> MySQL <--> SQL Server


files of possible interest
==========================
*   options.shards.js
shardsOptions



Links of interest:
    http://dev.mysql.com/doc/refman/5.7/en/osx-installation.html
    https://www.sqlite.org/cvstrac/wiki?p=ConverterTools
    http://akrabat.com/setting-up-php-mysql-on-os-x-yosemite/          <<<<<<<<<<
    https://dev.mysql.com/doc/refman/5.5/en/cannot-create.html
