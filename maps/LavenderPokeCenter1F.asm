LavenderPokeCenter1F_MapScriptHeader: ; 0x7e69e
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e6a0

NurseScript_0x7e6a0: ; 0x7e6a0
	jumpstd pokecenternurse
; 0x7e6a3

GentlemanScript_0x7e6a3: ; 0x7e6a3
	jumptextfaceplayer UnknownText_0x7e6bd
; 0x7e6a6

TeacherScript_0x7e6a6: ; 0x7e6a6
	jumptextfaceplayer UnknownText_0x7e710
; 0x7e6a9

YoungsterScript_0x7e6a9: ; 0x7e6a9
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x7e6b7
	writetext UnknownText_0x7e779
	waitbutton
	closetext
	end
; 0x7e6b7

UnknownScript_0x7e6b7: ; 0x7e6b7
	writetext UnknownText_0x7e7ed
	waitbutton
	closetext
	end
; 0x7e6bd

UnknownText_0x7e6bd: ; 0x7e6bd
	text "To the north of"
	line "LAVENDER is ROCK"

	para "TUNNEL. Go through"
	line "it to get to the"
	cont "POWER PLANT."
	done
; 0x7e710

UnknownText_0x7e710: ; 0x7e710
	text "There's a radio"
	line "program that plays"
	cont "# FLUTE music."

	para "Oh? Ah, your radio"
	line "needs an EXPN CARD"
	cont "to tune into it."
	done
; 0x7e779

UnknownText_0x7e779: ; 0x7e779
	text "If the POWER PLANT"
	line "isn't running, the"

	para "MAGNET TRAIN won't"
	line "run either<...>"

	para "It also means the"
	line "RADIO STATION"
	cont "can't broadcast<...>"
	done
; 0x7e7ed

UnknownText_0x7e7ed: ; 0x7e7ed
	text "The DIRECTOR of"
	line "the RADIO STATION"
	cont "sure was happy."

	para "He said they're"
	line "back on the air"

	para "because the POWER"
	line "PLANT is running"
	cont "smoothly again."
	done
; 0x7e872

LavenderOldCenter_LinkScript:
	jumpstd pokecenteroldlink

LavenderPokeCenter1F_MapEventHeader: ; 0x7e872
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $6, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x7e6a0, -1
	person_event SPRITE_GENTLEMAN, 10, 16, $5, 0, 1, -1, -1, 0, 0, 0, GentlemanScript_0x7e6a3, -1
	person_event SPRITE_TEACHER, 7, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x7e6a6, -1
	person_event SPRITE_YOUNGSTER, 8, 7, $4, 1, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, YoungsterScript_0x7e6a9, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, LavenderOldCenter_LinkScript, -1
; 0x7e8bb

