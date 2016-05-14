	db MAGCARGO ; 219

	db  50,  60, 160,  30,  90,  120 ; BST 410 > 520
	;   hp  atk  def  spd  sat  sdf
;	db  50,  40, 120,  30,  80,  80 old stats

	db FIRE, ROCK
	db 75 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, WILLOWISP, HYPER_BEAM, PROTECT, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLAMETHROWER
	; end
