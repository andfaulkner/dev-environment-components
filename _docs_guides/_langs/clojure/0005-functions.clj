
;----------------------------------------------------------
; define functions
(defn woohoo
  "express extreme excitement" ; built-in documentation - docstring
  [name]
  (str "yay! hooray! " name " said, for virtually no reason"))

(println (woohoo "meeka"))
; => yay! hooray! meeka said, for virtually no reason

;----------------------------------------------------------
; varargs function
(defn add-multiple
  "add as many parameters as you'd like"
  [& values]
  (reduce + values))

(println (add-multiple 1 3 2 5 4 2 1))
; => 18

;----------------------------------------------------------
; destructuring - get individual items from vector passed in as argument based on order given
(defn return-first-item-in-vector
  "Return only the first item in a given vector"
  [[first-item-provided]]
  first-item-provided)

(println (return-first-item-in-vector [23 12 43 234 "shouldn't be visible in return"]))

;----------------------------------------------------------
; partial functions

(defn add-2-numbers
  "add two numbers together"
  [num-1 num-2]
  (+ num-1 num-2))

; note that you can't use defn here - defn only allowed if you define args etc.
(def add-10
  (partial add-2-numbers 10))

(println (add-10 14))
; => 24

;----------------------------------------------------------
; apply
; same as in js
(println (apply add-2-numbers [2 3]))
; => 5

;------------------------------------------------------------------------------
; lambda shorthand
; #(...)     is shorthand for   (fn [arg1 arg2 ...] (...))
;            or perhaps         (fn [args] (...))
;
; number of args depends on how many % are in the function. thus...e.g.
; #(%)       is shorthand for   (fn [arg1] arg1)
;
(println (#(+ 2 %) 2))
; => 4

(#(+ %1 %2) 2 5)
; => 7

(#(map inc %&) 4 9 1)
; => (5 10 2)

(#(reduce + (map inc %&)) 4 9 1)
; => 17

; (#(map #(+ % 2) ((map inc %&) 4 9 1)))
; = error, because you can't nest #()s

;------------------------------------------------------------------------------
; -> and ->> operators (threading macros: thread-first, thread-last)

(defn inc2
  "add 2 to each item in list"
  [& coll]
  (map #(+ % 2) coll))

(defn inc9
  "add 9 to each item in list"
  [& coll]
  (map #(+ % 9) coll))

(defn turn-to-swears
  "Turn letter into swear word, if a swear word exists starting with that letter"
  [array-of-chars]
  (map
    #(cond
      (or (= (clojure.string/lower-case %) "f") (= (clojure.string/lower-case %) "fuck")) "fuck"
      (or (= (clojure.string/lower-case %) "s") (= (clojure.string/lower-case %) "shit")) "shit"
      (or (= (clojure.string/lower-case %) "a") (= (clojure.string/lower-case %) "asshole")) "asshole"
      :else (str % "::not_a_swear"))
    array-of-chars))


(def turn-to-swear-words turn-to-swears)

(-> "i o e f a"
  .toUpperCase
  (clojure.string/replace "F" "!")
  (clojure.string/split #" ")
  turn-to-swears
  ((flip clojure.string/join) ", "))
; => "I::not_a_swear, O::not_a_swear, E::not_a_swear, !::not_a_swear, asshole"

-



;------------------------------------------------------------------------------
; flip function arguments
(defn flip [func] 
  (fn 
    ([] (func))
    ([a1] (func a1))
    ([a1 a2] (func a2 a1)) 
    ([a1 a2 a3] (func a3 a2 a1)) 
    ([a1 a2 a3 a4] (func a4 a3 a2 a1)) 
    ([a1 a2 a3 a4 & rest]
        (->> rest
            (concat [a1 a2 a3 a4])
            reverse
            (apply func)))))

; usage:
((flip /) 9 3)
; => 1/3

;-------------------------------------------- ^:dynamic --------------------------------------------
; Instruction to the Clojure compiler that a symbol (as defined with def) is intended to be
; dynamically rebound (with binding)
; Note that it's not *great* practice most of the time
;  - higher-order functions tend to be a better pattern in most cases where you'd use it

; Example:
  (def ^:dynamic bar 10)
  (binding [bar 20] bar) ;; dynamically bind bar within the scope of the binding
    ; => 20
  bar ;; check underlying value of bar (outside the binding)
    ; => 10

;; Any functions called within the binding will see the modified value of bar (20)
;; ...while other threads will still see the unchanged root value of 10

; Without dynamic, this would fail - e.g.:
; (def foo 1)
; (binding [foo 2] foo)
  ; => 'IllegalStateException Can't dynamically bind non-dynamic var'
