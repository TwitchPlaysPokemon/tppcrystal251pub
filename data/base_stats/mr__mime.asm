	db MR__MIME ; 122

	db 40, 45, 65, 90, 100, 120
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY_T
	db 45 ; catch rate
	db 161 ; base exp
	db NO_ITEM ; item 1
	db MYSTERYBERRY ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 25 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SOLARBEAM, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
