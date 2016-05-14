	db MAREEP ; 179

	db  55,  40,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 235 ; catch rate
	db 56 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, PROTECT, RAIN_DANCE, FLARE_BLITZ, WILD_CHARGE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT
	; end
