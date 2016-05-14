	db LUGIA ; 249

	db 106,  90, 130, 110,  90, 154
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING
	db 3 ; catch rate
	db 253 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 120 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, DRAGON_PULSE, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, THUNDER_WAVE, SUBSTITUTE, FLY, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, THUNDERBOLT, ICE_BEAM
	; end
