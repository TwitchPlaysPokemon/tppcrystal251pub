	db GRAVELER ; 075

	db 55, 95, 115, 35, 45, 45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 120 ; catch rate
	db 137 ; base exp
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, PROTECT, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLAMETHROWER, THUNDERPUNCH, FIRE_PUNCH
	; end
