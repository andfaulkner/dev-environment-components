(ns this-file-namespace)
; namespace is defined at the top of the file, as seen above

;;################################
;;#          NAMESPACES          #
;;################################
(println " ***** NAMESPACES *****")
(println " ----- CORE NAMESPACE: clojure.core. Contains println (clojure.core/println) -----")
(clojure.core/println "hi!")	;	#	=> hi!		<<<< Identical behaviour to println
; fully-qualified name of println is clojure.core/println. Does the same thing as println.

; fully-qualified names are written namespace/symbol
; all clojure.core functions are available without the fully qualified name

;;#########################################
;;#          REQUIRING LIBRARIES          #
;;#########################################
(println " ***** REQUIRING LIBRARIES *****")

(println " ----- REQUIRE A LIBRARY (string library in this case) -----")
(require '[clojure.string :as str])

(println " ----- USE A FUNCTION IN A REQUIRE'D LIBRARY -----")
(println (str/split "hello there" #" ")) ; # => [hello there]
