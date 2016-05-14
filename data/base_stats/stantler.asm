	db STANTLER ; 234

	db  88,  95,  62,  85,  85,  65 ; BST 465 > 480
	;   hp  atk  def  spd  sat  sdf
;	db  73,  95,  62,  85,  85,  65 old stats

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 163 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FLARE_BLITZ, WILD_CHARGE, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, THUNDER_WAVE, SUBSTITUTE, FLASH,
	; end
