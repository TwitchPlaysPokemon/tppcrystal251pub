	db YANMA ; 193

	db  70,  65,  60,  95,  105,  50 ; BST 390 > 445
	;   hp  atk  def  spd  sat  sdf
;	db  65,  65,  45,  95,  75,  45 old stats

	db BUG, FLYING
	db 75 ; catch rate
	db 78 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, STRING_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH,
	; end
