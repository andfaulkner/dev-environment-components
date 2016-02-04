SUMMARY
=======

A; B        Run A and then B, regardless of success of A
A && B      Run B if A succeeded
A || B      Run B if A failed
A &         Run A in background.
A || true   Run A. Output no error if it fails. 

&& - double-ampersand
=====================
*   do something based on whether previous command was successful

        do_something && do_something_else_that_depended_on_something

*   specifically, it runs the second value iff the first statement returns 0
    *   not all commands use return value to indicate success/failure. 
        *   e.g. GNU diff returns 1 if two files differ & 0 if they don't

|| - double-pipes
=================
*   do something after another command, even if the preceding one failed. e.g.

        mkdir test || echo "mkdir run to try to make dir test"

& after a command
=================
*   run the preceding command in the background. e.g.

        tar -czf file.tar.gz dirname &

; - semicolon - between 2 commands
==================================

*   run second command regardless of whether first succeeds

        createdb pattern_design; node ./scripts/generate-db-tables.js

|| true
=======

*   suppress error output for multiple-command-in-one-line. e.g.

        createdb pattern_design || true
