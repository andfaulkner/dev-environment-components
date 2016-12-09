----------------------------------------------------------------------------------------------------
--------------------------------------------- RECORDS ----------------------------------------------
----------------------------------------------------------------------------------------------------
-- Record: set of key-value pairs

----------------------------------------- CREATING RECORDS -----------------------------------------
lettersToNumbers = { a = 1, b = 2 }
    --> return { a = 1, b = 2 } : { a : number, b : number1 }

-- unlike lists, there is no restriction on types between values. e.g. below is
-- valid even though age is a number & name is a string:
dogInfo = { name = "Meeka", age = 5 }
    --> return { name = "Meeka", age = 5 } : { age : number, name : String }

--------------------------------------- GETTING FROM RECORDS ---------------------------------------
-- Main method 1: directly call the field, just like in JS or Ruby or Python
lettersToNumbers.b
    --> return 2 : Number

-- Main method 2: use field name as a function, pass to a record to get the value out
.name dogInfo
    --> return "Meeka" : String

----------------------------------------- UPDATING RECORDS -----------------------------------------
-------- updating single field in a record --------
newDogInfo = { dogInfo | age = 6 }
    --> { name = "Meeka", age = 6 } : { name : String, age : number }

-------- updating multiple record fields at once --------
newDogInfoTwo = { dogInfo | age = 7, name = "Meekamoo" }
    --> { name = "Meekamoo", age = 7 } : { age : number, name : String }
