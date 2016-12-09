---------------------------------------------- LISTS -----------------------------------------------
arr = [1, 2, 3, 4, 5]

-------- Check if list is empty --------
List.isEmpty arr
--> return False : Bool

---------------- length ----------------
List.length [1, 2, 3] --> 3 : Int

---------------- Map ----------------
-- run the lambda in the middle on each value in arr, return new resultant array
List.map (\x -> x + 4) arr
--> [5,6,7,8,9] : List number

double x = x * 2
List.map double arr --> return [2,4,6,8,10] : List number

---------------- Filter ----------------
-- return array omitting values for which the test condition doesn't return true
List.filter (\x -> x >= 4) arr
--> [4,5] : List number

---------------- Reverse ----------------
List.reverse [1, 2, 3] --> return [3,2,1] : List number

---------------- Sort ----------------
List.sort [9, 2, 7, 4, 12, -10] --> return [-10,2,4,7,9,12] : List number
