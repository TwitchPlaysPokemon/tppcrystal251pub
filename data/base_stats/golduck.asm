	db GOLDUCK ; 055

	db 80, 82, 78, 85, 95, 80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 75 ; catch rate
	db 175 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, FURY_CUTTER, SUBSTITUTE, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE
	; end
