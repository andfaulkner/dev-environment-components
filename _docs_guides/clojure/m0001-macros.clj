;------------------------------------------------------------------------------
; rearranging syntax

(defmacro infix
  "use when you want to feel like you're using Ruby or Javascript again"
  [all-args]
  (list (second all-args) (first all-args) (last all-args 2)))

(println (infix (2 + 9)))