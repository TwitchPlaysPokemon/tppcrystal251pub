	db KINGDRA ; 230

	db  75,  95,  95,  85,  95,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, DRAGON
	db 45 ; catch rate
	db 243 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, DRAGON_PULSE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end