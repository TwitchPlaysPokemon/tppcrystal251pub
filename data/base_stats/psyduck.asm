	db PSYDUCK ; 054

	db 50, 52, 48, 55, 65, 50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, SUBSTITUTE, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
