(defmacro log-with-fish
  [msg]
  `(println (str "fish: " ~msg)))

(defmacro logged-by-fish
  [msg]
  `(println (str "\"" (clojure.string/capitalize ~msg) "\", said the fish.")))
  ; `(println (str ~msg ", said the fish")))

(logged-by-fish "request failed due to invalid parameters")
; => "Request failed due to invalid parameters", said the fish.
