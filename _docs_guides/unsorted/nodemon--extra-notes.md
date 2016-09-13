Watch a file or set of files
============================
*   watch the file itself for changes

        nodemon file_to_run.js

*   watch a file besides the file itself for changes

        nodemon --watch file_to_watch file_to_run.js

*   watch multiple files for changes

        nodemon --watch file_to_watch.ext --watch another_to_watch.any file_to_run.js

*   watch all contents of directory

        nodemon --watch some_dir_to_watch/** file_to_run.js

Delay restart after changes occur
=================================
*   restart 10 seconds after change occurs

        nodemon --delay 10 server.js

*   restart 2.5 seconds after change:

        nodemon --delay 2.5 server.js

*   restart 1254 ms after change:

        nodemon --delay 1254ms server.js

Execute non-node scripts with nodemon
=====================================
*   seems to handle python and ruby out of the box ???

List types of files being watched (by extension)
================================================

nodemon -e js,ts,tsx,jsx run_file.js



Nodemon is requireable - see https://github.com/remy/nodemon/blob/master/doc/requireable.md
===========================================================================================
*   you can do some pretty cool things with it
