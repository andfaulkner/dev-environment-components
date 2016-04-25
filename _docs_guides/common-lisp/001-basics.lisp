; load a .lisp file
; (load "relative/path/to/file/from/location/clisp/launched/from.lisp")
; you can then define functions in the file

;******* atoms *******
;; these evaluate to themselves. atoms are non-grouped items
10 										;=> 10
:THING								;=> THING
"asdf"								;=> "asdf"
t           					;=> T    			<<< ...meaning true
'aiooo								;=> AIOOO     <<< a symbol, so it gets uppecased automatically in output

;******* s-expressions *******
;; tied-together bracketed groups. The main component of the language. Tied together atoms.
(+ 1 2 3)
'(3 :foo t "yesm")		; => (3 :FOO T "yesm")

;******* comments *******
;; basic one-line comments are started with semicolons
#| Block comments are defined with a hash-pipe.
   These can span multiple lines.
	 #| 
	   Also, they can be nested.
   |#
|#

;******* variables *******;
; define parameter set to the current scope
(defparameter *moo* "moop city")
*moo* ;=> "moop city"
;   (*moo*)			<<< would return an error, since this is in a different scope



;******* functions *******
(defun hello ()
	"Hello World")

(defun hello-person (name)
    (format t "Hello ~A" name))

(hello-person "meeka")
;=> "Hello meeka"
;=> NIL							<<< nil because it doesn't actually return a string, it just prints it

(defun hello-person-2 (name)
    (concatenate 'string "Hello " name))

(hello-person-2 "meeka")
;=> "Hello meeka"		<<<< this time it actually returns the string, it doesn't just print it

