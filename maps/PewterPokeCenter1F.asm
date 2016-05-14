PewterPokeCenter1F_MapScriptHeader: ; 0x1a2ee5
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2ee7

NurseScript_0x1a2ee7: ; 0x1a2ee7
	jumpstd pokecenternurse
; 0x1a2eea

TeacherScript_0x1a2eea: ; 0x1a2eea
	jumptextfaceplayer UnknownText_0x1a2f01
; 0x1a2eed

JigglypuffScript_0x1a2eed: ; 0x1a2eed
	loadfont
	writetext UnknownText_0x1a2f5d
	cry JIGGLYPUFF
	waitbutton
	closetext
	end
; 0x1a2ef7

BugCatcherScript_0x1a2ef7: ; 0x1a2ef7
	jumptextfaceplayer UnknownText_0x1a2f75
; 0x1a2efa

PokefanMScript_0x1a2efa: ; 0x1a2efa
	faceplayer
	loadfont
	trade $4
	waitbutton
	closetext
	end
; 0x1a2f01

UnknownText_0x1a2f01: ; 0x1a2f01
	text "<...>Yeah, and the"
	line "GYM in CINNABAR's"

	para "gone. I was really"
	line "amazed."

	para "<...>Yes? I'm on the"
	line "phone. Go away!"
	done
; 0x1a2f5d

UnknownText_0x1a2f5d: ; 0x1a2f5d
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done
; 0x1a2f75

UnknownText_0x1a2f75: ; 0x1a2f75
	text "Most #MON get"
	line "drowsy if they"

	para "hear a JIGGLYPUFF"
	line "singing."

	para "I hear there's a"
	line "move that can be"

	para "used only while a"
	line "#MON is asleep."
	done
; 0x1a2ff4

PewterOldCenter_LinkScript:
	jumpstd pokecenteroldlink

PewterPokeCenter1F_MapEventHeader: ; 0x1a2ff4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $6, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $2, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 6
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x1a2ee7, -1
	person_event SPRITE_TEACHER, 10, 15, $5, 0, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x1a2eea, -1
	person_event SPRITE_JIGGLYPUFF, 7, 7, $16, 0, 0, -1, -1, 0, 0, 0, JigglypuffScript_0x1a2eed, -1
	person_event SPRITE_BUG_CATCHER, 7, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, BugCatcherScript_0x1a2ef7, -1
	person_event SPRITE_POKEFAN_M, 7, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x1a2efa, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PewterOldCenter_LinkScript, -1
; 0x1a304a

