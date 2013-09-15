(clear)

(start-audio "alsa_pcm:capture_1" 1024 44100)
(gain 1)

(desiredfps 24)

;(every-frame (begin (display (gh 0)) (display " - ") (display (gh 1)) (display " - ") (display (gh 2)) (display " - ") (display (gh 3)) (newline)))
;(define testocrew (with-state (build-extruded-type "FreeSans.ttf" "Visual Reactions" 1)))

(osc-source "8080")
(every-frame
    (with-state
;	      (when (osc-msg "/touch")
;		 (display (osc 0))(newline)
;		 (display (osc 1))(newline)
;	      )
;	      
;	      (when (osc-msg "/acc")
;		 (display (osc 0))(newline)
;		 (display (osc 1))(newline)
;		 (display (osc 2))(newline)
;	      )
;	      
;	      (when (osc-msg "/ori")
;		 (display (osc 0))(newline)
;		 (display (osc 1))(newline)
;		 (display (osc 2))(newline)
;		 
;		 
;		 
;	      )
	      
	      (when (osc-msg "/")
	         (display "OSC EVENT:")(newline)
		 (display (osc 0))(newline)
	      )
      
      (draw-cube)
      
      
      
      )
     
     
     
     )

