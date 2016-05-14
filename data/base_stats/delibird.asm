	db DELIBIRD ; 225

	db  105,  65,  65,  85,  75,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING
	db 45 ; catch rate
	db 116 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, GUNK_SHOT, SEISMIC_TOSS, REST, ATTRACT, THIEF, SUBSTITUTE, FLY, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE
	; end
