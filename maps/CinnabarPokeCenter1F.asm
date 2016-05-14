CinnabarPokeCenter1F_MapScriptHeader: ; 0x1ab32a
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ab32c

NurseScript_0x1ab32c: ; 0x1ab32c
	jumpstd pokecenternurse
; 0x1ab32f

CooltrainerFScript_0x1ab32f: ; 0x1ab32f
	jumptextfaceplayer UnknownText_0x1ab335
; 0x1ab332

FisherScript_0x1ab332: ; 0x1ab332
	jumptextfaceplayer UnknownText_0x1ab37f
; 0x1ab335

UnknownText_0x1ab335: ; 0x1ab335
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave<...>"
	done
; 0x1ab37f

UnknownText_0x1ab37f: ; 0x1ab37f
	text "It's been a month"
	line "since the volcano"
	cont "erupted."
	done
; 0x1ab3ab

CinnabarOldCenter_LinkScript:
	jumpstd pokecenteroldlink

CinnabarPokeCenter1F_MapEventHeader: ; 0x1ab3ab
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $6, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x1ab32c, -1
	person_event SPRITE_COOLTRAINER_F, 9, 15, $5, 0, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerFScript_0x1ab32f, -1
	person_event SPRITE_FISHER, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FisherScript_0x1ab332, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CinnabarOldCenter_LinkScript, -1
; 0x1ab3e7

