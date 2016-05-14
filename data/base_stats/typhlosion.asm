	db TYPHLOSION ; 157

	db  78,  84,  78, 100, 109,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 240 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, HYPER_BEAM, PROTECT, FLARE_BLITZ, WILD_CHARGE, SOLARBEAM, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, REST, ATTRACT, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, STRENGTH, FLAMETHROWER, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
