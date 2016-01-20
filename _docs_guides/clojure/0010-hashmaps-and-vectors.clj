;;##########################################
;;#          HASHMAPS AND VECTORS          #
;;##########################################
(println " ***** HASHMAPS AND VECTORS *****")

;;####################################
;;#          CREATE HASHMAP          #
;;####################################
(println " ***** CREATE HASHMAP *****")

(println " ----- HASHMAP WITH KEYWORDS AS KEYS -----")
(println {:a 1 :b 2 :c 3})	; => {:a 1, :c 3, :b 2} 	<<< hashmaps are unordered

(println " ----- HASHMAP WITH SYMBOLS AS KEYS -----")
(println {'a 1 'b 2 'c 3})	; => {a 1, b 3, c 2}

(println " ----- HASHMAP WITH STRINGS AS KEYS -----")
(println {"a" 1 "b" 2 "c" 3})


(println "")
;;###################################
;;#          CREATE VECTOR          #
;;###################################
(println " ***** CREATE VECTOR *****")

(println " ----- CREATE VECTOR (basically an array) -----")
(println [1, 2, 3]) ; => [1 2 3]											<<< vectors are ordered
; commas are not needed in vectors
(println [1 2 3]) ; => [1 2 3]

(println " ----- CREATE EMPTY VECTOR -----")
(println []) ; => []

(println " ----- CREATE nil VECTOR -----")
(println [nil])	; => [nil]

(println " ----- CREATE VECTOR WITH vector FN -----")
(println (vector 1 2 3)) ; => [1 2 3]

(println " ----- GET CLASS OF A VECTOR -----")
(println (class [1 3 5])) ; => clojure.lang.PersistentVector


(println "")
;;###################################################
;;#          assoc (ON HASHMAPS & VECTORS)          #
;;###################################################
(println " ***** assoc (ON HASHMAPS & VECTORS) *****")

(println " ----- HASHMAP FROM assoc FN AND ARGS PASSED TO IT -----")
(println (assoc {} :key1 "value" :key2 "value"))	; => {:key2 value, :key1 value}

(println " ----- HASHMAP FROM assoc WITH NIL PASSED AS ARG -----")
(println (assoc nil :key1 4)) ; => {:key1 4}

(println " ----- nil HASHMAP FROM assoc -----")
(println (assoc {} nil nil))	; => {nil nil}

(println " ----- UPDATE FIELD IN HASHMAP WITH assoc -----")
(def test-map {:account-no 123456 :lname "Peekafaulkner" :fnam "Meeka"})
(println (assoc test-map :fnam "Moo"))	; => {:account-no 123456, :lname Peekafaulkner, :fnam Moo}
(println test-map)	; => {:account-no 123456, :lname Peekafaulkner, :fnam Meeka}
; remains the same - assoc does not mutate the original data

(println " ----- OVERWRITE HASHMAP ENTRY WITH SAME KEY USING assoc -----")
(println (assoc {:key1 "old value1" :key2 "value2"} 
        					:key1 "new_val1" :key3 "val3")) ; => {:key3 val3, :key2 val2, :key1 new_val1}

(println " ----- REPLACE ITEM IN VECTOR AT INDEX WITH assoc -----")
(println (assoc [1 2 3] 0 10)) ; => [10 2 3]

(println " ----- ADD ITEM AT INDEX ONE BEYOND END OF VECTOR WITH ASSOC -----")
(println (assoc [1 2 3] 3 10)) ; => [1 2 3 10]

(println " ----- INSERT LIST INTO VECTOR WITH assoc -----")
(println (assoc [1 2 3] 2 '(8 4 1)))	; => [1 2 (8 4 1)]


(println "")
;;######################################################
;;#          dissoc (ON HASHMAPS AND VECTORS)          #
;;######################################################
(println " ***** dissoc (ON HASHMAPS AND VECTORS) *****")

(println " ----- REMOVE HASHMAP ITEM BY KEY WITH dissoc -----")
(println (dissoc {:key1 "val1" :key2 "val2" :key3 "val3"} :key2))	; => {:key3 val3, :key1 val1}

(println " ----- REMOVE MULTIPLE HASHMAP ITEMS BY KEY WITH dissoc -----")
(println (dissoc {:key1 "val1" :key2 "val2" :key3 "val3" :key4 "val4"} :key2 :key4))	
		; => {:key3 val3, :key1 val1}

(println " ----- dissoc NON-EXISTENT HASHMAP KEY - RETURNS ORIGINAL HASHMAP -----")
(println (dissoc {:key1 "val1" :key2 "val2" } :key3))	; => {:key2 val2, :key1 val1}

(println " ----- SELECT A SET OF KEYS FROM A HASHMAP USING select-keys -----")
(println (select-keys {:key1 "val1" :key2 "val2" :key3 "val3" :key4 "val4"} [:key1 :key3]))
		; => {:key3 val3, :key1 val1}


(println "")
;;#######################################################
;;#          get VALUES FROM HASHMAP OR VECTOR          #
;;#######################################################
(println " ***** get VALUES FROM HASHMAP OR VECTOR *****")

(def hash-test {:k1 "v1" :k2 "v2" :k3 "v3" :k4 "v4" :k5 "v5" :k6 "v6"}) ; FOR NEXT 3 TESTS

(println " ----- get VALUE FROM HASHMAP -----")
(println (get hash-test :k1))	; => v1
(println (get hash-test :k1 :k5))	; => v1 		<<< can only get value out of hashmap this way

(println " ----- get VALUE FROM HASHMAP, WITH KEY NOT FOUND ERR MSG -----")
(println (get hash-test :k7 "key :k7 not found")) ; => key :k7 not found

(println " ----- get VALUE FROM VECTOR AT INDEX -----")
(println (get [1 2 3] 1)) ; => 2

(println "")
;;##################################################
;;#          COMPARING HASHES AND VECTORS          #
;;##################################################
(println " ***** COMPARING HASHES AND VECTORS *****")

(println " ----- COMPARE 2 VECTORS -----")
(println (= (vector 1 2 3) [1 2 3])) ; => true    <<< same value vectors are equal

(println " ----- COMPARE 2 VECTORS -----")
(println (= hash-test {:k1 "v1" :k2 "v2" :k3 "v3" :k4 "v4" :k5 "v5" :k6 "v6"})) 
	; => true    <<< same value hashes are equal

(println " ----- CHECK IF SOMETHING IS A VECTOR -----")
(println (vector? [1 3 4])) ;=> true

(println " ----- CHECK IF SOMETHING IS A HASHMAP (MAP) -----")
(println (map? {:k1 4 :k2 "yep"})) ;=> true