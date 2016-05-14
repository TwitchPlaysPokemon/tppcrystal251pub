	db SWINUB ; 220

	db  60,  75,  50,  50,  50,  40 ; BST 250 > 325
	;   hp  atk  def  spd  sat  sdf
;	db  50,  50,  40,  50,  30,  30 old stats

	db ICE, GROUND
	db 225 ; catch rate
	db 50 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, EARTH_POWER, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, STRENGTH, ICE_BEAM
	; end
