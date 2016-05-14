	db VULPIX ; 037

	db 38, 41, 40, 65, 50, 65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db 60 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, PROTECT, FLARE_BLITZ, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DARK_PULSE, REST, ATTRACT, SUBSTITUTE, FLAMETHROWER
	; end
