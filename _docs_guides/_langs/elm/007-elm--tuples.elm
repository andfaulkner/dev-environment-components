
-- WARNING: TUPLES DON'T WORK THAT WELL IN THE REPL

---------------------------------------------- TUPLES ----------------------------------------------
-- another data structure
    -- can hold a fixed number of values
    -- a value can have any type
-- most common use: if you need to return more than 1 value from a function

----------------------------------------- CREATING TUPLES ------------------------------------------
(1, "ASDF")
--> returns (1,"ASDF") : ( number, String )

(True, [30, 40, 100], "Yes", "um ok", 9)
--> returns (True,[30,40,100],"Yes","um ok",9)
--    : ( Bool, List number, String, String, number1 )

area = (10, 20)
--> returns (10,20) : (number, number1)

volume = (30, 50, 100)

-------------------------------------- ACCESSING TUPLE VALUES --------------------------------------
-------------------- Accessing tuple values via helper methods --------------------
Tuple.first ("hello", "tuples") --> returns "hello" : String
Tuple.second ("hello", "tuples") --> returns "tuples" : String

-------------------- Accessing tuple values via destructuring --------------------
let
    (width, height) = area
in
    width + height
--> returns 30 : number

-- can place all on one line if desired:
let (width, height) = area in width + height

-- use _ as a placeholder to skip over a value:
let
    (width, _, depth) = volume
in
    width * depth
    --> returns 3000 : number

-- you must match on the exact number of items in the tuple or you'll get a compiler error
--  this is where _ comes in - ass a placeholder for unwanted items

