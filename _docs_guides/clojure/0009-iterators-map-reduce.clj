;;###############################
;;#          ITERATORS          #
;;###############################
(println " ***** ITERATORS *****")

(println " ----- MAP -----")
(println (map inc [0 1 2 3]))		; => (1 2 3 4)

;	note: inc means 'increment by 1'

(println " ----- REDUCE -----")
(println (reduce + [1 2 3 4 5]))	; =>  15

(println (format "%s" 4))
(println (str (str "asdf") (str "vvv")))

(println " ----- REDUCE WITH OWN LAMBDA FUNCTION -----")
(println (reduce (fn [a b]
										 (str a b))
	[3 5 1 2]))											; #	=> 3512

(println " ----- REDUCE WITH START VALUE PROVIDED -----")
(println (reduce (fn [a b]
										 (str a b))
	"number string: " [3 5 1 2]))		;	# => number string: 3512

(println " ----- FILTER OUT VALUES THAT DON'T MATCH THE PREDICATE -----")
(println (filter odd? (range 10))) ; # => (1 3 5 7 9)

(println " ----- FILTER OUT VALUES THAT DON'T MATCH THE PREDICATE -----")
(println (filter odd? (range 10))) ; # => (1 3 5 7 9)