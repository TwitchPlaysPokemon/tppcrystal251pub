	db EXEGGCUTE ; 102

	db 60, 40, 80, 40, 60, 45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC
	db 90 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWORDS_DANCE, REST, ATTRACT, THIEF, SUBSTITUTE, STRENGTH, FLASH,

	; end
