	db HOOTHOOT ; 163

	db  60,  40,  40,  50,  56,  56 ; BST 262 > 302
	;   hp  atk  def  spd  sat  sdf
;	db  60,  30,  30,  50,  36,  56 old stats

	db NORMAL, FLYING
	db 255 ; catch rate
	db 52 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SUBSTITUTE, FLY, FLASH,
	; end
