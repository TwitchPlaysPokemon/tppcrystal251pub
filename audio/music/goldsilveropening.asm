Music_GoldSilverOpening: ; f7055
	dbw $80, Music_GoldSilverOpening_Ch1
	dbw $01, Music_GoldSilverOpening_Ch2
	dbw $02, Music_GoldSilverOpening_Ch3
; f705e

Music_GoldSilverOpening_Ch1:
	tempo $100
	dutycycle $1
	notetype $c, $14
	vibrato $8, $12
	stereopanning $f0
; Pat 0 Row 0
; Pat 1 Row 0
; Pat 2 Row 0
	callchannel Music_GoldSilverOpening_P1
; Pat 3 Row 0
	note G_, 6
	note B_, 2
	octave 4
	note D_, 4
	octave 2
	note G_, 4
	octave 3
	note B_, 2
	octave 4
	note F_, 4
	note E_, 1
	note D#, 1
	note D_, 4
	octave 3
	note D#, 1
	note E_, 1
	note F_, 4
	note E_, 1
	note D#, 1
	note D_, 6
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 16
	endchannel

Music_GoldSilverOpening_Ch2:
; Pat 0 Row 0
	dutycycle $0
	notetype $4, $14
	vibrato $8, $12
	stereopanning $f
	note __, 1
	notetype $c, $14
; Pat 0 Row 0
; Pat 1 Row 0
; Pat 2 Row 0
	callchannel Music_GoldSilverOpening_P1
; Pat 3 Row 0
	note G_, 5
	notetype $8, $a4
	note __, 1
	notetype $c, $a4
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note F_, 6
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note D#, 6
	octave 2
	note B_, 2
	note G_, 2
	octave 3
	note D#, 2
	note F_, 6
	octave 2
	note B_, 2
	note G_, 2
	octave 3
	note F_, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note G_, 4
	endchannel

Music_GoldSilverOpening_Ch3:
; Pat 0 Row 0
	notetype $c, $33
	stereopanning $ff
	octave 2
	note G_, 16
	intensity $23
	note G_, 14
	notetype $4, $13
	octave 3
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	notetype $c, $13
; Pat 1 Row 0
	note G_, 16
	note F_, 16
	note D#, 16
	note F_, 16
; Pat 2 Row 0
Music_GoldSilverOpening_Ch3_L1:
	intensity $13
	octave 3
	note G_, 1
	intensity $33
	octave 2
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	intensity $33
	octave 2
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	intensity $33
	octave 2
	note F#, 1
	loopchannel 2, Music_GoldSilverOpening_Ch3_L1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	note G_, 10
	octave 3
	note F_, 1
	intensity $33
	octave 2
	note F_, 1
; Pat 3 Row 0
	intensity $13
	octave 3
	note G_, 1
	intensity $33
	octave 2
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note F_, 1
	octave 2
	intensity $33
	note F_, 1
	intensity $13
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	intensity $33
	note F_, 1
	intensity $13
	octave 3
	note F_, 1
	octave 2
	intensity $33
	note F_, 1
	intensity $13
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	intensity $33
	note F_, 1
	intensity $13
	octave 3
	note D#, 1
	octave 2
	intensity $33
	note D#, 1
	intensity $13
	note D#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 1
	intensity $33
	note D#, 1
	intensity $13
	octave 3
	note D#, 1
	octave 2
	intensity $33
	note D#, 1
	intensity $13
	note D#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 1
	intensity $33
	note D#, 1
	intensity $13
	octave 3
	note F_, 1
	octave 2
	intensity $33
	note F_, 1
	intensity $13
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	intensity $33
	note F_, 1
	intensity $13
	octave 3
	note F_, 1
	octave 2
	intensity $33
	note F_, 1
	intensity $13
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	intensity $33
	note F_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 1
	octave 2
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	note G_, 1
	intensity $33
	note G_, 1
	intensity $13
	octave 3
	note G_, 4
	endchannel

Music_GoldSilverOpening_P1:
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	intensity $24
	note F#, 1
	note G_, 1
	note B_, 1
	intensity $34
	octave 3
	note D_, 1
	note F#, 1
	note G_, 1
	intensity $44
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	intensity $54
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	note F#, 1
	intensity $64
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	intensity $74
	note F#, 1
	note G_, 1
	note B_, 1
	intensity $84
	octave 3
	note D_, 1
	note F#, 1
	note G_, 1
	intensity $94
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	intensity $a4
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	note F#, 1
; Pat 1 Row 0
	tempo $a8
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	note F#, 1
	octave 1
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
	octave 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 2
	note D_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 3
	note D_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 5
	note D_, 1
	octave 1
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
; Pat 2 Row 0
	note G_, 2
	octave 4
	intensity $54
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	intensity $a4
	octave 3
	note F#, 2
	note G_, 2
	octave 4
	intensity $54
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	intensity $a4
	octave 3
	note F#, 2
	note G_, 2
	octave 4
	intensity $54
	note D_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note D_, 2
	intensity $a4
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	endchannel
