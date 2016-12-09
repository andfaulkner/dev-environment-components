----------------------------------------------- REPL -----------------------------------------------
-- open with this command in the terminal:
--      elm-repl

-- to use multiline values in the repl, break line ends with slashes. e.g.

sufficientAmmo ammoRemaining = \
    if ammoRemaining > 10000 then "Yippie-ki-yay-mothafucka!!!!" \
    else "*cries*"

-- no need to do this outside the repl