	db GOLBAT ; 042

	db 75, 80, 70, 90, 65, 75
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING
	db 90 ; catch rate
	db 159 ; base exp
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
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, GUNK_SHOT, STRING_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE, FLY
	; end
