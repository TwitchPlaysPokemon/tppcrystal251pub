TimeCapsule_MapScriptHeader: ; 0x1934eb
TimeCapsuleKanto_MapScriptHeader: ; 0x1934eb
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1934f8, $0000
	dw UnknownScript_0x1934fc, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1934fd
; 0x1934f8

UnknownScript_0x1934f8: ; 0x1934f8
	priorityjump UnknownScript_0x19350d
	end
; 0x1934fc

UnknownScript_0x1934fc: ; 0x1934fc
	end
; 0x1934fd

UnknownScript_0x1934fd: ; 0x1934fd
	special Function29f47
	iffalse UnknownScript_0x193508
	disappear $3
	appear $2
	return
; 0x193508

UnknownScript_0x193508: ; 0x193508
	disappear $2
	appear $3
	return
; 0x19350d

UnknownScript_0x19350d: ; 0x19350d
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $3
	end
; 0x193514

MapTimeCapsuleSignpost1Script: ; 0x193514
	special Function29eaf
	newloadmap $f8
	end
; 0x19351a

ChrisScript_0x19351a: ; 0x19351a
	loadfont
	writetext UnknownText_0x193521
	waitbutton
	closetext
	end
; 0x193521

UnknownText_0x193521: ; 0x193521
	text "Your friend is"
	line "ready."
	done
; 0x193538

TimeCapsule_MapEventHeader: ; 0x193538
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 4, $3, MapTimeCapsuleSignpost1Script
	signpost 4, 5, $4, MapTimeCapsuleSignpost1Script

	; people-events
	db 2
	person_event SPRITE_RED, 8, 7, $9, 0, 0, -1, -1, 0, 0, 0, ChrisScript_0x19351a, EVENT_000_STD
	person_event SPRITE_RED, 8, 10, $8, 0, 0, -1, -1, 0, 0, 0, ChrisScript_0x19351a, EVENT_001_STD
; 0x19356c

TimeCapsuleKanto_MapEventHeader: ; 0x193538
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 4, GROUP_POKECENTER_2F_KANTO, MAP_POKECENTER_2F_KANTO
	warp_def $7, $5, 4, GROUP_POKECENTER_2F_KANTO, MAP_POKECENTER_2F_KANTO

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 4, $3, MapTimeCapsuleSignpost1Script
	signpost 4, 5, $4, MapTimeCapsuleSignpost1Script

	; people-events
	db 2
	person_event SPRITE_RED, 8, 7, $9, 0, 0, -1, -1, 0, 0, 0, ChrisScript_0x19351a, EVENT_000_STD
	person_event SPRITE_RED, 8, 10, $8, 0, 0, -1, -1, 0, 0, 0, ChrisScript_0x19351a, EVENT_001_STD
; 0x19356c

