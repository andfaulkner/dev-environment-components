---------------- APP STARTING POINT ----------------
main =
    text "hello world!"
-- all apps start on a function called main

--------------------------------------- 2 KINDS OF FUNCTIONS ---------------------------------------
-- 1) anonymous
-- 2) named

--------------------------------------- ANONYMOUS FUNCTIONS ----------------------------------------
-- aka a lambda
-- e.g.:
\x -> x + 1
    -- arguments are listed between the \ and ->
        -- in the above example, x is the only argument
    -- right side of the arrow says what to do to the arguments
    -- has implicit return (like Ruby)

\x y -> x + y
    -- no commas between arguments
    -- above takes 2 params, x and y

----------------------------------------- NAMED FUNCTIONS ------------------------------------------
add1 : Int -> Int  --< function signature. Optional, but recommended for clarity
add1 x =           --< function name and args
    x + 1          --< actions performed on the args

add : Int -> Int -> Int
add x y =
    x + y  --> returns <function> : number -> number -> number
    -- note that the function signature simply adds another arrow when another
    -- argument is received by the function. Technically Elm functions only
    -- take one argument, but thanks to auto-currying this is transparent

----------------------------- FUNCTION APPLICATION (RUNNING FUNCTIONS) -----------------------------
add1 5 --> returns 6 : number

add 5 8 --> returns 13 : number

-- function application is done with spaces rather than braces

----------------------------------- NO-ARG FUNCTIONS (CONSTANTS) -----------------------------------
name =
    "Meeka" --> returns "Meeka" : String

--------------------------------------- PARTIAL APPLICATION ----------------------------------------
-- any function requiring multiple args can take a smaller number of args to create a partially
-- applied function. The function will then run when the remaining args are passed in.
divide x y = y / x
divideBy3 = divide 3 -- << partially applied function
divideBy3 21         --> returns 7 : Float

--------------------------------------- ORDER OF ASSOCATION ----------------------------------------
-- function application "associates to the left"
    -- meaning a function consumes ("associates to/with") the leftmost values first
        -- ...aka the nearest values
-- natural order represented by parens:
    ((divide 3) 21)

-- parens can be used to control order of association, namely when calling a function with the
-- result of another function. e.g.
add 10 (divide 25 50)  --> returns 12 : Float
    -- without the parens, this would try to literally add the function 'divide' to the number 10
        -- (...and of course throw an error)

------------------------------------------ PIPE OPERATOR -------------------------------------------
-- visually inverts the order of application to make the control flow easier to follow

50                      -- 1) grab the number 50
    |> divide 25        -- 2) a) create partial fn that divides anything passed to it by 25;
                        --    b) run it on the result of the previous step (50);
    |> add 10           -- 3) a) create partial fn that adds 10 to anything passed to it
                        --    b) run the partial function on the result of the previous step (2)
--> returns 12 : Float

-- much easier to read - i.e. all together it looks like this:
50
    |> divide 25
    |> add 10


-- can also put it all on one line
    50 |> divide 25 |> add 10


------------------------------------------ TYPE VARIABLES ------------------------------------------
-- aka generics

