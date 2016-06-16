;;#################################
;;#          IDENTIFIERS          #
;;#################################
(println " ***** IDENTIFIERS *****")
(println " ----- Used to name things, such as functions or variables -----")
(def some-variable 42)
(println some-variable)

(println " ----- IDENTIFIERS IN HASHMAPS -----")
(println {:a 1, :c 3, :b some-variable})

;;#################################
;;#          LET, LOCALS          #
;;#################################
(println " ***** LET, LOCALS *****")
; let is for lexically scoped named values
(println " ----- DEFINE A LET VALUE -----")
(println (let [width			10
							 height			20
							 thickness	2]
	(println "hello from inside the let!")
	(* 	width
			height
			thickness)))
; => 400
; NOTE THAT YOU CANNOT REFERENCE ANY OF THE LET VALUES OUTSIDE THE SCOPE

(println " ----- REDEFINE A LET VALUE WITHIN A SCOPE -----")
(println (let [x 	10
							 x  (* x x)
							 x  (+ x x)]
					x))
;	=> 200

(print "\n")