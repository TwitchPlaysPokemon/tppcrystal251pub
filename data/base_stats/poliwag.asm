	db POLIWAG ; 060

	db 40, 50, 40, 90, 40, 40
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 255 ; catch rate
	db 60 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn AMPHIBIAN, AMPHIBIAN ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
