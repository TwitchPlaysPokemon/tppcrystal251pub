	db JOLTEON ; 135

	db  65,  75,  70, 130, 110, 95
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
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
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT

	; end
