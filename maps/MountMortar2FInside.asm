MountMortar2FInside_MapScriptHeader: ; 0x7e0c8
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e0ca

TrainerSupernerdHugh: ; 0x7e0ca
	; bit/flag number
	dw $5c5

	; trainer group && trainer id
	db SUPER_NERD, HUGH

	; text when seen
	dw SupernerdHughSeenText

	; text when trainer beaten
	dw SupernerdHughBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdHughScript
; 0x7e0d6

SupernerdHughScript: ; 0x7e0d6
	talkaftercancel
	loadfont
	writetext UnknownText_0x7e10e
	waitbutton
	closetext
	end
; 0x7e0de

ItemFragment_0x7e0de: ; 0x7e0de
	db MAX_POTION, 1
; 0x7e0e0

ItemFragment_0x7e0e0: ; 0x7e0e0
	db RARE_CANDY, 1
; 0x7e0e2

ItemFragment_0x7e0e2: ; 0x7e0e2
	db TM_EARTH_POWER, 1
; 0x7e0e4

ItemFragment_0x7e0e4: ; 0x7e0e4
	db DRAGON_SCALE, 1
; 0x7e0e6

ItemFragment_0x7e0e6: ; 0x7e0e6
	db ELIXER, 1
; 0x7e0e8

ItemFragment_0x7e0e8: ; 0x7e0e8
	db ESCAPE_ROPE, 1
; 0x7e0ea

MapMountMortar2FInsideSignpostItem0: ; 0x7e0ea
	dw $0092
	db FULL_RESTORE

; 0x7e0ed

SupernerdHughSeenText: ; 0x7e0ed
	text "Yo! MARKUS!"
	done
; 0x7e0fa

SupernerdHughBeatenText: ; 0x7e0fa
	text "Sorry, my mistake."
	done
; 0x7e10e

UnknownText_0x7e10e: ; 0x7e10e
	text "I'm investigating"
	line "MT.MORTAR, but my"
	cont "pal's gone AWOL."

	para "Have you seen a"
	line "trainer who has a"

	para "STARMIE that can"
	line "use SURF?"
	done
; 0x7e184

MountMortar2FInside_MapEventHeader: ; 0x7e184
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $21, $11, 4, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $5, $3, 6, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 8, 24, $7, MapMountMortar2FInsideSignpostItem0

	; people-events
	db 7
	person_event SPRITE_POKE_BALL, 26, 32, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0de, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_MAX_POTION
	person_event SPRITE_POKE_BALL, 37, 6, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0e0, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_RARE_CANDY
	person_event SPRITE_POKE_BALL, 21, 23, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0e2, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_TM_DEFENSE_CURL
	person_event SPRITE_POKE_BALL, 9, 20, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0e4, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_DRAGON_SCALE
	person_event SPRITE_POKE_BALL, 15, 13, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0e6, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_ELIXER
	person_event SPRITE_POKE_BALL, 9, 32, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7e0e8, EVENT_ITEM_MT_MORTAR_2F_OUTSIDE_ESCAPE_ROPE
	person_event SPRITE_SUPER_NERD, 30, 17, $a, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 2, TrainerSupernerdHugh, -1
; 0x7e1f4

