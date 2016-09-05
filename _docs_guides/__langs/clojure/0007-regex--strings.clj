;------------------------------------------------------------------------------
; split string on lines

(require '[clojure.string :as str])

(println (str/split-lines "test \n string that is \n multiple lines"))
; => [test   string that is   multiple lines]

(println (count (str/split-lines "test \n string that is \n multiple lines")))
; => 3


;------------------------------------------------------------------------------
; REGEX:: return first match on a string

(println (re-find #"poop-[a-zA-Z]*" "poop-stick in a poop-tree"))
; => "poop-stick"

;------------------------------------------------------------------------------
; REGEX:: return ALL matches in a string
(println (re-seq #"poop-[a-zA-Z]*" "poop-stick in a poop-tree"))
; => ("poop-stick", "poop-tree")

;------------------------------------------------------------------------------
; REGEX:: return full string if given regex matches the entire string

(println (re-matches #"poop-.*" "poop-stick in a poop-tree"))
; => "poop-stick in a poop-tree"

(println (re-matches #"^poop-[a-zA-Z]*" "poop-stick in a poop-tree"))
; => nil    <<< it must match the WHOLE string



