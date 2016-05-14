	db SNUBBULL ; 209

	db  60,  80,  50,  30,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db FAIRY_T, FAIRY_T
	db 190 ; catch rate
	db 60 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn FIELD, FAIRY ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, WILD_CHARGE, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
