	db SEAKING ; 119

	db  80,  92, 105,  68,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 60 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER,   BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, FURY_CUTTER, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM

	; end
