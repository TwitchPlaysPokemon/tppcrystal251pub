SilverCavePokeCenter1F_MapScriptHeader: ; 0x1ae598
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ae59a

NurseScript_0x1ae59a: ; 0x1ae59a
	jumpstd pokecenternurse
; 0x1ae59d

GrannyScript_0x1ae59d: ; 0x1ae59d
	jumptextfaceplayer SilverPokeCenterNPCText
; 0x1ae5a0

SecondGrannyPCScript: ; 0x1ae59d
	jumptextfaceplayer SilverPokeCenterNPC2Text
; 0x1ae5a0

SilverPokeCenterNPCText: ; 0x1ae5a0
	text "Trainers who seek"
	line "power climb MT."

	para "SILVER despite its"
	line "many dangers<...>"

	para "With their trusted"
	line "#MON, they must"

	para "feel they can go"
	line "anywhere<...>"
	done

SilverPokeCenterNPC2Text:
	text "An item in your"
	line "PACK may be "

	para "registered for use"
	line "on SELECT Button."

	para "Isn't that useful?"

	done

SilverCavePokeCenter1F_MapEventHeader: ; 0x1ae622
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $4, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x1ae59a, -1
	person_event SPRITE_GRANNY, 9, 5, $8, 1, 2, -1, -1, 0, 0, 0, GrannyScript_0x1ae59d, -1
	person_event SPRITE_GRANNY, 8, 12, $5, 1, 3, -1, -1, PAL_OW_BLUE, 0, 0, SecondGrannyPCScript, -1
; 0x1ae651

