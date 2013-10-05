(clear)
(clear-texture-cache)
;BACKGROUNDZ
;(define BG00 (with-state
;		(texture (load-texture (string-append base_dir "textures/test.png")))
;		;(texture-params 0 '(wrap-s repeat wrap-t repeat))
;		
;		(scale (vector 2.4 1.6 0))
;		(translate (vector 0 0 -10))
;	(build-plane)))


;PARTICLE SYSTEMS

; util func to return a random vector
(define (rndvec)
    (vsub (vector (flxrnd) (flxrnd) (flxrnd)) 
        (vector 0.5 0.5 0.5)))
        
; util function to return a random value
(define (rndval) (- (flxrnd) 0.5))
        
(define prtclSys (with-state (build-particles 1024)))


(with-primitive prtclSys
	
	; add the velocity pdata 
	(pdata-add "vel" "v")
	; init all the velocities
	;(pdata-map! (lambda (vel) (vmul (rndvec) 1)) "vel")
	
	;init particles size
	(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")
	; init all the colours
	;(pdata-map! (lambda (c) (vector 0 0 0 0)) "c")

  
    
)
(define prtclSysColor (vector 1 1 1))
;(with-primitive prtclSys (hide 1))


(define prtclSys2 (with-state (build-particles 512)))

(with-primitive prtclSys2
	
	; add the velocity pdata 
	(pdata-add "vel" "v")
	
	; set particles size
	(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")


  
    
)
(define prtclSys2Color (vector 1 1 1))
;(with-primitive prtclSys2 (hide 1))



(define prtclSys3 (with-state (build-particles 512)))

(with-primitive prtclSys3
	
	; add the velocity pdata 
	(pdata-add "vel" "v")
	
	; set particles size
	(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")


  
    
)
(define prtclSys3Color (vector 1 1 1))
;(with-primitive prtclSys2 (hide 1))



(define prtclSys4 (with-state (build-particles 512)))

(with-primitive prtclSys4
	
	; add the velocity pdata 
	(pdata-add "vel" "v")
	
	; set particles size
	(pdata-map! (lambda (s) (vector .5 .5 .5)) "s")


  
    
)
(define prtclSys4Color (vector 1 1 1))
;(with-primitive prtclSys3 (hide 1))






;(texture-params 0 '(tex-env replace))

; BASE SHAPES
(define kube (with-state (load-primitive (string-append base_dir "obj/kube.obj"))))
(with-primitive kube (hide 1))

(define smallring (with-state (load-primitive (string-append base_dir "obj/smallring.obj"))))
(with-primitive smallring (hide 1))

(define bigring (with-state (load-primitive (string-append base_dir "obj/bigring.obj"))))
(with-primitive bigring (hide 1))


; GEOMETRY
;(define triangolo (with-state (load-primitive (string-append base_dir "obj/triangolo.obj"))))
;(with-primitive triangolo (hide 1))

(define triangoloBig (with-state (load-primitive (string-append base_dir "obj/triangoloBig.obj"))))
(with-primitive triangoloBig (hide 1))

(define piramidi (with-state (load-primitive (string-append base_dir "obj/piramidi.obj"))))
(with-primitive piramidi (hide 1))

(define triangoli (with-state (load-primitive (string-append base_dir "obj/triangoli.obj"))))
(with-primitive triangoli (hide 1))

(define piramidiring (with-state (load-primitive (string-append base_dir "obj/piramidiring.obj"))))
(with-primitive piramidiring (hide 1))

(define triangoliring (with-state (load-primitive (string-append base_dir "obj/triangoliring.obj"))))
(with-primitive triangoliring (hide 1))

(define piramidisphere (with-state (load-primitive (string-append base_dir "obj/piramidisphere.obj"))))
(with-primitive piramidisphere (hide 1))

(define triangolisphere (with-state (load-primitive (string-append base_dir "obj/triangolisphere.obj"))))
(with-primitive triangolisphere (hide 1))

(define triA (with-state (load-primitive (string-append base_dir "obj/triA.obj"))))
(with-primitive triA (hide 1))

(define triB (with-state (load-primitive (string-append base_dir "obj/triB.obj"))))
(with-primitive triB (hide 1))

(define triC (with-state (load-primitive (string-append base_dir "obj/triC.obj"))))
(with-primitive triC (hide 1))

(define hexA (with-state (load-primitive (string-append base_dir "obj/hexA.obj"))))
(with-primitive hexA (hide 1))

(define moleculeA (with-state (load-primitive (string-append base_dir "obj/moleculeA.obj"))))
(with-primitive moleculeA (hide 1))

(define nautilus (with-state (load-primitive (string-append base_dir "obj/nautilus.obj"))))
(with-primitive nautilus (hide 1))


; CREWS
;(define electroswingitalia (with-state (load-primitive (string-append base_dir "obj/electroswingitalia.obj"))))
;(with-primitive electroswingitalia (hide 1))

(define subaddiction (with-state (load-primitive (string-append base_dir "obj/subaddiction.obj"))))
(with-primitive subaddiction (hide 1))


;;;;;;;;;
; lettering

(define gatopreto03 (with-state (load-primitive (string-append base_dir "obj/gatopreto03.obj"))))
(with-primitive gatopreto03 (hide 1))

(define gatopreto04 (with-state (load-primitive (string-append base_dir "obj/gatopreto04.obj"))))
(with-primitive gatopreto04 (hide 1))

(define yodha01 (with-state (load-primitive (string-append base_dir "obj/yodha01.obj"))))
(with-primitive yodha01 (hide 1))

(define yodha02 (with-state (load-primitive (string-append base_dir "obj/yodha02.obj"))))
(with-primitive yodha02 (hide 1))

(define kinkybusiness (with-state (load-primitive (string-append base_dir "obj/kinkybusiness.obj"))))
(with-primitive kinkybusiness (hide 1))

(define WR_03 (with-state (load-primitive (string-append base_dir "obj/WR_03.obj"))))
(with-primitive WR_03 (hide 1))


;Add objects to library with:
;(define objID (with-state (load-primitive (string-append base_dir "obj/objFile.obj"))))


; Define the dummy primitives

(define shapeOne (build-cube))
(with-primitive shapeOne (hide 1))

(define shapeTwo (build-cube))
(with-primitive shapeTwo (hide 1))

(define shapeThree (build-cube))
(with-primitive shapeThree (hide 1))

;Define Initial colors
(define RedLightness 0.5)
(define GreenLightness 0.25)
(define BlueLightness 0.25)

;Define initial tranformation settings
(define Scale 10)
(define RotX -60)
(define RotY 60)
(define RotZ -60)

(define accumRot0 (vector 0 0 0))
(define accumRot1 (vector 0 0 0))
(define accumRot2 (vector 0 0 0))

(define beatThreshold 0)
(define metronome 0)
(define timeFrame 6)
(define lastTimeframePeaks 0)
(define peaksDensity 0)
(define nucleus 1)
(define psysInterference 0)

(define velGain 2)
(define colGain 2)
(define pcolGain 2)
