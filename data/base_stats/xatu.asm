	db XATU ; 178

	db  65,  80,  80,  95,  100,  80 ; BST 470 > 500
	;   hp  atk  def  spd  sat  sdf
;	db  65,  75,  70,  95,  95,  70

	db PSYCHIC, FLYING
	db 75 ; catch rate
	db 165 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, DAZZLINGLEAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLY, FLASH,
	; end
