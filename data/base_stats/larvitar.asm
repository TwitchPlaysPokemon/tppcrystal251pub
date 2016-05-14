	db LARVITAR ; 246

	db  50,  64,  50,  41,  45,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 45 ; catch rate
	db 60 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 40 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, DARK_PULSE, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE,
	; end
