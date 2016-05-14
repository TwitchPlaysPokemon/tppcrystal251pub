Route20_MapScriptHeader: ; 0x1acd20
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1acd25
; 0x1acd25

UnknownScript_0x1acd25: ; 0x1acd25
	setevent EVENT_ROAD_WORK_ON_ROUTE_19_FINISHED
	return
; 0x1acd29

TrainerSwimmerfNicole: ; 0x1acd29
	; bit/flag number
	dw $3f5

	; trainer group && trainer id
	db SWIMMERF, NICOLE

	; text when seen
	dw SwimmerfNicoleSeenText

	; text when trainer beaten
	dw SwimmerfNicoleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfNicoleScript
; 0x1acd35

SwimmerfNicoleScript: ; 0x1acd35
	talkaftercancel
	loadfont
	writetext UnknownText_0x1acd93
	waitbutton
	closetext
	end
; 0x1acd3d

TrainerSwimmerfLori: ; 0x1acd3d
	; bit/flag number
	dw $3f6

	; trainer group && trainer id
	db SWIMMERF, LORI

	; text when seen
	dw SwimmerfLoriSeenText

	; text when trainer beaten
	dw SwimmerfLoriBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfLoriScript
; 0x1acd49

SwimmerfLoriScript: ; 0x1acd49
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ace15
	waitbutton
	closetext
	end
; 0x1acd51

TrainerSwimmermCameron: ; 0x1acd51
	; bit/flag number
	dw $5a4

	; trainer group && trainer id
	db SWIMMERM, CAMERON

	; text when seen
	dw SwimmermCameronSeenText

	; text when trainer beaten
	dw SwimmermCameronBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermCameronScript
; 0x1acd5d

SwimmermCameronScript: ; 0x1acd5d
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ace8b
	waitbutton
	closetext
	end
; 0x1acd65

MapRoute20Signpost0Script: ; 0x1acd65
	jumptext UnknownText_0x1acec2
; 0x1acd68
MapRoute20Signpost1Script: ; 0x1acd65
	jumptext KnownText_0x1acec2
; 0x1acd68

SwimmerfNicoleSeenText: ; 0x1acd68
	text "I feel so much"
	line "lighter in water."
	done
; 0x1acd8a

SwimmerfNicoleBeatenText: ; 0x1acd8a
	text "Oh, no!"
	done
; 0x1acd93

UnknownText_0x1acd93: ; 0x1acd93
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done
; 0x1acdd0

SwimmerfLoriSeenText: ; 0x1acdd0
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done
; 0x1ace10

SwimmerfLoriBeatenText: ; 0x1ace10
	text "No!"
	done
; 0x1ace15

UnknownText_0x1ace15: ; 0x1ace15
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done
; 0x1ace4b

SwimmermCameronSeenText: ; 0x1ace4b
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done
; 0x1ace83

SwimmermCameronBeatenText: ; 0x1ace83
	text "Aiyah!"
	done
; 0x1ace8b

UnknownText_0x1ace8b: ; 0x1ace8b
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done
; 0x1acec2

UnknownText_0x1acec2: ; 0x1acec2
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done
; 0x1acef8

KnownText_0x1acec2:
	text "What does this"
	line "sign say?"

	para "DANGER! FAST"
	line "CURRENTS WITHIN"
	done

Route20_MapEventHeader: ; 0x1acef8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $9, $26, 1, GROUP_SEAFOAM_ISLANDS_ENTRANCE, MAP_SEAFOAM_ISLANDS_ENTRANCE
	warp_def $5, $1e, 2, GROUP_SEAFOAM_ISLANDS_ENTRANCE, MAP_SEAFOAM_ISLANDS_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 37, $0, MapRoute20Signpost0Script
	signpost 7, 33, $0, MapRoute20Signpost1Script

	; people-events
	db 3
	person_event SPRITE_SWIMMER_GIRL, 12, 56, $a, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerSwimmerfNicole, -1
	person_event SPRITE_SWIMMER_GIRL, 17, 49, $a, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerSwimmerfLori, -1
	person_event SPRITE_SWIMMER_GUY, 17, 16, $a, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerSwimmermCameron, -1
; 0x1acf2f

