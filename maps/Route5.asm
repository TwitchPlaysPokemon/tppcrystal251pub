Route5_MapScriptHeader: ; 0x1adb17
	; trigger count
	db 0

	; callback count
	db 1
	dbw 1, .SnorlaxCheck
; 0x1adb19
.SnorlaxCheck
	checkevent EVENT_ROUTE_5_SNORLAX
	iftrue .skip
	changeblock 8, 12, $B8
.skip
	return

PokefanMScript_0x1adb19: ; 0x1adb19
	jumptextfaceplayer UnknownText_0x1adb22
; 0x1adb1c

MapRoute5Signpost0Script: ; 0x1adb1c
	jumptext UnknownText_0x1adb66
; 0x1adb1f

MapRoute5Signpost1Script: ; 0x1adb1f
	jumptext UnknownText_0x1adb97
; 0x1adb22

Snorlax5:
	loadfont
	special SpecialSnorlaxAwake
	iftrue WakeSnorlax5
	checkitem POKE_FLUTE
	iftrue .FluteWakeSnorlax
	writetext Snorlax5Text
	waitbutton
	closetext
	end
.FluteWakeSnorlax
	writetext Snorlax5WakeyWakeyPrompt
	yesorno
	iffalse .nope
	farscall _PokefluteSnorlaxScript
	end
.nope
	closetext
	end

WakeSnorlax5:
	writetext Snorlax5WakeText
	pause 15
	cry SNORLAX
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadpokedata SNORLAX, 85
	startbattle
	writebyte SNORLAX
	special SpecialMonCheck
	iffalse .DontKillSnorlax
	disappear $3
	changeblock 8, 12, $1a
.DontKillSnorlax
	returnafterbattle
	end

UnknownText_0x1adb22: ; 0x1adb22
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done
; 0x1adb66

UnknownText_0x1adb66: ; 0x1adb66
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done
; 0x1adb97

UnknownText_0x1adb97: ; 0x1adb97
	text "What's this?"

	para "House for Sale<...>"
	line "Nobody lives here."
	done

Snorlax5WakeyWakeyPrompt:
	text "SNORLAX is snoring"
	line "peacefully<...>"

	para "Play the #"
	line "FLUTE?"
	done

Snorlax5Text:
	text "SNORLAX is snoring"
	line "peacefully<...>"
	done

Snorlax5WakeText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX<...>"

	para "<...>"

	para "SNORLAX woke up!"
	done

; 0x1adbc7

Route5_MapEventHeader: ; 0x1adbc7
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $f, $11, 1, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE, MAP_ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $11, $8, 1, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $11, $9, 2, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $b, $a, 1, GROUP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, MAP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 17, 17, $0, MapRoute5Signpost0Script
	signpost 11, 10, $0, MapRoute5Signpost1Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 20, 21, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x1adb19, EVENT_MEN_BLOCKING_UNDERGROUND_PATH_ROUTES_5_6
	person_event SPRITE_BIG_SNORLAX, 18, 12, $15, 0, 0, -1, -1, 0, 0, 0, Snorlax5, EVENT_ROUTE_5_SNORLAX
; 0x1adbf8

