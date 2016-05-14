Music_TPP_Credits:
	dbw $c0, Music_TPP_Credits_Ch1
	dbw $01, Music_TPP_Credits_Ch2
	dbw $02, Music_TPP_Credits_Ch3
	dbw $03, Music_TPP_Credits_Ch4

Music_TPP_Credits_Ch1:
; Pat 0 Row 0
	tempo $a6
	dutycycle $3
	notetype $c, $12
	stereopanning $f0
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note F#, 2
	intensity $22
	note A#, 2
	note B_, 2
	octave 4
	note E_, 2
	intensity $32
	note F#, 2
	note A#, 2
	note B_, 2
	intensity $42
	note F#, 2
	octave 3
	note B_, 2
	note F#, 2
	intensity $52
	octave 4
	note A_, 2
	note E_, 2
	octave 3
	note B_, 2
	intensity $62
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	intensity $72
	note F#, 2
	note A#, 2
	note B_, 2
	intensity $82
	octave 4
	note E_, 2
	note F#, 2
	note A#, 2
	intensity $92
	note B_, 2
	note F#, 2
	octave 3
	note B_, 2
	intensity $a2
	note F#, 2
	octave 4
	note A_, 2
	note E_, 2
	intensity $b2
	octave 3
	note B_, 2
	note F#, 2
; Pat 1 Row 0
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note F#, 2
	note A#, 2
	note B_, 2
	octave 4
	note E_, 2
	note F#, 2
	note A#, 2
	note B_, 2
	note F#, 2
	octave 3
	note B_, 2
	note F#, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 3
	note B_, 2
	note F#, 2
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	note D_, 2
	octave 3
	note G_, 2
	note D_, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 3
	note G_, 2
	note D_, 2
; Pat 2 Row 0
	octave 4
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note G_, 2
	tempo $9c
	note A_, 2
	note E_, 2
	tempo $92
	note C#, 2
	octave 3
	note B_, 2
	tempo $8a
	note A_, 2
	note B_, 2
	tempo $82
	octave 4
	note C#, 2
	note A#, 2
; Pat 3 Row 0
	tempo $7b
Music_TPP_Credits_Ch1_L1:
	callchannel Music_TPP_Credits_Ch1_P1
	loopchannel 3, Music_TPP_Credits_Ch1_L1
; Pat 9 Row 0
	note B_, 2
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 3
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	note F#, 2
	note D_, 2
	octave 3
	note F#, 2
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	intensity $c7
	vibrato $7, $12
	note F#, 2
	note E_, 2
; Pat 4 Row 0
	note F#, 4
	note E_, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note B_, 4
	note A_, 2
	note B_, 6
	note A_, 2
	note B_, 2
	note D_, 4
	note F#, 2
	note G_, 6
	note D_, 2
	note F#, 2
	note G_, 6
	note F#, 6
	note E_, 4
; Pat 5 Row 0
	note F#, 6
	octave 2
	note B_, 6
	octave 3
	note F#, 2
	note E_, 2
	note F#, 4
	note D_, 2
	note C#, 4
	note E_, 2
	note F#, 4
	note G_, 16
	intensity $f
	vibrato $1, $32
	note A_, 12
	intensity $c7
	vibrato $7, $12
	note F#, 2
	note E_, 2
; Pat 6 Row 0
	note F#, 4
	note E_, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note B_, 4
	note A_, 2
	note B_, 6
	octave 4
	note C#, 2
	note D_, 2
	note F#, 4
	note E_, 2
	note D_, 6
	note C#, 2
	note D_, 2
	note C#, 4
	note D_, 2
	note C#, 6
	octave 3
	note B_, 2
	note A_, 2
; Pat 7 Row 0
	note B_, 6
	note F#, 6
	note B_, 4
	note A_, 6
	note G_, 6
	note F#, 4
	note G_, 16
	intensity $f
	vibrato $1, $32
	note A_, 12
	dutycycle $2
	intensity $87
	vibrato $0, $0
	note B_, 2
	note A_, 2
; Pat 8 Row 0
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note C#, 2
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note F#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note A#, 2
	octave 5
	note C#, 2
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
; Pat 13 Row 0
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note A#, 2
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	note A_, 2
	callchannel Music_TPP_Credits_Ch1_P2
	note C#, 2
	note D_, 2
	note F#, 2
	note A_, 10
; Pat 15 Row 0
	octave 3
	note B_, 4
	note B_, 1
	note __, 1
	note B_, 4
	note B_, 1
	note __, 1
	note B_, 4
	note A_, 4
	note A_, 1
	note __, 1
	note B_, 6
	octave 4
	note C#, 4
	note D_, 4
	note C#, 2
	octave 3
	note A_, 6
	note F#, 4
	note B_, 4
	note A_, 2
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
; Pat 16 Row 0
	note D_, 4
	octave 3
	note B_, 2
	note F#, 4
	note B_, 2
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note F#, 4
	note B_, 4
	octave 4
	note C#, 4
	note D_, 3
	octave 3
	note B_, 3
	octave 4
	note D_, 2
	note E_, 3
	note C#, 3
	note E_, 2
	note F#, 3
	note D_, 3
	note F#, 2
	note A_, 3
	note G_, 3
	note F#, 2
; Pat 17 Row 0
	intensity $b2
	vibrato $0, $0
Music_TPP_Credits_Ch1_L2:
	callchannel Music_TPP_Credits_Ch1_P1
	loopchannel 4, Music_TPP_Credits_Ch1_L2
; Pat 18 Row 0
; Pat 12 Row 0
	dutycycle $2
	intensity $87
	callchannel Music_TPP_Credits_Ch1_P2
	note C#, 10
	octave 2
	note G#, 2
	octave 3
	note D#, 2
	note G_, 2
; Pat 23 Row 0
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 6
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note A#, 1
	note __, 1
	note A#, 6
	octave 4
	note D#, 4
	note D_, 6
	note C_, 6
	octave 3
	note A#, 4
	octave 4
	note C_, 12
	note C_, 2
	note D_, 2
; Pat 24 Row 0
	note C_, 4
	octave 3
	note A#, 2
	note G#, 4
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G_, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 2
	note F_, 2
	note G_, 2
	octave 5
	note C_, 10
	octave 4
	note D_, 2
	note D#, 2
	note G_, 2
	note A#, 10
; Pat 25 Row 0
	note C_, 4
	note C_, 1
	note __, 1
	note C_, 4
	note C_, 1
	note __, 1
	note C_, 4
	octave 3
	note A#, 4
	note A#, 1
	note __, 1
	octave 4
	note C_, 6
	note D_, 4
	note D#, 4
	note D_, 2
	octave 3
	note A#, 6
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
; Pat 26 Row 0
	note D#, 4
	note C_, 2
	octave 3
	note G_, 4
	octave 4
	note C_, 2
	note D#, 4
	note D_, 4
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 3
	note C_, 3
	note D#, 2
	note F_, 3
	note D_, 3
	note F_, 2
	tempo $7e
	note G_, 3
	tempo $87
	note D#, 3
	tempo $91
	note G_, 2
	tempo $99
	note A#, 3
	tempo $a6
	note G#, 5
; Pat 27 Row 0
	intensity $b2
	vibrato $0, $0
	callchannel Music_TPP_Credits_Ch1_P3
	note G#, 2
	note D#, 2
	octave 3
	note G#, 2
	note D#, 2
	octave 4
	note A#, 2
	note F_, 2
	octave 3
	note G#, 2
	note D#, 2
; Pat 28 Row 0
	callchannel Music_TPP_Credits_Ch1_P3
	intensity $c7
	vibrato $7, $12
	note C_, 2
	note __, 2
	note C_, 4
	notetype $8, $c7
	octave 3
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note B_, 2
	notetype $c, $c7
	octave 4
	note C_, 16
	endchannel

Music_TPP_Credits_Ch1_P1:
	octave 3
	note B_, 2
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 3
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	note F#, 2
	note D_, 2
	octave 3
	note F#, 2
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note B_, 2
	note A_, 2
	endchannel

Music_TPP_Credits_Ch1_P2:
; Pat 12 Row 0
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note C#, 2
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note F#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note A#, 2
	octave 5
	note C#, 2
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
; Pat 10 Row 0
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note A#, 2
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note E_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note A#, 2
	octave 5
	note C#, 2
	dutycycle $3
	intensity $c7
	vibrato $7, $12
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note F#, 2
; Pat 11 Row 0
	note G_, 4
	note G_, 1
	note __, 1
	note G_, 6
	note B_, 4
	note A_, 4
	note A_, 1
	note __, 1
	note A_, 6
	octave 4
	note D_, 4
	note C#, 6
	octave 3
	note B_, 6
	note A_, 4
	note B_, 12
	note B_, 2
	octave 4
	note C#, 2
; Pat 14 Row 0
	octave 3
	note B_, 4
	note A_, 2
	note G_, 4
	note A_, 2
	note B_, 4
	note A_, 4
	note F#, 4
	note B_, 4
	octave 4
	note C#, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note B_, 10
	endchannel

Music_TPP_Credits_Ch1_P3:
	octave 3
	note C_, 2
	note F_, 2
	note G_, 2
	note B_, 2
	octave 4
	note C_, 2
	note F_, 2
	note G_, 2
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note A#, 2
	note F_, 2
	note C_, 2
	octave 3
	note G_, 2
	octave 2
	note G#, 2
	octave 3
	note C_, 2
	note D#, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note G_, 2
	endchannel

Music_TPP_Credits_Ch2:
; Pat 0 Row 0
	dutycycle $0
	notetype $c, $17
	vibrato $7, $12
	stereopanning $f
	octave 3
	note B_, 4
	note F#, 4
	intensity $27
	note D#, 4
	intensity $37
	note F#, 4
	note B_, 4
	intensity $47
	note F#, 4
	intensity $57
	note D#, 4
	note F#, 4
	intensity $67
	note B_, 4
	intensity $77
	note F#, 4
	note D#, 4
	intensity $87
	note C#, 4
	intensity $97
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	intensity $a7
	note F#, 4
	intensity $b7
	note A#, 4
; Pat 1 Row 0
	intensity $c7
	note B_, 16
	note F#, 8
	note B_, 8
	note A_, 12
	note G_, 2
	note F#, 2
	note E_, 8
	note G_, 8
; Pat 2 Row 0
	note F#, 6
	note A_, 2
	note B_, 8
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
	note A#, 4
; Pat 3 Row 0
	note B_, 16
	callchannel Music_TPP_Credits_Ch2_P1
	dutycycle $1
	octave 3
	note F#, 2
	note A_, 2
	note A#, 2
; Pat 4 Row 0
	note B_, 12
	note F#, 2
	note B_, 2
	octave 4
	note F#, 8
	note E_, 4
	note F#, 4
	octave 3
	note G_, 6
	note B_, 6
	octave 4
	note D_, 4
	note C#, 6
	octave 3
	note B_, 6
	note A_, 4
; Pat 5 Row 0
	note B_, 6
	note F#, 6
	note B_, 4
	octave 4
	note F#, 4
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	note A_, 4
	note B_, 16
	intensity $f
	vibrato $1, $32
	octave 4
	note C#, 12
	intensity $c7
	vibrato $7, $12
	octave 3
	note A_, 2
	note A#, 2
; Pat 6 Row 0
	note B_, 12
	note F#, 2
	note B_, 2
	octave 4
	note F#, 6
	note E_, 6
	note F#, 4
	note B_, 4
	note A_, 2
	note G_, 4
	note D_, 6
	note G_, 4
	note F#, 2
	note E_, 6
	note D_, 2
	note C#, 2
; Pat 7 Row 0
	note D_, 6
	octave 3
	note B_, 6
	octave 4
	note D_, 4
	note C#, 6
	octave 3
	note B_, 6
	note A_, 4
	note B_, 16
	intensity $f
	vibrato $1, $32
	octave 4
	note C#, 12
	dutycycle $0
	intensity $c7
	vibrato $7, $12
	octave 3
	note F#, 2
	note A_, 2
; Pat 8 Row 0
	note B_, 6
	note F#, 6
	octave 4
	note D_, 4
	note C#, 6
	note D_, 6
	note E_, 4
	note C#, 6
	octave 3
	note B_, 6
	note A_, 4
	note B_, 12
	note B_, 2
	octave 4
	note C#, 2
; Pat 13 Row 0
	note D_, 6
	octave 3
	note B_, 6
	octave 4
	note D_, 4
	note C#, 6
	octave 3
	note B_, 6
	octave 4
	note D_, 4
	note C#, 6
	note F#, 6
	note E_, 4
	note F#, 12
	note F#, 2
	note E_, 2
	callchannel Music_TPP_Credits_Ch2_P2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
; Pat 15 Row 0
	note D_, 4
	note D_, 1
	note __, 1
	note D_, 4
	note D_, 1
	note __, 1
	note D_, 4
	note C#, 4
	note C#, 1
	note __, 1
	note F#, 6
	note A_, 4
	octave 3
	note B_, 6
	octave 4
	note C#, 6
	note D_, 4
	note E_, 10
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note E_, 2
; Pat 16 Row 0
	note F#, 6
	octave 3
	note B_, 6
	octave 4
	note F#, 4
	note E_, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	note E_, 4
	note G_, 3
	note E_, 3
	note G_, 2
	note A_, 3
	note F#, 3
	note A_, 2
	note B_, 3
	note G_, 3
	note B_, 2
	octave 5
	note C#, 3
	octave 4
	note A_, 3
	note B_, 16
; Pat 17 Row 14
	note __, 2
	dutycycle $0
	callchannel Music_TPP_Credits_Ch2_P1
	octave 3
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	callchannel Music_TPP_Credits_Ch2_P2
	octave 3
	note C_, 2
	note G_, 2
	note A#, 2
; Pat 23 Row 0
	octave 4
	note C_, 4
	note C_, 1
	note __, 1
	note C_, 6
	note D#, 4
	note D_, 4
	note D_, 1
	note __, 1
	note D_, 6
	note F_, 4
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note D#, 6
	note G_, 4
	note F_, 12
	note G_, 2
	note F_, 2
; Pat 24 Row 0
	note D#, 6
	note C_, 6
	note D#, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 4
	note D#, 4
	note F_, 4
	note G_, 10
	note C_, 2
	note D#, 2
	note G_, 2
	note F_, 10
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note F_, 2
; Pat 25 Row 0
	note D#, 4
	note D#, 1
	note __, 1
	note D#, 6
	note G_, 4
	note F_, 4
	note F_, 1
	note __, 1
	note F_, 6
	note A#, 4
	octave 5
	note C_, 6
	note D_, 6
	note D#, 4
	note F_, 12
	note G_, 2
	note F_, 2
; Pat 26 Row 0
	note D#, 6
	note C_, 6
	note D#, 4
	note D_, 4
	octave 4
	note A#, 4
	note G_, 4
	note A#, 4
	note G#, 3
	note F_, 3
	note G#, 2
	note A#, 3
	note G_, 3
	note A#, 2
	octave 5
	note C_, 3
	octave 4
	note G#, 3
	octave 5
	note C_, 2
	note D_, 3
	octave 4
	note A#, 5
; Pat 27 Row 0
	intensity $c8
	vibrato $0, $0
	octave 5
	note C_, 16
	vibrato $7, $32
	note C_, 16
	vibrato $0, $0
	note C_, 16
	intensity $c7
	vibrato $7, $12
	note C_, 16
; Pat 28 Row 0
	octave 4
	note C_, 6
	note E_, 2
	note G_, 8
	note C_, 6
	note E_, 2
	note A#, 6
	note A_, 1
	note G#, 1
	note G_, 6
	octave 3
	note G#, 1
	note A_, 1
	note A#, 6
	note A_, 1
	note G#, 1
	octave 5
	note C_, 2
	note __, 2
	note C_, 4
	notetype $8, $c7
	octave 4
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note B_, 2
	notetype $c, $c7
	octave 5
	note C_, 16
	endchannel

Music_TPP_Credits_Ch2_P1:
	octave 4
	note F#, 4
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	note A_, 4
	note B_, 16
	octave 4
	note F#, 4
	note D_, 2
	note C#, 4
	octave 3
	note F#, 2
	note A_, 4
; Pat 9 Row 0
	note B_, 16
	octave 4
	note F#, 4
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	note A_, 4
	note B_, 16
	octave 4
	note F#, 4
	note D_, 2
	note C#, 4
	endchannel

Music_TPP_Credits_Ch2_P2:
; Pat 12 Row 0
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 6
	octave 4
	note D_, 4
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 6
	octave 4
	note E_, 4
	note E_, 2
	note C#, 2
	note E_, 2
	note B_, 6
	note F#, 2
	note E_, 2
	note F#, 8
	note E_, 4
	note F#, 4
; Pat 10 Row 0
	note G_, 6
	note B_, 6
	octave 5
	note D_, 4
	note C#, 6
	note D_, 6
	note E_, 4
	note C#, 16
	octave 4
	note A#, 10
	dutycycle $1
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note A_, 2
; Pat 11 Row 0
	note B_, 4
	note B_, 1
	note __, 1
	note B_, 6
	octave 4
	note D_, 4
	note C#, 4
	note C#, 1
	note __, 1
	note C#, 6
	note E_, 4
	note F#, 2
	note B_, 2
	note F#, 2
	note D_, 6
	note F#, 4
	note E_, 12
	note F#, 2
	note E_, 2
; Pat 14 Row 0
	note D_, 6
	octave 3
	note B_, 6
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	note E_, 4
	note F#, 10
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note E_, 10
	endchannel

Music_TPP_Credits_Ch3:
; Pat 0 Row 0
	notetype $c, $33
	stereopanning $ff
	octave 2
	note B_, 16
	note B_, 16
	intensity $23
	note B_, 16
	note B_, 16
; Pat 1 Row 0
	intensity $13
	note B_, 16
	note F#, 16
	note G_, 16
	note A_, 16
; Pat 2 Row 0
	note G_, 16
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
; Pat 3 Row 0
Music_TPP_Credits_Ch3_L1:
	callchannel Music_TPP_Credits_Ch3_P1
	loopchannel 8, Music_TPP_Credits_Ch3_L1
; Pat 9 Row 0
; Pat 4 Row 0
	callchannel Music_TPP_Credits_Ch3_P2
	note F#, 4
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note F#, 1
	intensity $33
	note F#, 1
	intensity $13
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note F#, 2
	note C#, 2
; Pat 5 Row 0
	callchannel Music_TPP_Credits_Ch3_P2
	note A_, 4
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note A_, 1
	intensity $33
	note A_, 1
	intensity $13
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note A_, 2
	note A#, 2
; Pat 6 Row 0
	callchannel Music_TPP_Credits_Ch3_P2
	note F#, 4
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note F#, 1
	intensity $33
	note F#, 1
	intensity $13
	note C#, 1
	intensity $33
	note F#, 1
	intensity $13
	note F#, 2
	note C#, 2
; Pat 7 Row 0
	callchannel Music_TPP_Credits_Ch3_P2
	note A_, 4
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note A_, 1
	intensity $33
	note A_, 1
	intensity $13
	note E_, 1
	intensity $33
	note A_, 1
	intensity $13
	note A_, 2
	note G#, 2
; Pat 8 Row 0
Music_TPP_Credits_Ch3_L2:
	note G_, 8
	note D_, 4
	note G_, 4
	note A_, 8
	note E_, 4
	note A_, 4
	note A#, 8
	note F_, 4
	note A#, 4
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	loopchannel 3, Music_TPP_Credits_Ch3_L2
; Pat 13 Row 0
; Pat 12 Row 0
; Pat 10 Row 0
	note G_, 8
	note D_, 4
	note G_, 4
	note A_, 8
	note E_, 4
	note A_, 4
	note A#, 16
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A_, 2
	note A#, 2
; Pat 11 Row 0
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note D_, 1
	note F#, 1
	note E_, 2
	octave 1
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 2
	note F#, 2
	octave 1
	note A_, 1
	octave 2
	note C#, 1
; Pat 14 Row 0
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note A_, 2
	note E_, 1
	note C#, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note A_, 2
	note E_, 1
	note C#, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note A_, 2
	note C#, 1
	note E_, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note D_, 1
	note F#, 1
	note A_, 2
	note E_, 1
	note C#, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note A_, 2
	note E_, 1
	note C#, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note A_, 2
	note C#, 1
	note E_, 1
; Pat 15 Row 0
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note F#, 1
	note D_, 1
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note B_, 2
	note D_, 1
	note F#, 1
	note E_, 2
	octave 1
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 2
	note F#, 2
	octave 1
	note A_, 1
	octave 2
	note C#, 1
; Pat 16 Row 0
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 2
	note G_, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	note C#, 1
	octave 1
	note A_, 1
	note F#, 1
	note A_, 1
	octave 2
	note F#, 2
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note E_, 2
	octave 1
	note B_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	octave 2
	note E_, 2
	note F#, 2
	note C#, 1
	note F#, 2
	note C#, 1
	note F#, 2
	note G_, 2
	note D_, 1
	note G_, 2
	note D_, 1
	note G_, 2
	note A_, 2
	note E_, 1
	note A_, 2
	note E_, 1
	note A_, 2
; Pat 17 Row 0
Music_TPP_Credits_Ch3_L3:
	callchannel Music_TPP_Credits_Ch3_P1
	loopchannel 7, Music_TPP_Credits_Ch3_L3
; Pat 18 Row 0
	intensity $13
	octave 2
	note B_, 2
	intensity $33
	note B_, 2
	octave 1
	note B_, 2
	intensity $13
	octave 2
	note B_, 2
	intensity $33
	note A_, 2
	intensity $13
	note A_, 1
	intensity $33
	note A_, 1
	intensity $13
	note A_, 1
	intensity $33
	note A_, 1
	octave 1
	note A_, 2
; Pat 12 Row 0
	intensity $13
	octave 2
	note G_, 8
	note D_, 4
	note G_, 4
	note A_, 8
	note E_, 4
	note A_, 4
	note A#, 8
	note F_, 4
	note A#, 4
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 2
; Pat 10 Row 0
	note G_, 8
	note D_, 4
	note G_, 4
	note A_, 8
	note E_, 4
	note A_, 4
	note A#, 16
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A#, 2
	intensity $33
	note A#, 2
	intensity $13
	note A_, 2
	note A#, 2
; Pat 21 Row 0
	note G_, 16
	note F#, 16
	note B_, 16
	note E_, 12
	note F#, 4
; Pat 22 Row 0
	note G_, 16
	note A_, 16
	note B_, 16
	note A_, 8
	octave 3
	note C_, 4
	octave 2
	note A#, 4
; Pat 23 Row 0
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note C_, 1
	note D#, 1
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note D#, 1
	note G_, 1
	note F_, 2
	note C_, 1
	octave 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 2
	note G_, 2
	octave 1
	note A#, 1
	octave 2
	note D_, 1
; Pat 24 Row 0
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note C_, 1
	note D#, 1
	note A#, 2
	note F_, 1
	note D_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	note A#, 2
	note F_, 1
	note D_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	note A#, 2
	note D_, 1
	note F_, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note D#, 1
	note G_, 1
	note A#, 2
	note F_, 1
	note D_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	note A#, 2
	note F_, 1
	note D_, 1
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	note A#, 2
	note D_, 1
	note F_, 1
; Pat 25 Row 0
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note C_, 1
	note D#, 1
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	octave 3
	note C_, 2
	octave 2
	note D#, 1
	note G_, 1
	note F_, 2
	note C_, 1
	octave 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 2
	note G_, 2
	octave 1
	note A#, 1
	octave 2
	note D_, 1
; Pat 26 Row 0
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	octave 2
	note C_, 1
	note G#, 2
	note C_, 1
	note D#, 1
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 2
	note G_, 2
	octave 1
	note A#, 1
	octave 2
	note D_, 1
	note F_, 2
	note C_, 1
	note F_, 2
	note C_, 1
	note F_, 2
	note G_, 2
	note D_, 1
	note G_, 2
	note D_, 1
	note G_, 2
	note G#, 2
	note D#, 1
	note G#, 2
	note D#, 1
	note G#, 2
	note A#, 2
	note F_, 1
	note A#, 2
	note F_, 1
	note A#, 2
; Pat 27 Row 0
	octave 3
	note C_, 16
	note C_, 16
	octave 2
	note G#, 16
	note G#, 16
; Pat 28 Row 0
	octave 3
	note C_, 16
	note C_, 16
	octave 2
	note G#, 16
	note G#, 2
	note __, 2
	note G#, 4
	notetype $8, $13
Music_TPP_Credits_Ch3_L4:
	intensity $13
	note A#, 1
	intensity $23
	note A#, 1
	loopchannel 6, Music_TPP_Credits_Ch3_L4
	notetype $c, $13
	octave 3
	note C_, 8
	intensity $23
	note C_, 10
	intensity $33
	note C_, 10
	endchannel

Music_TPP_Credits_Ch3_P1:
	intensity $13
	octave 2
	note B_, 2
	intensity $33
	note B_, 2
	octave 1
	note B_, 2
	intensity $13
	octave 2
	note B_, 2
	intensity $33
	note B_, 2
	intensity $13
	note B_, 1
	intensity $33
	note B_, 1
	intensity $13
	note B_, 1
	intensity $33
	note B_, 1
	octave 1
	note B_, 2
	endchannel

Music_TPP_Credits_Ch3_P2:
	intensity $13
	octave 2
	note B_, 4
	note F#, 1
	intensity $33
	note B_, 1
	intensity $13
	note F#, 1
	intensity $33
	note B_, 1
	intensity $13
	note B_, 1
	intensity $33
	note B_, 1
	intensity $13
	note F#, 1
	intensity $33
	note B_, 1
	intensity $13
	note B_, 2
	note F#, 2
	note E_, 4
	octave 1
	note B_, 1
	intensity $33
	octave 2
	note E_, 1
	intensity $13
	octave 1
	note B_, 1
	intensity $33
	octave 2
	note E_, 1
	intensity $13
	note E_, 1
	intensity $33
	note E_, 1
	intensity $13
	octave 1
	note B_, 1
	intensity $33
	octave 2
	note E_, 1
	intensity $13
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note G_, 4
	note D_, 1
	intensity $33
	note G_, 1
	intensity $13
	note D_, 1
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	note D_, 1
	intensity $33
	note G_, 1
	intensity $13
	note G_, 2
	note D_, 2
	endchannel

Music_TPP_Credits_Ch4:
; Pat 0 Row 56
	notetype $c
	togglenoise $5
	stereopanning $ff
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
; Pat 1 Row 0
Music_TPP_Credits_Ch4_L1:
	note B_, 8
	note G#, 6
	note B_, 2
	loopchannel 4, Music_TPP_Credits_Ch4_L1
; Pat 2 Row 0
	note B_, 2
	note C_, 4
	note B_, 2
	note G#, 4
	note B_, 2
	note C_, 2
	note B_, 2
	note C_, 2
	note C_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
; Pat 3 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note E_, 1
; Pat 9 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note G#, 1
; Pat 4 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note E_, 1
; Pat 5 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note E_, 1
; Pat 6 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note E_, 1
; Pat 7 Row 0
Music_TPP_Credits_Ch4_L2:
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	loopchannel 3, Music_TPP_Credits_Ch4_L2
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note G#, 1
	note G#, 1
; Pat 8 Row 0
Music_TPP_Credits_Ch4_L3:
	note B_, 2
	note E_, 2
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	loopchannel 8, Music_TPP_Credits_Ch4_L3
; Pat 13 Row 0
	callchannel Music_TPP_Credits_Ch4_P2
; Pat 11 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note D_, 1
; Pat 14 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note G#, 1
; Pat 15 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note D_, 1
; Pat 16 Row 0
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note G#, 1
; Pat 17 Row 0
	callchannel Music_TPP_Credits_Ch4_P1
	note E_, 1
; Pat 18 Row 0
Music_TPP_Credits_Ch4_L4:
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	loopchannel 3, Music_TPP_Credits_Ch4_L4
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note G#, 1
	note G#, 1
; Pat 12 Row 0
	callchannel Music_TPP_Credits_Ch4_P2
; Pat 21 Row 0
	note G#, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
; Pat 22 Row 48
	note D_, 2
	note D_, 2
	note C#, 2
	note C#, 2
	note C_, 2
	note C_, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
; Pat 23 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note D_, 1
; Pat 24 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note G#, 1
; Pat 25 Row 0
	callchannel Music_TPP_Credits_Ch4_P3
	note D_, 1
; Pat 26 Row 0
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
; Pat 27 Row 0
Music_TPP_Credits_Ch4_L5:
	note B_, 8
	note G#, 6
	note B_, 2
	loopchannel 7, Music_TPP_Credits_Ch4_L5
; Pat 28 Row 0
	note B_, 4
	note G#, 4
	notetype $8
	note B_, 2
	note B_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note B_, 2
	notetype $c
	note F#, 16
	endchannel

Music_TPP_Credits_Ch4_P1:
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	loopchannel 3, Music_TPP_Credits_Ch4_P1
	note B_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	endchannel

Music_TPP_Credits_Ch4_P2:
; Pat 12 Row 0
	note B_, 2
	note E_, 2
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 2
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 1
	note B_, 1
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 1
	note B_, 2
	note G#, 1
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
; Pat 10 Row 0
	note B_, 2
	note E_, 2
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 2
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 1
	note B_, 1
	note F_, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	endchannel

Music_TPP_Credits_Ch4_P3:
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	loopchannel 3, Music_TPP_Credits_Ch4_P3
	note B_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	endchannel
