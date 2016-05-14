GoldenrodDeptStore5F_MapScriptHeader: ; 0x5608b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x56090
; 0x56090

UnknownScript_0x56090: ; 0x56090
	;checkcode VAR_WEEKDAY
	;if_equal SUNDAY, UnknownScript_0x56099
	;disappear $7
	appear $7
	return
; 0x56099

UnknownScript_0x56099: ; 0x56099
	;appear $7
	return
; 0x5609c

ClerkScript_0x5609c: ; 0x5609c
	faceplayer
	loadfont
	pokemart $0, $0009
	closetext
	end
	;checkevent EVENT_GOT_TM02_HEADBUTT
	;iftrue UnknownScript_0x560ad
	;checkevent EVENT_GOT_TM15_HYPER_BEAM
	;iftrue UnknownScript_0x560c2
	;jump UnknownScript_0x560b6
; 0x560ad

UnknownScript_0x560ad: ; 0x560ad
	;checkevent EVENT_GOT_TM15_HYPER_BEAM
	;iftrue UnknownScript_0x560c8
	;jump UnknownScript_0x560bc
; 0x560b6

UnknownScript_0x560b6: ; 0x560b6
	;pokemart $0, $0009
	;closetext
	;end
; 0x560bc

UnknownScript_0x560bc: ; 0x560bc
	;pokemart $0, $000a
	;closetext
	;end
; 0x560c2

UnknownScript_0x560c2: ; 0x560c2
	;pokemart $0, $000b
	;closetext
	;end
; 0x560c8

UnknownScript_0x560c8: ; 0x560c8
	;pokemart $0, $000c
	;closetext
	;end
; 0x560ce

ReceptionistScript_0x560ce: ; 0x560ce
	faceplayer
	loadfont
	pokemart $0, $000a
	closetext
	end


	;checkcode VAR_WEEKDAY
	;if_not_equal SUNDAY, UnknownScript_0x56112
	;checkflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	;iftrue UnknownScript_0x56112
	;special Function718d
	;writetext UnknownText_0x56143
	;buttonsound
	;if_greater_than $95, UnknownScript_0x560ee
	;if_greater_than $31, UnknownScript_0x560fd
	;jump UnknownScript_0x56103
; 0x560ee

;UnknownScript_0x560ee: ; 0x560ee
	;writetext UnknownText_0x5615a
	;buttonsound
	;verbosegiveitem TM_RETURN, 1
	;iffalse UnknownScript_0x56116
	;setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	;closetext
	;end
; 0x560fd

;UnknownScript_0x560fd: ; 0x560fd
	;writetext UnknownText_0x561a6
	;waitbutton
	;closetext
	;end
; 0x56103

;UnknownScript_0x56103: ; 0x56103
	;writetext UnknownText_0x561d8
	;buttonsound
	;verbosegiveitem TM_ROCK_POLISH, 1
	;iffalse UnknownScript_0x56116
	;setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	;closetext
	;end
; 0x56112

;UnknownScript_0x56112: ; 0x56112
	;writetext UnknownText_0x56202
	;waitbutton
UnknownScript_0x56116: ; 0x56116
	closetext
	end
; 0x56118

TwinScript_0x56118: ; 0x56118
	faceplayer
	loadfont
	special SpecialGameboyCheck
	if_not_equal $2, UnknownScript_0x5612a
	writetext UnknownText_0x56241
	waitbutton
	closetext
	special Function1050b9
	end
; 0x5612a

UnknownScript_0x5612a: ; 0x5612a
	writetext UnknownText_0x56279
	waitbutton
	closetext
	end
; 0x56130

LassScript_0x56130: ; 0x56130
	jumptextfaceplayer UnknownText_0x562ad
; 0x56133

CooltrainerMScript_0x56133: ; 0x56133
	faceplayer
	loadfont
	trade $0
	waitbutton
	closetext
	end
; 0x5613a

PokefanMScript_0x5613a: ; 0x5613a
	jumptextfaceplayer UnknownText_0x562f3
; 0x5613d

MapGoldenrodDeptStore5FSignpost0Script: ; 0x5613d
	jumptext UnknownText_0x56364
; 0x56140

MapGoldenrodDeptStore5FSignpost1Script: ; 0x56140
	jumpstd elevatorbutton
; 0x56143

UnknownText_0x56143: ; 0x56143
	;text "Hello. Oh, your"
	;line "#MON<...>"
	;done
; 0x5615a

UnknownText_0x5615a: ; 0x5615a
	;text "It's very attached"
	;line "to you."

	;para "This move should"
	;line "be perfect for a"
	;cont "pair like you."
	;done
; 0x561a6

UnknownText_0x561a6: ; 0x561a6
	;text "It's adorable!"

	;para "You should teach"
	;line "it good TM moves."
	;done
; 0x561d8

UnknownText_0x561d8: ; 0x561d8
	;text "It looks evil. How"
	;line "about this TM for"
	;cont "it?"
	;done
; 0x56202

UnknownText_0x56202: ; 0x56202
	;text "There are sure to"
	;line "be TMs that are"

	;para "just perfect for"
	;line "your #MON."
	;done
; 0x56241

UnknownText_0x56241: ; 0x56241
	text "MYSTERY GIFT."

	para "With just a"
	line "little beep, you"
	cont "get a gift."
	done
; 0x56279

UnknownText_0x56279: ; 0x56279
	text "The MYSTERY GIFT"
	line "option requires a"
	cont "Game Boy Color."
	done
; 0x562ad

UnknownText_0x562ad: ; 0x562ad
	text "They sell hold"
	line "items here now!"

	para "Some can even"
	line "evolve #MON."
	done
; 0x562f3

UnknownText_0x562f3: ; 0x562f3
	text "You can't rename a"
	line "#MON you get in"
	cont "a trade."

	para "The name is a re-"
	line "flection of the"

	para "original trainer's"
	line "feelings for it."
	done
; 0x56364

UnknownText_0x56364: ; 0x56364
	text "Customize Your"
	line "#MON"

	para "5F TACTICS CORNER"
	done
; 0x56386

GoldenrodDeptStore5F_MapEventHeader: ; 0x56386
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $f, 1, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore5FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore5FSignpost1Script

	; people-events
	db 6
	person_event SPRITE_CLERK, 9, 12, $7, 0, 0, -1, -1, 0, 0, 0, ClerkScript_0x5609c, -1
	person_event SPRITE_LASS, 10, 7, $2, 1, 1, -1, -1, 0, 0, 0, LassScript_0x56130, -1
	person_event SPRITE_COOLTRAINER_M, 7, 10, $3, 0, 0, -1, -1, 0, 0, 0, CooltrainerMScript_0x56133, -1
	person_event SPRITE_POKEFAN_M, 9, 17, $2, 2, 2, -1, -1, 0, 0, 0, PokefanMScript_0x5613a, -1
	person_event SPRITE_TWIN, 5, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TwinScript_0x56118, -1
	person_event SPRITE_RECEPTIONIST, 9, 11, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ReceptionistScript_0x560ce, EVENT_RECEPTIONIST_ON_GOLDENROD_DEPT_STORE_5F
; 0x563f3

