main :: IO()

------------------------------ Comments ------------------------------
-- these are defined using -- followed by your comment

------------------------------ Defining Variables ------------------------------
-- typeless var definitions
x = 3
-- through type inference, Haskell automatically knows that the variable is of type Int

-- typed var definitions
y :: Int
y = 3
-- we've made explicit that y is an Int

z :: Float
z = 3

lst = [2,3,5,7,11]

total = sum (map (3*) lst)

-- main must be defined in all files - an IO monad is always implicitly present (?)
        -- main :: IO()
main = print total


mainer :: IO()
mainer = print z


-- Get type of expression or object (in GHCi)
:type 3 -- OUTPUT) 3 :: Num t => t

-- To show the type of every expression in GHCi - :set +t
