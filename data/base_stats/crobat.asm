	db CROBAT ; 169

	db  85,  90,  80, 130,  70,  80
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING
	db 90 ; catch rate
	db 241 ; base exp
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
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, GUNK_SHOT, STRING_SHOT, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, FLY,

	; end
