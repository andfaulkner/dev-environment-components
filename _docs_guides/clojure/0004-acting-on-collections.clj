;----------------------------------------------------------
; map operation

(println (map inc [0 1 2 3 4]))
; => [1 2 3 4 5]

; NOTE: inc ups each val by 1

; ; map on multiple collections at once
; TODO

;----------------------------------------------------------
; reduce operation

(println (reduce + [1 3 2 4 5 6 7]))
; => 28


;----------------------------------------------------------
; join arrays of strings
(println (clojure.string/join ", " ['a, 'b 'c 'd 'e 'f 'g]))
; => a, b, c, d, e, f, g

; check if string blank
(println (clojure.string/blank? "   "))

; reverse and capitalize a string
(println (clojure.string/capitalize (clojure.string/reverse "ffulf fo llab a si akeem")))

;----------------------------------------------------------
; check if collection is empty
(println (empty? []))
; => true

; add item to start of collection
(println (cons 0 '(2 3 6)))
; => (0 2 3 6)



;------------------------------------------------------------------------------
; range
(println (range 10))
; => (0 1 2 3 4 5 6 7 8 9)

(println (range 10 30))
; => (10 15 20 25)

(println (range 10 30 5))
; => (10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29)

;------------------------------------------------------------------------------
; SUGAR FUNCTIONS FOR REPL

(defn third [arr] (first (next (next arr))))

