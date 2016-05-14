	db TOGETIC ; 176

	db  60,  45,  85,  55,  95, 105 ; BST 405 > 445
	;   hp  atk  def  spd  sat  sdf
;	db  55,  40,  85,  40,  80, 105 old stats

	db FAIRY_T, FLYING
	db 75 ; catch rate
	db 142 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 10 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn AVIAN, FAIRY ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, THUNDER_WAVE, SUBSTITUTE, FLY, FLASH, FLAMETHROWER
	; end
