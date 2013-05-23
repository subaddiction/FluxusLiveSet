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
(when (key-pressed "q") (shapeSchema hexA piramidiring triangolisphere))

(when (key-pressed "w") (shapeSchema triA piramidisphere triangoliring))

(when (key-pressed "e") (shapeSchema triB triangoloBig piramidiring))

(when (key-pressed "r") (shapeSchema triC triangoliring triangoloBig))

(when (key-pressed "t") (shapeSchema moleculeA triangoloBig piramidiring))

(when (key-pressed "y") (shapeSchema nautilus triangoloBig triangoliring))

(when (key-pressed "u") (shapeSchema triangolo triangoliring piramidisphere))

(when (key-pressed "i") (shapeSchema electroswingitalia piramidiring triangolisphere))

(when (key-pressed "o") (shapeSchema triangolo triangolisphere piramidiring))

(when (key-pressed "p") (shapeSchema electroswingitalia triangoliring piramidisphere))





(when (key-pressed "a") (shapeSchema electroswingitalia triangoliring bigring))

(when (key-pressed "s") (shapeSchema nautilus piramidiring triangolisphere))

(when (key-pressed "d") (shapeSchema electroswingitalia triangoliring piramidiring))

(when (key-pressed "f") (shapeSchema hexA smallring piramidiring))

(when (key-pressed "g") (shapeSchema triangolo bigring piramidisphere))

(when (key-pressed "h") (shapeSchema triangolo piramidiring triangolisphere))

(when (key-pressed "j") (shapeSchema triA bigring triangoliring))

(when (key-pressed "k") (shapeSchema triB triangoliring piramidiring))

(when (key-pressed "l") (shapeSchema triC piramidisphere triangolisphere))



(when (key-pressed "z") (shapeSchema kube smallring bigring))

(when (key-pressed "x") (shapeSchema triangolisphere triA piramidiring))

(when (key-pressed "c") (shapeSchema triangoliring hexA piramidisphere))

(when (key-pressed "v") (shapeSchema piramidisphere moleculeA bigring))

(when (key-pressed "b") (shapeSchema triangolisphere nautilus bigring))

(when (key-pressed "n") (shapeSchema subaddiction triangoliring bigring))

(when (key-pressed "m") (shapeSchema subaddiction triangolisphere triangolisphere))




