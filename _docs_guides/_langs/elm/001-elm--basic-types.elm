---------------------------------------------- TYPES -----------------------------------------------
----------------- Strings -----------------
"hello" --> returns "hello" : String

-- string concat:
"hello" ++ " " ++ "world!" --> "hello world!"

-- chars:
'a' --> 'a' : Char

-- length
String.length "my crazy string" --> 15 : Int

-- reverse
String.reverse "hello" --> olleh : String

-- repeat
String.repeat 3 "ja" --> jajaja : String

-- split on matching chars
String.split "/" "/home/someone/location/project/current-project.elm"
--> ["","home","someone","location","project","current-project.elm"] : List String

----------------- Numbers -----------------
4 --> returns 4 : number

-- arithmetic
5 + 9 --> returns 14 : number
9 - 4 --> returns 5 : number
2 - 9 --> returns -7 : number
9 * 2 --> returns 18 : number
9 * 4 --> returns 2.25 : Float
4 ^ 2 --> returns 16 : number

----------------- Booleans -----------------
True --> returns True : Bool
False --> returns False : Bool

-- boolean algebra
True || False --> returns True : Bool
True && False --> returns False : Bool

----------------- Lists (arrays) -----------------
[1, 2, 3] --> returns [1,2,3] : List number
["a", "grgt", "656"] --> returns ["a","grgt","656"] : List String

-- all items in a list must be of the same type. e.g. this fails:
    -- [1, "something", 7, False]

----------------- Tuples -----------------
(3, "asdf")
--> (3,"asdf") : ( number, String )

