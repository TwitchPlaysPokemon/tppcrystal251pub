	db QUAGSIRE ; 195

	db  95,  85,  85,  35,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND
	db 90 ; catch rate
	db 151 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, EARTH_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, SEISMIC_TOSS, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
