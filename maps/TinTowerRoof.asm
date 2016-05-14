TinTowerRoof_MapScriptHeader: ; 0x7722b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x77230
; 0x77230

UnknownScript_0x77230: ; 0x77230
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x77241
	checkitem RAINBOW_WING
	iftrue UnknownScript_0x7723e
	jump UnknownScript_0x77241
; 0x7723e

UnknownScript_0x7723e: ; 0x7723e
	appear $2
	return
; 0x77241

UnknownScript_0x77241: ; 0x77241
	disappear $2
	return
; 0x77244

HoOhScript_0x77244: ; 0x77244
	faceplayer
	loadfont
	writetext UnknownText_0x77260
	cry HO_OH
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadpokedata HO_OH, 100
	startbattle
	writebyte HO_OH
	special SpecialMonCheck
	iffalse .DontKillHoOh
	setevent EVENT_FOUGHT_HO_OH
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	disappear $2
.DontKillHoOh
	returnafterbattle
	end
; 0x77260

UnknownText_0x77260: ; 0x77260
	text "Shaoooh!"
	done
; 0x7726a

TinTowerRoof_MapEventHeader: ; 0x7726a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $d, $9, 4, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_HO_OH, 9, 13, $16, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, HoOhScript_0x77244, EVENT_HO_OH_IS_HERE
; 0x77282



