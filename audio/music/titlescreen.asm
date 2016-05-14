; Title Screen remix by Pigu
; originally made for a now abandoned Pokemon Crystal TPPSE
; Stereo panning added by TrainerTimmy

Music_TitleScreen: ; eb808
	dbw $c0, Music_TitleScreen_Ch1
	dbw $01, Music_TitleScreen_Ch2
	dbw $02, Music_TitleScreen_Ch3
	dbw $03, Music_TitleScreen_Ch4
; eb814

Music_TitleScreen_Ch1:
	tempo $77
	dutycycle $2
	notetype $6, $55
	vibrato $8, $12
	stereopanning $ff
	note __, 9
	octave 2
	note D_, 1
	note C#, 1
	note C_, 1
	octave 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
; Pat 1 Row 0
	notetype $c, $5b
	callchannel Music_TitleScreen_Ch1_P1
	octave 3
	note C_, 2
	note __, 1
; Pat 2 Row 1
	callchannel Music_TitleScreen_Ch1_P1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
; Pat 3 Row 0
Music_TitleScreen_Ch1_L1:
	intensity $b2
	stereopanning $ff
	octave 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 1
	note C_, 1
	octave 1
	note B_, 1
	note E_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	note E_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	note E_, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 1
	note E_, 1
	octave 2
	note E_, 1
	octave 1
	note B_, 1
	note A_, 1
	note D_, 1
	octave 2
	note D_, 2
	octave 1
	note A_, 1
	note D_, 1
	octave 2
	note D_, 2
	octave 1
	note A_, 1
	note D_, 1
	octave 2
	note D_, 2
	octave 1
	note A_, 1
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 1
; Pat 4 Row 0
; Pat 3 Row 0
	loopchannel 3, Music_TitleScreen_Ch1_L1
; Pat 5 Row 0
	octave 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 2
	note C_, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 1
	note C_, 1
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 2
	note D_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note E_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 2
	note E_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 2
	note E_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 2
	note E_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
; Pat 6 Row 0
	intensity $82
	stereopanning $f0
	octave 4
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	octave 3
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	octave 4
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	octave 3
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note A_, 1
	note A#, 1
	octave 3
	note D_, 1
	note F_, 1
	note A_, 1
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note A#, 1
	note B_, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note E_, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note E_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 5
	note C_, 1
	octave 3
	note E_, 1
	note G_, 1
	note B_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	octave 5
	note C_, 1
	note C#, 1
; Pat 7 Row 0
	intensity $b2
	stereopanning $f
Music_TitleScreen_Ch1_L2:
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 4
	note C_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 4
	note C_, 1
	octave 5
	note C#, 1
	octave 6
	note C#, 1
; Pat 8 Row 0
	loopchannel 3, Music_TitleScreen_Ch1_L2
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 1
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 4
	note C_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 4
	note C_, 1
	note B_, 1
	octave 5
	note B_, 1
; Pat 1 Row 0
	notetype $c, $5b
	callchannel Music_TitleScreen_Ch1_P1
	octave 3
	note C_, 2
	note __, 1
; Pat 9 Row 1
	callchannel Music_TitleScreen_Ch1_P1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
; Pat 10 Row 0
	intensity $b2
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 4
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 4
	octave 2
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 4
	note G_, 4
	note G_, 4
	note F_, 3
	note F_, 3
	note F#, 2
	note G_, 4
	octave 1
	note G_, 2
	endchannel

Music_TitleScreen_Ch2:
; Pat 0 Row 0
	dutycycle $3
	notetype $6, $c7
	vibrato $10, $22
	stereopanning $ff
	octave 1
	note G_, 3
	note B_, 3
	note D_, 3
	note G_, 2
	note B_, 2
	octave 2
	note D_, 1
	note E_, 1
	note F_, 1
; Pat 1 Row 0
	notetype $c, $8b
	callchannel Music_TitleScreen_Ch2_P1
	octave 4
	note C_, 2
	note G_, 2
; Pat 2 Row 0
	callchannel Music_TitleScreen_Ch2_P1
	stereopanning $ff
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
; Pat 3 Row 0
	intensity $c7
	callchannel Music_TitleScreen_Ch2_P2
; Pat 4 Row 0
	stereopanning $ff
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	octave 2
	note G_, 6
	octave 3
	note C_, 2
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	octave 4
	note C_, 2
	note D_, 8
	octave 3
	stereopanning $f0
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 2
	note D_, 8
	note C_, 3
	note C_, 3
	octave 2
	note B_, 2
; Pat 3 Row 0
	callchannel Music_TitleScreen_Ch2_P2
; Pat 5 Row 0
	stereopanning $ff
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	octave 2
	note G_, 6
	octave 3
	note C_, 2
	stereopanning $ff
	octave 4
	note F_, 3
	note E_, 3
	note F_, 2
	note G_, 6
	note A#, 2
	note G_, 8
	octave 3
	note G_, 8
	octave 4
	note A_, 8
; Pat 6 Row 0
	note A#, 6
	note F_, 2
	note F_, 6
	octave 3
	note G_, 1
	note A_, 1
	note A#, 6
	note F_, 2
	octave 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 6
	octave 4
	note G_, 2
	note G_, 6
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	octave 3
	note G_, 2
	octave 5
	note C_, 4
	note C#, 4
; Pat 7 Row 0
Music_TitleScreen_Ch2_L1:
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	stereopanning $f0
	intensity $c7
	octave 5
	note D_, 1
	stereopanning $ff
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	stereopanning $f0
	intensity $c7
	octave 5
	note D_, 1
	stereopanning $ff
	intensity $8b
	octave 4
	note A_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	stereopanning $f0
	intensity $c7
	octave 5
	note D_, 1
	stereopanning $ff
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	stereopanning $ff
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 4
	note A_, 1
	stereopanning $f0
	intensity $c7
	octave 5
	note C_, 1
	stereopanning $ff
	intensity $8b
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	intensity $c7
	octave 5
	note C_, 1
	intensity $8b
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	stereopanning $f0
	intensity $c7
	octave 5
	note C#, 1
	stereopanning $ff
	intensity $8b
	octave 4
	note C#, 1
; Pat 8 Row 0
	loopchannel 3, Music_TitleScreen_Ch2_L1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 4
	note A_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	intensity $c7
	octave 5
	note D_, 1
	intensity $8b
	octave 4
	note A_, 1
	intensity $c7
	octave 5
	note C_, 1
	intensity $8b
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	intensity $c7
	octave 5
	note C_, 1
	intensity $8b
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	intensity $c7
	note B_, 1
	intensity $8b
	octave 3
	note B_, 1
; Pat 1 Row 0
	callchannel Music_TitleScreen_Ch2_P1
	octave 4
	note C_, 2
	note G_, 2
; Pat 9 Row 0
	callchannel Music_TitleScreen_Ch2_P1
	octave 4
	stereopanning $ff
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
; Pat 10 Row 0
	intensity $c7
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 1
	intensity $8b
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	intensity $c7
	octave 4
	note F_, 1
	intensity $8b
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	intensity $c7
	octave 4
	note F#, 1
	intensity $8b
	octave 3
	note F#, 1
	intensity $c7
	octave 4
	note G_, 2
	note __, 2
	octave 3
	note G_, 2
	endchannel

Music_TitleScreen_Ch3:
; Pat 1 Row 0
	customwave $ffff, $0007, $ff77, $7777, $7777, $7707, $77ff, $0000
	notetype $c, $1f
	stereopanning $ff
	octave 2
	note __, 8
	octave 2
	note G_, 16
	note F_, 16
	note E_, 16
	note F_, 16
; Pat 2 Row 0
	note G_, 16
	note F_, 16
	note E_, 16
	note F_, 16
; Pat 3 Row 0
Music_TitleScreen_Ch3_L1:
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $3f
	note G_, 4
	stereopanning $f
	intensity $1f
	note F_, 2
	stereopanning $f0
	intensity $2f
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note F_, 2
	stereopanning $f0
	intensity $2f
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	intensity $3f
	note F_, 4
	stereopanning $f
	intensity $1f
	note E_, 2
	stereopanning $f0
	intensity $2f
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note E_, 2
	stereopanning $f0
	intensity $2f
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	intensity $3f
	note E_, 4
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	intensity $3f
	note D_, 4
; Pat 4 Row 0
; Pat 3 Row 0
	loopchannel 3, Music_TitleScreen_Ch3_L1
; Pat 5 Row 0
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $3f
	note G_, 4
	stereopanning $f
	intensity $1f
	note F_, 2
	stereopanning $f0
	intensity $2f
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note F_, 2
	intensity $2f
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	intensity $3f
	note F_, 4
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note G_, 2
	stereopanning $f0
	intensity $2f
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $3f
	note G_, 4
	stereopanning $f
	intensity $1f
	note A_, 2
	stereopanning $f0
	intensity $2f
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note A_, 2
	stereopanning $f0
	intensity $2f
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	intensity $3f
	note A_, 4
; Pat 6 Row 0
	stereopanning $f
	intensity $1f
	note A#, 6
	note F_, 6
	note D_, 4
	octave 1
	note A#, 4
	octave 2
	note C_, 4
	note D_, 4
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 3
	note C_, 6
	octave 2
	note G_, 6
	note E_, 4
	note C_, 4
	note D_, 4
	note E_, 4
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
; Pat 7 Row 0
Music_TitleScreen_Ch3_L2:
	octave 3
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	intensity $3f
	note D_, 4
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note D_, 2
	note C_, 1
	stereopanning $f0
	intensity $2f
	octave 2
	note C_, 1
	octave 4
	note C_, 1
	stereopanning $f
	intensity $1f
	octave 3
	note C_, 1
	stereopanning $f0
	intensity $2f
	octave 2
	note C_, 1
	octave 4
	note C_, 1
	stereopanning $f
	intensity $1f
	octave 3
	note C#, 1
	stereopanning $f0
	intensity $2f
	octave 2
	note C#, 1
; Pat 8 Row 0
	loopchannel 3, Music_TitleScreen_Ch3_L2
	stereopanning $f
	intensity $1f
	octave 3
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	intensity $3f
	note D_, 4
	stereopanning $f
	intensity $1f
	note D_, 2
	stereopanning $f0
	intensity $2f
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	stereopanning $f
	intensity $1f
	note D_, 2
	note C_, 1
	stereopanning $f0
	intensity $2f
	octave 2
	note C_, 1
	octave 4
	note C_, 1
	stereopanning $f
	intensity $1f
	octave 3
	note C_, 1
	stereopanning $f0
	intensity $2f
	octave 2
	note C_, 1
	octave 4
	note C_, 1
	stereopanning $f
	intensity $1f
	octave 2
	note B_, 1
	stereopanning $f0
	intensity $2f
	octave 1
	note B_, 1
; Pat 1 Row 0
	stereopanning $ff
	intensity $1f
	octave 2
	note G_, 16
	note F_, 16
	note E_, 16
	note F_, 16
; Pat 9 Row 0
	note G_, 16
	note F_, 16
	note E_, 16
	note F_, 12
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
; Pat 10 Row 0
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	octave 3
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 1
	note G_, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 1
	stereopanning $f
	intensity $2f
	octave 2
	note F_, 1
	stereopanning $f0
	octave 4
	note F_, 1
	stereopanning $ff
	intensity $1f
	octave 3
	note F_, 1
	stereopanning $f
	intensity $2f
	octave 2
	note F_, 1
	stereopanning $f0
	octave 4
	note F_, 1
	stereopanning $ff
	intensity $1f
	octave 3
	note F#, 1
	stereopanning $f
	intensity $2f
	octave 2
	note F#, 1
	stereopanning $ff
	intensity $1f
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	endchannel

Music_TitleScreen_Ch4:
; Pat 0 Row 10
	notetype $6
	togglenoise $5
	stereopanning $f0
	note __, 10
	note C_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
; Pat 1 Row 0
	notetype $c
	note G#, 16
	note D#, 16
	note D#, 16
	note D#, 16
; Pat 2 Row 0
	note G#, 16
	note D#, 16
	note D#, 16
	note D#, 12
	note C_, 1
	note C_, 1
	note C#, 1
	note C_, 1
; Pat 3 Row 0
Music_TitleScreen_Ch4_L1:
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note F_, 2
	note C_, 1
	note D#, 1
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note D#, 1
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 4
	note D#, 2
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note C_, 1
	note C#, 1
	note D#, 1
	note D#, 1
; Pat 4 Row 0
; Pat 3 Row 0
	loopchannel 3, Music_TitleScreen_Ch4_L1
; Pat 5 Row 0
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note F_, 2
	note C_, 1
	note D#, 1
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note D#, 1
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 4
	note D#, 2
	note C_, 2
	note D#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C#, 1
	note C#, 1
; Pat 6 Row 0
	note G#, 16
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note G#, 16
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
; Pat 7 Row 0
Music_TitleScreen_Ch4_L2:
	note C_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note F_, 1
; Pat 8 Row 0
	loopchannel 4, Music_TitleScreen_Ch4_L2
; Pat 1 Row 0
	note G#, 16
	note D#, 16
	note D#, 16
	note D#, 16
; Pat 9 Row 0
	note G#, 16
	note D#, 16
	note D#, 16
	note D#, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C#, 1
	note C_, 1
; Pat 10 Row 0
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 4
	note B_, 2
	endchannel

Music_TitleScreen_Ch1_P1:
	octave 1
	note __, 1
	note G_, 2
	octave 2
	note C_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	note __, 2
	octave 1
	note F_, 2
	note B_, 2
	octave 2
	note C_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note __, 2
	octave 1
	note E_, 2
	note A_, 2
	note B_, 2
	octave 2
	note E_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	note __, 2
	octave 1
	note F_, 2
	note A#, 2
	octave 2
	note C_, 2
	note F_, 2
	note A_, 2
	note A#, 2
	endchannel

Music_TitleScreen_Ch2_P1:
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note G_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note F_, 2
	octave 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 2
	note F_, 2
	note A#, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note A#, 2
	endchannel

Music_TitleScreen_Ch2_P2:
	stereopanning $ff
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	octave 2
	note G_, 6
	octave 3
	note B_, 2
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 6
	octave 3
	stereopanning $f0
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 2
	endchannel
