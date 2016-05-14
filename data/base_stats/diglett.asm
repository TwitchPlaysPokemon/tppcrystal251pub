	db DIGLETT ; 050

	db 10, 55, 25, 95, 35, 45

	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 255 ; catch rate
	db 53 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, PROTECT, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, CUT,

	; end
