MrFujisHouse_MapScriptHeader: ; 0x7e8c8
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e8ca

SuperNerdScript_0x7e8ca: ; 0x7e8ca
	jumptextfaceplayer UnknownText_0x7e8f1
; 0x7e8cd

LassScript_0x7e8cd: ; 0x7e8cd
	jumptextfaceplayer UnknownText_0x7e940
; 0x7e8d0

RhydonScript_0x7e8d0: ; 0x7e8d0
	loadfont
	writetext UnknownText_0x7e9b6
	cry PSYDUCK
	waitbutton
	closetext
	end
; 0x7e8da

GrowlitheScript_0x7e8da: ; 0x7e8da
	loadfont
	writetext UnknownText_0x7e9c9
	cry NIDORINO
	waitbutton
	closetext
	end
; 0x7e8e4

MoltresScript_0x7e8e4: ; 0x7e8e4
	loadfont
	writetext UnknownText_0x7e9da
	cry PIDGEY
	waitbutton
	closetext
	end
; 0x7e8ee

MapMrFujisHouseSignpost1Script: ; 0x7e8ee
	jumpstd difficultbookshelf
; 0x7e8f1

UnknownText_0x7e8f1: ; 0x7e8f1
	text "MR.FUJI does live"
	line "here, but he's not"

	para "home now."

	para "He should be at"
	line "the SOUL HOUSE."
	done
; 0x7e940

UnknownText_0x7e940: ; 0x7e940
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "Grandpa takes in"
	line "the poor homeless"

	para "#MON and takes"
	line "care of them."
	done
; 0x7e9b6

UnknownText_0x7e9b6: ; 0x7e9b6
	text "PSYDUCK: Gu-guwa?"
	done
; 0x7e9c9

UnknownText_0x7e9c9: ; 0x7e9c9
	text "NIDORINO: Gyun!"
	done
; 0x7e9da

UnknownText_0x7e9da: ; 0x7e9da
	text "PIDGEY: Pijji!"
	done
; 0x7e9ea

MrFujisHouse_MapEventHeader: ; 0x7e9ea
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapMrFujisHouseSignpost1Script
	signpost 1, 1, $0, MapMrFujisHouseSignpost1Script

	; people-events
	db 5
	person_event SPRITE_SUPER_NERD, 5, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SuperNerdScript_0x7e8ca, -1
	person_event SPRITE_LASS, 8, 7, $2, 1, 1, -1, -1, 0, 0, 0, LassScript_0x7e8cd, -1
	person_event SPRITE_RHYDON, 8, 11, $16, 0, 0, -1, -1, 0, 0, 0, RhydonScript_0x7e8d0, -1
	person_event SPRITE_GROWLITHE, 9, 9, $16, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GrowlitheScript_0x7e8da, -1
	person_event SPRITE_SPEAROW, 7, 5, $16, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MoltresScript_0x7e8e4, -1
; 0x7ea45

