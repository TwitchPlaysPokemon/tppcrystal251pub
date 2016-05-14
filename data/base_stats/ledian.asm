	db LEDIAN ; 166

	db  85,  65,  60,  85,  75, 110 ; BST 390 > 480
	;   hp  atk  def  spd  sat  sdf
;	db  55,  35,  50,  85,  55, 110 old stats

	db BUG, FLYING
	db 90 ; catch rate
	db 137 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, STRING_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH, ICE_PUNCH, THUNDERPUNCH

	; end
