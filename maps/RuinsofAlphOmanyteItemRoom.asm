RuinsofAlphOmanyteItemRoom_MapScriptHeader: ; 0x59a2a
	; trigger count
	db 0

	; callback count
	db 0
; 0x59a2c

ItemFragment_0x59a2c: ; 0x59a2c
	db PARLYZ_GUARD, 1
; 0x59a2e

ItemFragment_0x59a2e: ; 0x59a2e
	db BURN_GUARD, 1
; 0x59a30

ItemFragment_0x59a30: ; 0x59a30
	db STARDUST, 1
; 0x59a32

ItemFragment_0x59a32: ; 0x59a32
	db STAR_PIECE, 1
; 0x59a34

MapRuinsofAlphOmanyteItemRoomSignpost1Script: ; 0x59a34
	jumptext UnknownText_0x59a37
; 0x59a37

UnknownText_0x59a37: ; 0x59a37
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
; 0x59a5c

RuinsofAlphOmanyteItemRoom_MapEventHeader: ; 0x59a5c
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapRuinsofAlphOmanyteItemRoomSignpost1Script
	signpost 1, 5, $0, MapRuinsofAlphOmanyteItemRoomSignpost1Script

	; people-events
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x59a2c, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x59a2e, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x59a30, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x59a32, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
; 0x59ab4

