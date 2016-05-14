Route19_MapScriptHeader: ; 0x19e9d9
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x19e9de
; 0x19e9de

UnknownScript_0x19e9de: ; 0x19e9de
	checkevent EVENT_ROAD_WORK_ON_ROUTE_19_FINISHED
	iftrue UnknownScript_0x19e9fc
	changeblock $6, $6, $7a
	changeblock $8, $6, $7a
	changeblock $a, $6, $7a
	changeblock $c, $8, $7a
	changeblock $4, $8, $7a
	changeblock $a, $a, $7a
UnknownScript_0x19e9fc: ; 0x19e9fc
	return
; 0x19e9fd

TrainerSwimmerfDawn: ; 0x19e9fd
	; bit/flag number
	dw $3f3

	; trainer group && trainer id
	db SWIMMERF, DAWN

	; text when seen
	dw SwimmerfDawnSeenText

	; text when trainer beaten
	dw SwimmerfDawnBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfDawnScript
; 0x19ea09

SwimmerfDawnScript: ; 0x19ea09
	talkaftercancel
	loadfont
	writetext UnknownText_0x19ebad
	waitbutton
	closetext
	end
; 0x19ea11

TrainerSwimmermHarold: ; 0x19ea11
	; bit/flag number
	dw $594

	; trainer group && trainer id
	db SWIMMERM, HAROLD

	; text when seen
	dw SwimmermHaroldSeenText

	; text when trainer beaten
	dw SwimmermHaroldBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermHaroldScript
; 0x19ea1d

SwimmermHaroldScript: ; 0x19ea1d
	talkaftercancel
	loadfont
	writetext UnknownText_0x19eab4
	waitbutton
	closetext
	end
; 0x19ea25

TrainerSwimmermJerome: ; 0x19ea25
	; bit/flag number
	dw $5a1

	; trainer group && trainer id
	db SWIMMERM, JEROME

	; text when seen
	dw SwimmermJeromeSeenText

	; text when trainer beaten
	dw SwimmermJeromeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermJeromeScript
; 0x19ea31

SwimmermJeromeScript: ; 0x19ea31
	talkaftercancel
	loadfont
	writetext UnknownText_0x19ec7e
	waitbutton
	closetext
	end
; 0x19ea39

TrainerSwimmermTucker: ; 0x19ea39
	; bit/flag number
	dw $5a2

	; trainer group && trainer id
	db SWIMMERM, TUCKER

	; text when seen
	dw SwimmermTuckerSeenText

	; text when trainer beaten
	dw SwimmermTuckerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermTuckerScript
; 0x19ea45

SwimmermTuckerScript: ; 0x19ea45
	talkaftercancel
	loadfont
	writetext UnknownText_0x19eb3b
	waitbutton
	closetext
	end
; 0x19ea4d

FisherScript_0x19ea4d: ; 0x19ea4d
	faceplayer
	loadfont
	checkevent EVENT_ROAD_WORK_ON_ROUTE_19_FINISHED
	iftrue UnknownScript_0x19ea5b
	writetext UnknownText_0x19ecaf
	waitbutton
	closetext
	end
; 0x19ea5b

UnknownScript_0x19ea5b: ; 0x19ea5b
	writetext UnknownText_0x19ed24
	waitbutton
	closetext
	end
; 0x19ea61

FisherScript_0x19ea61: ; 0x19ea61
	faceplayer
	loadfont
	checkevent EVENT_ROAD_WORK_ON_ROUTE_19_FINISHED
	iftrue UnknownScript_0x19ea6f
	writetext UnknownText_0x19ed45
	waitbutton
	closetext
	end
; 0x19ea6f

UnknownScript_0x19ea6f: ; 0x19ea6f
	writetext UnknownText_0x19ed7d
	waitbutton
	closetext
	end
; 0x19ea75

MapRoute19Signpost0Script: ; 0x19ea75
	jumptext UnknownText_0x19edbc
; 0x19ea78

MapRoute19Signpost1Script: ; 0x19ea78
	jumptext UnknownText_0x19ede5
; 0x19ea7b

SwimmermHaroldSeenText: ; 0x19ea7b
	text "Have you been"
	line "to the volcano?"

	para "It's hot there,"
	line "but I found some"
	cont "cool #MON!"
	done
; 0x19eaad

SwimmermHaroldBeatenText: ; 0x19eaad
	text "Glub<...>"
	done
; 0x19eab4

UnknownText_0x19eab4: ; 0x19eab4
	text "The volcano was"
	line "way too hot!"

	para "I didn't dare"
	line "explore all of it."
	done
; 0x19eafa

SwimmermTuckerSeenText: ; 0x19eafa
	text "Pant, pant<...>"
	line "Just<...> a little<...>"

	para "farther<...> to<...>"
	line "FUCHSIA<...>"
	done
; 0x19eb2d

SwimmermTuckerBeatenText: ; 0x19eb2d
	text "I'm drowning!"
	done
; 0x19eb3b

UnknownText_0x19eb3b: ; 0x19eb3b
	text "I<...> asked my girl-"
	line "friend to swim to"
	cont "FUCHSIA<...> Gasp<...>"
	done
; 0x19eb6f

SwimmerfDawnSeenText: ; 0x19eb6f
	text "I'm disgusted by"
	line "wimpy people!"
	done
; 0x19eb8e

SwimmerfDawnBeatenText: ; 0x19eb8e
	text "I could beat you"
	line "at swimming<...>"
	done
; 0x19ebad

UnknownText_0x19ebad: ; 0x19ebad
	text "It's a quick swim"
	line "between FUCHSIA"

	para "and SEAFOAM IS-"
	line "LANDS<...>"

	para "Sheesh, some big"
	line "man my boyfriend"

	para "is! What a wimp!"
	done
; 0x19ec19

SwimmermJeromeSeenText: ; 0x19ec19
	text "Swimming?"
	line "I'm lousy at it."

	para "I'm just splashing"
	line "around in these"
	cont "shallow waters."
	done
; 0x19ec66

SwimmermJeromeBeatenText: ; 0x19ec66
	text "I thought I could"
	line "win."
	done
; 0x19ec7e

UnknownText_0x19ec7e: ; 0x19ec7e
	text "I caught these"
	line "#MON in"
	cont "freshwater."

	para "Different types"
	line "of #MON appear"
	para "depending on"
	line "where you SURF."
	done
; 0x19ecaf

UnknownText_0x19ecaf: ; 0x19ecaf
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done
; 0x19ed24

UnknownText_0x19ed24: ; 0x19ed24
	text "I'm all sweaty."
	line "Time for a swim!"
	done
; 0x19ed45

UnknownText_0x19ed45: ; 0x19ed45
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder<...>"
	done
; 0x19ed7d

UnknownText_0x19ed7d: ; 0x19ed7d
	text "The roadwork is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done
; 0x19edbc

UnknownText_0x19edbc: ; 0x19edbc
	text "ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done
; 0x19ede5

UnknownText_0x19ede5: ; 0x19ede5
	text "Please be careful"
	line "if you are swim-"
	cont "ming to SEAFOAM"
	cont "ISLANDS."

	para "FUCHSIA POLICE"
	done
; 0x19ee31

Route19_MapEventHeader: ; 0x19ee31
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $3, $7, 3, GROUP_ROUTE_19___FUCHSIA_GATE, MAP_ROUTE_19___FUCHSIA_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 11, $0, MapRoute19Signpost0Script
	signpost 1, 11, $0, MapRoute19Signpost1Script

	; people-events
	db 6
	person_event SPRITE_SWIMMER_GIRL, 27, 13, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 0, TrainerSwimmerfDawn, -1
	person_event SPRITE_SWIMMER_GUY, 32, 17, $a, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerSwimmermHarold, -1
	person_event SPRITE_SWIMMER_GUY, 21, 15, $a, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerSwimmermJerome, -1
	person_event SPRITE_SWIMMER_GUY, 27, 12, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 0, TrainerSwimmermTucker, -1
	person_event SPRITE_FISHER, 9, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 1, FisherScript_0x19ea4d, -1
	person_event SPRITE_FISHER, 9, 15, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 1, FisherScript_0x19ea61, -1
; 0x19ee94

