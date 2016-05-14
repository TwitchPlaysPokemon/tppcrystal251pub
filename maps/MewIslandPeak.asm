MewIslandPeak_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MewText:
	text "Mew!"
	done

MewScript:
	faceplayer
	loadfont
	writetext MewText
	cry MEW
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	loadpokedata MEW, 99
	startbattle
	writebyte MEW
	special SpecialMonCheck
	iffalse DontKillMew
	disappear $2
	setevent EVENT_FOUGHT_MEW
DontKillMew:
	returnafterbattle
	end

MewIslandPeak_MapEventHeader:
	; filler
	db 0, 0

	db 1
	warp_def $9, $9, 5, GROUP_MEWISLANDF2, MAP_MEWISLANDF2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_MONSTER, $8, $a, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, MewScript, EVENT_FOUGHT_MEW
