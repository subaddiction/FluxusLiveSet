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
		(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")
		(pdata-map! (lambda (p) (vector 0 0 0)) "p")
		(pdata-map! (lambda (vel) (vector 0 0 0)) "vel")	
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
		(lambda (vel) (vadd vel (vector 0 (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)))))
	)
)

(define (psys3VelReset)
	(with-primitive prtclSys3
		(lambda (vel) (vadd vel (vector (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)) 0)))
	)
)

(define (psys4VelReset)
	(with-primitive prtclSys4
		(lambda (vel) (vadd vel (vector (* velGain (rndval) (gh 0)) 0 (* velGain (rndval) (gh 0)))))
	)
)



; Primitives movement
(define (pulse base_dir shapeOne shapeTwo shapeThree pulseRedLightness pulseGreenLightness pulseBlueLightness pulseScale pulseRotX pulseRotY pulseRotZ)
    
    ;Detect peaks density
    (beatDetect)
    
    ; Include keybindings
    (load (string-append base_dir "lib/keys.scm"))

    
    
    ;manipulate particle systems pdata
    	
    	
	(with-primitive prtclSys
	    	
	    	(rotate (vector (* 0.01 (gh 0) pulseRotX) (* 0.01 (gh 0) pulseRotY) (* 0.01 (gh 0) pulseRotZ)))
	    	
	    	;Colorize particles
	    	(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8) 1)) "c")
	    	
		; update the velocities
		(pdata-map! 
		   (lambda (vel) (vadd vel (vector (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)))))
		   "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        )
        
        
        
        (with-primitive prtclSys2
        	
	    	(rotate (vector 0 (/ (gh 0) 3) (/ (gh 0) 6)))
	    	
	    	;Colorize particles
	    	;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	    	(pdata-map! (lambda (c) (vmul prtclSys2Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector 0 (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)))))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        ) 
        
        
        
        (with-primitive prtclSys3
        	
	    	(rotate (vector (/ (gh 0) -3) (/ (gh 0) 6) 0))
	    	
	    	;Colorize particles
	    	(pdata-map! (lambda (c) (vmul prtclSys3Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector (* velGain (rndval) (gh 0)) (* velGain (rndval) (gh 0)) 0)))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        )
        
        
        
        (with-primitive prtclSys4
        	
	    	(rotate (vector (/ (gh 0) -6) 0 (/ (gh 0) -3)))
	    	
	    	;Colorize particles
	    	(pdata-map! (lambda (c) (vmul prtclSys4Color (* .1 (gh 0)))) "c")
	    	
		; update the velocities
		(pdata-map! 
		    (lambda (vel) (vadd vel (vector (* velGain (rndval) (gh 0)) 0 (* velGain (rndval) (gh 0))))) ; (* .01 (rndval) (gh 0))
		    "vel")

		; update the positions
		(pdata-map! vadd "p" "vel")
        
        ) 
        
        ;;;;; EOF PARTICLES
        
        ; Set refernce scaling
        (scale (vector 0.0001 0.0001 0.0001))
        
        
        ; Animate shapes
        (scale (vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale)))
        
        (translate (vector (* 0.01 pulseRotX (gh 4)) (* 0.01 pulseRotY (gh 4)) (* 0.01 pulseRotZ (gh 4))))
        
        
        ;SHAPE 1
        (set! accumRot0 (vadd accumRot0 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        (rotate accumRot0)
        
        (colour (vector (* (gh 0) pulseRedLightness) (* (gh 2) pulseGreenLightness) (* (gh 4) pulseBlueLightness)))
        
        (if (> nucleus 0)
        	(draw-instance shapeOne)
        	(set! nucleus 0)
        )
        
        ;SHAPE 2
        (set! accumRot1 (vadd accumRot1 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        (rotate accumRot1)
        
        (colour (vector (* (gh 4) pulseRedLightness) (* (gh 2) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
        (draw-instance shapeTwo)
        
        ;SHAPE 3
        (set! accumRot2 (vadd accumRot2 (vector (* .06 (gh 0) pulseRotX) (* .06 (gh 0) pulseRotY) (* .06 (gh 0) pulseRotZ))))
        (rotate accumRot2)
	
        (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
        (draw-instance shapeThree)
        
        
        ;(begin (display (gh 0)) (newline))
        ;(begin (display metronome) (newline))
        ;(begin (display time) (newline))
        ;(begin (display delta) (newline))
        ;(begin (display peaksDensity) (newline))
        
        ;(begin (display lastTimeframePeaks) (newline))
        ;(begin (display beatThreshold) (newline))
        
        ;(begin (display psysInterference) (newline))
    
)
