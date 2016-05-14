	db MACHOP ; 066

	db 70, 80, 50, 35, 35, 35
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 180 ; catch rate
	db 61 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 63 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLAMETHROWER, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
