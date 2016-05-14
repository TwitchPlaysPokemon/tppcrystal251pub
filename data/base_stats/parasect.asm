	db PARASECT ; 047

	db 100, 115, 115, 75, 100, 80
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS
	db 75 ; catch rate
	db 142 ; base exp
	db TINYMUSHROOM ; item 1
	db BIG_MUSHROOM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INSECT, PLANT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWORDS_DANCE, STRING_SHOT, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, FLASH, FALSE_SWIPE

	; end
