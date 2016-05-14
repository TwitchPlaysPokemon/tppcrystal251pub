	db POLIWRATH ; 062

	db 90, 95, 95, 70, 70, 90
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIGHTING
	db 45 ; catch rate
	db 225 ; base exp
	db NO_ITEM ; item 1
	db KINGS_ROCK ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn AMPHIBIAN, AMPHIBIAN ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, ROCK_SLIDE, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
