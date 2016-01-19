;;######################################
;;#          STRING FUNCTIONS          #
;;######################################
(println " ***** STRING FUNCTIONS *****")

(println " ----- MAKE A STRING WITH A FUNCTION -----")
(println (str "asdf" "...yay!" " great string moo!"))	; # => asdf...yay! great string moo!

(println " ----- GET STRING LENGTH -----")
(println (count "this is a string"))	;	# => 16

(println " ----- REQUIRE CLOJURE STRING LIBRARY -----")
(require '[clojure.string :as str])

(println " ----- SPLIT A STRING INTO AN ARRAY -----")
(println (str/split "apple,orange,carrot", #",")) ; # => [apple orange carrot]

(println " ----- JOIN AN ARRAY INTO A STRING -----")
(println (str/join ["apple", "orange", "carrot"])) ; # => appleorangecarrot

(println " ----- JOIN AN ARRAY INTO A STRING, WITH A DIVIDER -----")
(println (str/join ", " ["apple", "orange", "carrot"])) ; # => apple, orange, carrot

(println " ----- REPLACE PART OF A STRING -----")
(println (str/replace "Hello everybody!" "Hello", "Aloha")) ; # => Aloha everybody!

;;#################################
;;#          SEQUENTIALS          #
;;#################################
(println " ***** SEQUENTIALS *****")

; STRINGS ARE SEQUENTIALS

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

;;#########################################
;;#          SEQUENTIALS - LISTS          #
;;#########################################
(println " ***** SEQUENTIALS - LISTS *****")

(println " ----- DEFINE A LIST -----")
(def my-list '(8 3 4))
(println " ----- GET FIRST LIST ITEM -----")
(println (first my-list))			;	=> 8
(println " ----- GET SECOND LIST ITEM -----")
(println (second my-list))		;	=> 3
(println " ----- GET THIRD LIST ITEM -----")
(println (last my-list))			; => 4 