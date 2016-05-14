GoldenrodDeptStoreB1F_MapScriptHeader: ; 0x7d779
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 1, UnknownScript_0x7d781

	dbw 5, UnknownScript_0x7d7ac
; 0x7d781

UnknownScript_0x7d781: ; 0x7d781
	checkevent EVENT_GOT_CARD_KEY
	iftrue UnknownScript_0x7d78a
	jump UnknownScript_0x7d791
; 0x7d78a

UnknownScript_0x7d78a: ; 0x7d78a
	changeblock $10, $4, $d
	jump UnknownScript_0x7d791
; 0x7d791

UnknownScript_0x7d791: ; 0x7d791
	checkevent EVENT_GOLDENROD_DEPT_STORE_BASEMENT_LAYOUT_2
	iftrue UnknownScript_0x7d7a2
	checkevent EVENT_GOLDENROD_DEPT_STORE_BASEMENT_LAYOUT_3
	iftrue UnknownScript_0x7d7a7
	changeblock $a, $8, $d
	return
; 0x7d7a2

UnknownScript_0x7d7a2: ; 0x7d7a2
	changeblock $4, $a, $d
	return
; 0x7d7a7

UnknownScript_0x7d7a7: ; 0x7d7a7
	changeblock $a, $c, $d
	return
; 0x7d7ac

UnknownScript_0x7d7ac: ; 0x7d7ac
	clearevent EVENT_GOLDENROD_DEPT_STORE_BASEMENT_LAYOUT_4
	return
; 0x7d7b0

BlackBeltScript_0x7d7b0: ; 0x7d7b0
	jumptextfaceplayer UnknownText_0x7d7cb
; 0x7d7b3

BlackBeltScript_0x7d7b3: ; 0x7d7b3
	jumptextfaceplayer UnknownText_0x7d82c
; 0x7d7b6

BlackBeltScript_0x7d7b6: ; 0x7d7b6
	jumptextfaceplayer UnknownText_0x7d875
; 0x7d7b9

MachopScript_0x7d7b9: ; 0x7d7b9
	loadfont
	writetext UnknownText_0x7d8bb
	cry MACHOKE
	waitbutton
	closetext
	end
; 0x7d7c3

ItemFragment_0x7d7c3: ; 0x7d7c3
	db ETHER, 1
; 0x7d7c5

ItemFragment_0x7d7c5: ; 0x7d7c5
	db AMULET_COIN, 1
; 0x7d7c7

ItemFragment_0x7d7c7: ; 0x7d7c7
	db FULL_HEAL, 1
; 0x7d7c9

ItemFragment_0x7d7c9: ; 0x7d7c9
	db ULTRA_BALL, 1
; 0x7d7cb

UnknownText_0x7d7cb: ; 0x7d7cb
	text "Hey, kid! You're"
	line "holding us up!"

	para "Our policy is to"
	line "work behind the"

	para "scenes where no"
	line "one can see us!"
	done
; 0x7d82c

UnknownText_0x7d82c: ; 0x7d82c
	text "I lose my passion"
	line "for work if some-"
	cont "one's watching."

	para "Come on, kid,"
	line "scoot!"
	done
; 0x7d875

UnknownText_0x7d875: ; 0x7d875
	text "Oohah! Oohah!"

	para "The stuff on the"
	line "ground's junk."

	para "Take it if you"
	line "want it!"
	done
; 0x7d8bb

UnknownText_0x7d8bb: ; 0x7d8bb
	text "MACHOKE: Maaacho!"
	done
; 0x7d8ce

GoldenrodDeptStoreB1F_MapEventHeader: ; 0x7d8ce
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $2, $11, 3, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $4, $9, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $4, $a, 2, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 8
	person_event SPRITE_POKE_BALL, 19, 14, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7d7c3, EVENT_ITEM_GOLDENRODDEPTSTOREB1F_ETHER
	person_event SPRITE_POKE_BALL, 6, 18, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7d7c5, EVENT_ITEM_GOLDENRODDEPTSTOREB1F_AMULET_COIN
	person_event SPRITE_POKE_BALL, 7, 10, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7d7c7, EVENT_ITEM_GOLDENRODDEPTSTOREB1F_BURN_HEAL
	person_event SPRITE_POKE_BALL, 19, 19, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7d7c9, EVENT_ITEM_GOLDENRODDEPTSTOREB1F_ULTRA_BALL
	person_event SPRITE_BLACK_BELT, 14, 13, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BlackBeltScript_0x7d7b0, -1
	person_event SPRITE_BLACK_BELT, 12, 8, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, BlackBeltScript_0x7d7b3, -1
	person_event SPRITE_BLACK_BELT, 17, 10, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, BlackBeltScript_0x7d7b6, -1
	person_event SPRITE_MACHOP, 11, 11, $16, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, MachopScript_0x7d7b9, -1
; 0x7d94b

