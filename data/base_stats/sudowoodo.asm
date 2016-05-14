	db SUDOWOODO ; 185

	db  80, 110, 155,  30,  30, 105; (+10 attack and HP +40 sdef)
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK
	db 65 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, PROTECT, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SEISMIC_TOSS, STRING_SHOT, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, STRENGTH, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
