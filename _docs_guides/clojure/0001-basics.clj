; (-main)::     core of clojure program: autoruns when project runs. Same as Java's main.
(-main)
; => ...whatever is defined in this function -- you have to make it yourself

; println::     print a line
(println "this will output")
; => this will output

; do::          Evaluates the expressions in order and returns the value of the last
(do 
  (println "LOG: DO TEST RAN!")
  (+ 1 1))
; => LOG: DO TEST RAN!
; => 2

(do)
; => nil

; Array literals::  [1 2 3 4 5]
[1 2 3 4]
; => [1 2 3 4]

