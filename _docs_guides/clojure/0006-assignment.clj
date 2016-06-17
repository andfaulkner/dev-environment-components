
; SAMPLE DATA
(def dog-list ["meeka" "callie" "jake" "squeaker"])

;------------------------------------------------------------------------------
; let
; assign var within new scope, return a value

; basic
(println (let [x 88] x))


; return a vector
(println (let [[meeksy & dogs] dog-list]
  [meeksy (map #(str % " the dog") dogs)]))

; => ["meeka" ("callie the dog" "jake the dog" "squeaker the dog")]

; return a list
(println (let [[meeksy & dogs] dog-list]
  (map #(str % " the dog")
    dogs)))
; => ("callie the dog" "jake the dog" "squeaker the dog")


(let [x 88] 
  x)

(println (let [[meeksy & dogs] ["meeka" "callie" "jake"]]
  (get dogs 1)))
