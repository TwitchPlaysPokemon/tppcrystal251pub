	db CLOYSTER ; 091

	db 50, 95, 180, 70, 85, 45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE
	db 60 ; catch rate
	db 184 ; base exp
	db PEARL ; item 1
	db BIG_PEARL ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, HIDDEN_POWER,   BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, SURF, WHIRLPOOL, ICE_BEAM
	; end
