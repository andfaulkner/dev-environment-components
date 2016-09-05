Autofixing errors from cli
==========================

    eslint --fix path/to/file.js


Rules that ESLint can autofix from cli
======================================
    
-   eqeqeq: ==   --convert to-->   ===
-   array-bracket-spacing: e.g. [2, 3, 5] NOT [ 2, 5, 1 ]
-   disallow-extra-semicolons
-   block-spacing: e.g. function () {return 'asdf';}   <<< not OK
												function () { return 'asdf'; } <<< OK
-   eol-last: must have newline at end of file
-   indent:  indent style, with exception given for switch-case structures
-   no-mixed-spaces-and-tabs 	<<< smart tabs lets you use spaces for alignment
-   no-spaced-func: e.g. function ()  vs function()
-   quotes:  can autofix to make them all '' or "" as desired
-   space-infix-ops  :  require space around infix operators


Weird rules
===========

-   no-empty-character-class:  none of this in a regex:  []
-   no-invalid-regexp:  validate strings passed to new RegExp
-   no-empty:   none of this: if (foo) {    }
-   no-extra-boolean-cast:  if (!!foo)  <<< there is no reason to do this! it autocasts.
-   no-extra-parens <<< I'm finally going to learn which are and aren't needed :)
-   valid-typeof:  ensure typeof comparison is against a valid string