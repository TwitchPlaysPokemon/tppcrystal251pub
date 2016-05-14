	db GROWLITHE ; 058

	db 55, 70, 45, 60, 70, 50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db 70 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 63 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, PROTECT, FLARE_BLITZ, WILD_CHARGE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, THIEF, SUBSTITUTE, FLAMETHROWER
	; end
