VermilionPokeCenter1F_MapScriptHeader: ; 0x191601
	; trigger count
	db 0

	; callback count
	db 0
; 0x191603

NurseScript_0x191603: ; 0x191603
	jumpstd pokecenternurse
; 0x191606

FishingGuruScript_0x191606: ; 0x191606
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0x191614
	writetext UnknownText_0x191620
	waitbutton
	closetext
	end
; 0x191614

UnknownScript_0x191614: ; 0x191614
	writetext UnknownText_0x191698
	waitbutton
	closetext
	end
; 0x19161a

SailorScript_0x19161a: ; 0x19161a
	jumptextfaceplayer UnknownText_0x1916fe
; 0x19161d

BugCatcherScript_0x19161d: ; 0x19161d
	jumptextfaceplayer UnknownText_0x19173b
; 0x191620

UnknownText_0x191620: ; 0x191620
	text "A sleeping #MON"
	line "is lying in front"
	cont "of DIGLETT'S CAVE."

	para "It's a fantastic"
	line "opportunity to get"

	para "it, but how do you"
	line "wake it up?"
	done
; 0x191698

UnknownText_0x191698: ; 0x191698
	text "There used to be a"
	line "sleeping #MON"

	para "lying in front of"
	line "DIGLETT'S CAVE."

	para "But it seems to"
	line "have disappeared."
	done
; 0x1916fe

UnknownText_0x1916fe: ; 0x1916fe
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done
; 0x19173b

UnknownText_0x19173b: ; 0x19173b
	text "Oh? You have some"
	line "BADGES I've never"
	cont "seen before."

	para "Oh, I get it. You"
	line "got them in JOHTO."
	done
; 0x191791

VermilionOldCenter_LinkScript:
	jumpstd pokecenteroldlink
	
VermilionPokeCenter1F_MapEventHeader: ; 0x191791
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $6, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x191603, -1
	person_event SPRITE_FISHING_GURU, 7, 12, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, FishingGuruScript_0x191606, -1
	person_event SPRITE_SAILOR, 9, 16, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, SailorScript_0x19161a, -1
	person_event SPRITE_BUG_CATCHER, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BugCatcherScript_0x19161d, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, VermilionOldCenter_LinkScript, -1
; 0x1917da

