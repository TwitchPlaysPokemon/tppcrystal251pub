	db MURKROW ; 198

	db  85,  105, 52,  91, 105,  52 ; BST 405 > 490
	;   hp  atk  def  spd  sat  sdf
;	db  60,  85,  42,  91,  85,  42

	db DARK, FLYING
	db 30 ; catch rate
	db 81 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, SHADOW_BALL, PSYCHIC, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DARK_PULSE, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLY,
	; end
