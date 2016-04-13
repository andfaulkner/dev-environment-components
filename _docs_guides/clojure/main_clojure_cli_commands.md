REPL
====
## Best repl
    lein repl

## Basic repl
    clojure

## Once in the repl, to exit:
    (System/exit 0)

INSTALL PACKAGES
================
    lein


PROJECTS
========
## make new project
		lein new app name-of-app

## run a newly created project (run in proj root)
		lein run

Project repl
------------
### launch project repl
    lein repl

*   note this at the bottom of the cli, IDing the current namespace:

		proj-name.core=> 

### run project from within repl
		(-main)