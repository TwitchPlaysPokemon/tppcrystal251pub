	db SNEASEL ; 215

	db  65, 115,  65, 125,  45,  85 ;(+20 attack, +10 all others)
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE
	db 60 ; catch rate
	db 86 ; base exp
	db NO_ITEM ; item 1
	db QUICK_CLAW ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SWORDS_DANCE, DARK_PULSE, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE
	; end
