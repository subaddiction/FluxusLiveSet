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

; Primitive movement
(define (pulse base_dir shapeOne shapeTwo shapeThree pulseRedLightness pulseGreenLightness pulseBlueLightness pulseScale pulseRotX pulseRotY pulseRotZ)
    
    ; Include keybindings
    (load (string-append base_dir "lib/keys.scm"))

    
    ; Put everything else 25 forward
    (scale (vector 0.0001 0.0001 0.0001))
    (translate (vector 0 0 50))
    
        (with-primitive shapeOne (translate (vector 0 1000 0)))
        (with-primitive shapeTwo (translate (vector 0 1000 0)))
        (with-primitive shapeThree (translate (vector 0 1000 0)))
        
        
        ; Animate shapes
        (scale (vector (* (gh 0) pulseScale) (* (gh 0) pulseScale) (* (gh 0) pulseScale)))
        
        (translate (vector (* 0.01 pulseRotX (gh 4)) (* 0.01 pulseRotY (gh 4)) (* 0.01 pulseRotZ (gh 4))))
        
        
        (rotate (vector (- (* 1.5 (gh 8) pulseRotX) 0.75) (- (* 3 (gh 0) (sin (time)) pulseRotY) 1.5) (- (* 0.3 (gh 8) pulseRotZ) 0.15)))
        (rotate (vector (gh 16) (gh 16) (gh 16)))
        
        ;(with-primitive shapeOne (hide 0))
        (colour (vector (* (gh 0) pulseRedLightness) (* (gh 2) pulseGreenLightness) (* (gh 4) pulseBlueLightness)))
        (draw-instance shapeOne)
        
    
        (rotate (vector (* 6 (gh 0) pulseRotX) (* 6 (gh 0) pulseRotY) (* 6 (gh 0) pulseRotZ)))
        
        (rotate (vector (* (gh 0) pulseRotZ) (* (gh 0) pulseRotY) (* (gh 0) pulseRotX)))
        
        ;(with-primitive shapeTwo (hide 0))
        (colour (vector (* (gh 4) pulseRedLightness) (* (gh 2) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
        (draw-instance shapeTwo)
        
        
        ;(rotate (vector 0 -90 0))
        (rotate (vector (* 6 (gh 1) pulseRotY) (* 6 (gh 1) pulseRotZ) (* 6 (gh 1) pulseRotX)))
        
        ;(with-primitive shapeThree (hide 0))
        (colour (vector (* (gh 2) pulseRedLightness) (* (gh 4) pulseGreenLightness) (* (gh 0) pulseBlueLightness)))
        (draw-instance shapeThree)
    
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


