	db GOLDEEN ; 118

	db  55,  77,  70,  63,  35,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, FURY_CUTTER, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM

	; end
