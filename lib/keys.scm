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
	(shapeSchema WR_01 piramidiring triangolisphere)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 .5 1))
)

(when (key-pressed "w")
	(shapeSchema RAYNA_01 piramidisphere triangoliring)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 0 .5))
)

(when (key-pressed "e")
	(shapeSchema RAYNA_02 triangoloBig piramidiring)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 0 0))
)

(when (key-pressed "r")
	(shapeSchema wl_logo triangoliring triangoloBig)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 0 0 1))
)

(when (key-pressed "t")
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 .3 1))
	(shapeSchema pandapartyinner triangoloBig piramidiring)
)

(when (key-pressed "y")
	(shapeSchema pandapartyouter triangoloBig triangoliring)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 0 1 .3))	
)

(when (key-pressed "u")
	(shapeSchema partybass triangoliring piramidisphere)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 .5 0))	
)

(when (key-pressed "i")
	(shapeSchema partyeverynight piramidiring triangolisphere)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector .3 .5 1))
)

(when (key-pressed "o")
	(shapeSchema baila triangolisphere piramidiring)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector .3 1 .5))
)

(when (key-pressed "p")
	(shapeSchema wr_logo triangoliring piramidisphere)
	(particlesReset prtclSys4)
	(psys3VelReset)
	(set! prtclSys4Color (vector 1 1 .3))
)


;;;;;;;;;;;;;;;;;;;;;;;


(when (key-pressed "a")
	(shapeSchema yo triangoliring bigring)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 0 .5 1))
)

(when (key-pressed "s")
	(shapeSchema swagger piramidiring triangolisphere)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 1 1 0))
)

(when (key-pressed "d")
	(shapeSchema nautilus triangoliring piramidiring)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 1 0 1))
)

(when (key-pressed "f")
	(shapeSchema hexA smallring piramidiring)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 0 1 0))
)

(when (key-pressed "g")
	(shapeSchema triangolo bigring piramidisphere)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 1 0 0))
)

(when (key-pressed "h")
	(shapeSchema triangolo piramidiring triangolisphere)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector .5 0 1))
)

(when (key-pressed "j")
	(shapeSchema triA bigring triangoliring)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 0 1 .3))
)

(when (key-pressed "k")
	(shapeSchema triB triangoliring piramidiring)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector 1 .3 .3))
)

(when (key-pressed "l")
	(shapeSchema triC piramidisphere triangolisphere)
	(particlesReset prtclSys3)
	(psys3VelReset)
	(set! prtclSys3Color (vector .3 .3 1))
)


;;;;;;;;;;;;;;;;;;;;;;;


(when (key-pressed "z")
	(shapeSchema kube smallring bigring)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 .5 0))
)

(when (key-pressed "x")
	(shapeSchema triangolisphere triA piramidiring)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 0 1 0))
)

(when (key-pressed "c")
	(shapeSchema triangoliring hexA piramidisphere)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 0 .5 1))
)

(when (key-pressed "v")
	(shapeSchema piramidisphere moleculeA bigring)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 0 .5))
)

(when (key-pressed "b")
	(shapeSchema triangolisphere nautilus bigring)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 1 0))
)

(when (key-pressed "n")
	(shapeSchema subaddiction triangoliring bigring)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 0 1))
)

(when (key-pressed "m")
	(shapeSchema subaddiction piramidisphere triangoliring)
	
;	(with-primitive prtclSys2
;		;(texture (load-texture (string-append base_dir "textures/texture0.png")))
;		;(pdata-map! (lambda (c) (vector 1 0 0)) "c")
;		
;	)
	(particlesReset prtclSys2)
	(psys2VelReset)
	(set! prtclSys2Color (vector 1 0 0))
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



;particle sysytems

(when (key-pressed ".")
	(clear-texture-cache)
	
	(set! psysInterference 0)
	
	(with-primitive prtclSys
		(texture (load-texture ""))
	)
	(set! prtclSysColor (vector 1 1 1))
	
	(with-primitive prtclSys2
		(texture (load-texture ""))
	)
	(set! prtclSys2Color (vector 1 1 1))
	
	(with-primitive prtclSys3
		(texture (load-texture ""))
	)
	(set! prtclSys3Color (vector 1 1 1))
	
	(with-primitive prtclSys4
		(texture (load-texture ""))
	)
	(set! prtclSys4Color (vector 1 1 1))
	
	(particlesReset prtclSys)
	(psysVelReset)
	
	(particlesReset prtclSys2)
	(psys2VelReset)
	
	(particlesReset prtclSys3)
	(psys3VelReset)
	
	(particlesReset prtclSys4)
	(psys4VelReset)
)

(when (key-pressed "Q")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/zebra.png")))
		;(pdata-map! (lambda (c) (vector (gh 0) (gh 4) (gh 8))) "c")
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "W")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/triangolo_booty.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "E")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/quadrato_bra.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "R")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/leopard.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "T")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/ghettoblaster.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "Y")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/cerchio_rock.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "U")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/cerchio_panda.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "I")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/cerchio_cuffie.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "O")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/fruit1.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)

(when (key-pressed "P")
	(with-primitive prtclSys
		(texture (load-texture (string-append base_dir "textures/fruit2.png")))
	)
	(particlesReset prtclSys)
	(psysVelReset)
)



;;;;;



(when (key-pressed "A")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture2.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "S")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture3.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "D")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture4.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "F")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture5.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "G")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture6.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "H")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture7.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "J")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture8.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "K")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture9.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)

(when (key-pressed "L")
(with-primitive prtclSys
(texture (load-texture (string-append base_dir "textures/texture0.png")))
)
(particlesReset prtclSys)
(psysVelReset)
)
