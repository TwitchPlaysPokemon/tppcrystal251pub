CeladonGameCornerPrizeRoom_MapScriptHeader: ; 0x726e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x726e9

GentlemanScript_0x726e9: ; 0x726e9
	jumptextfaceplayer UnknownText_0x728b8
; 0x726ec

PharmacistScript_0x726ec: ; 0x726ec
	jumptextfaceplayer UnknownText_0x728e9
; 0x726ef

MapCeladonGameCornerPrizeRoomSignpost0Script: ; 0x726ef
	faceplayer
	loadfont
	writetext UnknownText_0x7293e
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
	writetext UnknownText_0x72974
UnknownScript_0x726fd: ; 0x726fd
	special Function24b25
	loadmenudata MenuDataHeader_0x72790
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x72714
	if_equal $2, UnknownScript_0x72730
	if_equal $3, UnknownScript_0x7274c
	jump UnknownScript_0x72784
; 0x72714

UnknownScript_0x72714: ; 0x72714
	checkcoins 2000
	if_equal $2, UnknownScript_0x72778
	itemtotext LEFTOVERS, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem LEFTOVERS, $1
	iffalse UnknownScript_0x7277e
	takecoins 2000
	jump UnknownScript_0x7276d
; 0x72730

UnknownScript_0x72730: ; 0x72730
	checkcoins 50
	if_equal $2, UnknownScript_0x72778
	scall WantBerserkGene
	iffalse UnknownScript_0x72784
	giveitem BERSERK_GENE, $1
	iffalse UnknownScript_0x7277e
	takecoins 50
	jump UnknownScript_0x7276d
; 0x7274c

UnknownScript_0x7274c: ; 0x7274c
	checkcoins 600
	if_equal $2, UnknownScript_0x72778
	itemtotext PP_UP, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem PP_UP, $1
	iffalse UnknownScript_0x7277e
	takecoins 600
	jump UnknownScript_0x7276d
; 0x72768

UnknownScript_0x72768: ; 0x72768
	writetext UnknownText_0x72991
	yesorno
	end

WantBerserkGene: ; 0x72768
	writetext WantBerserkGeneText
	yesorno
	end
; 0x7276d

UnknownScript_0x7276d: ; 0x7276d
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	waitbutton
	jump UnknownScript_0x726fd
; 0x72778

UnknownScript_0x72778: ; 0x72778
	writetext UnknownText_0x729bb
	waitbutton
	closetext
	end
; 0x7277e

UnknownScript_0x7277e: ; 0x7277e
	writetext UnknownText_0x729d8
	waitbutton
	closetext
	end
; 0x72784

UnknownScript_0x72784: ; 0x72784
	writetext UnknownText_0x729f2
	waitbutton
	closetext
	end
; 0x7278a

UnknownScript_0x7278a: ; 0x7278a
	writetext UnknownText_0x72a14
	waitbutton
	closetext
	end
; 0x72790


MenuDataHeader_0x72790: ; 0x72790
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x72798
	db 1 ; default option
; 0x72798

MenuData2_0x72798: ; 0x72798
	db $80 ; flags
	db 4 ; items
	db "LEFTIES 2000@"
	db "POWER UP  50@"
	db "PP-UP    600@"
	db "CANCEL@"
; 0x727c8


MapCeladonGameCornerPrizeRoomSignpost1Script: ; 0x727c8
	faceplayer
	loadfont
	writetext UnknownText_0x7293e
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
UnknownScript_0x727d3: ; 0x727d3
	writetext UnknownText_0x72974
	special Function24b25
	loadmenudata MenuDataHeader_0x72877
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x727ed
	if_equal $2, UnknownScript_0x7281b
	if_equal $3, UnknownScript_0x72849
	jump UnknownScript_0x72784
; 0x727ed

UnknownScript_0x727ed: ; 0x727ed
	checkcoins 5000
	if_equal $2, UnknownScript_0x72778
	checkcode VAR_PARTYCOUNT
	if_equal $6, CGCSlot1PC
	pokenamemem PORYGON2, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	waitbutton
	writebyte PORYGON2
	special Functionc230
	givepoke PORYGON2, 80, 0, 0
	takecoins 5000
	jump UnknownScript_0x727d3
; 0x7281b

CGCSlot1PC:
	checkcode VAR_BOXSPACE
	if_equal $0, UnknownScript_0x7277e
	pokenamemem PORYGON2, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	waitbutton
	writebyte PORYGON2
	special Functionc230
	givepoke PORYGON2, 80, 0, 0
	takecoins 5000
	jump UnknownScript_0x727d3

UnknownScript_0x7281b: ; 0x7281b
	checkcoins 3000
	if_equal $2, UnknownScript_0x72778
	itemtotext LUCKY_EGG, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem LUCKY_EGG, $1
	iffalse UnknownScript_0x7277e
	takecoins 3000
	jump UnknownScript_0x7276d_2


;CGCSlot2PC:
;	checkcode VAR_BOXSPACE
;	if_equal $0, UnknownScript_0x7277e
;	pokenamemem PORYGON, $0
;	scall UnknownScript_0x72768
;	iffalse UnknownScript_0x72784
;	waitsfx
;	playsound SFX_TRANSACTION
;	writetext UnknownText_0x729ad
;	waitbutton
;	writebyte PORYGON
;	special Functionc230
;	givepoke PORYGON, 15, 0, 0
;	takecoins 5555
;	jump UnknownScript_0x727d3

UnknownScript_0x72849: ; 0x72849
	checkcoins 300
	if_equal $2, UnknownScript_0x72778
	itemtotext SLOWPOKETAIL, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem SLOWPOKETAIL, $1
	iffalse UnknownScript_0x7277e
	takecoins 300

UnknownScript_0x7276d_2: ; 0x7276d
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	waitbutton
	jump UnknownScript_0x727d3

CGCSlot3PC:
;	checkcode VAR_BOXSPACE
;	if_equal $0, UnknownScript_0x7277e
;	pokenamemem LARVITAR, $0
;	scall UnknownScript_0x72768
;	iffalse UnknownScript_0x72784
;	waitsfx
;	playsound SFX_TRANSACTION
;	writetext UnknownText_0x729ad
;	waitbutton
;	writebyte LARVITAR
;	special Functionc230
;	givepoke LARVITAR, 40, 0, 0
;	takecoins 8888
;	jump UnknownScript_0x727d3


MenuDataHeader_0x72877: ; 0x72877
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw MenuData2_0x7287f
	db 1 ; default option
; 0x7287f

MenuData2_0x7287f: ; 0x7287f
	db $80 ; flags
	db 4 ; items
	db "PORYGON2   5000@"
	db "LUCKY EGG  3000@"
	db "SLOWPOKETAIL300@"
	db "CANCEL@"
; 0x728b8


UnknownText_0x728b8: ; 0x728b8
	text "I wanted PORYGON2,"
	line "but I was short by"
	cont "100 coins<...>"
	done
; 0x728e9

UnknownText_0x728e9: ; 0x728e9
	text "Wow<...>"

	para "PORYGON2 is a"
	line "prize here."

	para "That #MON is"
	line "supposed to be"
	para "really hard to"
	line "find."
	done
; 0x7293e

UnknownText_0x7293e: ; 0x7293e
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done
; 0x72974

UnknownText_0x72974: ; 0x72974
	text "Which prize would"
	line "you like?"
	done
; 0x72991

UnknownText_0x72991: ; 0x72991
	text "OK, so you wanted"
	line "a @"
	text_from_ram StringBuffer3
	text "?"
	done

WantBerserkGeneText: ; 0x72991
	text "OK, so you wanted"
	line "a POWER UP?"
	done
; 0x729ad

UnknownText_0x729ad: ; 0x729ad
	text "Here you go!"
	done
; 0x729bb

UnknownText_0x729bb: ; 0x729bb
	text "You don't have"
	line "enough coins."
	done
; 0x729d8

UnknownText_0x729d8: ; 0x729d8
	text "You have no room"
	line "for it."
	done
; 0x729f2

UnknownText_0x729f2: ; 0x729f2
	text "Oh. Please come"
	line "back with coins!"
	done
; 0x72a14

UnknownText_0x72a14: ; 0x72a14
	text "Oh? You don't have"
	line "a COIN CASE."
	done
; 0x72a34

CeladonGameCornerPrizeRoom_MapEventHeader: ; 0x72a34
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $2, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $5, $3, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapCeladonGameCornerPrizeRoomSignpost0Script
	signpost 1, 4, $0, MapCeladonGameCornerPrizeRoomSignpost1Script

	; people-events
	db 2
	person_event SPRITE_GENTLEMAN, 6, 4, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, GentlemanScript_0x726e9, -1
	person_event SPRITE_PHARMACIST, 8, 8, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PharmacistScript_0x726ec, -1
; 0x72a68

