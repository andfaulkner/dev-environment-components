;------------------------------------------------------------------------------
; rearranging syntax

(defmacro infix
  "use when you want to feel like you're using Ruby or Javascript again"
  [all-args]
  (list (second all-args) (first all-args) (last all-args 2)))

(println (infix (2 + 9)))

;------------------------------------------------------------------------------
; basic basic basic macros
; create a 
(defmacro assert-equals
  [actual expected]           ; take 2 args. Can take any number, however
  (list '= expected actual))  ; output code that rearranged them.
                              ; Note: '= becomes =. Prevents compile-time evaluation


;------------------------------------------------------------------------------
; debug macro -- recursively expand all

(println (macroexpand '(assert-equals 1 3)))
; => (= 3 1)


(defmacro assert-equals [actual expected]
  `(when-not (= ~actual ~expected)
    (throw
      (AssertionError.
        (str "Expected " ~expected " but was " ~actual)))))


