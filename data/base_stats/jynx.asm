	db JYNX ; 124

	db 65, 50, 35, 95, 115, 95
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC
	db 45 ; catch rate
	db 159 ; base exp
	db ICE_BERRY ; item 1
	db ICE_BERRY ; item 2
	db 254 ; gender
	db 100 ; unknown
	db 25 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, FOCUS_BLAST, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SEISMIC_TOSS, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH, ICE_BEAM, ICE_PUNCH
	; end
