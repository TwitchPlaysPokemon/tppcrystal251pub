CeladonDeptStore3F_MapScriptHeader: ; 0x70d27
	; trigger count
	db 0

	; callback count
	db 0
; 0x70d29

ClerkScript_0x70d29: ; 0x70d29
	faceplayer
	loadfont
	pokemart $0, $0019
	closetext
	end

GuardsClerk: ; 0x70d29
	faceplayer
	loadfont
	pokemart $0, $0000
	closetext
	end
; 0x70d31

YoungsterScript_0x70d31: ; 0x70d31
	jumptextfaceplayer UnknownText_0x70d53
; 0x70d34

GameboyKidScript_0x70d34: ; 0x70d34
	faceplayer
	loadfont
	writetext UnknownText_0x70d86
	waitbutton
	closetext
	spriteface $4, $0
	end
; 0x70d3f

GameboyKidScript_0x70d3f: ; 0x70d3f
	faceplayer
	loadfont
	writetext UnknownText_0x70dc7
	waitbutton
	closetext
	spriteface $5, $0
	end
; 0x70d4a

SuperNerdScript_0x70d4a: ; 0x70d4a
	jumptextfaceplayer UnknownText_0x70e61
; 0x70d4d

MapCeladonDeptStore3FSignpost1Script: ; 0x70d4d
	jumpstd elevatorbutton
; 0x70d50

MapCeladonDeptStore3FSignpost0Script: ; 0x70d50
	jumptext UnknownText_0x70e85
; 0x70d53

UnknownText_0x70d53: ; 0x70d53
	text "I can't decide"
	line "which #MON I"

	para "should use this"
	line "item on<...>"
	done
; 0x70d86

UnknownText_0x70d86: ; 0x70d86
	text "Uh-oh! I traded my"
	line "#MON without"

	para "removing the UP-"
	line "GRADE from it."
	done
; 0x70dc7

UnknownText_0x70dc7: ; 0x70dc7
	text "Yeah! I'm finally"
	line "getting a PORYGON!"

	para "I'm no good at the"
	line "slots, so I could"

	para "never get enough"
	line "coins<...>"

	para "<...>Huh?"

	para "The traded PORYGON"
	line "turned into a dif-"
	cont "ferent #MON!"
	done
; 0x70e61

UnknownText_0x70e61: ; 0x70e61
	text "This store used"
	;line "to sell TMs,"
	line "to sell TMs."


	para "I heard they're"
	line "opening up a new"

	;para "they only open to"
	;line "the best trainers"
	;cont "in KANTO."

	para "TM DEPOT down-"
	line "stairs."

	para "I wonder if they'll"
	line "let me in<...>"

	done
; 0x70e85

UnknownText_0x70e85: ; 0x70e85
	text "3F: BATTLE SHOP"

	para "Make Your #MON"
	line "Stronger!"
	done
; 0x70eab

CeladonDeptStore3F_MapEventHeader: ; 0x70eab
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_2F, MAP_CELADON_DEPT_STORE_2F
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_4F, MAP_CELADON_DEPT_STORE_4F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore3FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore3FSignpost1Script

	; people-events
	db 6
	person_event SPRITE_CLERK, 5, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_0x70d29, -1
	person_event SPRITE_YOUNGSTER, 8, 10, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, YoungsterScript_0x70d31, -1
	person_event SPRITE_GAMEBOY_KID, 5, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, GameboyKidScript_0x70d34, -1
	person_event SPRITE_GAMEBOY_KID, 5, 14, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GameboyKidScript_0x70d3f, -1
	person_event SPRITE_SUPER_NERD, 8, 17, $2, 1, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, SuperNerdScript_0x70d4a, -1
	person_event SPRITE_CLERK, 5, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GuardsClerk, -1
; 0x70f0b

