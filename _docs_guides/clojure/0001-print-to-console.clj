

;;#######################################
;;#          OUTPUT TO CONSOLE          #
;;#######################################
(println " ***** OUTPUT TO CONSOLE *****") ;	=> evaluates to nil

(print " ----- Output a string to the console, no line break. -----") ;	=> evaluates to nil
(println " Output of a string to console, with line break") ;	=> evaluates to nil

;;##################################################
;;#          SEE DOCUMENTATION ON THE FLY          #
;;##################################################
(println " ***** SEE DOCUMENTATION ON THE FLY - REPL ONLY *****")
;(doc print)
; => clojure.core/print
; 	 ([& more])
; 			Prints the object(s) to the output stream that is the current value
;				of *out*.  print and println produce output for human consumption.



;; Exit the repl:
; (System/exit 0)

(print "\n")