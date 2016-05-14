	db URSARING ; 217

	db  90, 130,  75,  55,  75,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 60 ; catch rate
	db 175 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, GUNK_SHOT, SEISMIC_TOSS, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, STRENGTH, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
