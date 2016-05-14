	db NINETALES ; 038

	db  93,  92,  75,  100, 81, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 75 ; catch rate
	db 177 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 191 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, HYPER_BEAM, PROTECT, FLARE_BLITZ, SOLARBEAM, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DARK_PULSE, REST, ATTRACT, SUBSTITUTE, FLAMETHROWER

	; end
