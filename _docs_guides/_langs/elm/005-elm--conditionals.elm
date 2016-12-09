------------------------------------------ IF EXPRESSIONS ------------------------------------------
-- general syntax:
    -- if Bool then Any else Any
    -- it MUST be a boolean after the if. Elm has no concept of 'truthiness'
-- examples:

if True then "hello" else "world" --> "Hello" : String
if False then "hello" else "world" --> "world" : String

if 4 == 5 then "wtf" else "rly guys?" --> "rly guys?" : String

-------------------------------- USING IF EXPRESSIONS AS A TERNARY ---------------------------------
-- an if-statement can be the return value of a function

over9000 powerLevel =
    if powerLevel > 9000 then "Back off biznatches!" else "Flee! An army of maurading penises!"

-- note: if in the repl, you can define it like this (sans comment dashes):
--     over9000 powerLevel = \
--         if powerLevel > 9000 then "Back off biznatches!" else "Flee! An army of maurading penises!"

over9000 10000 --> "Back off biznatches!" : String
over9000 211 --> "Flee! An army of maurading penises!" : String
