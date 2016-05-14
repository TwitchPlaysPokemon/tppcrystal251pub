	db ARIADOS ; 168

	db  91, 117,  91,  52,  78,  78
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 90 ; catch rate
	db 137 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, PSYCHIC, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, STRING_SHOT, DARK_PULSE, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH,

	; end
