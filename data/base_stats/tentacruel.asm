	db TENTACRUEL ; 073

	db 80,  80,  65, 110, 80,  120
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON
	db 60 ; catch rate
	db 180 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, DAZZLINGLEAM, TOXIC, HIDDEN_POWER,   BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWORDS_DANCE, REST, ATTRACT, THIEF, SUBSTITUTE, CUT, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM

	; end
