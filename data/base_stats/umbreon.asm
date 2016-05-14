	db UMBREON ; 197

	db  95,  75, 110,  65,  70, 130 ; BST 525 > 545
	;   hp  atk  def  spd  sat  sdf
;	db  95,  65, 110,  65,  60, 130 old stats

	db DARK, DARK
	db 45 ; catch rate
	db 184 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 35 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DARK_PULSE, REST, ATTRACT, SUBSTITUTE, CUT, FLASH,
	; end
