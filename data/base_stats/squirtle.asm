	db SQUIRTLE ; 007

	db 44, 48, 65, 43, 50, 64
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 45 ; catch rate
	db 63 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, DRAGON_PULSE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE
	; end
