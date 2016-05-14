	db NIDORINA ; 030

	db 70, 62, 67, 56, 55, 55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 120 ; catch rate
	db 128 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 254 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY,   BLIZZARD, PROTECT, RAIN_DANCE, THUNDER, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, GUNK_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE, STRENGTH, THUNDERBOLT, ICE_BEAM, FALSE_SWIPE
	; end
