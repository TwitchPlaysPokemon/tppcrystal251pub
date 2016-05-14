	db FARFETCH_D ; 083

	db 52, 65, 55, 60, 58, 62
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 45 ; catch rate
	db 123 ; base exp
	db NO_ITEM ; item 1
	db STICK ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, FLY, FALSE_SWIPE

	; end
