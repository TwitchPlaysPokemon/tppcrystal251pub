Route10PokeCenter1F_MapScriptHeader: ; 0x188bd2
	; trigger count
	db 0

	; callback count
	db 0
; 0x188bd4

NurseScript_0x188bd4: ; 0x188bd4
	jumpstd pokecenternurse
; 0x188bd7

GentlemanScript_0x188bd7: ; 0x188bd7
	jumptextfaceplayer UnknownText_0x188bf1
; 0x188bda

GymGuyScript_0x188bda: ; 0x188bda
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188be8
	writetext UnknownText_0x188c26
	waitbutton
	closetext
	end
; 0x188be8

UnknownScript_0x188be8: ; 0x188be8
	writetext UnknownText_0x188c9e
	waitbutton
	closetext
	end
; 0x188bee

CooltrainerFScript_0x188bee: ; 0x188bee
	jumptextfaceplayer UnknownText_0x188d0c
; 0x188bf1

UnknownText_0x188bf1: ; 0x188bf1
	text "A #MON CENTER"
	line "near a cave?"

	para "That's mighty"
	line "convenient."
	done
; 0x188c26

UnknownText_0x188c26: ; 0x188c26
	text "The POWER PLANT's"
	line "MANAGER is looking"

	para "for a strong #-"
	line "MON trainer."

	para "He needs help"
	line "getting back"

	para "something that"
	line "was stolen."
	done
; 0x188c9e

UnknownText_0x188c9e: ; 0x188c9e
	text "I hear TEAM ROCKET"
	line "got back together"

	para "in JOHTO but fell"
	line "apart right away."

	para "I didn't know any-"
	line "thing about that."
	done
; 0x188d0c

UnknownText_0x188d0c: ; 0x188d0c
	text "When you go out-"
	line "side, you can see"

	para "the roof of a big"
	line "building."

	para "That's the POWER"
	line "PLANT."
	done
; 0x188d63

Route10OldCenter_LinkScript:
	jumpstd pokecenteroldlink
	
Route10PokeCenter1F_MapEventHeader: ; 0x188d63
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $6, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x188bd4, -1
	person_event SPRITE_GENTLEMAN, 9, 15, $5, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, GentlemanScript_0x188bd7, -1
	person_event SPRITE_GYM_GUY, 7, 10, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, GymGuyScript_0x188bda, -1
	person_event SPRITE_COOLTRAINER_F, 8, 6, $9, 0, 0, -1, -1, 0, 0, 0, CooltrainerFScript_0x188bee, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, Route10OldCenter_LinkScript, -1
; 0x188dac

