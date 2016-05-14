	db AMPHAROS ; 181

	db  90,  75,  85,  55, 115,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 45 ; catch rate
	db 225 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, WILD_CHARGE, FLASH_CANNON, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, STRENGTH, FLASH, THUNDERBOLT, THUNDERPUNCH, FIRE_PUNCH
	; end
