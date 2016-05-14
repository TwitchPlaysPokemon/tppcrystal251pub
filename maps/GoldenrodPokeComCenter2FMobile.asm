GoldenrodPokeComCenter2FMobile_MapScriptHeader: ; 0x625cf
	; trigger count
	db 0

	; callback count
	db 0
; 0x625d1

ScientistScript_0x625d1: ; 0x625d1
	jumptextfaceplayer UnknownText_0x62674
; 0x625d4

ScientistScript_0x625d4: ; 0x625d4
	jumptextfaceplayer UnknownText_0x626f9
; 0x625d7

ScientistScript_0x625d7: ; 0x625d7
	jumptextfaceplayer UnknownText_0x62795
; 0x625da
MapGoldenrodPokeComCenter2FMobileSignpost0Script: ; 0x62671
	jumptext UnknownText_0x62b26
; 0x62674
MapGoldenrodPokeComCenter2FMobileSignpost1Script: ; 0x62671
	jumptext PCC_OfficePCText
; 0x62674
MapGoldenrodPokeComCenter2FMobileSignpost2Script: ; 0x62671
	jumptext PCC_OfficePCText2
; 0x62674

UnknownText_0x62674: ; 0x62674
	text "The #COM CENTER"
	line "was built to"

	para "satisfy demands"
	line "for trainers to"

	para "interact with"
	line "others far away."

	para "It even lets total"
	line "strangers have fun"
	cont "together!"
	
	para "I wonder if we can"
	line "make some sort of"
	cont "game using it<...>"
	
	done
; 0x626f9

UnknownText_0x626f9: ; 0x626f9
	text "When you linked"
	line "with someone by"

	para "wireless for the"
	line "first time,"

	para "were you not"
	line "impressed?"

	para "When my first try"
	line "worked, I got"
	cont "the shakes!"
	done
; 0x62795

UnknownText_0x62795: ; 0x62795
	text "They were able to"
	line "build this huge"

	para "facility thanks to"
	line "advances in wire-"
	cont "less technology."

	para "If the signal goes"
	line "out, it could"
	cont "cause riots!"
	done
; 0x627ee

UnknownText_0x62b26: ; 0x62b26
	text "The ADMINISTRATION"
	line "OFFICE received an"
	cont "e-mail. It says<...>"

	para $56, " ", $56, " ", $56

	para "To the #COM"
	line "CENTER staff<...>"

	para "Wireless communi-"
	line "cation has enabled"

	para "#MON trainers"
	line "to interact across"

	para "the nation. Let's"
	line "keep working for"

	para "the day when all"
	line "the trainers in"

	para "the world can link"
	line "without barriers!"

	para $56, " ", $56, " ", $56
	done

PCC_OfficePCText: ; 0x62b26
	text "The screen is"
	line "filled with lots"
	cont "of code!"

	para "Better not touch"
	line "it<...>"
	done

PCC_OfficePCText2: ; 0x62b26
	text "There's a video"
	line "playing on the"
	
	para "monitor with a"
	line "long chat box next"
	cont "to it."

	para "The words keep"
	line "moving too fast"
	cont "to read!"
	done

GoldenrodPokeComCenter2FMobile_MapEventHeader: ; 0x62c32
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $1f, $0, 3, GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F
	warp_def $1f, $1, 3, GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 26, 6, $1, MapGoldenrodPokeComCenter2FMobileSignpost0Script
	signpost 28, 6, $1, MapGoldenrodPokeComCenter2FMobileSignpost1Script
	signpost 26, 3, $1, MapGoldenrodPokeComCenter2FMobileSignpost2Script

	; people-events
	db 3
	person_event SPRITE_SCIENTIST, 32, 8, $4, 1, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ScientistScript_0x625d1, -1
	person_event SPRITE_SCIENTIST, 31, 11, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x625d4, -1
	person_event SPRITE_SCIENTIST, 33, 11, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ScientistScript_0x625d7, -1
; 0x62c78

