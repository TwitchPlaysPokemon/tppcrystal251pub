	db OCTILLERY ; 224

	db  75, 105,  75,  45, 105,  75
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 75 ; catch rate
	db 168 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FISH ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, FLASH_CANNON, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, GUNK_SHOT, SEISMIC_TOSS, STRING_SHOT, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, SURF, WHIRLPOOL, WATERFALL, FLAMETHROWER, ICE_BEAM
	; end
