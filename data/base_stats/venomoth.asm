	db VENOMOTH ; 049

	db 105,  65,  60,  90, 130, 95
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 75 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, GUNK_SHOT, STRING_SHOT, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH,
	; end
