Route16FuchsiaSpeechHouse_MapScriptHeader: ; 0x73371
	; trigger count
	db 0

	; callback count
	db 0
; 0x73373

SuperNerdScript_0x73373: ; 0x73373
	jumptextfaceplayer UnknownText_0x73379
; 0x73376

MapRoute16FuchsiaSpeechHouseSignpost1Script: ; 0x73376
	jumpstd picturebookshelf
; 0x73379

UnknownText_0x73379: ; 0x73379
	text "The CYCLING ROAD"
	line "is swarmed with"
	cont "bees this season."

	para "I can't even go"
	line "outside<...>"
	done
; 0x733bc

Route16FuchsiaSpeechHouse_MapEventHeader: ; 0x733bc
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $7, $3, 1, GROUP_ROUTE_16, MAP_ROUTE_16

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute16FuchsiaSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapRoute16FuchsiaSpeechHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_SUPER_NERD, 7, 6, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SuperNerdScript_0x73373, -1
; 0x733e3

