
;;#################################
;;#          SEQUENTIALS          #
;;#################################
(println " ***** SEQUENTIALS *****")

; STRINGS ARE SEQUENTIALS. LISTS ARE SEQUENTIALS.

(println " ----- GET FIRST ITEM IN A SEQUENTIAL -----")
(println (first "hello"))	; => h

(println " ----- GET LAST ITEM IN A SEQUENTIAL -----")
(println (last "hello"))	; => o

(println " ----- GET ALL ITEMS IN A SEQUENTIAL BUT THE FIRST -----")
(println (rest "hello")) 	; => (e l l o)

(println " ----- GET ITEM IN A SEQUENTIAL AT A SPECIFIC INDEX -----")
(println (nth "hello" 1)) ; => e  				<<<< first position is index 0

(println " ----- DO SOMETHING ON EACH ITEM IN A SEQUENCE -----")
(doseq [my-letter "hello"] (println my-letter))
; => 	h
; 		e
;			l
;			l
;			o

(println "")

;;###################################
;;#          CREATE A LIST          #
;;###################################
(println " ***** CREATE A LIST *****")

(println " ----- DEFINE A LIST -----")
(def my-list '(8 3 4 0 1))


;;##########################################
;;#          GET ITEMS FROM LISTS          #
;;##########################################
(println " ***** GET ITEMS FROM LISTS *****")

(println " ----- GET FIRST LIST ITEM -----")
(println (first my-list))			;	=> 8

(println " ----- GET SECOND LIST ITEM -----")
(println (second my-list))		;	=> 3

(println " ----- GET THIRD LIST ITEM -----")
(println (last my-list))			; => 4 

(println " ----- GET ITEM AT GIVEN INDEX -----")
(println (nth my-list 1))			;	=> 3

(println " ----- GET ALL ITEMS BUT FIRST -----")	; can also use pop
(println (rest my-list))			;	=> (3 4 0 1)

(println " ----- GET FIRST n ITEMS OF LIST -----")
(println (take 3 my-list))		; => (8 3 4)

(println " ----- GET ALL ITEMS AFTER ITEM n (no 0 index) -----")
(println (drop 2 my-list))		; => (4 0 1)

;;####################################
;;#          LIST FUNCTIONS          #
;;####################################
(println " ***** LIST FUNCTIONS *****")


(println " ----- CHECK IF ITEM IS A LIST -----")
(println (list? my-list))			; => true

(println " ----- ADD AN ITEM TO THE START OF A SEQUENCE -----")
(println (cons "item1" '("item2", "item3", "item4")))	; #=> (item1 item2 item3 item4)

(println " ----- REVERSE A LIST -----")
(println (reverse '("item1" "item2" "item3" "item4")))	; #=> (item4 item3 item2 item1)

(println " ----- MAKE LIST OF STRINGS, DEFINED BY GIVING A LARGE UNQUOTED STRING' -----")
(println '(Large string defined without quotes broken into words as list items))
	; # => (Large string defined without quotes broken into words as list items)

(println (count '(Large string defined without quotes broken into words as list items))) ; => 11

(println (type '(Large string defined without quotes broken into words as list items)))
	; # => clojure.lang.PersistentList

(println "")
;;############################
;;#          RANGES          #
;;############################
(println " ***** RANGES *****")
(println " ----- NUMERIC RANGE FROM 1 TO 9 -----")
(println (range 1 10))	; => (1 2 3 4 5 6 7 8 9)

(println " ----- NUMERIC RANGE FROM 0 TO 10, 1 ARG GIVEN ONLY -----")
(println (range 10))	; => (0 1 2 3 4 5 6 7 8 9)

(println " ----- NUMERIC RANGE, WITH NEGATIVES -----")
(println (range -5 5))	; => (-5 -4 -3 -2 -1 0 1 2 3 4)

(println " ----- NUMERIC RANGE, ON A CERTAIN QUANTITY MULTIPLE -----")
(println (range 0 10 2))	; => (0 2 4 6 8)

(println " ----- DESCENDING RANGE -----")
(println (range 10 0 -1))	; => (10 9 8 7 6 5 4 3 2 1)
