Music_SSAnne:
	dbw $c0, Music_SSAnne_Ch1
	dbw $01, Music_SSAnne_Ch2
	dbw $02, Music_SSAnne_Ch3
	dbw $03, Music_SSAnne_Ch4

Music_SSAnne_Ch1:
; Pat 0 Row 0
	tempo $d5
	dutycycle $3
	notetype $c, $d6
	stereopanning $f
	octave 2
	note A_, 6
	octave 3
	note A_, 6
	octave 4
	note D_, 2
	note C#, 2
	note D_, 2
	octave 3
	note E_, 9
	octave 2
	note A_, 6
	octave 3
	note A_, 6
	octave 4
	note D_, 2
	note E_, 2
	note F#, 2
	octave 3
	note A_, 9
; Pat 1 Row 0
	notetype $8, $83
	dutycycle $2
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	notetype $6, $83
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note C#, 1
	note D_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 5
	note C#, 1
	note D_, 1
	note E_, 1
	octave 4
	note F#, 1
	note G_, 1
	note A_, 1
	octave 5
	note C#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	octave 4
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C#, 1
; Pat 2 Row 0
	notetype $8, $83
	note D_, 6
Music_SSAnne_Ch1_L:
	dutycycle $3
	intensity $d6
	octave 3
	note A_, 12
	octave 4
	note E_, 6
	note D_, 12
	note C#, 6
	octave 3
	note A_, 12
; Pat 3 Row 6
	note A_, 6
	note B_, 12
	octave 4
	note D_, 12
	note C#, 6
	octave 3
	note A_, 12
; Pat 4 Row 6
	note A_, 12
	octave 4
	note E_, 6
	note D_, 12
	note C#, 6
	octave 3
	note A_, 12
; Pat 5 Row 6
	note A_, 6
	note B_, 12
	octave 4
	note D_, 12
	note C#, 12
; Pat 6 Row 0
	dutycycle $2
	intensity $83
	octave 3
	note F#, 3
	octave 2
	note B_, 3
	octave 3
	note F#, 3
	note B_, 3
	note F#, 3
	octave 2
	note B_, 3
	octave 3
	note F#, 3
	note B_, 3
	note E_, 3
	octave 2
	note A_, 3
	octave 3
	note E_, 3
	note A_, 3
	note E_, 3
	octave 2
	note A_, 3
	octave 3
	note E_, 3
	note A_, 3
; Pat 7 Row 0
	note D_, 3
	octave 2
	note G_, 3
	octave 3
	note D_, 3
	note G_, 3
	note D_, 3
	octave 2
	note G_, 3
	octave 3
	note D_, 3
	note G_, 3
	note C#, 3
	octave 2
	note A_, 3
	octave 3
	note C#, 3
	note F#, 3
	note C#, 3
	octave 2
	note A_, 3
	octave 3
	note C#, 3
	note F#, 3
; Pat 8 Row 0
	intensity $88
	vibrato $10, $22
	note G_, 9
	note __, 3
	note G_, 3
	note A_, 3
	note G_, 3
	note E_, 3
	note F#, 9
	note G_, 3
	note A_, 3
	octave 4
	note C#, 3
	note D_, 3
	note F#, 3
; Pat 9 Row 0
	notetype $6, $83
	vibrato $0, $0
	octave 3
	note E_, 1
	note __, 1
	note E_, 8
	note E_, 4
	note E_, 1
	note __, 1
	notetype $8, $88
	vibrato $10, $22
	note E_, 6
	note B_, 3
	octave 4
	note C#, 3
	note D_, 12
	note E_, 12
; Pat 10 Row 0
	dutycycle $3
	intensity $d6
	vibrato $0, $0
	note D_, 3
	octave 3
	note A_, 3
	octave 4
	note D_, 6
	note E_, 6
	note G_, 6
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note D_, 3
	note E_, 6
	note C#, 6
; Pat 11 Row 0
	note D_, 3
	note E_, 3
	note F#, 6
	note G_, 6
	note F#, 3
	note E_, 3
	note A_, 6
	note G_, 3
	note F#, 3
	note E_, 6
	octave 3
	note F#, 3
	note E_, 3
; Pat 12 Row 0
	note F#, 3
	note D_, 3
	notetype $c, $d6
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	note __, 1
	note F#, 2
	note __, 1
	note G_, 2
	notetype $8, $d6
	note F#, 2
	note G_, 2
	note F#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 6
	note C#, 6
; Pat 13 Row 0
	note B_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	octave 2
	note F#, 2
	note G_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G_, 2
	note A_, 6
	note __, 2
	note G_, 2
	note F#, 2
	note E_, 12
	note __, 6
	loopchannel 0, Music_SSAnne_Ch1_L


Music_SSAnne_Ch2:
; Pat 0 Row 0
	dutycycle $1
	notetype $c, $d6
	stereopanning $f0
	octave 3
	note D_, 2
	note G_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	octave 3
	note A_, 9
	note D_, 2
	note G_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 7
	note C#, 1
	note D_, 1
; Pat 1 Row 0
	notetype $8, $d6
	note C#, 16
	notetype $6, $d6
	note __, 8
	octave 3
	note A_, 8
	octave 4
	note D_, 8
	note C#, 8
; Pat 2 Row 0
	notetype $8, $d6
Music_SSAnne_Ch2_L:
	note D_, 3
	octave 3
	note A_, 3
	octave 4
	note D_, 6
	note E_, 6
	note G_, 6
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note D_, 3
	note E_, 6
	note C#, 6
; Pat 3 Row 0
	note D_, 3
	note E_, 3
	note F#, 6
	note G_, 6
	note F#, 3
	note E_, 3
	note A_, 6
	note G_, 3
	note F#, 3
	note E_, 6
	note F#, 3
	note E_, 3
; Pat 4 Row 0
	note D_, 3
	octave 3
	note A_, 3
	octave 4
	note D_, 6
	note E_, 6
	note G_, 6
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note D_, 3
	note E_, 6
	note C#, 6
; Pat 5 Row 0
	note D_, 3
	note E_, 3
	note F#, 6
	note G_, 6
	note F#, 3
	note E_, 3
	note A_, 6
	note G_, 3
	note F#, 3
	note E_, 15
; Pat 6 Row 3
	dutycycle $0
	intensity $e8
	vibrato $7, $12
	note F#, 3
	note E_, 3
	note F#, 2
	note __, 1
	note F#, 3
	note G_, 3
	note F#, 3
	note G_, 3
	note A_, 3
	note E_, 3
	note C#, 3
	octave 3
	note B_, 3
	note A_, 3
	note B_, 3
	octave 4
	note C#, 3
	note E_, 3
; Pat 7 Row 0
	note __, 3
	note D_, 3
	note C#, 3
	note D_, 2
	note __, 1
	note D_, 3
	note E_, 3
	note D_, 3
	note E_, 3
	note F#, 3
	note C#, 3
	octave 3
	note B_, 3
	note A_, 2
	note __, 1
	note A_, 3
	note B_, 3
	octave 4
	note C#, 3
	note E_, 3
; Pat 8 Row 0
	note __, 3
	octave 3
	note B_, 3
	note A_, 3
	note B_, 2
	note __, 1
	note B_, 3
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	octave 4
	note C#, 3
	note D_, 3
	octave 3
	note A_, 3
	note F#, 3
	note E_, 3
	note D_, 3
	note E_, 3
	note F#, 3
	note A_, 3
; Pat 9 Row 0
	note __, 3
	note B_, 3
	note A_, 3
	note B_, 2
	note __, 1
	note B_, 3
	octave 4
	note C#, 3
	note D_, 3
	note E_, 3
	note F#, 3
	note G_, 3
	note F#, 3
	note E_, 3
	note A_, 3
	note G_, 3
	note F#, 3
	note E_, 3
; Pat 10 Row 0
	note F#, 12
	note G_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note B_, 6
	note A_, 12
; Pat 11 Row 0
	note B_, 11
	note __, 1
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 6
	note E_, 3
	note D_, 3
	note C#, 6
	octave 3
	note B_, 3
	octave 4
	note C#, 3
; Pat 12 Row 0
	note D_, 2
	note __, 1
	octave 3
	note A_, 2
	note __, 1
	octave 4
	note D_, 2
	note __, 1
	notetype $c, $e8
	note E_, 1
	note F#, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note E_, 2
	notetype $8, $e8
	note F#, 5
	note __, 1
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 6
	note F#, 6
; Pat 13 Row 0
	note B_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	octave 3
	note F#, 2
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 2
	note G_, 2
	note A_, 6
	note __, 2
	note E_, 2
	note B_, 2
	note A_, 12
	dutycycle $1
	intensity $d6
	vibrato $0, $0
	loopchannel 0, Music_SSAnne_Ch2_L


Music_SSAnne_Ch3:
; Pat 0 Row 0
	notetype $c, $13
	stereopanning $ff
	octave 3
	note D_, 6
	note __, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 5
	octave 4
	note C#, 7
	octave 3
	note C#, 2
	note D_, 4
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 3
	note __, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 4
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C#, 9
; Pat 1 Row 0
	notetype $8, $13
	octave 2
	note A_, 16
	notetype $c, $13
	note __, 16
Music_SSAnne_Ch3_L:
; Pat 2 Row 0
	notetype $8, $13
	note D_, 12
	note A_, 12
	note B_, 12
	note A_, 12
; Pat 3 Row 0
	note D_, 12
	note E_, 12
	note A_, 12
	note A_, 6
	note C#, 6
; Pat 4 Row 0
	note D_, 12
	octave 1
	note A_, 12
	note B_, 12
	octave 2
	note C#, 12
; Pat 5 Row 0
	note D_, 12
	note E_, 12
	note A_, 12
	note A_, 6
	note C#, 6
; Pat 6 Row 0
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note A_, 2
	note __, 4
	note A_, 2
	note __, 4
	note A_, 2
	note __, 4
	note A_, 2
	note __, 4
; Pat 7 Row 0
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note F#, 2
	note __, 4
	note A_, 2
	note __, 4
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note F#, 2
	note __, 4
; Pat 8 Row 0
	note G_, 10
	note __, 2
	note G_, 9
	octave 1
	note G_, 3
	octave 2
	note D_, 9
	note A_, 3
	note D_, 12
; Pat 15 Row 0
	notetype $6, $13
	note E_, 1
	note __, 1
	note E_, 8
	note __, 4
	note E_, 1
	note __, 1
	note E_, 12
	note B_, 2
	note __, 2
	note A_, 12
	note F#, 2
	note G_, 2
	note A_, 12
	octave 1
	note A_, 2
	octave 2
	note C#, 2
; Pat 16 Row 0
	note D_, 12
	note D_, 1
	note __, 1
	note D_, 2
	note A_, 2
	note __, 4
	octave 1
	note A_, 6
	octave 2
	note A_, 4
	note B_, 4
	note __, 8
	note B_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 1
	note __, 3
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
; Pat 17 Row 0
	octave 2
	note G_, 4
	note __, 8
	note G_, 1
	note __, 1
	note G_, 2
	note E_, 2
	note __, 4
	octave 3
	note E_, 6
	octave 2
	note E_, 4
	note A_, 4
	note __, 8
	note A_, 1
	note __, 1
	octave 1
	note A_, 2
	octave 2
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 1
	note __, 3
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
; Pat 18 Row 0
	octave 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note __, 2
	note A#, 4
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 2
	note __, 4
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A#, 2
; Pat 19 Row 0
	note B_, 4
	note __, 2
	note B_, 2
	note __, 4
	note B_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note E_, 6
	octave 2
	note E_, 3
	note __, 1
	note E_, 2
	note B_, 2
	note E_, 2
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 2
	note __, 4
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	note A_, 1
	note __, 3
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note C#, 2
	loopchannel 0, Music_SSAnne_Ch3_L

Music_SSAnne_Ch4:
	notetype $c
	togglenoise $3
	stereopanning $ff
Music_SSAnne_Ch4_L1:
	note __, 9
	loopchannel 6, Music_SSAnne_Ch4_L1 ; 54 rows
	notetype $8
	note __, 16
	notetype $c
	note __, 16
Music_SSAnne_Ch4_L:
	note __, 16
	loopchannel 12, Music_SSAnne_Ch4_L ; 6 pats
; Pat 14 Row 0
	notetype $6
Music_SSAnne_Ch4_L2:
	note __, 8
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	loopchannel 4, Music_SSAnne_Ch4_L2
; Pat 15 Row 0
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 10
	note __, 16
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note D#, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
; Pat 16 Row 0
	note D#, 4
	note G_, 4
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note D#, 4
	note C_, 4
	note F#, 2
	note G_, 2
	note D#, 4
	note G_, 4
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 4
	note G_, 2
	note F#, 2
; Pat 17 Row 0
	note G_, 4
	note D#, 4
	note G#, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note D#, 4
	note C_, 4
	note F#, 2
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 2
	note C_, 4
	note G_, 2
	note F#, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 4
	note C_, 2
	note C_, 2
; Pat 18 Row 0
	note D#, 4
	note G_, 4
	note C_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 4
	note F#, 2
	note G_, 2
	note D#, 4
	note G_, 4
	note C_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 4
	note G_, 2
	note F#, 2
; Pat 19 Row 0
	note G_, 4
	note D#, 4
	note C_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 4
	note F#, 2
	note G_, 2
	note D#, 4
	note G_, 4
	note C_, 4
	note G_, 2
	note F#, 2
	note G_, 2
	note D#, 4
	note D#, 2
	note C_, 8
	notetype $c
	loopchannel 0, Music_SSAnne_Ch4_L
