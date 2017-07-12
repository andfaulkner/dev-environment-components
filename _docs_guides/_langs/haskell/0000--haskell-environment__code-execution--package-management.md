Executing Haskell code
======================
repl
----
Open repl:

    ghci

Exit repl:

    :quit

Compile and run
---------------
Compile script:

    ghc haskell_file.hs

Compile with given output file name:

    ghc -o 0002-basics-compiled 0002-basics-compiled.hs
    #      \__________________/ \_____________________/
    #          output file            input file

Run compiled script:

    ./haskell_file

Compile and run with one command:

    ghc -o 0002-basics-compiled 0002-basics-compiled.hs ./0002-basics-compiled



Package management
==================
*   Uses "cabal" package manager

Update package list
-------------------
Always do this on first installing cabal. It's also a good idea to do it daily.

    cabal update

Install package
---------------
General syntax:

    cabal install PACKAGE_NAME_HERE --max-backjumps=100000 --reorder-goals

Example (installing hsdev):

    cabal install hsdev --max-backjumps=100000 --reorder-goals


Dev environment: hsdev
======================
Remote server
-------------
Start server:

1. Open repl:

    ghci

2. Launch in repl:

    hsdev start

    ghci

    PS>