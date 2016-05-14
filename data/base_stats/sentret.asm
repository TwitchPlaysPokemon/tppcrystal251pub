	db SENTRET ; 161

	db  35,  46,  34,  20,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db 43 ; base exp
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, SOLARBEAM, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, SURF, WHIRLPOOL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
