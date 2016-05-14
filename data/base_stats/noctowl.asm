	db NOCTOWL ; 164

	db 110,  75,  50,  70,  86,  96 ; BST 442 > 487
	;   hp  atk  def  spd  sat  sdf
;	db 100,  50,  50,  70,  76,  96 old stats

	db NORMAL, FLYING
	db 90 ; catch rate
	db 155 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FLASH_CANNON, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SUBSTITUTE, FLY, FLASH,
	; end
