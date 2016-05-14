	db IGGLYBUFF ; 174

	db  90,  30,  15,  15,  40,  20
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY_T
	db 170 ; catch rate
	db 42 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 10 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, WILD_CHARGE, SOLARBEAM, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, FLASH, FLAMETHROWER
	; end
