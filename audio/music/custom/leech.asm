; Rise of the Leech King
; Original composition by Mark Roebbelen
; from the album Helix Symphony
; released in 2015/03/01
; demake by pigdevil2010 in 2015/03/08
; Thanks for the MIDI!

Music_Leech:
	dbw $C0, Music_Leech_Ch1
	dbw $01, Music_Leech_Ch2
	dbw $02, Music_Leech_Ch3
	dbw $03, Music_Leech_Ch4

Music_Leech_Ch1:
; Pat 0 Row 0
	tempo $85
	dutycycle $1
	notetype $c, $b6
	vibrato $a, $33
	octave 4
	note G#, 12
	note G#, 4
	note G#, 8
	note F#, 8
	note E_, 12
	note D#, 4
	note E_, 8
	note D#, 8
; Pat 1 Row 0
	notetype $c, $b3
	octave 5
	note G#, 4
	note A_, 4
	note E_, 4
	note D#, 4
	octave 4
	note F#, 4
	note A_, 4
	notetype $c, $b6
	note F#, 4
	note A_, 4
	note G#, 12
	note A_, 4
	note G#, 16
; Pat 2 Row 0
	notetype $c, $b3
	octave 3
	callchannel Music_Leech_Ch1_C1
	callchannel Music_Leech_Ch1_C1
	note F#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	callchannel Music_Leech_Ch1_C1
	callchannel Music_Leech_Ch1_C2
	callchannel Music_Leech_Ch1_C2
	note F#, 1
	note C_, 1
	note G#, 1
	note C_, 1
	callchannel Music_Leech_Ch1_C2
; Pat 3 Row 0
	notetype $c, $a7
	callchannel Music_Leech_Ch1_C3
; Pat 4 Row 0
	octave 4
	note C#, 16
	octave 3
	note B_, 6
	notetype $c, $b3
	octave 4
	note C#, 4
	note D#, 4
	octave 3
	note A#, 8
	note G#, 10
	notetype $c, $a7
	note G#, 16
; Pat 5 Row 0
; Pat 7 Row 0
; Pat 6 Row 0
Music_Leech_Ch1_L1:
	callchannel Music_Leech_Ch1_C3
	loopchannel 3, Music_Leech_Ch1_L1
; Pat 8 Row 0
	callchannel Music_Leech_Ch1_C8
; Pat 9 Row 0
	dutycycle $1
	notetype $c, $b6
	vibrato $a, $33
Music_Leech_Ch1_L2:
	callchannel Music_Leech_Ch1_C4
	loopchannel 4, Music_Leech_Ch1_L2
	callchannel Music_Leech_Ch1_C5
; Pat 10 Row 0
Music_Leech_Ch1_L3:
	callchannel Music_Leech_Ch1_C4
	loopchannel 2, Music_Leech_Ch1_L3
Music_Leech_Ch1_L4:
	callchannel Music_Leech_Ch1_C6
	loopchannel 2, Music_Leech_Ch1_L4
	callchannel Music_Leech_Ch1_C5
; Pat 11 Row 0
; Pat 12 Row 0
	callchannel Music_Leech_Ch1_C7
; Pat 3 Row 0
	notetype $c, $a7
	callchannel Music_Leech_Ch1_C3
; Pat 4 Row 0
	octave 4
	note C#, 16
	octave 3
	note B_, 6
	notetype $c, $b3
	octave 4
	note C#, 4
	note D#, 4
	octave 3
	note A#, 8
	note G#, 10
	notetype $c, $a7
	note G#, 16
; Pat 5 Row 0
; Pat 7 Row 0
Music_Leech_Ch1_L5:
	callchannel Music_Leech_Ch1_C3
	loopchannel 2, Music_Leech_Ch1_L5
; Pat 14 Row 0
	callchannel Music_Leech_Ch1_C8
; Pat 9 Row 0
	dutycycle $1
	notetype $c, $b6
	vibrato $a, $33
Music_Leech_Ch1_L6:
	callchannel Music_Leech_Ch1_C4
	loopchannel 4, Music_Leech_Ch1_L6
	callchannel Music_Leech_Ch1_C5
; Pat 10 Row 0
Music_Leech_Ch1_L7:
	callchannel Music_Leech_Ch1_C4
	loopchannel 2, Music_Leech_Ch1_L7
Music_Leech_Ch1_L8:
	callchannel Music_Leech_Ch1_C6
	loopchannel 2, Music_Leech_Ch1_L8
	callchannel Music_Leech_Ch1_C5
; Pat 11 Row 0
; Pat 12 Row 0
	callchannel Music_Leech_Ch1_C7
; Pat 16 Row 0
	notetype $c, $a7
	octave 3
	note C#, 16
	note E_, 8
	note C#, 8
	note D#, 4
	note C#, 4
	octave 2
	note B_, 16
	octave 3
	note D#, 8
; Pat 17 Row 0
	note C#, 16
	note D#, 8
	note E_, 8
	octave 2
	note B_, 4
	octave 3
	note C#, 4
	note D#, 4
	octave 2
	note F#, 4
	note G#, 4
	note F#, 4
	note B_, 4
	note G#, 4
; Pat 18 Row 0
	octave 3
	note C#, 16
	note E_, 16
	note C#, 4
	note D#, 4
	note E_, 8
	octave 4
	note D#, 8
	octave 3
	note B_, 8
; Pat 19 Row 0
	note A_, 16
	note B_, 16
	octave 4
	note C#, 16
	octave 3
	note F_, 16
; Pat 20 Row 0
	notetype $c, $83
	vibrato $7, $45
	callchannel Music_Leech_Ch2_C11
	notetype $8, $83
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	notetype $c, $83
	callchannel Music_Leech_Ch2_C12
	notetype $8, $83
	callchannel Music_Leech_Ch2_C13
; Pat 15 Row 0
	dutycycle $2
	notetype $c, $bb
	note __, 16
	octave 3
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	notetype $8, $bb
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 4
	endchannel

Music_Leech_Ch1_C1:
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	endchannel

Music_Leech_Ch1_C2:
	note D#, 1
	note C_, 1
	note G#, 1
	note C_, 1
	endchannel

Music_Leech_Ch1_C3:
	octave 4
	note C#, 16
	octave 3
	note B_, 16
	note A#, 16
	note G#, 16
	endchannel

Music_Leech_Ch1_C4:
	note C#, 1
	note E_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	octave 2
	note E_, 1
	endchannel

Music_Leech_Ch1_C5:
	octave 1
	note B_, 1
	octave 2
	note D#, 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note D#, 1
	octave 2
	note B_, 1
	note D#, 1
	loopchannel 4, Music_Leech_Ch1_C5
	endchannel

Music_Leech_Ch1_C6:
	note C#, 1
	note E_, 1
	octave 3
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note C#, 1
	octave 2
	note E_, 1
	endchannel

Music_Leech_Ch1_C7:
	octave 1
	note A_, 1
	octave 2
	note E_, 1
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	octave 2
	note A_, 1
	note E_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 2
	note E_, 1
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note E_, 1
	octave 2
	note B_, 1
	note E_, 1
	note A_, 1
	octave 3
	note C#, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note C#, 1
	octave 2
	note A_, 1
	note C#, 1
	note E_, 1
	octave 3
	note C#, 1
	octave 4
	note C#, 1
	octave 2
	note D#, 1
	note F#, 1
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	octave 2
	note E_, 1
	note G#, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note G#, 1
	note E_, 1
	octave 2
	note G#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note B_, 1
	octave 3
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	octave 2
	note B_, 1
	note F#, 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	note D#, 1
	notetype $8, $b6
	octave 4
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave 1
	note A_, 1
	octave 4
	note B_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D#, 1
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	octave 3
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	octave 2
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D#, 1
	octave 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	octave 2
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	notetype $c, $b6
Music_Leech_Ch1_C7L:
	octave 5
	note C#, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	octave 4
	note C#, 1
	loopchannel 4, Music_Leech_Ch1_C7L
	endchannel

Music_Leech_Ch1_C8:
	octave 4
	note C#, 16
	octave 3
	note B_, 16
	note A#, 16
	note G#, 8
	dutycycle $2
	notetype $c, $bb
	vibrato $7, $45
	note C#, 1
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	octave 2
	note B_, 1
	note __, 1
	endchannel

Music_Leech_Ch2:
; Pat 0 Row 0
	dutycycle $1
	notetype $c, $b6
	vibrato $a, $33
	octave 4
	note C#, 12
	note C#, 4
	octave 3
	note B_, 8
	note B_, 8
	note G#, 12
	note G#, 4
	octave 4
	note C_, 8
	note C_, 16
; Pat 1 Row 8
	note __, 16
	notetype $c, $a7
	note C#, 8
	note C_, 16
	note C_, 16
; Pat 2 Row 0
	note C_, 16
	note __, 16
	callchannel Music_Leech_Ch2_C2
; Pat 6 Row 0
	callchannel Music_Leech_Ch2_C3
; Pat 8 Row 0
	dutycycle $1
	notetype $c, $b3
	vibrato $a, $33
	callchannel Music_Leech_Ch2_C3
; Pat 9 Row 0
	dutycycle $2
	notetype $c, $bb
	vibrato $7, $45
Music_Leech_Ch2_L1:
	callchannel Music_Leech_Ch2_C4
	loopchannel 4, Music_Leech_Ch2_L1
	callchannel Music_Leech_Ch2_C5
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note __, 1
; Pat 10 Row 0
Music_Leech_Ch2_L2:
	callchannel Music_Leech_Ch2_C4
	loopchannel 2, Music_Leech_Ch2_L2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D#, 1
	note F#, 1
	note __, 1
	callchannel Music_Leech_Ch2_C5
	callchannel Music_Leech_Ch2_C11
	notetype $8, $bb
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	notetype $c, $bb
	callchannel Music_Leech_Ch2_C12
	notetype $8, $bb
	callchannel Music_Leech_Ch2_C13
	callchannel Music_Leech_Ch2_C14
	callchannel Music_Leech_Ch2_C2
; Pat 14 Row 0
	dutycycle $1
	notetype $c, $b3
	vibrato $a, $33
	callchannel Music_Leech_Ch2_C3
; Pat 9 Row 0
	dutycycle $2
	notetype $c, $bb
	vibrato $7, $45
Music_Leech_Ch2_L3:
	callchannel Music_Leech_Ch2_C4
	loopchannel 4, Music_Leech_Ch2_L3
	callchannel Music_Leech_Ch2_C5
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note __, 1
; Pat 10 Row 0
Music_Leech_Ch2_L4:
	callchannel Music_Leech_Ch2_C4
	loopchannel 2, Music_Leech_Ch2_L4
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D#, 1
	note F#, 1
	note __, 1
	callchannel Music_Leech_Ch2_C5
	callchannel Music_Leech_Ch2_C11
	notetype $8, $bb
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	notetype $c, $bb
	callchannel Music_Leech_Ch2_C12
	notetype $8, $bb
	callchannel Music_Leech_Ch2_C13
	callchannel Music_Leech_Ch2_C14
; Pat 16 Row 0
	dutycycle $1
	vibrato $a, $33
	notetype $c, $a7
	octave 4
	note C#, 16
	note C#, 8
	note C#, 8
	octave 3
	note B_, 8
	note B_, 16
	note B_, 8
; Pat 17 Row 0
	octave 4
	note C#, 16
	note C#, 8
	note C#, 8
	octave 3
	note B_, 8
	octave 4
	note D#, 4
	octave 3
	note F#, 4
	note G#, 4
	note F#, 4
	note B_, 4
	note G#, 4
; Pat 18 Row 0
	octave 4
	note E_, 16
	note E_, 16
	note E_, 4
	note F#, 4
	note G#, 4
	note B_, 4
	note G#, 8
	note B_, 8
; Pat 19 Row 0
	note C#, 16
	note C#, 8
	note D#, 8
	note F_, 16
	note C#, 16
; Pat 20 Row 0
	dutycycle $2
	notetype $c, $bb
	vibrato $7, $45
	callchannel Music_Leech_Ch2_C6
	notetype $8, $bb
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	notetype $c, $bb
	callchannel Music_Leech_Ch2_C12
; Pat 21 Row 0
	notetype $8, $bb
	callchannel Music_Leech_Ch2_C13
	callchannel Music_Leech_Ch2_C14
; Pat 15 Row 0
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	notetype $8, $bb
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	endchannel

Music_Leech_Ch2_C11:
	octave 3
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note B_, 1
	octave 4
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note B_, 1
Music_Leech_Ch2_C6:
	octave 5
	note E_, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 4
	note G#, 1
	note E_, 1
	note G#, 1
	endchannel

Music_Leech_Ch2_C12:
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note E_, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	octave 4
	note E_, 1
	note B_, 1
	octave 5
	note E_, 1
	note F#, 1
	octave 4
	note G#, 1
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	note G#, 1
	note B_, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note G#, 1
	note E_, 1
	note D#, 1
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	endchannel

Music_Leech_Ch2_C13:
	note C#, 1
	note E_, 1
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	note G#, 1
	octave 6
	note C#, 1
	octave 5
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note G#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	note G#, 1
	octave 6
	note C#, 1
	octave 5
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note G#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note B_, 1
	octave 5
	note D#, 1
	note F#, 1
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	note F#, 1
	note D#, 1
	octave 4
	note B_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note B_, 1
	octave 5
	note D#, 1
	note F#, 1
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	note F#, 1
	note D#, 1
	octave 4
	note B_, 1
	note F#, 1
	endchannel

Music_Leech_Ch2_C14:
	note E_, 1
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note G#, 1
	note E_, 1
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	note G#, 1
	note E_, 1
	note C#, 1
	octave 4
	note G#, 1
	notetype $c, $bb
	octave 5
	note C#, 1
	note E_, 1
	note C#, 1
	octave 4
	note B_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note C#, 1
	note C#, 1
	note __, 3
	endchannel

Music_Leech_Ch2_C2:
	note __, 16
	note __, 16
	note __, 6
; Pat 3 Row 38
	dutycycle $1
	notetype $c, $b3
	note C#, 4
	octave 3
	note B_, 4
	note A#, 8
	note B_, 1
	note A#, 1
	note G#, 4
	dutycycle $2
	notetype $c, $bb
	vibrato $7, $45
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note E_, 1
; Pat 4 Row 0
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note E_, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note E_, 1
	note G#, 1
	octave 4
	note D#, 1
	octave 3
	note G#, 1
	note E_, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note E_, 1
	note C#, 1
; Pat 5 Row 0
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note E_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F#, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note E_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	octave 3
	note B_, 1
	note G#, 1
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note A#, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note A#, 1
	note G#, 1
	notetype $8, $bb
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	notetype $c, $bb
	note F#, 1
	note A#, 1
	note F#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	notetype $8, $bb
	note A#, 1
	octave 4
	note C#, 1
	note F#, 1
	notetype $c, $bb
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note F#, 1
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
; Pat 7 Row 0
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note G#, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	note C#, 1
	note G#, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	notetype $8, $bb
	note F#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	notetype $c, $bb
	note F#, 1
	note A#, 1
	note F#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	notetype $8, $bb
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note F#, 1
	notetype $c, $bb
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note F#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	note C#, 1
	note F#, 1
	endchannel

Music_Leech_Ch2_C3:
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note G#, 1
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note G#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note E_, 1
	note G#, 1
	note F#, 1
	note C#, 1
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note C#, 1
	note F#, 1
	endchannel

Music_Leech_Ch2_C4:
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note __, 1
	endchannel

Music_Leech_Ch2_C5:
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note __, 1
	loopchannel 2, Music_Leech_Ch2_C5
	endchannel

Music_Leech_Ch3:
; Pat 3 Row 0
	notetype $c, $12
	callchannel Music_Leech_BeginRest
Music_Leech_Ch3_L2:
	callchannel Music_Leech_Ch3_C1
	loopchannel 6, Music_Leech_Ch3_L2
; Pat 9 Row 0
strum: MACRO
	rept \2
	callchannel Music_Leech_Ch3_\1
	endr
ENDM
	strum A_C#, 2
	strum A_E_, 1
	strum A_C#, 1
	strum C_D#, 1
	strum C_C#, 1
	strum A_B_, 3
; Pat 10 Row 0
	strum A_C#, 2
	strum A_D#, 1
	strum A_E_, 1
	strum B_B_, 1
	strum C_C#, 1
	strum C_D#, 1
	strum B_F#, 1
	strum B_G#, 1
	strum B_F#, 1
	strum B_B_, 1
	strum B_G#, 1
; Pat 11 Row 0
	strum C_C#, 4
	strum C_E_, 5
	strum C_F#, 1
	strum C_G#, 2
	strum C_D#, 2
	strum B_B_, 2
; Pat 13 Row 0
	strum C_C#, 6
	strum B_B_, 1
	strum C_D#, 1
	strum C_C#, 8
Music_Leech_Ch3_L3:
	callchannel Music_Leech_Ch3_C1
	loopchannel 4, Music_Leech_Ch3_L3
; Pat 14 Row 0
Music_Leech_Ch3_L4:
	note __, 16
	loopchannel 4, Music_Leech_Ch3_L4
; Pat 9 Row 0
	strum A_C#, 2
	strum A_E_, 1
	strum A_C#, 1
	strum C_D#, 1
	strum C_C#, 1
	strum A_B_, 3
; Pat 10 Row 0
	strum A_C#, 2
	strum A_D#, 1
	strum A_E_, 1
	strum B_B_, 1
	strum C_C#, 1
	strum C_D#, 1
	strum B_F#, 1
	strum B_G#, 1
	strum B_F#, 1
	strum B_B_, 1
	strum B_G#, 1
; Pat 11 Row 0
	strum C_C#, 4
	strum C_E_, 5
	strum C_F#, 1
	strum C_G#, 2
	strum C_D#, 2
	strum B_B_, 2
; Pat 13 Row 0
	strum C_C#, 6
	strum B_B_, 1
	strum C_D#, 1
	strum C_C#, 8
; Pat 16 Row 0
	strum A_C#, 2
	strum A_E_, 1
	strum A_C#, 1
	strum C_D#, 1
	strum C_C#, 1
	strum A_B_, 3
; Pat 17 Row 0
	strum A_C#, 2
	strum A_D#, 1
	strum A_E_, 1
	strum B_B_, 1
	strum C_C#, 1
	strum C_D#, 1
	strum B_F#, 1
	strum B_G#, 1
	strum B_F#, 1
	strum B_B_, 1
	strum B_G#, 1
; Pat 18 Row 0
	strum C_C#, 4
	strum C_E_, 5
	strum C_F#, 1
	strum C_G#, 2
	strum C_D#, 2
	strum B_B_, 2
; Pat 19 Row 0
	strum C_C#, 6
	strum B_B_, 1
	strum C_D#, 1
	strum C_C#, 8
; Pat 20 Row 0
	strum C_C#, 4
	strum C_E_, 5
	strum C_F#, 1
	strum C_G#, 2
	strum C_D#, 2
	strum B_B_, 2
; Pat 22 Row 0
	strum C_C#, 6
	strum B_B_, 1
	strum C_D#, 1
	strum C_C#, 8
; Pat 15 Row 0
	octave 2
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note B_, 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note E_, 1
	notetype $8, $12
	note C#, 2
	octave 1
	note B_, 2
	octave 2
	note C#, 4
	endchannel

Music_Leech_Ch3_C1:
	octave 2
	note C#, 2
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	octave 4
	note D#, 2
	endchannel

def_strumA1: MACRO
	octave 1
	note \1, 1
	octave 2
	note \1, 1
	octave 1
	note \1, 1
	note __, 1
	note \1, 1
	note __, 1
	note \1, 1
	note __, 1
	endchannel
ENDM

def_strumA2: MACRO
	octave 2
	note \1, 1
	octave 3
	note \1, 1
	octave 2
	note \1, 1
	note __, 1
	note \1, 1
	note __, 1
	note \1, 1
	note __, 1
	endchannel
ENDM

def_strumB: MACRO
	octave 1
	note \1, 1
	octave 2
	note \1, 1
	octave 3
	note \1, 1
	octave 2
	note \1, 1
	endchannel
ENDM

def_strumC: MACRO
	octave 2
	note \1, 1
	octave 3
	note \1, 1
	octave 4
	note \1, 1
	octave 3
	note \1, 1
	endchannel
ENDM

Music_Leech_Ch3_A_B_: def_strumA1 B_
Music_Leech_Ch3_A_C#: def_strumA2 C#
Music_Leech_Ch3_A_D#: def_strumA2 D#
Music_Leech_Ch3_A_E_: def_strumA2 E_
Music_Leech_Ch3_B_F#: def_strumB F#
Music_Leech_Ch3_B_G#: def_strumB G#
Music_Leech_Ch3_B_B_: def_strumB B_
Music_Leech_Ch3_C_C#: def_strumC C#
Music_Leech_Ch3_C_D#: def_strumC D#
Music_Leech_Ch3_C_E_: def_strumC E_
Music_Leech_Ch3_C_F#: def_strumC F#
Music_Leech_Ch3_C_G#: def_strumC G#

Music_Leech_Ch4:
; Pat 3 Row 0
	notetype $c
	togglenoise 1
	callchannel Music_Leech_BeginRest
Music_Leech_Ch4_L1:
	note C_, 4
	loopchannel 94, Music_Leech_Ch4_L1
	note C_, 2
	note A#, 2
	note C_, 2
	note A#, 1
	note B_, 1
; Pat 9 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 11 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 3 Row 0
Music_Leech_Ch4_L2:
	note C_, 4
	loopchannel 64, Music_Leech_Ch4_L2
; Pat 14 Row 0
	note E_, 16
	note __, 16
	note __, 16
	note __, 16
; Pat 9 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 11 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 16 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 18 Row 0
	callchannel Music_Leech_Ch4_C1
; Pat 20 Row 0
	note F#, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note F_, 1
	note F_, 1
Music_Leech_Ch4_L3:
	note D_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	loopchannel 14, Music_Leech_Ch4_L3
; Pat 22 Row 56
	note D_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note F_, 1
Music_Leech_Ch4_L4:
	note C_, 1
	loopchannel 29, Music_Leech_Ch4_L4
	notetype $8
	note C_, 2
	note C_, 2
	note C_, 2
	endchannel

Music_Leech_BeginRest:
	note __, 16
	loopchannel 10, Music_Leech_BeginRest
	endchannel

Music_Leech_Ch4_C1:
	note F#, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note F_, 1
	note F_, 1
Music_Leech_Ch4_C1L:
	note D_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	note C_, 1
	note B_, 1
	note F_, 1
	note F_, 1
	loopchannel 15, Music_Leech_Ch4_C1L
	endchannel
