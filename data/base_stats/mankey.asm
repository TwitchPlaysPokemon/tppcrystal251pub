	db MANKEY ; 056

	db 40, 80, 35, 70, 35, 45
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 190 ; catch rate
	db 61 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, GUNK_SHOT, SEISMIC_TOSS, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, STRENGTH, THUNDERBOLT, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
