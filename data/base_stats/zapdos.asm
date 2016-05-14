	db ZAPDOS ; 145

	db 90, 90, 85, 100, 125, 90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING
	db 3 ; catch rate
	db 251 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 80 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, WILD_CHARGE, THUNDER, RETURN, SKY_ATTACK, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, THUNDER_WAVE, SUBSTITUTE, FLY, FLASH, THUNDERBOLT
	; end
