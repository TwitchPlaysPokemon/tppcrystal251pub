	db CORSOLA ; 222

	db  85,  85,  85,  35,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, ROCK
	db 60 ; catch rate
	db 133 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM

	; end
