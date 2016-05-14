	db ARCANINE ; 059

	db 90, 110, 80, 100, 100, 80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 75 ; catch rate
	db 194 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 63 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, HYPER_BEAM, PROTECT, FLARE_BLITZ, WILD_CHARGE, SOLARBEAM, DRAGON_PULSE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, THIEF, SUBSTITUTE, FLAMETHROWER

	; end
