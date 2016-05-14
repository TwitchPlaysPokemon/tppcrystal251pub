	db HORSEA ; 116

	db 30, 40, 70, 60, 70, 25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db 59 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, DRAGON_PULSE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
