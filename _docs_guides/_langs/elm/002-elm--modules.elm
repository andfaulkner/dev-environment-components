--------------------------------------------- EXPORTS ----------------------------------------------
-- determine what to export from a module as follows:


module ElmModules exposing (..)

-- By convention module declaration should share a name with the file.
-- Place it at the top of the file.
-- every module in Elm requires a module declaration...thus every file needs one
------- exports: variants -------
-- module ElmModules exposing (..)
-- : (..) means expose everything at the top level of the file.
-- module ElmModules exposing (text)
-- : means expose only the top-level item (function or type) named text
-- module ElmModules exposing (text)
--------------------------------------------- IMPORTS ----------------------------------------------
-- import items from a module as follows:

import Html exposing (text)
import Html.Attributes exposing (..)


-- ...note that to import an item, the module must be exposing it
-- We could also imported from Html like this:
--      import Html
-- ...then we would reference 'text' through Html e.g.:
--      main = Html.text "hello world!"
----------------------------------------------- MAIN -----------------------------------------------
-- all Elm apps start on a function called main.
-- main must return an element to draw into the page. e.g.


main =
    text "Hello"



-- Above, it returns an Html element created with "text" and renders it into the page
