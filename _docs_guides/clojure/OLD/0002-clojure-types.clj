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


(println "")
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


(println "")
;;###################################
;;#          TYPE CHECKING          #
;;###################################
(println " ***** TYPE CHECKING *****")

(println " ----- GET TYPE -----")
(println (type 3))

(println " ----- IS NIL? -----")
(println (nil? nil))

(println " ----- IS CHAR? -----")
(println (char? "z"))
(println (char? 'z))
(println (char? (char 5)))	; => true   <<< WTF
(println (char 005))				; => 				<<< WTFWTFWTF

(println " ----- IS VECTOR? -----")
(println (vector? [1 3 4])) ;=> true

(println " ----- IS HASHMAP (MAP)? -----")
(println (map? {:k1 4 :k2 "yep"})) ;=> true

(println " ----- IS LIST? -----")
(println (list? (list 1 3 5 6)))			; => true


(println "")
;;##################################
;;#          INSTANCE OF?          #
;;##################################
(println " ***** INSTANCE OF? *****")

(println " ----- INSTANCE OF STRING? -----")
(println (instance? String "asdf"))	; => true
(println (instance? String 1))			; => false

(println " ----- INSTANCE OF CLASS? -----")
(println (instance? Class Thread))	; => true

(println " ----- INSTANCE OF NUMBER? -----")
(println (instance? Number 4))	; => true

(println " ----- INSTANCE OF LONG? -----")
(println (instance? Long 1))		; => true

(println " ----- INSTANCE OF Integer? -----")
(println (instance? Integer 1))					; => false
(println (instance? Integer -1))				; => false
(println (instance? Integer (int -1)))	; => true


(println "")
;;#############################
;;#          CASTING          #
;;#############################
(println " ***** CASTING *****")

(println " ----- CAST TO LONG -----")
(println (type 3.0))					; => java.lang.Double
(println (type (long 3.0)))		; => java.lang.Long

(println " ----- CAST TO INTEGER -----")
(println (type (int 3.0)))		; => java.lang.Integer

(println " ----- STRING TO NUMBER (Long) VIA READER -----")
(println (read-string "9"))					; => 9
(println (type (read-string "9")))	; => java.lang.Long

(println " ----- STRING TO INTEGER -----")
(defn parse-int [s]
	(Integer. (re-find #"\d+" s)))
(println (parse-int "432"))					; => 432
(println (type (parse-int "432")))	; => java.lang.integer

(println " ----- NUMBER TO STRING -----")
(println (str 52))									; => 52
(println (type (str 52)))						; => java.lang.String
