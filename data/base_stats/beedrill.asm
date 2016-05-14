	db BEEDRILL ; 015

	db 105, 100, 80, 85, 60, 95
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 45 ; catch rate
	db 173 ; base exp
	db NO_ITEM ; item 1
	db POISON_BARB ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWORDS_DANCE, STRING_SHOT, REST, ATTRACT, THIEF, FURY_CUTTER,SUBSTITUTE, CUT, FLASH, FALSE_SWIPE

	; end
