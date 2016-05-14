	db RHYHORN ; 111

	db 80, 85, 95, 25, 30, 30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK
	db 120 ; catch rate
	db 69 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, FLARE_BLITZ, DRAGON_PULSE, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, STRENGTH, WHIRLPOOL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
