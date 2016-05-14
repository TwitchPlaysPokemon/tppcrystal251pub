	db CHARMANDER ; 004

	db 39, 52, 43, 65, 60, 50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, PROTECT, FLARE_BLITZ, DRAGON_PULSE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, FIRE_BLAST, SEISMIC_TOSS, SWORDS_DANCE, REST, ATTRACT, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, STRENGTH, FLAMETHROWER, THUNDERPUNCH, FIRE_PUNCH, FALSE_SWIPE
	; end
