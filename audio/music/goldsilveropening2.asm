Music_GoldSilverOpening2: ; f7308
	dbw $c0, Music_GoldSilverOpening2_Ch1
	dbw $01, Music_GoldSilverOpening2_Ch2
	dbw $02, Music_GoldSilverOpening2_Ch3
	dbw $03, Music_GoldSilverOpening2_Ch4
; f7314

Music_GoldSilverOpening2_Ch1:
	tempo 92
	dutycycle $1
	notetype $c, $d4
	vibrato $0, $0
	stereopanning $f0
	note __, 10
; Pat 4 Row 10
Music_GoldSilverOpening2_Ch1_L1:
	octave 3
	intensity $d4
	note G_, 2
	note G_, 2
	note G_, 2
	intensity $d7
	note G#, 10
	intensity $d4
	note G_, 2
	note G_, 2
	note G_, 2
	intensity $d7
	note A#, 4
	note G#, 4
	note F_, 2
	loopchannel 2, Music_GoldSilverOpening2_Ch1_L1
; Pat 5 Row 0
	intensity $d4
	note G_, 2
	note G_, 2
	note G_, 2
	intensity $d7
	octave 4
	note G#, 8
	note A#, 8
	octave 5
	note C_, 6
	note D#, 2
	intensity $e
	note D_, 16
	intensity $f8
	note D_, 16
	intensity $d4
	octave 1
	note D_, 4
	endchannel

Music_GoldSilverOpening2_Ch2:
	dutycycle $1
	notetype $c, $d4
	vibrato $0, $0
	stereopanning $f0
	note __, 10
; Pat 4 Row 10
Music_GoldSilverOpening2_Ch2_L1:
	octave 3
	intensity $d4
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $d7
	note D#, 10
	intensity $d4
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $d7
	note F_, 4
	note D#, 4
	note C_, 2
	loopchannel 2, Music_GoldSilverOpening2_Ch2_L1
; Pat 5 Row 0
	intensity $d4
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $d7
	note G#, 8
	note A#, 8
	octave 4
	note C_, 6
	note D#, 2
	intensity $e
	note D_, 16
	intensity $f8
	note D_, 16
	intensity $d4
	octave 3
	note D_, 4
	endchannel

Music_GoldSilverOpening2_Ch3:
	notetype $6, $17
; Pat 4 Row 0
	octave 3
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	notetype $c, $17
	note G_, 2
	note G_, 2
	note G_, 2
Music_GoldSilverOpening2_Ch3_L1:
	octave 1
	note G#, 4
	octave 2
	note G#, 2
	note D#, 2
	note G#, 2
	note G_, 2
	note D_, 2
	note G#, 2
	loopchannel 4, Music_GoldSilverOpening2_Ch3_L1
; Pat 5 Row 0
	octave 2
	note G#, 4
	note D#, 2
	note C#, 2
	note A#, 4
	note F_, 2
	note D#, 2
	octave 3
	note C_, 4
	octave 2
	note G#, 2
	note F_, 2
Music_GoldSilverOpening2_Ch3_L2:
	octave 3
	note D_, 2
	octave 2
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	loopchannel 4, Music_GoldSilverOpening2_Ch3_L2
	note D_, 2
	endchannel

Music_GoldSilverOpening2_Ch4:
; Pat 4 Row 0
	notetype $c
	togglenoise $5
Music_GoldSilverOpening2_Ch4_L1:
	note A#, 1
	loopchannel 8, Music_GoldSilverOpening2_Ch4_L1
Music_GoldSilverOpening2_Ch4_L2:
	note A_, 1
	loopchannel 8, Music_GoldSilverOpening2_Ch4_L2
Music_GoldSilverOpening2_Ch4_L3:
	note G#, 4
	note C_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	loopchannel 4, Music_GoldSilverOpening2_Ch4_L3
; Pat 5 Row 0
Music_GoldSilverOpening2_Ch4_L4:
	note G#, 2
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	loopchannel 2, Music_GoldSilverOpening2_Ch4_L4
	note G#, 2
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note F#, 16
	note B_, 4
	endchannel
