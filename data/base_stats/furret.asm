	db FURRET ; 162

	db  95,  96,  74, 120,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 90 ; catch rate
	db 145 ; base exp
	db BERRY ; item 1
	db GOLD_BERRY ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, SURF, STRENGTH, WHIRLPOOL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE

	; end
