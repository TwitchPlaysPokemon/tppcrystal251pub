	db KRABBY ; 098

	db  60, 105, 90,   65,  45, 25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, REST, ATTRACT, THIEF, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM, FALSE_SWIPE

	; end
