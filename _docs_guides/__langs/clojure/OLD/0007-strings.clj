;;##################################
;;#          MAKE STRINGS          #
;;##################################
(println " ***** MAKE STRINGS *****")

(println " ----- MAKE A STRING LITERAL -----")
(println "This string is 'literally' defined, no function used")

(println " ----- MAKE A STRING WITH A FUNCTION -----")
(println (str "asdf" "...yay!" " great string moo!"))	; # => asdf...yay! great string moo!

(println " ----- GET STRING LENGTH -----")
(println (count "this is a string"))	;	# => 16

;;######################################################
;;#          CLOJURE STRING LIBRARY FUNCTIONS          #
;;######################################################
(println " ***** CLOJURE STRING LIBRARY FUNCTIONS *****")

(println " ----- REQUIRE CLOJURE STRING LIBRARY -----")
(require '[clojure.string :as str])

(println " ----- SPLIT A STRING INTO AN ARRAY -----")
(println (str/split "apple,orange,carrot", #",")) ; # => [apple orange carrot]

(println " ----- JOIN AN ARRAY INTO A STRING -----")
(println (str/join ["apple", "orange", "carrot"])) ; # => appleorangecarrot

(println " ----- JOIN AN ARRAY INTO A STRING, WITH A DIVIDER -----")
(println (str/join ", " ["apple", "orange", "carrot"])) ; # => apple, orange, carrot

;;####################################
;;#          STRING REPLACE          #
;;####################################
(println " ***** STRING REPLACE *****")


(println " ----- REPLACE PART OF A STRING -----")
(println (str/replace "Hello everybody!" "Hello", "Aloha")) ; # => Aloha everybody!

(println " ----- REMOVE MULTIPLE CHARACTERS IN A STRING -----")
(def spec-chars-str "Hello! Is a bear in here??? A bear's in here!!! #$%^")

(println (str/replace spec-chars-str #"['!?#$^%]" "")) ; => Hello Is a bear in here A bears in here

(println " ----- REPLACE MULTIPLE CHARS IN A STRING -----")
(println (str/replace spec-chars-str #"a|b" {"a" "1" "b" "2"}))
	; => Hello! Is 1 2e1r in here??? A 2e1r's in here!!! #$%^

(println " ----- REPLACE MULTIPLE CHARS & A SEQUENCE IN A STRING -----")
(println (str/replace spec-chars-str #"a|b|ello" {"a" "1" "b" "2" "ello" "i"}))
	; => Hi! Is 1 2e1r in here??? A 2e1r's in here!!! #$%^

(println " ----- REPLACE MULTIPLE CHARS IN A STRING - W/ SPECIAL ESCAPED CHARS -----")
(println (str/replace spec-chars-str 
											#"!!!|!|\?\?\?|\$" 
											{"!!!" "." 
											 "!" "." 
											 "???" "?" 
											 "$" "DD"}))
	; => Hello. Is a bear in here? A bear's in here. #DD%^

;;####################################
;;#          CAPITALIZATION          #
;;####################################
(println " ***** CAPITALIZATION *****")

(println " ----- MAKE STRING UPPERCASE -----")
(println (str/upper-case "this was initially lowercase")) ; => THIS WAS INITIALLY LOWERCASE

(println " ----- MAKE STRING LOWERCASE -----")
(println (str/lower-case "THIS WAS INITIALLY UPPERCASE")) ; => this was initially uppercase

(println " ----- CAPITALIZE A STRING -----")
(println (str/capitalize "this was initially all lowercase")) ; => This was initially all lowercase

(println " ----- TITLE-CASE A STRING -----")
(defn title-case 
	([my-str] (str/join " " 
 											(map str/capitalize 
 													 (str/split my-str 
 																			#" ")))))
(defn snake-case [my-str joiner] 
	(str/replace (str/join "_" 
						(map str/lower-case 
								 (str/split my-str 
 														#" "))) "'" ""))
(println (title-case "this was initially Not Title case")) ; => This Was Initially Not Title Case
(println (snake-case "this wasn't initially snake case" "_")) ; => this_wasn't_initially_snake_case


; AWESOME:   http://clojure-doc.org/articles/cookbooks/strings.html
;								--- lots of great string tips, info, recipes, features, commands, etc. here