	db LANTURN ; 171

	db 125,  58,  58,  67,  76,  76
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC
	db 75 ; catch rate
	db 161 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm CURSE, DAZZLINGLEAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, WILD_CHARGE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, SURF, FLASH, WHIRLPOOL, WATERFALL, THUNDERBOLT, ICE_BEAM
	; end
