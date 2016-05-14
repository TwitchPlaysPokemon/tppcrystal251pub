	db FERALIGATR ; 160

	db  85, 105, 100,  78,  79,  83
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 45 ; catch rate
	db 239 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, FOCUS_BLAST, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, DRAGON_PULSE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, SWORDS_DANCE, REST, ATTRACT, ROCK_SLIDE, FURY_CUTTER, SUBSTITUTE, CUT, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH, FALSE_SWIPE

	; end
