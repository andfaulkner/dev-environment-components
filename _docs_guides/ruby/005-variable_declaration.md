Declaring variables
===================

Regular variables
-----------------

-   example:

        new_inventory = File.open('new-inventory.txt').readlines

-   case matters
-   no type declaration, and no 'var'

-   use snake_case

Constants
---------
-   constants are defined in TitleCase: capitalize ALL words in the var, use no spaces or _ e.g.

		MyShip = "a cutter"

-   Ruby then complains if you try to redeclare it (although it still obeys)

		MyShip = "a cutter"
		MyShip = "a clipper"

		-   output of second command (redefining variable):

		    (irb):4: warning: already initialized constant MyShip
				=> "a bark" "a clipper"


Special cases
-------------

-   ending a message in ? indicates it's asking a true/false question
-   ending a message in ! indicates the message does something 'special' & maybe unexpected


Variable types --- IDed by Ruby using sigils


-----------------------------------------------------------------------------
| Name Begins With	|			Variable Scope			|		Example 									|
-----------------------------------------------------------------------------
|	$									|		A global variable     |		$app_name = "MyApp"				|
|	@									|		An instance variable  | 	@user_name = "meeka"			|
|	[a-z]	or _				|		A local variable 			|		interim_result = a * b		|
|	[A-Z]							|		A constant 						|		PI = 3.1415926535897			|
|	@@								|		A class variable 			|	 	@@number_of_users					|
| (PSEUDOVAR)  self	|		cur executing object  |   self											|
| (PSEUDOVAR)  nil	|		cur executing object  |   nil												|
-----------------------------------------------------------------------------
