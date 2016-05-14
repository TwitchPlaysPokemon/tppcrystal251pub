OlivineLighthouse4F_MapScriptHeader: ; 0x5b4e8
	; trigger count
	db 0

	; callback count
	db 0
; 0x5b4ea

TrainerLassConnie1: ; 0x5b4ea
	; bit/flag number
	dw $519

	; trainer group && trainer id
	db LASS, CONNIE1

	; text when seen
	dw LassConnie1SeenText

	; text when trainer beaten
	dw LassConnie1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassConnie1Script
; 0x5b4f6

LassConnie1Script: ; 0x5b4f6
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b63c
	waitbutton
	closetext
	end
; 0x5b4fe

TrainerSailorKent: ; 0x5b4fe
	; bit/flag number
	dw $578

	; trainer group && trainer id
	db SAILOR, KENT

	; text when seen
	dw SailorKentSeenText

	; text when trainer beaten
	dw SailorKentBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorKentScript
; 0x5b50a

SailorKentScript: ; 0x5b50a
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b584
	waitbutton
	closetext
	end
; 0x5b512

SailorKentSeenText: ; 0x5b512
	text "JASMINE must be"
	line "worried sick about"
	cont "the #MON here."

	para "She won't even"
	line "smile these days."
	done
; 0x5b565

SailorKentBeatenText: ; 0x5b565
	text "I can't manage a"
	line "smile either<...>"
	done
; 0x5b584

UnknownText_0x5b584: ; 0x5b584
	text "Speaking of sick,"
	line "I've heard there's"

	para "a good PHARMACY in"
	line "CIANWOOD."
	done
; 0x5b5c5

LassConnie1SeenText: ; 0x5b5c5
	text "I am visiting from"
	line "northern JOHTO."

	para "It gets very"
	line "cold there!"
	done
; 0x5b62b

LassConnie1BeatenText: ; 0x5b62b
	text "Maybe I should"
	line "teach DELIBIRD"
	cont "some new moves<...>"
	done
; 0x5b63c

UnknownText_0x5b63c: ; 0x5b63c
	text "DELIBIRD lives in"
	line "the north due to"
	cont "colder climates!"
	done
; 0x5b6c0

OlivineLighthouse4F_MapEventHeader: ; 0x5b6c0
	; filler
	db 0, 0

	; warps
	db 10
	warp_def $3, $d, 1, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $5, $3, 2, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $10, 6, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $9, $11, 7, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $8, 8, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $3, $9, 9, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $7, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $7, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SAILOR, 18, 11, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerSailorKent, -1
	person_event SPRITE_LASS, 6, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerLassConnie1, -1
; 0x5b712



