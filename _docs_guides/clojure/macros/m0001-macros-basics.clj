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


;;######################################################
;;#          EXPAND MACROS (MOSTLY TO DEBUG?)          #
;;######################################################
(println " ***** EXPAND MACROS (MOSTLY TO DEBUG?) ***** ")

(println (macroexpand '(noop))) ; #=> nil

(println (noop 3 1 23 4))