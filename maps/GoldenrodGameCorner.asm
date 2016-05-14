GoldenrodGameCorner_MapScriptHeader: ; 0x56bf4
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x56bf9
; 0x56bf9

UnknownScript_0x56bf9: ; 0x56bf9 looks like the move tutor appearance check
	checkevent EVENT_CLEARED_RADIO_TOWER
	iffalse UnknownScript_0x56c19
	checkitem COIN_CASE
	iffalse UnknownScript_0x56c0e
		;checkcode VAR_WEEKDAY
		;if_equal WEDNESDAY, UnknownScript_0x56c11
		;if_equal SATURDAY, UnknownScript_0x56c11
UnknownScript_0x56c0e: ; 0x56c0e
	appear $d
	return
; 0x56c11

UnknownScript_0x56c11: ; 0x56c11
		;checkflag ENGINE_5E
		;iftrue UnknownScript_0x56c19
	disappear $d
UnknownScript_0x56c19: ;0x56c19
	return
; 0x56c1a

PokefanMScript_0x56c1a: ; 0x56c1a
	faceplayer
	loadfont
	writetext UnknownText_0x5718a
	waitbutton
	closetext
	spriteface $d, $3
	end
; 0x56c25

ClerkScript_0x56c25: ; 0x56c25
	jumpstd gamecornercoinvendor
; 0x56c28

ReceptionistScript_0x56c28: ; 0x56c28
	faceplayer
	loadfont
	writetext UnknownText_0x56e50
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
	writetext UnknownText_0x56e8b
UnknownScript_0x56c36: ; 056c36
	special Function24b25
	loadmenudata MenuDataHeader_0x56cc9
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x56c4d
	if_equal $2, UnknownScript_0x56c69
	if_equal $3, UnknownScript_0x56c85
	jump UnknownScript_0x56cbd
; 0x56c4d

UnknownScript_0x56c4d: ; 0x56c4d
	checkcoins 3000
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_ZAP_CANNON, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_ZAP_CANNON, $1
	iffalse UnknownScript_0x56cb7
	takecoins 3000
	jump UnknownScript_0x56ca6
; 0x56c69

UnknownScript_0x56c69: ; 0x56c69
	checkcoins 3000
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_DOUBLE_TEAM, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_DOUBLE_TEAM, $1
	iffalse UnknownScript_0x56cb7
	takecoins 3000
	jump UnknownScript_0x56ca6
; 0x56c85

UnknownScript_0x56c85: ; 0x56c85
	checkcoins 999
	if_equal $2, UnknownScript_0x56cb1
	itemtotext UP_GRADE, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem UP_GRADE, $1
	iffalse UnknownScript_0x56cb7
	takecoins 999
	jump UnknownScript_0x56ca6
; 0x56ca1

UnknownScript_0x56ca1: ; 0x56ca1
	writetext UnknownText_0x56ea8
	yesorno
	end
; 0x56ca6

UnknownScript_0x56ca6: ; 0x56ca6
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	jump UnknownScript_0x56c36
; 0x56cb1

UnknownScript_0x56cb1: ; 0x56cb1
	writetext UnknownText_0x56ecb
	waitbutton
	closetext
	end
; 0x56cb7

UnknownScript_0x56cb7: ; 0x56cb7
	writetext UnknownText_0x56ee8
	waitbutton
	closetext
	end
; 0x56cbd

UnknownScript_0x56cbd: ; 0x56cbd
	writetext UnknownText_0x56f09
	waitbutton
	closetext
	end
; 0x56cc3

UnknownScript_0x56cc3: ; 0x56cc3
	writetext UnknownText_0x56f35
	waitbutton
	closetext
	end
; 0x56cc9


MenuDataHeader_0x56cc9: ; 0x56cc9
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x56cd1
	db 1 ; default option
; 0x56cd1

MenuData2_0x56cd1: ; 0x56cd1
	db $80 ; flags
	db 4 ; items
	db "TM07    3000@"
	db "TM32    3000@"
	db "UP-GRADE 999@"
	db "CANCEL@"
; 0x56d01


ReceptionistScript_0x56d01: ; 0x56d01
	faceplayer
	loadfont
	writetext UnknownText_0x56e50
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
UnknownScript_0x56d0c: ; 0x56d0c
	writetext UnknownText_0x56e8b
	special Function24b25
	loadmenudata MenuDataHeader_0x56db0
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x56d26
	if_equal $2, UnknownScript_0x56d54
	if_equal $3, UnknownScript_0x56d82
	jump UnknownScript_0x56cbd
; 0x56d26

UnknownScript_0x56d26: ; 0x56d26 NEEDS NEW MONS
	checkcoins 2000
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, GCSlot1PC  ;if party is ful, can't carry more
	pokenamemem PORYGON, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte PORYGON
	special Functionc230
	givepoke PORYGON, 30, 0, 0
	takecoins 2000
	jump UnknownScript_0x56d0c

GCSlot1PC:
	checkcode VAR_BOXSPACE ;else  check to make sure there is space in the box
	if_equal $0, UnknownScript_0x56cb7
	pokenamemem PORYGON, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext GCSentToPCText
	waitbutton
	writebyte PORYGON
	special Functionc230
	givepoke PORYGON, 30, 0, 0
	takecoins 2000
	jump UnknownScript_0x56d0c
; 0x56d54

UnknownScript_0x56d54: ; 0x56d54
	checkcoins 2000
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, GCSlot2PC
	pokenamemem LAPRAS, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte LAPRAS
	special Functionc230
	givepoke LAPRAS, 30, 0, 0
	takecoins 2000
	jump UnknownScript_0x56d0c
; 0x56d82

GCSlot2PC:
	checkcode VAR_BOXSPACE ;else  check to make sure there is space in the box
	if_equal $0, UnknownScript_0x56cb7
	pokenamemem LAPRAS, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext GCSentToPCText
	waitbutton
	writebyte LAPRAS
	special Functionc230
	givepoke LAPRAS, 30, 0, 0
	takecoins 2000
	jump UnknownScript_0x56d0c

UnknownScript_0x56d82: ; 0x56d82
	checkcoins 500
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, GCSlot3PC
	pokenamemem GRIMER, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte GRIMER
	special Functionc230
	givepoke GRIMER, 30, 0, 0
	takecoins 500
	jump UnknownScript_0x56d0c
; 0x56db0

GCSlot3PC:
	checkcode VAR_BOXSPACE ;else  check to make sure there is space in the box
	if_equal $0, UnknownScript_0x56cb7
	pokenamemem GRIMER, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitsfx
	playsound SFX_TRANSACTION
	writetext GCSentToPCText
	waitbutton
	writebyte GRIMER
	special Functionc230
	givepoke GRIMER, 30, 0, 0
	takecoins 500
	jump UnknownScript_0x56d0c

MenuDataHeader_0x56db0: ; 0x56db0
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw MenuData2_0x56db8
	db 1 ; default option
; 0x56db8

MenuData2_0x56db8: ; 0x56db8
	db $80 ; flags
	db 4 ; items
	db "PORYGON    2000@"
	db "LAPRAS     2000@"
	db "GRIMER      500@"
	db "CANCEL@"
; 0x56df1


PharmacistScript_0x56df1: ; 0x56df1
	faceplayer
	loadfont
	writetext UnknownText_0x56f55
	waitbutton
	closetext
	spriteface $fe, $2
	end
; 0x56dfc

GoldenrodVoltorbFlipGuyScript:
	faceplayer
	loadfont
	writetext GoldenrodVoltorbFlipGuyText
	waitbutton
	closetext
	spriteface $e, $3
	end

PokefanMScript_0x56dfc: ; 0x56dfc
	faceplayer
	loadfont
	writetext UnknownText_0x56f9e
	waitbutton
	closetext
	spriteface $7, $3
	end
; 0x56e07

CooltrainerMScript_0x56e07: ; 0x56e07
	faceplayer
	loadfont
	writetext UnknownText_0x56ff4
	waitbutton
	closetext
	spriteface $8, $2
	end
; 0x56e12

CooltrainerMBrokenScript: ; 0x56e07
	faceplayer
	loadfont
	writetext CooltrainerNotBettingText
	waitbutton
	closetext
	spriteface 15, $2
	end
; 0x56e12

PokefanFScript_0x56e12: ; 0x56e12
	faceplayer
	loadfont
	writetext UnknownText_0x5702b
	waitbutton
	closetext
	spriteface $9, $3
	end
; 0x56e1d

CooltrainerFScript_0x56e1d: ; 0x56e1d
	jumptextfaceplayer UnknownText_0x57097
; 0x56e20

GentlemanScript_0x56e20: ; 0x56e20
	faceplayer
	loadfont
	writetext UnknownText_0x570b1
	waitbutton
	closetext
	spriteface $b, $3
	end
; 0x56e2b

PokefanMScript_0x56e2b: ; 0x56e2b
	jumptextfaceplayer UnknownText_0x5710d
; 0x56e2e

MapGoldenrodGameCornerSignpost30Script: ; 0x56e2e
	loadfont
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins 3
	if_equal $2, .NotEnoughCoins
	writetext GoldenrodVoltorbFlipText
	waitbutton
	closetext
	refreshscreen $0
	special Special_VoltorbFlip
	closetext
	if_equal 10, .ReachedLevel10
	end
; 0x56e31
.NotEnoughCoins
	writetext GoldenrodVoltorbFlipNotEnoughCoinsText
	waitbutton
	closetext
	end
.NoCoinCase
	writetext GoldenrodVoltorbFlipNoCoinCaseText
	waitbutton
	closetext
	end

.ReachedLevel10
	loadfont
	writetext GoldenrodVoltorbFlipReachedHighestLevel
	waitbutton
	verbosegiveitem MASTER_BALL, 1
	iffalse .nope
	writetext GoldenrodVoltorbFlipReceivedMasterBallText
.nope
	waitbutton
	closetext
	end

MapGoldenrodGameCornerSignpost17Script: ; 0x56e31
	random $6
	if_equal $0, MapGoldenrodGameCornerSignpost7Script
	refreshscreen $0
	writebyte $0
	special Functionc373
	closetext
	end
; 0x56e40


MapGoldenrodGameCornerSignpost7Script: ; 0x56e40
	refreshscreen $0
	writebyte $1
	special Functionc373
	closetext
	end
; 0x56e49

MapGoldenrodGameCornerSignpost29Script: ; 0x56e49
	refreshscreen $0
	special Functionc380
	closetext
	end
; 0x56e50

UnknownText_0x56e50: ; 0x56e50
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done
; 0x56e8b

UnknownText_0x56e8b: ; 0x56e8b
	text "Which prize would"
	line "you like?"
	done
; 0x56ea8

UnknownText_0x56ea8: ; 0x56ea8
	text_from_ram StringBuffer3
	text "."
	line "Is that right?"
	done
; 0x56ebd

UnknownText_0x56ebd: ; 0x56ebd
	text "Here you go!"
	done
; 0x56ecb

GCSentToPCText:
	text "We have sent the"
	line "#MON to BILL's"
	cont "PC for you."
	done

UnknownText_0x56ecb: ; 0x56ecb
	text "Sorry! You need"
	line "more coins."
	done
; 0x56ee8

UnknownText_0x56ee8: ; 0x56ee8
	text "Sorry. You can't"
	line "carry any more."
	done
; 0x56f09

UnknownText_0x56f09: ; 0x56f09
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done
; 0x56f35

UnknownText_0x56f35: ; 0x56f35
	text "Oh? You don't have"
	line "a COIN CASE."
	done
; 0x56f55

UnknownText_0x56f55: ; 0x56f55
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done
; 0x56f9e

UnknownText_0x56f9e: ; 0x56f9e
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done
; 0x56ff4

UnknownText_0x56ff4: ; 0x56ff4
	text "I just got 777"
	line "on the slots!"

	para "I'm going to"
	line "share the payout"

	para "with all my"
	line "friends!"
	done
; 0x5702b

UnknownText_0x5702b: ; 0x5702b
	text "Card flip<...>"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done
; 0x57097

UnknownText_0x57097: ; 0x57097
	text "I won't quit until"
	line "I win!"
	done
; 0x570b1

UnknownText_0x570b1: ; 0x570b1
	text "I taught ZAP"
	line "CANNON to my"
	cont "#MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done
; 0x5710d

UnknownText_0x5710d: ; 0x5710d
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping<...>"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done
; 0x5718a

UnknownText_0x5718a: ; 0x5718a
	text "The floor is al-"
	line "ways covered in"

	para "salt for some"
	line "reason<...>"
	done
; 0x571af

GoldenrodVoltorbFlipGuyText:
	text "I'm trying out a"
	line "fun new game here."

	para "Sit across from me"
	line "to play!"
	done

GoldenrodVoltorbFlipText:
	text "Let's play some"
	line "VOLTORB FLIP!"
	done

GoldenrodVoltorbFlipNotEnoughCoinsText:
	text "You need 3 coins"
	line "to play this game."
	done

GoldenrodVoltorbFlipReachedHighestLevel:
	text "Splendid! Marve-"
	line "lous!"

	para "You've reached the"
	line "highest possible"

	para "level in VOLTORB"
	line "FLIP!"

	para "This deserves a"
	line "special reward."

	para "Here, take this."
	done

GoldenrodVoltorbFlipReceivedMasterBallText:
	text "Come back and play"
	line "again any time!"
	done

GoldenrodVoltorbFlipNoCoinCaseText:
	text "You need to have a"
	line "COIN CASE to play."
	done

CooltrainerNotBettingText: ; 0x56ff4
	text "Aww man<...>"

	para "This is my"
	line "favorite machine!"

	para "I really wanted to"
	line "use it<...>"
	
	para "But betting isn't"
	line "available right"
	cont "now<...>"
	done
GoldenrodGameCorner_MapEventHeader: ; 0x571db
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $2, 10, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $d, $3, 10, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 31
	signpost 6, 6, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 6, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 8, 6, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 6, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 6, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 6, $3, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 7, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 7, $0, MapGoldenrodGameCornerSignpost7Script
	signpost 8, 7, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 7, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 7, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 7, $4, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 12, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 12, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 8, 12, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 12, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 12, $0, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 12, $3, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 13, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 7, 13, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 8, 13, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 9, 13, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 10, 13, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 11, 13, $4, MapGoldenrodGameCornerSignpost29Script
	signpost 6, 18, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 7, 18, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 8, 18, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 9, 18, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 10, 18, $0, MapGoldenrodGameCornerSignpost29Script
	signpost 11, 18, $3, MapGoldenrodGameCornerSignpost29Script
	signpost 1, 12, $4, MapGoldenrodGameCornerSignpost30Script

	; people-events
	db 14
	person_event SPRITE_CLERK, 6, 7, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ClerkScript_0x56c25, -1
	person_event SPRITE_RECEPTIONIST, 6, 20, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ReceptionistScript_0x56c28, -1
	person_event SPRITE_RECEPTIONIST, 6, 22, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ReceptionistScript_0x56d01, -1
	person_event SPRITE_PHARMACIST, 11, 12, $8, 0, 0, -1, 2, 8 + PAL_OW_BLUE, 0, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_PHARMACIST, 11, 12, $8, 0, 0, -1, 4, 8 + PAL_OW_BLUE, 0, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_POKEFAN_M, 14, 15, $9, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PokefanMScript_0x56dfc, -1
	person_event SPRITE_COOLTRAINER_M, 12, 18, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CooltrainerMScript_0x56e07, -1
	person_event SPRITE_POKEFAN_F, 10, 21, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanFScript_0x56e12, -1
	person_event SPRITE_COOLTRAINER_F, 7, 14, $2, 1, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CooltrainerFScript_0x56e1d, -1
	person_event SPRITE_GENTLEMAN, 14, 9, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GentlemanScript_0x56e20, -1
	person_event SPRITE_POKEFAN_M, 13, 6, $2, 1, 1, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PokefanMScript_0x56e2b, -1
	person_event SPRITE_POKEFAN_M, 14, 21, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x56c1a, EVENT_POKEFAN_M_IN_GOLDENROD_GAME_CORNER
	person_event SPRITE_GENTLEMAN, 5, 14, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, GoldenrodVoltorbFlipGuyScript, -1
	person_event SPRITE_COOLTRAINER_M, 15, 18, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerMBrokenScript, -1
; 0x57322



