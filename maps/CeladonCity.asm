CeladonCity_MapScriptHeader: ; 0x1a9f3a
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a9f3f
; 0x1a9f3f

UnknownScript_0x1a9f3f: ; 0x1a9f3f
	setflag ENGINE_FLYPOINT_CELADON
	return
; 0x1a9f43

FisherScript_0x1a9f43: ; 0x1a9f43
	jumptextfaceplayer UnknownText_0x1a9f7d
; 0x1a9f46

PoliwagScript_0x1a9f46: ; 0x1a9f46
	loadfont
	writetext UnknownText_0x1a9fcb
	cry POLIWRATH
	waitbutton
	closetext
	end
; 0x1a9f50

TeacherScript_0x1a9f50: ; 0x1a9f50
	jumptextfaceplayer UnknownText_0x1a9fde
; 0x1a9f53

GrampsScript_0x1a9f53: ; 0x1a9f53
	jumptextfaceplayer UnknownText_0x1aa043
; 0x1a9f56

GrampsScript_0x1a9f56: ; 0x1a9f56
	jumptextfaceplayer UnknownText_0x1aa0dc
; 0x1a9f59

YoungsterScript_0x1a9f59: ; 0x1a9f59
	jumptextfaceplayer UnknownText_0x1aa115
; 0x1a9f5c

YoungsterScript_0x1a9f5c: ; 0x1a9f5c
	jumptextfaceplayer UnknownText_0x1aa155
; 0x1a9f5f

TeacherScript_0x1a9f5f: ; 0x1a9f5f
	jumptextfaceplayer UnknownText_0x1aa1bd
; 0x1a9f62

LassScript_0x1a9f62: ; 0x1a9f62
	jumptextfaceplayer UnknownText_0x1aa306
; 0x1a9f65

MapCeladonCitySignpost0Script: ; 0x1a9f65
	jumptext UnknownText_0x1aa340
; 0x1a9f68

MapCeladonCitySignpost1Script: ; 0x1a9f68
	jumptext UnknownText_0x1aa369
; 0x1a9f6b

MapCeladonCitySignpost2Script: ; 0x1a9f6b
	jumptext UnknownText_0x1aa3a9
; 0x1a9f6e

MapCeladonCitySignpost3Script: ; 0x1a9f6e
	jumptext UnknownText_0x1aa3d4
; 0x1a9f71

MapCeladonCitySignpost4Script: ; 0x1a9f71
	jumptext UnknownText_0x1aa3e5
; 0x1a9f74

MapCeladonCitySignpost5Script: ; 0x1a9f74
	loadfont
	writetext UnknownText_0x1aa418
	waitbutton
	closetext
	checkevent EVENT_BEAT_BILL_IN_BATTLE_TENT
	iftrue MapCeladonCitySignpost5Script2
	spriteface $0, $1
	loadfont
	writetext MapCeladonCityDoorAjarText
	waitbutton
	closetext
	; farjump UnknownScript_0x1253d
MapCeladonCitySignpost5Script2:
	end
; 0x1a9f77

MapCeladonCitySignpost6Script: ; 0x1a9f77
	jumpstd pokecentersign
; 0x1a9f7a

MapCeladonCitySignpostItem7: ; 0x1a9f7a
	dw $00fd
	db PP_UP

; 0x1a9f7d

UnknownText_0x1a9f7d: ; 0x1a9f7d
	text "This POLIWRATH is"
	line "my partner."

	para "I wonder if it'll"
	line "ever evolve into a"
	cont "frog #MON."
	done
; 0x1a9fcb

UnknownText_0x1a9fcb: ; 0x1a9fcb
	text "POLIWRATH: Croak!"
	done
; 0x1a9fde

UnknownText_0x1a9fde: ; 0x1a9fde
	text "I lost at the slot"
	line "machines again<...>"

	para "We girls also play"
	line "the slots now."

	para "You should check"
	line "them out too."
	done
; 0x1aa043

UnknownText_0x1aa043: ; 0x1aa043
	text "I raise GRIMER"
	line "here to sell to"
	cont "the GAME CORNER"
	cont "in GOLDENROD."

	para "Looks like I've"
	line "overdone it<...>"

	para "I can't get out"
	line "of my house now!"
	done
; 0x1aa0dc

UnknownText_0x1aa0dc: ; 0x1aa0dc
	text "Nihihi! This GYM"
	line "is great! Only"

	para "girls are allowed"
	line "here!"
	done
; 0x1aa115

UnknownText_0x1aa115: ; 0x1aa115
	text "Want to know a"
	line "secret?"

	para "CELADON MANSION"
	line "has a hidden back"
	cont "door."
	done
; 0x1aa155

UnknownText_0x1aa155: ; 0x1aa155
	text "They're holding an"
	line "eating contest at"
	cont "the restaurant."

	para "Just watching them"
	line "go at it makes me"
	cont "feel bloated<...>"
	done
; 0x1aa1bd

UnknownText_0x1aa1bd: ; 0x1aa1bd
	text "CELADON DEPT.STORE"
	line "has the biggest"

	para "and best selection"
	line "of merchandise."

	para "If you can't get"
	line "it there, you"

	para "can't get it any-"
	line "where."

	para "Gee<...> I sound like"
	line "a sales clerk."
	done
; 0x1aa25b

; possibly unused
UnknownText_0x1aa25b: ; 0x1aa25b
	;text "I love being"
	;line "surrounded by tall"
	;cont "buildings!"

	;para "Isn't it true that"
	;line "GOLDENROD #MON"

	;para "CENTER was made"
	;line "much, much bigger?"

	;para "That is so neat!"
	;line "I wish we had a"

	;para "place like that in"
	;line "KANTO<...>"
	;done
; 0x1aa306

UnknownText_0x1aa306: ; 0x1aa306
	text "Looking at the"
	line "ground while I was"

	para "walking made me"
	line "dizzy."
	done
; 0x1aa340

UnknownText_0x1aa340: ; 0x1aa340
	text "CELADON CITY"

	para "The City of"
	line "Rainbow Dreams"
	done
; 0x1aa369

UnknownText_0x1aa369: ; 0x1aa369
	text "CELADON CITY"
	line "#MON GYM"
	cont "LEADER: ERIKA"

	para "The Nature-Loving"
	line "Princess"
	done
; 0x1aa3a9

UnknownText_0x1aa3a9: ; 0x1aa3a9
	text "Find What You"
	line "Need at CELADON"
	cont "DEPT.STORE!"
	done
; 0x1aa3d4

UnknownText_0x1aa3d4: ; 0x1aa3d4
	text "CELADON MANSION"
	done
; 0x1aa3e5

UnknownText_0x1aa3e5: ; 0x1aa3e5
	text "The Playground for"
	line "Everybody--CELADON"
	cont "GAME CORNER"
	done
; 0x1aa418

UnknownText_0x1aa418: ; 0x1aa418
	text "ATTENTION"

	para "The BATTLE TENT"
	line "is closed until"
	cont "further notice."

	para "Please visit our"
	line "new facility, the"

	para "BATTLE TOWER,"
	line "located in JOHTO."
	done

MapCeladonCityDoorAjarText:
	text $56, "?"

	para "The door is ajar."
	line "Someone's inside!"
	done
; 0x1aa497

CeladonCity_MapEventHeader: ; 0x1aa497
	; filler
	db 0, 0

	; warps
	db 10
	warp_def $9, $4, 1, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $9, $10, 1, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $3, $10, 3, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $3, $11, 3, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $9, $1d, 1, GROUP_CELADON_POKECENTER_1F, MAP_CELADON_POKECENTER_1F
	warp_def $13, $12, 1, GROUP_CELADON_GAME_CORNER, MAP_CELADON_GAME_CORNER
	warp_def $13, $17, 1, GROUP_CELADON_GAME_CORNER_PRIZE_ROOM, MAP_CELADON_GAME_CORNER_PRIZE_ROOM
	warp_def $1d, $a, 1, GROUP_CELADON_GYM, MAP_CELADON_GYM
	warp_def $1d, $19, 1, GROUP_CELADON_CAFE, MAP_CELADON_CAFE
	warp_def $13, $1d, 1, GROUP_BATTLE_TENT_RUINS, MAP_BATTLE_TENT_RUINS

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 21, 23, $0, MapCeladonCitySignpost0Script
	signpost 31, 11, $0, MapCeladonCitySignpost1Script
	signpost 9, 6, $0, MapCeladonCitySignpost2Script
	signpost 9, 13, $0, MapCeladonCitySignpost3Script
	signpost 21, 19, $0, MapCeladonCitySignpost4Script
	signpost 21, 29, $0, MapCeladonCitySignpost5Script
	signpost 9, 30, $0, MapCeladonCitySignpost6Script
	signpost 21, 37, $7, MapCeladonCitySignpostItem7

	; people-events
	db 9
	person_event SPRITE_FISHER, 15, 30, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FisherScript_0x1a9f43, -1
	person_event SPRITE_POLIWAG, 15, 31, $16, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PoliwagScript_0x1a9f46, -1
	person_event SPRITE_TEACHER, 28, 24, $5, 0, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, TeacherScript_0x1a9f50, -1
	person_event SPRITE_GRAMPS, 20, 18, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, GrampsScript_0x1a9f53, -1
	person_event SPRITE_GRAMPS, 35, 12, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, GrampsScript_0x1a9f56, -1
	person_event SPRITE_YOUNGSTER, 17, 22, $5, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, YoungsterScript_0x1a9f59, -1
	person_event SPRITE_YOUNGSTER, 37, 28, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, YoungsterScript_0x1a9f5c, -1
	person_event SPRITE_TEACHER, 18, 10, $2, 2, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x1a9f5f, -1
	person_event SPRITE_LASS, 26, 11, $4, 2, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, LassScript_0x1a9f62, -1
; 0x1aa567

