;;################################
;;#          ARITHMETIC          #
;;################################
(println " ***** ARITHMETIC *****")
(println (+ 1 2))
(println (- 4 2))
(println (* 4 8))
(println (/ 2 2))

;;##################################
;;#          CONDITIONALS          #
;;##################################
(println " ***** CONDITIONALS *****")

(println " ----- if-then -----")
(println (if true "yes" "no")) ; =>	yes

(println " ----- equality testing -----")
(println (= 1 1))	;	=> true
(println (= 1 2))	;	=> false

(println " ----- inequality testing -----")
(println (not= 1 1))	;	=> false

(println " ----- less than, greater than -----")
(println (> 4 2))	;	=> true
(println (< 4 2))	;	=> false
(println (>= 4 4))	;	=> true
(println (<= 4 3))	;	=> false

