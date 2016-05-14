Route34IlexForestGate_MapScriptHeader: ; 0x62d28
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x62d2d
; 0x62d2d

UnknownScript_0x62d2d: ; 0x62d2d
	checkevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	iffalse UnknownScript_0x62d38
	disappear $2
	appear $5
	return
; 0x62d38

UnknownScript_0x62d38: ; 0x62d38
	disappear $5
	appear $2
	return
; 0x62d3d

UnknownScript_0x62d3d: ; 0x62d3d
	checkevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	iffalse UnknownScript_0x62d62
	showemote $0, $5, 20
	spriteface $5, $2
	spriteface $0, $3
	follow $0, $5
	applymovement $0, MovementData_0x62d97
	stopfollow
	spriteface $0, $0
	loadfont
	writetext UnknownText_0x62e41
	waitbutton
	closetext
	applymovement $5, MovementData_0x62d9a
UnknownScript_0x62d62: ; 0x62d62
	end
; 0x62d63

TeacherScript_0x62d63: ; 0x62d63
	faceplayer
	loadfont
	checkevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	iftrue UnknownScript_0x62d84
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue UnknownScript_0x62d7e
	writetext UnknownText_0x62d9d
	buttonsound
	verbosegiveitem TM_ATTRACT, 1
	iffalse UnknownScript_0x62d82
	setevent EVENT_GOT_TM12_SWEET_SCENT
UnknownScript_0x62d7e: ; 0x62d7e
	writetext UnknownText_0x62df6
	waitbutton
UnknownScript_0x62d82: ; 0x62d82
	closetext
	end
; 0x62d84

UnknownScript_0x62d84: ; 0x62d84
	writetext UnknownText_0x62e41
	buttonsound
	closetext
	end
; 0x62d8a

ButterfreeScript_0x62d8a: ; 0x62d8a
	loadfont
	writetext UnknownText_0x62e83
	cry BUTTERFREE
	waitbutton
	closetext
	end
; 0x62d94

LassScript_0x62d94: ; 0x62d94
	jumptextfaceplayer UnknownText_0x62e97
; 0x62d97

MovementData_0x62d97: ; 0x62d97
	step_up
	step_up
	step_end
; 0x62d9a

MovementData_0x62d9a: ; 0x62d9a
	step_down
	step_right
	step_end
; 0x62d9d

UnknownText_0x62d9d: ; 0x62d9d
	text "Oh, honey. You're"
	line "making a #DEX?"

	para "It must be hard if"
	line "#MON don't love"
	cont "you."
	para "Try using this TM."

	done
; 0x62df6

UnknownText_0x62df6: ; 0x62df6
	text "ATTRACT infatuates"
	line "foes and makes"

	para "them unwilling to"
	line "attack you."

	para "It won't work if"
	line "they're the same"
	cont "gender, though."

	para "#MON should"
	line "try to be more"
	cont "open-minded."
	done
; 0x62e41

UnknownText_0x62e41: ; 0x62e41
	text "Something's wrong"
	line "in ILEX FOREST<...>"

	para "You should stay"
	line "away right now."
	done
; 0x62e83

UnknownText_0x62e83: ; 0x62e83
	text "BUTTERFREE: Freeh!"
	done
; 0x62e97

UnknownText_0x62e97: ; 0x62e97
	text "Did you see the"
	line "shrine honoring"
	cont "the protector?"

	para "It watches over"
	line "the FOREST from"
	cont "across time."

	para "I think that it"
	line "must be a grass-"
	cont "type #MON."
	done
; 0x62f20

Route34IlexForestGate_MapEventHeader: ; 0x62f20
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $0, $5, 2, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $4, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST
	warp_def $7, $5, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST

	; xy triggers
	db 1
	xy_trigger 0, $7, $4, $0, UnknownScript_0x62d3d, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_TEACHER, 7, 13, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, TeacherScript_0x62d63, EVENT_TEACHER_IN_ILEX_FOREST_ROUTE_34_GATE
	person_event SPRITE_BUTTERFREE, 8, 13, $16, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ButterfreeScript_0x62d8a, -1
	person_event SPRITE_LASS, 8, 7, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, LassScript_0x62d94, EVENT_LASS_IN_ILEX_FOREST_ROUTE_34_GATE
	person_event SPRITE_TEACHER, 11, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, TeacherScript_0x62d63, EVENT_TEACHER_IN_ILEX_FOREST_ROUTE_34_GATE_2
; 0x62f76

