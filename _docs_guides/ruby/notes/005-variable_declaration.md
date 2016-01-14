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