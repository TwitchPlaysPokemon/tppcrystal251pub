GoldenrodNameRatersHouse_MapScriptHeader: ; 0x5577a
	; trigger count
	db 0

	; callback count
	db 0
; 0x5577c

GentlemanScript_0x5577c: ; 0x5577c
	faceplayer
	loadfont
	special SpecialNameRater
	waitbutton
	closetext
	end
; 0x55784

MoveRelearnerScript:
	faceplayer
	loadfont
	special SpecialMoveRelearner
	waitbutton
	closetext
	end


MapGoldenrodNameRatersHouseSignpost1Script: ; 0x55784
	jumpstd difficultbookshelf
; 0x55787

MapGoldenrodNameRatersHouseSignpost2Script: ; 0x55787
	jumpstd radio2
; 0x5578a

INCLUDE "text/sweethoney.asm"

GoldenrodNameRatersHouse_MapEventHeader: ; 0x55953
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapGoldenrodNameRatersHouseSignpost1Script
	signpost 1, 1, $0, MapGoldenrodNameRatersHouseSignpost1Script
	signpost 1, 7, $0, MapGoldenrodNameRatersHouseSignpost2Script

	; people-events
	db 2
	person_event SPRITE_GENTLEMAN, 8, 6, $6, 0, 2, -1, -1, 0, 0, 0, GentlemanScript_0x5577c, -1
	person_event SPRITE_FISHER, 8, 9, $6, 0, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, MoveRelearnerScript, -1
; 0x5597f

