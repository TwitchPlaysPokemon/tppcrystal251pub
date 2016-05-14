	db POLIWHIRL ; 061

	db 65, 65, 65, 90, 50, 50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 120 ; catch rate
	db 135 ; base exp
	db NO_ITEM ; item 1
	db KINGS_ROCK ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn AMPHIBIAN, AMPHIBIAN ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, SUBSTITUTE, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
