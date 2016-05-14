	db HO_OH ; 250

	db 106, 130,  90,  90, 110, 154
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING
	db 3 ; catch rate
	db 253 ; base exp
	db SACRED_ASH ; item 1
	db SACRED_ASH ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 120 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, THUNDER_WAVE, SUBSTITUTE, FLY, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT
	; end
