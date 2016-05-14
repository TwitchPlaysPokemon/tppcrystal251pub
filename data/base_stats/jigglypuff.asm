	db JIGGLYPUFF ; 039

	db 115, 45, 20, 20, 45, 25
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY_T
	db 170 ; catch rate
	db 95 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 10 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn FAIRY, FAIRY ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, WILD_CHARGE, SOLARBEAM, THUNDER, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
