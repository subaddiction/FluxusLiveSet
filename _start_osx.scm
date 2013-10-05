; _start.scm
; primo file da caricare.
; Definisce directory di lavoro e carica librerie, oggetti e textures.
(reset-camera)

; Base directory
(define base_dir "/Users/Shared/fluxus/FluxusLiveSet-wobble-02/")

; Include general config
(load (string-append base_dir "lib/config_osx.scm"))


; Include primitives library
(load (string-append base_dir "lib/objects.scm"))


; Include functions
(load (string-append base_dir "lib/functions.scm"))


; Fire animations
(every-frame
	;(begin (display (midi-peek)) (newline))
	(pulse base_dir shapeOne shapeTwo shapeThree RedLightness GreenLightness BlueLightness Scale RotX RotY RotZ)
)
