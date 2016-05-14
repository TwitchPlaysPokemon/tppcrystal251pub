GoldenrodDeptStore4F_MapScriptHeader: ; 0x55ee7
	; trigger count
	db 0

	; callback count
	db 0
; 0x55ee9

ClerkScript_0x55ee9: ; 0x55ee9
	faceplayer
	loadfont
	pokemart $0, $0008
	closetext
	end
; 0x55ef1

CooltrainerMScript_0x55ef1: ; 0x55ef1
	jumptextfaceplayer UnknownText_0x55f08
; 0x55ef4

BugCatcherScript_0x55ef4: ; 0x55ef4
	jumptextfaceplayer UnknownText_0x55f52
; 0x55ef7

GameboyKidScript_0x55ef7: ; 0x55ef7
	faceplayer
	loadfont
	writetext UnknownText_0x55f74
	waitbutton
	closetext
	spriteface $5, $0
	end
; 0x55f02

MapGoldenrodDeptStore4FSignpost0Script: ; 0x55f02
	jumptext UnknownText_0x5600d
; 0x55f05

MapGoldenrodDeptStore4FSignpost1Script: ; 0x55f05
	jumpstd elevatorbutton
; 0x55f08

UnknownText_0x55f08: ; 0x55f08
	text "Hey. I love strong"
	line "#MON."

	para "I feed them PRO-"
	line "TEIN to crank up"
	cont "their ATTACK."

	para "The new recipe"
	line "can crank it up"
	cont "TO THE MAX!!!"
	done
; 0x55f52

UnknownText_0x55f52: ; 0x55f52
	text "They started"
	line "selling ways to"
	cont "evolve your"
	cont "#MON just"
	cont "recently."
	done
; 0x55f74

UnknownText_0x55f74: ; 0x55f74
	text "Some #MON can"
	line "evolve by being"
	cont "traded via a Game"
	cont "Link cable."

	para "I know of four:"
	line "MACHOKE, KADABRA,"
	cont "HAUNTER and, um,"
	cont "GRAVELER."

	para "I heard there are"
	line "others too."
	done
; 0x5600d

UnknownText_0x5600d: ; 0x5600d
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F POWER PALACE"
	done
; 0x56038

GoldenrodDeptStore4F_MapEventHeader: ; 0x56038
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_5F, MAP_GOLDENROD_DEPT_STORE_5F
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_3F, MAP_GOLDENROD_DEPT_STORE_3F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore4FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore4FSignpost1Script

	; people-events
	db 4
	person_event SPRITE_CLERK, 9, 17, $7, 0, 0, -1, -1, 0, 0, 0, ClerkScript_0x55ee9, -1
	person_event SPRITE_COOLTRAINER_M, 11, 15, $9, 0, 0, -1, -1, 0, 0, 0, CooltrainerMScript_0x55ef1, -1
	person_event SPRITE_BUG_CATCHER, 6, 11, $5, 0, 1, -1, -1, 0, 0, 0, BugCatcherScript_0x55ef4, -1
	person_event SPRITE_GAMEBOY_KID, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, GameboyKidScript_0x55ef7, -1
; 0x5608b

