	db DODUO ; 084

	db 35, 85, 45, 75, 35, 35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 190 ; catch rate
	db 62 ; base exp
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
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SUBSTITUTE, FLY,

	; end
