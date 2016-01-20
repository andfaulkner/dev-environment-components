;;################################
;;#          ARITHMETIC          #
;;################################
(println " ***** ARITHMETIC *****")
(println (+ 1 2))
(println (- 4 2))
(println (* 4 8))
(println (/ 2 2))
(println (inc 1))		; => 2

(println " ----- RETURN THE LARGEST NUMBER IN A SET OF ARGS -----")
(println (max 3 5 2 3))	;	=> 5
(println " ----- RETURN THE LARGEST NUMBER IN A LIST -----")
(println (max '(3 5 2 3 7))) ; => 7

(println " ----- RETURN THE SMALLEST NUMBER IN A SET OF ARGS -----")
(println (min 3 5 2 3))	;	=> 5
(println " ----- RETURN THE SMALLEST NUMBER IN A LIST -----")
(println (min '(3 5 2 3 7))) ; => 7

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

(println " ----- CHECK IF GREATER THAN 0 -----")
(println (pos? 2))	; => true
(println " ----- CHECK IF LESS THAN 0 -----")
(println (neg? -2)) ; => true

(println " ----- WHEN -----")
(println (when (= 1 1) true)) ; => true
(println (when (not= 1 1) true)) ; => nil

(loop [i 0]
  (when (< i 5)
    (println i)    
    (recur (inc i)); loop i will take this value
))
; =>	0 
;			1
;			2
;			3
;			4