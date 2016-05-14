	db GYARADOS ; 130

	db 95, 125, 79, 81, 60, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 45 ; catch rate
	db 189 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 5 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FISH, REPTILE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, DRAGON_PULSE, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, DARK_PULSE, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
