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
; filter
(println (filter odd? (range 10)))



;------------------------------------------------------------------------------
; juxt
;
; takes fns as args
; returns vector w/ result of applying each fn to all args passed to
; juxt s-expr, from left-to-right

(println ((juxt first last) [1 2 3 4 5]))
; => [1 5]

;use to get multiple keys from a hash
(println ((juxt :age :name) {:name "meeka" :age 5 :is-fluffy true :floppy-ears true}))
; => [5 meeka]

; use to "explode" a value (a la JS destructuring assignment into object literals
; e.g. { age: 10, name: "meeka", "isDog", "floppyEars", breed: "German Shepweiler"}),
;    ...which auto-adds isDog:"isDog", floppyEars: "floppyEars"
; juxt can something similar to a keyword
(println ((juxt identity name) :floppy-ears))
; => [:floppy-ears floppy-ears]

; can be used to split sequences
(println ((juxt take drop) 5 [1 "two" 3 "four" 5 6 "seven" 8 "nine" 10 "eleven" 12]))
; => [(1 two 3 four 5) (6 seven 8 nine 10 eleven 12)]


;------------------------------------------------------------------------------
; SUGAR FUNCTIONS FOR REPL

(defn third [arr] (first (next (next arr))))

