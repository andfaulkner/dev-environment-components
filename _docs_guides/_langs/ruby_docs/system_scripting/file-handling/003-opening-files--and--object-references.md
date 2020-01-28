Opening files...also referencing objects
========================================

Opening a file
--------------

-   example (can be run in irb):

    		File.open('new-inventory.txt')

-   output:

        => #<File:new-inventory.txt>

-   path of File.open is relative to CWD.


### File object

-   File.open('filePathAndName.ext')
		-		opens a file, preps it for use
		-		ARGUMENTS ::: filePathAndName.ext: name and path to file

-   File.open('filePathAndName.ext').readlines
		-		opens a file, preps it for use, converts each line of file into a string,
				stores these strings in an array, emits these strings to the terminal
		-		ARGUMENTS ::: filePathAndName.ext: name and path to file

###Assigning a variable

-   Example:

				new_inventory = File.open('new-inventory.txt').readlines

