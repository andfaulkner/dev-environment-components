;; MACROS
;; like functions which take as arguments regular Clojure code and return transformed Clojure code
;; purpose: add new syntax to the language

; (require '[clojure.Thread :as Thread])

;;############################
;;#          MACROS          #
;;############################
(println " ***** MACROS *****")

(println " ----- DEFINE A NOOP MACRO (MOST BASIC MACRO POSSIBLE) TAKING VARARGS -----")
(defmacro noop [& args]
	nil)

(println " ----- USE NOOP MACRO -----")
(println (noop 54 1 2 "asdf" "vg" -32))	; => nil

(println " ----- DEFINE A +2 INCREMENTER MACRO - WITH A WORD A FUNCTION WOULDN'T ALLOW -----")
(defmacro ++2 [n]
	(list + n 2))

(println " ----- USE +2 INCREMENTER MACRO -----")
(println (++2 4))	; => 6

(println " ----- DEFINE A MACRO THAT LETS YOU USE INFIX NOTATION ON 3 ITEMS -----")
(defmacro infix
  "Use this macro when you pine for the notation of your childhood"
  [infixed]
  (list (second infixed) (first infixed) (last infixed)))

(println " ----- USE INFIX MACRO -----")
(println (infix(3 + 2)))

(println "\n")
;;###################################################
;;#          CONTRAST MACROS AND FUNCTIONS          #
;;###################################################
(println " ***** CONTRAST MACROS AND FUNCTIONS *****")

(println "=================== IDENTICAL MACRO & FUNCTION:: ==================")
(println " ----- DEFINE A FUNCTION - AKA __NOT__ A MACRO - TO GET THE 3rd ITEM FROM A LIST -----")
(defn third	[list-with-three-or-more]
	(nth list-with-three-or-more 2))

(println " ----- RUN THE 3rd ITEM FROM LIST FUNCTION (AKA __NOT__ A MACRO) -----")
(println (third '(4 1 9 "ver")))	; => 9

(println " ----- DEFINE A MACRO TO GET THE 3rd ITEM FROM A LIST -----")
(defmacro third2 [list-with-three-or-more]
	(list nth list-with-three-or-more 2))

(println " ----- RUN THE 3rd ITEM FROM LIST MACRO -----")
(println (third2 '(4 1 9 "ver")))	; => 9
(println "===================================================================")


;;############################################################################
;;#          MACROS FOR GETTING VALUES ONLY AVAILABLE AT BUILD-TIME          #
;;############################################################################
(println " ***** MACROS FOR GETTING VALUES ONLY AVAILABLE AT BUILD-TIME *****")

(println " ----- DEFINE A MACRO WHOSE VALUE IS THE TIME OF BUILD-TIME EVALUATION -----")
(defmacro build-time []
	(str (java.util.Date.)))

(println " ----- DEFINE FUNCTION 2 GET RUN-TIME (FNs CAN ONLY SEE RUN-TIME, NOT BUILD-TIME) -----")
(defn run-time []
	(str (java.util.Date.)))

(println " ----- RUN MACRO WHOSE VALUE IS THE TIME OF BUILD-TIME EVALUATION -----")
(println (build-time))
; # => Mon Jan 18 23:09:50 EST 2016

(println " ----- RUN FUNCTION THAT GIVES RUN-TIME, W/ DELAY TO SHOW THE DIFF FROM THE MACRO -----")
(future (Thread/sleep 5000) (println (run-time)) 100)
; # => Mon Jan 18 23:09:55 EST 2016		
				; note that the time it gives is 10s after the macro time. Also note that it
				; doesn't appear within the heading, but at the bottom of the output, because
				; it takes so comparatively long to actually run. Clojure is asynchronous.

(println "\n")
;;#################################
;;#          TEST MACROS          #
;;#################################
(println " ***** TEST MACROS *****")
(defmacro +++ [arg] 
	(list + 1 arg))

(println (+++ 3)) ; => 4

; (defn ++++ [arg] (+ arg 1))
; (println (++++ 3 5))				<<<< doesn't work - a macro must be used for this

(defmacro --><-- [args]
	(list inc args))

(println (--><-- 5)) ; => 6

(defmacro ># [arg] (list println (str "\n***** " arg " *****")))
(defmacro >## [arg] (list println (str " ----- " arg " -----")))

(># "Heading 1")
(>## "Heading 2")

; see http://www.lispcast.com/when-to-use-a-macro


;------------------------------------------------------------------------------
;; Expand macros (mostly to debug them)

(println (macroexpand '(noop))) ; #=> nil

(println (noop 3 1 23 4))

;------------------------------------------------------------------------------
; Background

; Macros are evaluated before runtime. Program execution order:
;   macros expanded --> code executed (including macro-generated code)

; Remember: each item of code is a piece of data. e.g.
; (+ 1 2)   <<< a data structure containing 3 items: +, 1, and 2

; Code is data, and macros are data transformation operations done on this data

;------------------------------------------------------------------------------
; Key components

;-------------------------
; Quotes
;    Prevent code from being evaluated to work with it as data. i.e. flip the
;    interpreter into "data mode", treating the next s-exp as a data structure
;    rather than evaluating it right away.

'(+ 1 9)
; => (+ 1 9)

(quote (+ 1 9))
; => (+ 1 9)

;-------------------------
; Eval
;    Actually execute code stored as data

(def addition-op-1 '(+ 1 9))
(println addition-op-1)
; => (+ 1 9)

(eval addition-op-1)
; => 10

;-------------------------
; Syntax-quote & Unquote
;    Tells reader to treat expression as data (same as quote special form), but
;    it also fully qualifies all symbols, e.g. expanding + to clojure.core/+
;    Also allows for 'unquoting' parts of the expression via the ~

; replace nil with an empty string. Not actually that useful, Clojure handles nil just fine.
(defmacro de-nil
  [arg]
  `(cond
      (= ~arg nil) ""   ; tilde (~) causes arg to bind at runtime rather than compile-time 
      :else ~arg))

;-------------------------
; splicing unquote: ~@  
;   lets us eval an expression just like normal unquote, with 2 differences:
;     1) it expects result of eval to be a list or seq
;     2) the result gets spliced into the outer list the unquoted list was present in. 
;        E.g. it "explodes" the list sexp

;    I think of the ~@ here like a fuse attached to a Legend of Zelda-style bomb.
;    Compile-time lights the wick, but the bomb only explodes at runtime. This blasts
;    open one of the walls of the sexp, and the values escape into the sexp outside.
;    Together with their new friends they tear down their old sexp home, then they all
;    hold hands and sing kum-bae-yah, for they are a family now.

(defmacro one-two-and-some-grump
  [arg]
  `(list 1 2 ~arg)) ; => (1 2 (3 4))

(defmacro one-two-and-friends
  [arg]
  `(list 1 2 ~@arg))
; => (1 2 3 4)


;-------------------------
; gensym and #
; use # within ` to produce a gensym for each symbol automatically

(defmacro define-x-hygenically []
  `(do
     (def x# 2)
     (list x#)))


; (defn replace-underscore 
;   [form new-val]
;   (map #(cond (= % '_) new-val :else %) form))


; (defmacro ->>>
;   [init & forms]
;   (let [~(concat (list (replace-underscore (first ~forms) ~new-val) (rest ~forms))))

; (->>> 1
;   (+ _ 2)
;   (+ 3 _)
;   (- 50 _)
;   (/ _ 2))


;
; 
; *** IMPORTANT GOTCHA WITH MACROS ***
;   Variables used in a macro are bound at the point where the macro is
;   declared, NOT at the point where the macro is used
;
