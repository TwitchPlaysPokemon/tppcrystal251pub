	db KINGLER ; 099

	db  75, 140, 125,  85,  70, 50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 60 ; catch rate
	db 166 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM, FALSE_SWIPE

	; end
