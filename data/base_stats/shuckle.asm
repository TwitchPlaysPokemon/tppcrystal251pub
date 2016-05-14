	db SHUCKLE ; 213

	db  20,  10, 230,  05,  10, 230
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK
	db 190 ; catch rate
	db 177 ; base exp
	db BERRY ; item 1
	db BERRY ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 5, 5 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, PROTECT, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, STRING_SHOT, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLASH,
	; end
