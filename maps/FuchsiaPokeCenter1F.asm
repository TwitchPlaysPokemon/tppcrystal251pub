FuchsiaPokeCenter1F_MapScriptHeader: ; 0x196452
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x196458, $0000

	; callback count
	db 0
; 0x196458

UnknownScript_0x196458: ; 0x196458
	end
; 0x196459

NurseScript_0x196459: ; 0x196459
	jumpstd pokecenternurse
; 0x19645c

CooltrainerMScript_0x19645c: ; 0x19645c
	jumptextfaceplayer UnknownText_0x196494
; 0x19645f

CooltrainerFScript_0x19645f: ; 0x19645f
	jumptextfaceplayer UnknownText_0x1964dc
; 0x196462

JanineImpersonatorScript_0x196462: ; 0x196462
	faceplayer
	loadfont
	writetext UnknownText_0x19652e
	waitbutton
	closetext
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite $c, $a
	special Function14209
	loadfont
	writetext UnknownText_0x19654e
	waitbutton
	closetext
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite $c, $28
	special Function14209
	end
; 0x196486

MovementData_0x196486: ; 0x196486
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
; 0x196494

UnknownText_0x196494: ; 0x196494
	text "Badges are proof"
	line "of your skill as"
	cont "a trainer."

	para "This skill lets"
	line "you command newly"
	cont "caught #MON as"
	cont "if they were"
	cont "trained."

	done
; 0x1964dc

UnknownText_0x1964dc: ; 0x1964dc
	text "I got quite a"
	line "shock at the GYM."

	para "There were all"
	line "these girls who"
	cont "looked identical."
	done
; 0x19652e

UnknownText_0x19652e: ; 0x19652e
	text "I'm JANINE! Hocus-"
	line "pocus<...> Poof!"
	done
; 0x19654e

UnknownText_0x19654e: ; 0x19654e
	text "See? I look just"
	line "like her now!"
	done
; 0x19656e

FuchsiaOldCenter_LinkScript:
	jumpstd pokecenteroldlink
	
FuchsiaPokeCenter1F_MapEventHeader: ; 0x19656e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $6, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, NurseScript_0x196459, -1
	person_event SPRITE_COOLTRAINER_M, 8, 14, $5, 0, 1, -1, -1, 0, 0, 0, CooltrainerMScript_0x19645c, -1
	person_event SPRITE_COOLTRAINER_F, 8, 6, $9, 0, 0, -1, -1, 0, 0, 0, CooltrainerFScript_0x19645f, -1
	person_event SPRITE_JANINE_IMPERSONATOR, 7, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, JanineImpersonatorScript_0x196462, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FuchsiaOldCenter_LinkScript, -1
; 0x1965b7

