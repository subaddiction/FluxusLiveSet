; Primitives switcher
(define (shapeSchema assignOne assignTwo assignThree)
    
    (set! shapeOne assignOne)
    
    (set! shapeTwo assignTwo)
    
    (set! shapeThree assignThree)
    
)

; Color switcher
(define (colorSchema Red Green Blue)

    (set! RedLightness Red)
    (set! GreenLightness Green)
    (set! BlueLightness Blue)
)

; Transformations intensity
(define (transformSchema S X Y Z)

    (set! Scale S)
    (set! RotX X)
    (set! RotY Y)
    (set! RotZ Z)
)

; Blur
;(define (setBlur midiValue)
;    (set! midiBlur midiValue)
;)






(define (btdReset)

	;FARE QUI ROBA CON RAPPORTO TRA lastTimeframePeaks e timeFrame
	(if (> lastTimeframePeaks (/ timeFrame 1.5))
		(blur 0) ; no blur when > 1/3 of peaks
		(blur 0.7) ; little blur when < 1/3 peaks
	)
	
	(if (> lastTimeframePeaks (/ timeFrame 2))
		(set! nucleus 1) ; no blur when > 1/3 of peaks
		(set! nucleus 0) ; little blur when < 1/3 peaks
	)
	
	(set! peaksDensity (/ lastTimeframePeaks timeFrame))
	
	(set! metronome 0)
	(set! lastTimeframePeaks 0)
)

;Beat detect for Particle system reset or direction switch
(define (beatDetect)
	
	(if (> metronome timeFrame)
	(btdReset)
	(set! metronome (+ 1 metronome))
	)
	
	;Utilizzare beatThreshold per contare presunti picchi su (gh 0) - negli ultimi 2 secondi
	(if (> (gh 0) beatThreshold) 
		(set! lastTimeframePeaks (+ 1 lastTimeframePeaks))
		(set! lastTimeframePeaks (+ 0 lastTimeframePeaks))
		)
)




;particle sysyem reset
(define (particlesReset System)
	(with-primitive System
		;(opacity 0)
		;(pdata-map! (lambda (vel) (vmul (rndvec) 2)) "vel")
		;(pdata-map! (lambda (p) (vmul (rndvec) 3)) "p")
		
		(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")
		
		(pdata-map! (lambda (p) (vector 0 0 0)) "p")
		(pdata-map! (lambda (vel) (vector 0 0 0)) "vel")
		;(pdata-map! (lambda (vel) (pdata-get "System" 0)) "vel")
		
		

	
	)
	
	(if (> psysInterference 0)
			(with-primitive prtclSys (pdata-map! (lambda (vel) (vmul (rndvec) 1)) "vel") )
			(set! psysInterference 0)
	)
)


(define (psysVelReset)
	(with-primitive prtclSys
		(pdata-map! (lambda (vel) (vmul (rndvec) 1)) "vel")	
	)
	
)

(define (psys2VelReset)
	(with-primitive prtclSys2
		(lambda (vel) (vadd vel (vector 0 (* .1 (rndval) (gh 0)) (* .1 (rndval) (gh 0)))))
	)
)

(define (psys3VelReset)
	(with-primitive prtclSys3
		(lambda (vel) (vadd vel (vector (* .1 (rndval) (gh 0)) (* .1 (rndval) (gh 0)) 0)))
	)
)

(define (psys4VelReset)
	(with-primitive prtclSys4
		(lambda (vel) (vadd vel (vector (* .1 (rndval) (gh 0)) 0 (* .1 (rndval) (gh 0)))))
	)
)



; Primitives movement
(define (pulse base_dir shapeOne shapeTwo shapeThree pulseRedLightness pulseGreenLightness pulseBlueLightness pulseScale pulseRotX pulseRotY pulseRotZ)
    
    ;Detect peaks density
    (beatDetect)
    
    ; Include keybindings
    (load (string-append base_dir "lib/keys.scm"))

    
    ; Set refernce scaling
    (scale (vector 0.0001 0.0001 0.0001))
    
    
    		;manipulate particle systems pdata
	    	(with-primitive prtclSys
	    	
	    	(rotate (vector (* 0.01 (gh 0) pulseRotX) (* 0.01 (gh 0) pulseRotY) (* 0.01 (gh 0) pulseRotZ)))
	    	
	    	;Colorize particles
	    	(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	    	
		; update the velocities
		(pdata-map! 
		   ;(lambda (vel) (vmul (rndvec) 1))
		   (lambda (vel) (vadd vel (vector (* 0.000001 (gh 8) pulseScale) (* 0.000001 (gh 8) pulseScale) (* 0.000001 (gh 8) pulseScale))))
		   ;(vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale))
		   "vel")

		; update the positions 
		; (add the velocities onto the positions)
		;(pdata-map! vadd "p" "vel")) 
		(pdata-map! vadd "p" "vel")
        )
        
        
        
        
        
        
        
        
        (with-primitive prtclSys2
        
		;(with-state (translate (vector 0 0 -5)))
	    	
	    	;(translate (vector 0 0 0))
	    	(rotate (vector 0 (/ (gh 0) 3) (/ (gh 0) 6)))
	    	;(rotate (vector (* 0.01 (gh 8) pulseRotX) (* 0.01 (gh 8) pulseRotY) (* 0.01 (gh 8) pulseRotZ)))
	    	
	    	;Colorize particles
	    	;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	    	(pdata-map! (lambda (c) (vmul prtclSys2Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector 0 (* .1 (rndval) (gh 0)) (* .1 (rndval) (gh 0))))) ; (* .01 (rndval) (gh 0))
		    
		    ;lambda (vel) (vadd vel (vector .1 .1 .1)))
		    ;(vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        ) 
        
        
        
        
        (with-primitive prtclSys3
        
		;(with-state (translate (vector 0 0 -5)))
	    	
	    	;(translate (vector 0 0 0))
	    	(rotate (vector (/ (gh 0) -3) (/ (gh 0) 6) 0))
	    	;(rotate (vector (* 0.01 (gh 8) pulseRotX) (* 0.01 (gh 8) pulseRotY) (* 0.01 (gh 8) pulseRotZ)))
	    	
	    	;Colorize particles
	    	;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	    	(pdata-map! (lambda (c) (vmul prtclSys3Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector (* .1 (rndval) (gh 0)) (* .1 (rndval) (gh 0)) 0))) ; (* .01 (rndval) (gh 0))
		    
		    ;lambda (vel) (vadd vel (vector .1 .1 .1)))
		    ;(vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        )
        
        
        
        
        
        
        (with-primitive prtclSys4
        
		;(with-state (translate (vector 0 0 -5)))
	    	
	    	;(translate (vector 0 0 0))
	    	(rotate (vector (/ (gh 0) -6) 0 (/ (gh 0) -3)))
	    	;(rotate (vector (* 0.01 (gh 8) pulseRotX) (* 0.01 (gh 8) pulseRotY) (* 0.01 (gh 8) pulseRotZ)))
	    	
	    	;Colorize particles
	    	;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	    	(pdata-map! (lambda (c) (vmul prtclSys4Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector (* .1 (rndval) (gh 0)) 0 (* .1 (rndval) (gh 0))))) ; (* .01 (rndval) (gh 0))
		    
		    ;lambda (vel) (vadd vel (vector .1 .1 .1)))
		    ;(vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        ) 
        
        
        
        
        
        
        
        
        
        
        ; Animate shapes
        (scale (vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale)))
        
        (translate (vector (* 0.01 pulseRotX (gh 4)) (* 0.01 pulseRotY (gh 4)) (* 0.01 pulseRotZ (gh 4))))
        
        
        ;NEW ROTATION - ADDITION
        ;(set! accumRot0 (vadd accumRot0 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        ;(rotate accumRot0)
        
        ;(rotate (vector (- (* 1.5 (gh 8) pulseRotX) 0.75) (- (* 3 (gh 0) (sin (time)) pulseRotY) 1.5) (- (* 0.3 (gh 8) pulseRotZ) 0.15)))
        ;(rotate (vector (* (gh 0) pulseRotX) (* (gh 0) pulseRotY) (* (gh 0) pulseRotZ)))
        

        
        ;(with-primitive shapeOne (hide 0))
        (colour (vector (/ (* (gh 0) pulseRedLightness) 12.7) (/ (* (gh 2) pulseGreenLightness) 12.7) (/ (* (gh 4) pulseBlueLightness) 12.7)))
        
        (if (> nucleus 0)
        		(with-state (rotate (vector 0 (- (* 1 (gh 0) (sin (time)) pulseRotY) .5) 0)) (draw-instance shapeOne))
        		(set! nucleus 0)
        )
        
        ;NEW ROTATION - ADDITION
        ;(set! accumRot1 (vadd accumRot1 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        (set! accumRot1 (vadd accumRot1 (vector (* .12 (gh 0) pulseRotX) (* .12 (gh 0) pulseRotY) (* .12 (gh 0) pulseRotZ))))
        (rotate accumRot1)
        
        ;(rotate (vector (* 6 (gh 0) pulseRotX) (* 6 (gh 0) pulseRotY) (* 6 (gh 0) pulseRotZ)))
        ;(rotate (vector (* (gh 0) pulseRotZ) (* (gh 0) pulseRotY) (* (gh 0) pulseRotX)))
        
        
        ;(with-primitive shapeTwo (hide 0))
        (colour (vector (/ (* (gh 4) pulseRedLightness) 12.7) (/ (* (gh 2) pulseGreenLightness) 12.7) (/ (* (gh 0) pulseBlueLightness) 12.7)))
        (draw-instance shapeTwo)
        
        ;NEW ROTATION - ADDITION
        (set! accumRot2 (vadd accumRot2 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        (rotate accumRot2)
        
        ;(rotate (vector 0 -90 0))
        ;(rotate (vector (* 6 (gh 1) pulseRotY) (* 6 (gh 1) pulseRotZ) (* 6 (gh 1) pulseRotX)))
        
        ;(with-primitive shapeThree (hide 0))
        (colour (vector (/ (* (gh 2) pulseRedLightness) 12.7) (/ (* (gh 0) pulseGreenLightness) 12.7) (/ (* (gh 4) pulseBlueLightness) 12.7)))
        (draw-instance shapeThree)
        
        
        ;(begin (display (gh 0)) (newline))
        ;(begin (display metronome) (newline))
        ;(begin (display time) (newline))
        ;(begin (display delta) (newline))
        ;(begin (display peaksDensity) (newline))
        
        ;(begin (display lastTimeframePeaks) (newline))
        ;(begin (display beatThreshold) (newline))
        
        (begin (display psysInterference) (newline))
    
)


;Mapping test
;;;;;(define (editMapper planeObject)
;;;;;    (set! editPlane planeObject)
;;;;;)

; Mapping basic shapes: a plane and a decorator

;;;;;(define mapper (build-plane))
;;;;;(with-primitive mapper (hide 1))
;;;;;;(define decorator (build-cube))
;;;;;;(define decorator (build-torus 1 1.2 16 16))
;;;;;(define decorator bigring)



;;;;;(with-primitive decorator (hide 1))

;;;;;(define (setDecorator customPrimitive)
;;;;;    (set! decorator customPrimitive)
;;;;;)



; Decoration generators

;(define (decorArrayL basePrim pulseRedLightness pulseGreenLightness pulseBlueLightness pulseScale pulseRotX pulseRotY pulseRotZ)
;	(with-state
;        (translate (vector 0 0 0.2))
;        (scale (vector 0.2 0.2 1))
;        ;(rotate (vector (* 6 (gh 1) pulseRotY) (* 6 (gh 1) pulseRotZ) (* 6 (gh 1) pulseRotX)))
;        (scale (vector (* 0.2 (gh 1)) (* 0.2 (gh 0)) 1))
;        (rotate (vector 0 0 (* 6 (gh 1) pulseRotX)))
;        (colour (vector (* (gh 0) pulseRedLightness) (* (gh 2) pulseGreenLightness) (* (gh 4) pulseBlueLightness)))
;        (draw-instance basePrim)
;        )
;)


;;;;;(define (decorArrayL basePrim clones)
;;;;;	
;;;;;	(cond ((not (zero? clones))
;;;;;		
;;;;;		;(scale (vector (* 1 (gh 0) Scale) (* 1 (gh 0) Scale) (* 1 (gh 0) Scale)))
;;;;;		
;;;;;		(with-state
;;;;;		
;;;;;		(translate (vector 0 0 0.2))
;;;;;		(scale (vector .75 .75 .75))
;;;;;		(rotate (vector (* 1 (gh 1) RotX) (* 1 (gh 1) RotY) (* 1 (gh 1) RotZ)))
;;;;;		(draw-instance basePrim)
;;;;;			
;;;;;			
;;;;;			
;;;;;			;(translate (vector (* 0.001 (gh 5)) (* 0.001 (gh 9)) 0))
;;;;;			
;;;;;			
;;;;;			
;;;;;			
;;;;;			
;;;;;			(colour (vector (* clones (gh 0) RedLightness) (* (/ clones 3) (gh 2) GreenLightness) (* clones (gh 4) BlueLightness)))
;;;;;			(decorArrayL basePrim (- clones 1)))	
;;;;;		)
;;;;;        )
;;;;;)


;;;;;;(define (draw-row count)
;;;;;;	(cond ((not (zero? count))
;;;;;;		(draw-cube)
;;;;;;		(translate (vector 1.1 0 0))
;;;;;;		(draw-row (- count 1)))
;;;;;;	)
;;;;;;)


;;;;;(define (decorArrayR basePrim clones)
;;;;;	
;;;;;	(cond ((not (zero? clones))
;;;;;		
;;;;;		;(scale (vector (* 10 (gh 0) Scale) (* 10 (gh 0) Scale) (* 10 (gh 0) Scale)))
;;;;;		
;;;;;		(with-state
;;;;;		(translate (vector 0 0 0.2))
;;;;;		(rotate (vector (* -1 (gh 1) RotX) (* -1 (gh 1) RotY) (* -1 (gh 1) RotZ)))
;;;;;		(scale (vector .75 .75 .75))
;;;;;		(draw-instance basePrim)
;;;;;			
;;;;;			
;;;;;			
;;;;;			;(translate (vector (* 0.001 (gh 5)) (* 0.001 (gh 9)) 0))
;;;;;			
;;;;;			(colour (vector (* clones (gh 0) RedLightness) (* (/ clones 3) (gh 2) GreenLightness) (* clones (gh 4) BlueLightness)))
;;;;;			(decorArrayR basePrim (- clones 1)))	
;;;;;		)
;;;;;        )
;;;;;)



;;;;;; Manual mapping


;;;;;(define (mappingSchema base_dir pulseRedLightness pulseGreenLightness pulseBlueLightness pulseScale pulseRotX pulseRotY pulseRotZ)
;;;;;    
;;;;;    ;(set-ortho-zoom 10)
;;;;;    ;(ortho)
;;;;;    
;;;;;    (load (string-append base_dir "lib/keys.scm"))
;;;;;    
;;;;;    
;;;;;    (with-state
;;;;;    
;;;;;    (translate (vector -8 0 0))
;;;;;    (rotate (vector 0 60 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    ;(scale (vector (* 1 (gh 0) Scale) (* 1 (gh 0) Scale) (* 1 (gh 0) Scale)))
;;;;;    (scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;    (translate (vector 0 0 .2))
;;;;;    (colour (vector (* (gh 1) pulseRedLightness) (* (gh 5) pulseGreenLightness) (* (gh 9) pulseBlueLightness)))
;;;;;    
;;;;;    	 (decorArrayL decorator 8)
;;;;;    )
;;;;;    
;;;;;    
;;;;;    
;;;;;    (with-state
;;;;;    (translate (vector 8 0 0))
;;;;;    (rotate (vector 0 -60 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    ;(scale (vector (* 1 (gh 0) Scale) (* 1 (gh 0) Scale) (* 1 (gh 0) Scale)))
;;;;;	(scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;	(translate (vector 0 0 .2))
;;;;;	(colour (vector (* (gh 1) pulseRedLightness) (* (gh 5) pulseGreenLightness) (* (gh 9) pulseBlueLightness)))
;;;;;	(decorArrayR decorator 8)
;;;;;    )
;;;;;    
;;;;;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;    
;;;;;    (with-state
;;;;;    (translate (vector -4 4 0))
;;;;;    (rotate (vector 0 -45 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    (scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    ;(draw-instance mapper)
;;;;;        (decorArrayL decorator 3)
;;;;;    )
;;;;;    
;;;;;    
;;;;;    
;;;;;    (with-state
;;;;;    (translate (vector 4 4 0))
;;;;;    (rotate (vector 0 45 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    (scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    ;(draw-instance mapper)
;;;;;        (decorArrayR decorator 3)
;;;;;    )
;;;;;    
;;;;;    
;;;;;    
;;;;;    (with-state
;;;;;    (translate (vector -4 -4 0))
;;;;;    (rotate (vector 0 -45 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    (scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    ;(draw-instance mapper)
;;;;;        (decorArrayL decorator 3)
;;;;;    )
;;;;;    
;;;;;    
;;;;;    
;;;;;    (with-state
;;;;;    (translate (vector 4 -4 0))
;;;;;    (rotate (vector 0 45 0))
;;;;;    (scale (vector 4 4 4))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    (draw-instance mapper)
;;;;;    
;;;;;    (scale (vector (* .005 Scale) (* .005 Scale) (* .005 Scale)))
;;;;;    (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
;;;;;    ;(draw-instance mapper)
;;;;;        (decorArrayR decorator 3)
;;;;;    )


;;;;;)


