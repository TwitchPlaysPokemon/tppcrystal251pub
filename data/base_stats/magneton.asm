	db MAGNETON ; 082

	db 50, 60, 95, 70, 120, 70
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL
	db 60 ; catch rate
	db 163 ; base exp
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, WILD_CHARGE, FLASH_CANNON, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT
	; end
