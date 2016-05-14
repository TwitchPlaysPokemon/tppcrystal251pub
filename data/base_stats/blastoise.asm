	db BLASTOISE ; 009

	db 79, 83, 100, 78, 85, 105
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 45 ; catch rate
	db 239 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, DRAGON_PULSE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, DARK_PULSE, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE

	; end
