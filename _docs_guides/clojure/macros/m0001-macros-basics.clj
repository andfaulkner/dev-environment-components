;; MACROS
;; like functions which take as arguments regular Clojure code and return transformed Clojure code
;; purpose: add new syntax to the language

; (require '[clojure.Thread :as Thread])

;;############################
;;#          MACROS          #
;;############################
(println " ***** MACROS *****")

(println " ----- DEFINE A MACRO -----")

(defmacro infix
  "Use this macro when you pine for the notation of your childhood"
  [infixed]
  (list (second infixed) (first infixed) (last infixed)))

(println " ----- USE A DEFINED MACRO -----")
(println (infix (1 + 4)))

(println " ----- DEFINE A FUNCTION - AKA __NOT__ A MACRO -----")
(defn third	[list-with-three-or-more]
	(nth list-with-three-or-more 2))

(println " ----- RUN THE FUNCTION AKA __NOT__ A MACRO -----")
(println (third '(1 4 5)))

(println " ----- DEFINE A MACRO WHOSE VALUE IS THE TIME OF COMPILE-TIME EVALUATION -----")
(defmacro build-time []
	(str (java.util.Date.)))
; # => Mon Jan 18 23:09:50 EST 2016

(println " ----- DEFINE A FUNCTION - WHICH CAN ONLY GIVE TIME OF RUNTIME EVALUATION -----")
(defn run-time []
	(str (java.util.Date.)))

(println (build-time))
(future (Thread/sleep 10000) (println (run-time)) 100)
; # => Mon Jan 18 23:10:00 EST 2016		<<< note that the time it gives is 10s after the macro time


; see http://www.lispcast.com/when-to-use-a-macro