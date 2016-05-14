	db MEOWTH ; 052

	db 40, 45, 35, 90, 40, 40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db 58 ; base exp
	db AMULET_COIN ; item 1
	db AMULET_COIN ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, GUNK_SHOT, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, CUT, FLASH, THUNDERBOLT, FALSE_SWIPE
	; end 
