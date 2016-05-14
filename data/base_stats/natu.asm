	db NATU ; 177

	db  40,  50,  45,  70,  70,  45
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, DAZZLINGLEAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLASH,
	; end
