	db RAICHU ; 026

	db 60, 90, 55, 110, 90, 80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 75 ; catch rate
	db 214 ; base exp
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 10 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FAIRY ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, WILD_CHARGE, THUNDER, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLY, SURF, STRENGTH, FLASH, THUNDERBOLT, THUNDERPUNCH, FALSE_SWIPE
	; end
