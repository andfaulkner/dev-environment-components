;----------------------------------------------------------
; if
; (if test
;   then-do-this
;   optionally-else-do-this)
(if true
  (printf "ONWARD!")
  (printf "fail :("))
; => ONWARD!

;----------------------------------------------------------
; do:::    wrap up multiple forms in parens and run each
(if true
  (do (println "WIN!")
      (println "WIN WIN WIN HA!"))
  (do (println "FAIL")
      "FAIL FAIL FAIL"))
; => WIN!
; => WIN WIN WIN HA!

;----------------------------------------------------------
; truthiness: regular items are truthy

(if "bears"
  (println "bears!")
  (println "no bears :("))
; => bears!

;----------------------------------------------------------
; binding to values
; bind an action
(def poop
  (println ["turd"] ["crap"] ["plop"]))

; run bound action
poop
; => [turd] [crap] [plop]

; bind a symbol
(def crap :pinchedloaf)

(println crap)
; => :pinchedloaf

;----------------------------------------------------------
; maps
; map literal
(println {:bear-one "grizzly" :bear-two "brown"})
; => {:bear-one grizzly, :bear-two brown}

; map to function
{"addemup" +}

; get value
(println (get {:bear-type-1 "mama" :bear-type-2 "baby"} :bear-type-1))
; => mama

; nested hashes / maps
(println (get {:a 0 :b 1 :c {:dd 2 :ee 3}} :c))
; => {:dd 2 :ee 3}

(println (get (get {:a 0 :b 1 :c {:dd 2 :ee 3}} :c) :dd))
; => 2

; get deep in nested hash / map
(println (get-in {:a 0 :b 1 :c {:dd 2 :ee 3}} [:c :dd]))
; => 2

; super-basic get from hash
(println ({:z 26 :y 25 :x 24} :y))
; => 25

(println (:y {:z 26 :y 25 :x 24}))
; => 25

; default value for hash retrieval
(println (:r {:z 26 :y 25 :x 24} "rrrrr ooooo!"))
; => rrrrr ooooo!


;----------------------------------------------------------
; vectors
(println [1 2 3 4 5])
; => [1 2 3 4 5]

(vector "gr" "arg" "grrrrrrr")

; retrieve item based on index. Note: 0-indexed
(println ([22 23 24 25] 1))
; => 23

; add item to end of vector
(println (conj [1 2 3] 4))
; => [1 2 3 4]

;----------------------------------------------------------
; lists

(println '(1 2 3 4))
; => (1 2 3 4)

;----------------------------------------------------------
; Sets
(println (hash-set 1 1 2 2))
; => #{1 2}

; make set from existing list
(println (set [3 3 3 4 4]))
; => #{4 3}

; check if set contains something
(println (contains? (set [1 2 3 3 444 1 2]) 3))
; => true

(println #{"ok"})
; => #{ok}

(get #{:a :b} "kurt vonnegut")
; => nil

;----------------------------------------------------------
; or

(println (or poop +) 2 3 4)
; => true

(println ((or + -) 12 3 4))
; => 19

;----------------------------------------------------------
; and
(println (and true false))
; => false

(println ((and (= 1 1) +) 1 2 3))
; => 6     <<< returns & runs last function on args

;----------------------------------------------------------
; map operation

(println (map inc [0 1 2 3 4]))
; => [1 2 3 4 5]

; NOTE: inc ups each val by 1

;----------------------------------------------------------
; reduce operation

(println (reduce + [1 3 2 4 5 6 7]))
; => 28


;------------------------------------------------------------------------------
; loops
; all recursive

; basic loop - takes one arg, gives default val of 1, keeps going until 5 is reached
(loop [x 1]
  (when (<= x 5)
    (println x)
    (recur (+ x 1))))

; Fibonacci. Because recursion & functional programming tradition.
(loop [x 1                                 ; loop takes 2 args. 1st arg = x, 2nd = y. Default
       y 1]                                ; vals given, but each recur provides new vals.
  (when (<= x 2000)                        ; prevents looping forever
    (println (str "x: " x ";  y: " y))     ; output current values of x and y
    (recur y                               ; for next iteration: x is now equal to y;     and
          (+ x y))))                       ;                     y is now equal to x + y

; Another Fibonacci, this time building a list
(loop [fib-list [0 1]]
  (println fib-list)
  (when (< (count fib-list) 20)
    (recur (conj fib-list 
                 (+ (last fib-list) 
                    (second (rseq fib-list)))))))


