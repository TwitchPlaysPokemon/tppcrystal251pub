	db FLAREON ; 136

	db  75, 130,  70,  65,  95, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 35 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, HYPER_BEAM, PROTECT, RAIN_DANCE, FLARE_BLITZ, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, SUBSTITUTE, FLAMETHROWER

	; end
