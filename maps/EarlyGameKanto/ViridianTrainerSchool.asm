ViridianTrainerSchoolRB_MapScriptHeader:
	db 0
	db 0

ViridianTrainerSchoolRBLassScript:
	jumptextfaceplayer _SchoolText1

ViridianTrainerSchoolRBTeacherScript:
	jumptextfaceplayer _SchoolText2

ViridianTrainerSchoolRBBookcaseScript:
	jumpstd difficultbookshelf

ViridianTrainerSchoolRBBlackboardScript:
	loadfont
	writetext _ViridianSchoolBlackboardText1
	buttonsound
.loop
	writetext _ViridianSchoolBlackboardText2
	loadmenudata .MenuDataHeader
	interpretmenu
	writebackup
	if_equal 1, .Psn
	if_equal 2, .Par
	if_equal 3, .Slp
	if_equal 4, .Brn
	if_equal 5, .Frz
	closetext
	end

.Psn
	writetext _ViridianBlackboardPoisonText
	buttonsound
	jump .loop

.Par
	writetext _ViridianBlackboardPrlzText
	buttonsound
	jump .loop

.Slp
	writetext _ViridianBlackboardSleepText
	buttonsound
	jump .loop

.Brn
	writetext _ViridianBlackboardBurnText
	buttonsound
	jump .loop

.Frz
	writetext _ViridianBlackboardFrozenText
	buttonsound
	jump .loop

.MenuDataHeader
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 11 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x68ae9

.MenuData2
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Strings
	dbw BANK(ViridianTrainerSchoolRB_MapScriptHeader), $0000
; 0x68af2

.Strings
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"
; 0x68b0b

ViridianTrainerSchoolRB_NotebookScript
	loadfont
	writetext _ViridianSchoolNotebookText1
	buttonsound
	writetext _TurnPageText
	yesorno
	iffalse .quit
	writetext _ViridianSchoolNotebookText2
	buttonsound
	writetext _TurnPageText
	yesorno
	iffalse .quit
	writetext _ViridianSchoolNotebookText3
	buttonsound
	writetext _TurnPageText
	yesorno
	iffalse .quit
	writetext _ViridianSchoolNotebookText4
	buttonsound
	waitsfx
	spriteface $2, UP
	writetext _ViridianSchoolNotebookText5
	waitbutton
.quit
	closetext
	end

_SchoolText1:
	text "Whew! I'm trying"
	line "to memorize all"
	cont "my notes."
	done

_SchoolText2:
	text "Okay!"

	para "Be sure to read"
	line "the blackboard"
	cont "carefully!"
	done

_ViridianSchoolBlackboardText1:
	text "The blackboard"
	line "describes #MON"
	cont "STATUS changes"
	cont "during battles."
	done

_ViridianSchoolBlackboardText2:
	text "Which heading do"
	line "you want to read?"
	done

_ViridianBlackboardSleepText:
	text "A #MON can't"
	line "attack if it's"
	cont "asleep!"

	para "#MON will stay"
	line "asleep even after"
	cont "battles."

	para "Use AWAKENING to"
	line "wake them up!"
	done

_ViridianBlackboardPoisonText:
	text "When poisoned, a"
	line "#MON's health"
	cont "steadily drops."

	para "Poison lingers"
	line "after battles."

	para "Use an ANTIDOTE"
	line "to cure poison!"
	done

_ViridianBlackboardPrlzText:
	text "Paralysis could"
	line "make #MON"
	cont "moves misfire!"

	para "Paralysis remains"
	line "after battles."

	para "Use PARLYZ HEAL"
	line "for treatment!"
	done

_ViridianBlackboardBurnText:
	text "A burn reduces"
	line "power and speed."
	cont "It also causes"
	cont "ongoing damage."

	para "Burns remain"
	line "after battles."

	para "Use BURN HEAL to"
	line "cure a burn!"
	done

_ViridianBlackboardFrozenText:
	text "If frozen, a"
	line "#MON becomes"
	cont "totally immobile!"

	para "It stays frozen"
	line "even after the"
	cont "battle ends."

	para "Use ICE HEAL to"
	line "thaw out #MON!"
	done

_TurnPageText:
	text "Turn the page?"
	done

_ViridianSchoolNotebookText5:
	text "GIRL: Hey! Don't"
	line "look at my notes!"
	done

_ViridianSchoolNotebookText1:
	text "Looked at the"
	line "notebook!"

	para "First page<...>"

	para "# BALLs are"
	line "used to catch"
	cont "#MON."

	para "Up to 6 #MON"
	line "can be carried."

	para "People who raise"
	line "and make #MON"
	cont "fight are called"
	cont "#MON trainers."
	done

_ViridianSchoolNotebookText2:
	text "Second page<...>"

	para "A healthy #MON"
	line "may be hard to"
	cont "catch, so weaken"
	cont "it first!"

	para "Poison, burns and"
	line "other damage are"
	cont "effective!"
	done

_ViridianSchoolNotebookText3:
	text "Third page<...>"

	para "#MON trainers"
	line "seek others to"
	cont "engage in #MON"
	cont "fights."

	para "Battles are"
	line "constantly fought"
	cont "at #MON GYMs."
	done

_ViridianSchoolNotebookText4:
	text "Fourth page<...>"

	para "The goal for"
	line "#MON trainers"
	cont "is to beat the "
	cont "top 8 #MON"
	cont "GYM LEADERs."

	para "Do so to earn the"
	line "right to face<...>"

	para "The ELITE FOUR of"
	line "#MON LEAGUE!"
	done


ViridianTrainerSchoolRB_MapEventHeader:
	db 0, 0
	; warps
	db 2
	warp_def $7, $2, 2, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $3, 2, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 3, $0, ViridianTrainerSchoolRBBlackboardScript
	signpost 4, 3, $0, ViridianTrainerSchoolRB_NotebookScript

	; people-events
	db 2
	person_event SPRITE_LASS, 9, 7, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianTrainerSchoolRBLassScript, -1
	person_event SPRITE_TEACHER, 5, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ViridianTrainerSchoolRBTeacherScript, -1
