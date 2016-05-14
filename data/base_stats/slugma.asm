	db SLUGMA ; 218

	db  50,  50,  50,  30,  80,  50 ; BST 250 > 310
	;   hp  atk  def  spd  sat  sdf
;	db  40,  40,  40,  20,  70,  40 old stats

	db FIRE, FIRE
	db 190 ; catch rate
	db 50 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, WILLOWISP, PROTECT, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, FLAMETHROWER
	; end
