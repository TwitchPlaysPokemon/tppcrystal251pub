	db GRIMER ; 088

	db 80, 80, 50, 25, 40, 50
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 190 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, GUNK_SHOT, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, FLAMETHROWER, THUNDERBOLT, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
