;;###########################
;;#          TYPES          #
;;###########################
(println " ***** TYPES *****")

(print " ----- NUMBER -----")
(println 3)  ; => 3

(println " ----- nil (SCALAR) -----")
(println nil)	; => nil

(println " ----- BOOLEAN (SCALAR) -----")
(println true) ; => true
(println false) ; => false

(println " ----- REGULAR EXPRESSION} -----")
(println #"^foo\d?$") ; => #"^foo\d?$"

(println " ----- KEYWORD -----")
(println :foo) ; => :foo

(println " ----- SYMBOL -----")
(println 'foo) ; => foo

(println " ----- GET TYPE -----")
(println (type 4))	; => java.lang.Long

;;#####################################
;;#          DATA STRUCTURES          #
;;#####################################
(println " ***** DATA STRUCTURES *****")

(println " ----- VECTOR (basically an array) -----")
(println [1, 2, 3]) ; => [1 2 3]											<<< vectors are ordered
; commas are not needed in vectors
(println [1 2 3]) ; => [1 2 3]

(println " ----- HASHMAP WITH KEYWORDS AS KEYS -----")
(println {:a 1 :b 2 :c 3})	; => {:a 1, :c 3, :b 2} 	<<< hashmaps are unordered

(println " ----- HASHMAP WITH SYMBOLS AS KEYS -----")
(println {'a 1 'b 2 'c 3})	; => {a 1, b 3, c 2}

(println " ----- HASHMAP WITH STRINGS AS KEYS -----")
(println {"a" 1 "b" 2 "c" 3})

(println " ----- LIST (linked-list) -----")
(println '(1 2 3))	;	=> (1 2 3)											<<< lists are ordered
;	Lists are most often used when treating code itself as just a bunch of nested lists
; NOT for sequential data. Vectors are generally for sequential data

(println " ----- SET -----")
(println #{:a :b :c})	;	=> #{:a :c :b}								<<< sets are unordered

(println " ----- NESTING DATA STRUCTURES (below: a set w a vector, hashmap, & another set) -----")
(println #{:a
	[1 2 3]
	{:foo 11 :bar 12}
	#{"shirt" "coat" "hat"}
})															;	=> #{[1 2 3] :a #{shirt hat coat} {:foo 11, :bar 12}}
