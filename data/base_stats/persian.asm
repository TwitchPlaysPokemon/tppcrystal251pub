	db PERSIAN ; 053

	db 65, 70, 60, 115, 65, 65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 90 ; catch rate
	db 154 ; base exp
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
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, GUNK_SHOT, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, CUT, FLASH, THUNDERBOLT, FALSE_SWIPE
	; end
