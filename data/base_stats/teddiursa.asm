	db TEDDIURSA ; 216

	db  60,  80,  50,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 120 ; catch rate
	db 66 ; base exp
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
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, GUNK_SHOT, SEISMIC_TOSS, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, STRENGTH, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
