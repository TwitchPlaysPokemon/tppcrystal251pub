	db KABUTO ; 140

	db 30, 80, 90, 55, 55, 45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER
	db 45 ; catch rate
	db 71 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 30 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, EARTH_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, WATERFALL, WHIRLPOOL, ICE_BEAM
	; end
