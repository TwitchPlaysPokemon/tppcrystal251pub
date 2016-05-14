	db LAPRAS ; 131

	db 130, 85, 80, 60, 85, 95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 40 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SOLARBEAM, DRAGON_PULSE, THUNDER, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, THUNDERBOLT, ICE_BEAM
	; end
