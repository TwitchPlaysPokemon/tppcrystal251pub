	db AERODACTYL ; 142

	db 80, 105, 65, 130, 60, 75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING
	db 45 ; catch rate
	db 180 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 35 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, DRAGON_PULSE, EARTHQUAKE, RETURN, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, FLY, FLAMETHROWER

	; end
