SeafoamIslandsB3F_MapScriptHeader:
	db 0

	db 0

ArticunoScript1:
	faceplayer
	loadfont
	writetext ArticunoText1
	cry ARTICUNO
	waitbutton
	closetext
	loadpokedata ARTICUNO, 95
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	writebyte ARTICUNO
	special SpecialMonCheck
	iffalse DontKillArticuno
	disappear $2
	setevent EVENT_FOUGHT_ARTICUNO
DontKillArticuno:
	returnafterbattle
	end


ArticunoText1:
	text "Fuoooh!"
	done

SeafoamIslandsB3F_MapEventHeader:
	db 0, 0

	db 2
	warp_def 3, 3, 3, GROUP_SEAFOAM_ISLANDS_B2F, MAP_SEAFOAM_ISLANDS_B2F
	warp_def 21, 3, 4, GROUP_SEAFOAM_ISLANDS_B2F, MAP_SEAFOAM_ISLANDS_B2F

	db 0

	db 0

	db 1
	person_event SPRITE_ARTICUNO, 12, 8, $16, 0, 0, -1, -1, 1, 0, 0, ArticunoScript1, EVENT_FOUGHT_ARTICUNO
