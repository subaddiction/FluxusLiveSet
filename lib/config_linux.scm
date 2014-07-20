(clear)
(clear-texture-cache)
(reset-camera)

; Archimede Debian7 GNU/Linux
(set-projection-transform (vector 1 0 0 0 0 16/9 0 0 0 0 -1 -1 0 0 -2 0))
(start-audio "system:capture_1" 1024 44100)
;(start-audio "vlc_5655:out_1" 1024 44100)

(midiin-open 1)

(gain 0.2)

(ambient 0)
;(blur 0)
;(desiredfps 24)





