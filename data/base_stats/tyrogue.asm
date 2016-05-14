	db TYROGUE ; 236

	db  35,  35,  35,  35,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 75 ; catch rate
	db 42 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 0 ; gender
	db 100 ; unknown
	db 25 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, STRENGTH,
	; end
