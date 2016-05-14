	db WOOPER ; 194

	db  75,  65,  45,  25,  55,  35 ; BST 210 > 300
	;   hp  atk  def  spd  sat  sdf
;	db  55,  45,  45,  15,  25,  25 old stats

	db WATER, GROUND
	db 255 ; catch rate
	db 42 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, EARTH_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, REST, ATTRACT, SUBSTITUTE, SURF, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM, ICE_PUNCH
	; end
