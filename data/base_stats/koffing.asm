	db KOFFING ; 109

	db 40, 65, 95, 35, 60, 45
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 190 ; catch rate
	db 68 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, PROTECT, RAIN_DANCE, THUNDER, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH, FLAMETHROWER, THUNDERBOLT
	; end
