ViridianMart_MapScriptHeader: ; 0x9b5e5
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b5e7

ClerkScript_0x9b5e7: ; 0x9b5e7
	loadfont
	pokemart $0, $0012
	closetext
	end
; 0x9b5ee

LassScript_0x9b5ee: ; 0x9b5ee
	jumptextfaceplayer UnknownText_0x9b5f4
; 0x9b5f1

CooltrainerMScript_0x9b5f1: ; 0x9b5f1
	jumptextfaceplayer UnknownText_0x9b61a
; 0x9b5f4

UnknownText_0x9b5f4: ; 0x9b5f4
	text "Have you heard of"
	line "the celebrities?"

	para "It is the talk"
	line "of the town!"
	done
; 0x9b61a

UnknownText_0x9b61a: ; 0x9b61a
	text "Have you been to"
	line "CINNABAR?"

	para "It's an island way"
	line "south of here."
	done
; 0x9b657

ViridianMart_MapEventHeader: ; 0x9b657
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $3, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, 0, 0, -1, -1, 0, 0, 0, ClerkScript_0x9b5e7, -1
	person_event SPRITE_LASS, 6, 11, $5, 0, 2, -1, -1, 0, 0, 0, LassScript_0x9b5ee, -1
	person_event SPRITE_COOLTRAINER_M, 10, 5, $7, 0, 0, -1, -1, 0, 0, 0, CooltrainerMScript_0x9b5f1, -1
; 0x9b68e

