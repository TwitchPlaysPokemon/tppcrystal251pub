CianwoodPharmacy_MapScriptHeader: ; 0x9df97
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x9df9d, $0000

	; callback count
	db 0
; 0x9df9d

UnknownScript_0x9df9d: ; 0x9df9d
	end
; 0x9df9e

PharmacistScript_0x9df9e: ; 0x9df9e
	faceplayer
	loadfont
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue UnknownScript_0x9dfc4
	checkevent EVENT_TALKED_TO_JASMINE_ABOUT_AMPHY
	iffalse UnknownScript_0x9dfc4
	writetext UnknownText_0x9dfcd
	buttonsound
	giveitem SECRETPOTION, $1
	writetext UnknownText_0x9e056
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext UnknownText_0x9e070
	waitbutton
	closetext
	end
; 0x9dfc4

UnknownScript_0x9dfc4: ; 0x9dfc4
	pokemart $3, $0004
	closetext
	end
; 0x9dfca

MapCianwoodPharmacySignpost1Script: ; 0x9dfca
	jumpstd difficultbookshelf
; 0x9dfcd

UnknownText_0x9dfcd: ; 0x9dfcd
	text "Your #MON ap-"
	line "pear to be fine."

	para "Is something wor- "
	line "rying you?"

	para "<...>"

	para "The LIGHTHOUSE"
	line "#MON is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done
; 0x9e056

UnknownText_0x9e056: ; 0x9e056
	text "<PLAYER> received"
	line "SECRETPOTION."
	done
; 0x9e070

UnknownText_0x9e070: ; 0x9e070
	text "My SECRETPOTION is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done
; 0x9e0b7

CianwoodPharmacy_MapEventHeader: ; 0x9e0b7
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapCianwoodPharmacySignpost1Script
	signpost 1, 1, $0, MapCianwoodPharmacySignpost1Script

	; people-events
	db 1
	person_event SPRITE_PHARMACIST, 7, 6, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PharmacistScript_0x9df9e, -1
; 0x9e0de

