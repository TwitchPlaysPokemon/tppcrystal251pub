RuinsofAlphKabutoItemRoom_MapScriptHeader: ; 0x599a0
	; trigger count
	db 0

	; callback count
	db 0
; 0x599a2

ItemFragment_0x599a2: ; 0x599a2
	db SUN_STONE, 1
; 0x599a4

ItemFragment_0x599a4: ; 0x599a4
	db POISON_GUARD, 1
; 0x599a6

ItemFragment_0x599a6: ; 0x599a6
	db REVIVAL_HERB, 1
; 0x599a8

ItemFragment_0x599a8: ; 0x599a8
	db ENERGY_ROOT, 1
; 0x599aa

MapRuinsofAlphKabutoItemRoomSignpost1Script: ; 0x599aa
	jumptext UnknownText_0x599ad
; 0x599ad

UnknownText_0x599ad: ; 0x599ad
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
; 0x599d2

RuinsofAlphKabutoItemRoom_MapEventHeader: ; 0x599d2
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapRuinsofAlphKabutoItemRoomSignpost1Script
	signpost 1, 5, $0, MapRuinsofAlphKabutoItemRoomSignpost1Script

	; people-events
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x599a2, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x599a4, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x599a6, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x599a8, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
; 0x59a2a

