ack: grep replacement
=====================
Divert ack-grep command to instead respond to just typing ack in the cli

    sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

Restrict files searched
-----------------------
*   search only in js files

    ack -w --js __insert_query_here__

*   display all types of files ack knows how to identify, based on language of code
    **  uses more than just file extension to detect the language of the code in the file

    ack --help-types



Number of matches
-----------------

*   Show # of matches only, but not the filenames or actual matched text

    ack -ch __query__

*   Show # of matches in each file searched (# of matches beside filename)
    **   ...but not actual matched text lines

    ack -c __query__

*   Show # of matches in each file searched, but not filenames of searched
    files with 0 matches:

    ack -cl __query__

Extra info
----------
*   show column of match (not just row)

     ack --column --js __query__

Showing context of matches
--------------------------
*   Show a certain number of lines SURROUNDING each match
    **  e.g. this shows the 3 lines before the match, the line of the match,
        and the 3 lines after the match:

        ack -C 3 __query__

*   Show a certain number of lines that came BEFORE each match
    **   e.g. this shows the line of the match, along with the 5 lines BEFORE it

        ack -B 5 __query__

*   Show a certain number of lines that came AFTER each match
    **   e.g. this shows the line of the match, along with the 5 lines AFTER it

        ack -A 5 __query__

*   show filenames of files with matches, but not the matches themselves:
    **  (note that you can also leave out the query, and/or use other restrictions
        such as --js)

        ack -f __query__

Links with good info
====================
*    https://www.digitalocean.com/community/tutorials/how-to-install-and-use-ack-a-grep-replacement-for-developers-on-ubuntu-14-04