	db MARILL ; 183

	db  70,  50,  50,  40,  40,  50 ; BST 250 > 300
	;   hp  atk  def  spd  sat  sdf
;	db  70,  20,  50,  40,  20,  50 old stats

	db WATER, FAIRY_T
	db 190 ; catch rate
	db 88 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn AMPHIBIAN, FAIRY ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, DAZZLINGLEAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
