	db VILEPLUME ; 045

	db 75, 80, 85, 50, 110, 90
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 45 ; catch rate
	db 216 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, STRING_SHOT, REST, ATTRACT, SUBSTITUTE, CUT, FLASH,

	; end
