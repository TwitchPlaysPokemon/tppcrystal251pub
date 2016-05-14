	db NIDORAN_M ; 032

	db 46, 57, 40, 50, 40, 40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 235 ; catch rate
	db 55 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 0 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, PROTECT, RAIN_DANCE, THUNDER, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, GUNK_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE,STRENGTH, THUNDERBOLT,ICE_BEAM, FALSE_SWIPE
	; end
