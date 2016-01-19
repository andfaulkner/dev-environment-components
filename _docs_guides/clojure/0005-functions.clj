
;;###############################
;;#          FUNCTIONS          #
;;###############################
(println " ***** FUNCTIONS *****")

(println " ----- DEFINE FUNCTION - shorthand -----")
(defn my-func [a            b] (+ a b))

(println " ----- CALL A FUNCTION -----")
(println (my-func 3 5)) ;	=> 8
;	note that println is also a function call

(println " ----- DEFINE LAMBDA, ASSIGN TO VAR -----")
(def my-multiplier
	(fn [a b]
		(println "multiply a and b!")
	(* a b)))

(println " ----- CALL LAMBDA ASSIGNED TO VAR -----")
(println (my-multiplier 3 6))
;	#	=> multiply a and b!
;			 18

(print "\n")