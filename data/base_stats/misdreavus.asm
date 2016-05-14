	db MISDREAVUS ; 200

	db  65,  70,  60,  85,  85,  85 ; BST 435 > 450
	;   hp  atk  def  spd  sat  sdf
;	db  60,  60,  60,  85,  85,  85 old stats

	db GHOST, GHOST
	db 45 ; catch rate
	db 87 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 25 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, DAZZLINGLEAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, ICY_WIND, PROTECT, RAIN_DANCE, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, DARK_PULSE, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT
	; end
