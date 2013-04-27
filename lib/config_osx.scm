(clear)
(reset-camera)

; Spank OSX
(start-audio "system:capture_1" 1024 44100)

(midiin-open 1)

(gain 0.2)

(load (string-append base_dir "lib/objects.scm"))

(ambient 0)
;(blur 0)
;(desiredfps 24)

