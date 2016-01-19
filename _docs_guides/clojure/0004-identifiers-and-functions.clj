;;#################################
;;#          IDENTIFIERS          #
;;#################################
(println " ***** IDENTIFIERS *****")
(println " ----- Used to name things, such as functions or variables -----")
(def some-variable 42)
(println some-variable)

(println " ----- IDENTIFIERS IN HASHMAPS -----")
(println {:a 1, :c 3, :b some-variable})


;;###############################
;;#          FUNCTIONS          #
;;###############################
(println " ***** FUNCTIONS *****")

(println " ----- DEFINE FUNCTION -----")
(defn my-func [a            b] (+ a b))

(println " ----- CALL A FUNCTION -----")
(println (my-func 3 5)) ;	=> 8
;	note that println is also a function call


(print "\n")