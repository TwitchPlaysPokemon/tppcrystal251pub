	db DUNSPARCE ; 206

	db 100,  70,  70,  45,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 190 ; catch rate
	db 145 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, PROTECT, RAIN_DANCE, FLARE_BLITZ, WILD_CHARGE, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, STRING_SHOT, REST, ATTRACT, THIEF, THUNDER_WAVE, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLAMETHROWER, THUNDERBOLT

	; end
