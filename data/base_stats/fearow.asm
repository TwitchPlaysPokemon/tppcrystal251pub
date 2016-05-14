	db FEAROW ; 022

	db 84, 100,  65,  120, 71,  71
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 90 ; catch rate
	db 155 ; base exp
	db NO_ITEM ; item 1
	db SHARP_BEAK ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SUBSTITUTE, FLY, FALSE_SWIPE

	; end
