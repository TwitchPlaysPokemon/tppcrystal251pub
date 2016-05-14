	db HERACROSS ; 214

	db  80, 125,  75,  85,  40,  95
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIGHTING
	db 45 ; catch rate
	db 175 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 25 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, FOCUS_BLAST, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, FURY_CUTTER, CUT, STRENGTH, FALSE_SWIPE
	; end
