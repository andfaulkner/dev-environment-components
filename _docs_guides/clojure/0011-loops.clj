;;###########################
;;#          LOOPS          #
;;###########################
(println " ***** LOOPS *****")

; recur
; loop

(loop [i 0]  
  (when (< i 5)
    (println i)    
    (recur (inc i)); loop i will take this value
))

(loop [j 0]
	(when (< j 5)
		(println (+ j 8))
		(recur (inc j))))
