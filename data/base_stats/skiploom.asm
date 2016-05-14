	db SKIPLOOM ; 188

	db  55,  45,  50,  80,  45,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 120 ; catch rate
	db 119 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn FAIRY, PLANT ; egg groups

	; tmhm
	tmhm CURSE, DAZZLINGLEAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, REST, ATTRACT, SUBSTITUTE, FLASH,
	; end
