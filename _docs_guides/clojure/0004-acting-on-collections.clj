;----------------------------------------------------------
; map operation

(println (map inc [0 1 2 3 4]))
; => [1 2 3 4 5]

; NOTE: inc ups each val by 1

;----------------------------------------------------------
; reduce operation

(println (reduce + [1 3 2 4 5 6 7]))
; => 28


;----------------------------------------------------------
; join arrays of strings
(println (clojure.string/join ", " ['a, 'b 'c 'd 'e 'f 'g]))
; => a, b, c, d, e, f, g
