RedsHouse2FRB_MapScriptHeader: ; 0x19b048
	; trigger count
	db 0

	; callback count
	db 1

	dbw 5, .initroom
; 0x7abb3

.initroom: ; 0x7abb4
	special Function27043
	setevent EVENT_007_STD
	checkevent EVENT_SET_IN_YOUR_ROOM_036
	iftrue .skipinit
	jumpstd initializeevents
.skipinit: ; 0x7abc4
	return
; 0x7abc5

; 0x19b04a

MapRedsHouse2FRBSignpost0Script: ; 0x19b04a
	jumptext RedsHouse2FRB_N64Text
; 0x19b04d

MapRedsHouse2FRBBedScript:
	jumptext RedsHouse2FRBComfyBedText

MapRedsHouse2FRBPCScript:
	loadfont
	special Functionc2e7
	closetext
	end

RedsHouse2FRB_N64Text: ; 0x19b050
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done
; 0x19b087

RedsHouse2FRBComfyBedText:
	text "It's a comfy bed."
	line "No time to sleep!"
	done

RedsHouse2FRB_MapEventHeader: ; 0x19b0b9
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $7, 3, GROUP_REDS_HOUSE_1F_RB, MAP_REDS_HOUSE_1F_RB

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 5, 3, $0, MapRedsHouse2FRBSignpost0Script
	signpost 6, 0, $0, MapRedsHouse2FRBBedScript
	signpost 7, 0, $0, MapRedsHouse2FRBBedScript
	signpost 1, 0, $0, MapRedsHouse2FRBPCScript

	; people-events
	db 0
; 0x19b0ce

