	db REMORAID ; 223

	db  35,  65,  35,  95,  85,  35 ; BST 300 > 350
	;   hp  atk  def  spd  sat  sdf
;	db  35,  65,  35,  65,  65,  35 old stats

	db WATER, WATER
	db 190 ; catch rate
	db 60 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FISH ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, GUNK_SHOT, STRING_SHOT, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, FLAMETHROWER, ICE_BEAM
	; end
