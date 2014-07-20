; midi controls
(define baseScale 0.2)
(when (midi-peek)
	; Korg nano kontrol Scene 4 (custom)
	
	; knob 1
	(desiredfps (+ 1 (* 24 (midi-ccn 0 10))))
	
	; knob2 
	(gain (midi-ccn 1 10))
	
	; knob3
	(set! baseScale (* 100 (midi-ccn 2 10)))
	
	; knob4
	(set! beatThreshold (* 100 (midi-ccn 3 10)))
	
	; Fader 1 2 3 RGB
	(colorSchema (midi-ccn 0 7) (midi-ccn 1 7) (midi-ccn 2 7))
	
	; knob3 scale - Fader 456 Rotate
	;(transformSchema (* baseScale (midi-cc 2 10)) (- (* 36 (midi-ccn 3 7)) 18) (- (* 36 (midi-ccn 4 7)) 18) (- (* 36 (midi-ccn 5 7)) 18))
	(transformSchema (* baseScale (midi-cc 2 10)) (- (* 36 (midi-ccn 3 7)) 18) (- (* 36 (midi-ccn 4 7)) 18) (- (* 36 (midi-ccn 5 7)) 18))
	
)


; Testing calls
;;;(define (testConf)
;;;	(desiredfps 24)
;;;	(gain 0.5)
;;;	(set! baseScale 100)
;;;	(colorSchema 8 6 8)
;;;	(transformSchema 100 0 0 0)
;;;)
;;;(when (key-pressed ".") (testConf))


; Shape schemes
(when (key-pressed "q")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 0 0))
)

(when (key-pressed "w")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 1 1 0))
)

(when (key-pressed "e")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys4)
	(psys4VelReset)
	(set! prtclSys4Color (vector 0 1 0))
)

(when (key-pressed "r")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 .3 0))
)

(when (key-pressed "t")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector .3 0 1))
)

(when (key-pressed "y")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys4)
	(psys4VelReset)
	(set! prtclSys4Color (vector .5 1 0))	
)

(when (key-pressed "u")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector .5 .1 0))	
)

(when (key-pressed "i")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector .5 0 1))
)

(when (key-pressed "o")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys4)
	(psys4VelReset)
	(set! prtclSys4Color (vector .3 1 0))
)

(when (key-pressed "p")
	(shapeSchema 0 0 0)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 0 .3))
)


;;;;;;;;;;;;;;;;;;;;;;;


(when (key-pressed "a")
	(shapeSchema lion1 triangoliodd quadratifill)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 0 .5 1))
)

(when (key-pressed "s")
	(shapeSchema lion1 cerchiodd esagonifill)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 1 1 0))
)

(when (key-pressed "d")
	(shapeSchema lion1 quadratiodd triangolifill)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 1 0 1))
)

(when (key-pressed "f")
	(shapeSchema lion1 esagoniodd cerchifill)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 0 1 0))
)

(when (key-pressed "g")
	(shapeSchema lion1 triangolifill quadratiodd)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 1 0 0))
)

(when (key-pressed "h")
	(shapeSchema lion1 quadratifill esagoniodd)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector .5 0 1))
)

(when (key-pressed "j")
	(shapeSchema lion1 esagonifill quadratiodd)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 0 1 .3))
)

(when (key-pressed "k")
	(shapeSchema lion1 triangolifill cerchiodd)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector 1 .3 .3))
)

(when (key-pressed "l")
	(shapeSchema lion1 cerchifill esagoniodd)
;	(particlesReset prtclSys3)
;	(psys3VelReset)
;	(set! prtclSys3Color (vector .3 .3 1))
)


;;;;;;;;;;;;;;;;;;;;;;;


(when (key-pressed "z")
	(shapeSchema kube quadratifill triangoliodd)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 1 .5 0))
)

(when (key-pressed "x")
	(shapeSchema triA cerchiodd triangolifill)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 0 1 0))
)

(when (key-pressed "c")
	(shapeSchema hexA esagonifill quadratiodd)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 0 .5 1))
)

(when (key-pressed "v")
	(shapeSchema moleculeA triangoliodd esagoniodd)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 1 0 .5))
)

(when (key-pressed "b")
	(shapeSchema nautilus quadratiodd cerchiodd)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 1 1 0))
)

(when (key-pressed "n")
	(shapeSchema subaddiction quadratifill cerchifill)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 1 0 1))
)

(when (key-pressed "m")
	(shapeSchema subaddiction esagonifill triangolifill)
	
;	(with-primitive prtclSys2
;		;(texture (load-texture (string-append base_dir "textures/texture0.png")))
;		;(pdata-map! (lambda (c) (vector 1 0 0)) "c")
;		
;	)
;	(particlesReset prtclSys2)
;	(psys2VelReset)
;	(set! prtclSys2Color (vector 1 0 0))
)


(when (key-pressed ",")
;	(set! accumRot0 (vector 0 0 0))
;	(set! accumRot1 (vector 0 0 0))
;	(set! accumRot2 (vector 0 0 0))
	
;	(if (>= psysInterference 1)
;		(set! psysInterference 0)
;		(set! psysInterference 1)
;	)

	(set! psysInterference 1)
	
)

;(when (key-pressed "1")
;	(with-primitive prtcl01
;		(pdata-map! (lambda (vel) (vmul (rndvec) 2)) "vel")
;		(pdata-map! (lambda (p) (vmul (rndvec) 3)) "p")
;		(particlesReset prtcl01)
;		)
;	)

;particle sysytems

(when (key-pressed ".")
	(clear-texture-cache)
	
	(set! psysInterference 0)
	
	(with-primitive prtclSys
		(texture (load-texture ""))
	)
	
	(shapeSchema 0 0 0)
	
	(with-primitive prtclSys2
		(texture (load-texture ""))
	)
	(set! prtclSys2Color (vector 1 1 0))
	
	(with-primitive prtclSys3
		(texture (load-texture ""))
	)
	(set! prtclSys3Color (vector 1 0 0))
	
	(with-primitive prtclSys4
		(texture (load-texture ""))
	)
	(set! prtclSys4Color (vector 0 1 0))
	
	(particlesReset prtclSys)
	(psysVelReset)
	
	(particlesReset prtclSys2)
	(psys2VelReset)
	
	(particlesReset prtclSys3)
	(psys3VelReset)
	
	(particlesReset prtclSys4)
	(psys4VelReset)
)

(when (key-pressed "1")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture ""))
		;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "2")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture2.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "3")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture3.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "4")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture4.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "5")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture5.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "6")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture6.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "7")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture7.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "8")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture8.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "9")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture9.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "0")
	(shapeSchema 0 0 0)
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/texture0.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)




