	db PORYGON2 ; 233

	db  85,  80,  90,  60, 105,  95
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 180 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SOLARBEAM, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, THIEF, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT, ICE_BEAM
	; end
