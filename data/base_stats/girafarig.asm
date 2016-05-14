	db GIRAFARIG ; 203

	db  70,  80,  75,  85,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC
	db 60 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, FLARE_BLITZ, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, STRENGTH, FLASH, THUNDERBOLT
	; end
