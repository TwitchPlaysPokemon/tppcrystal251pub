MtMoonPokeCenter1FRB_MapScriptHeader: ; 0x694c7
	; trigger count
	db 0

	; callback count
	db 0
; 0x694c9

NurseScript_MtMoonPokeCenter1FRB: ; 0x694c9
	jumpstd pokecenternurse
; 0x694cc

FisherScript1_MtMoonPokeCenter1FRB:
	faceplayer
	loadfont
	checkevent EVENT_BOUGHT_MAGIKARP_FROM_SALESMAN
	iftrue .already_bought_karp
	writetext FisherText1_MtMoonPokeCenter1FRB
	yesorno
	iffalse .Refused
	checkmoney $0, 500
	if_equal 2, .NotEnoughMoney
	checkcode VAR_PARTYCOUNT
	if_not_equal $6, .give_karp
	checkcode VAR_BOXSPACE
	if_equal $0, .BoxAndPartyAreFull
.give_karp
	takemoney $0, 500
	playsound SFX_TRANSACTION
	waitsfx
	setevent EVENT_BOUGHT_MAGIKARP_FROM_SALESMAN
	writetext FisherText2_MtMoonPokeCenter1FRB
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MAGIKARP, 5, 0, 0
.already_bought_karp
	writetext FisherText3_MtMoonPokeCenter1FRB
	waitbutton
	closetext
	end

.Refused
	writetext FisherText4_MtMoonPokeCenter1FRB
	waitbutton
	closetext
	end

.BoxAndPartyAreFull
	writetext FisherText5_MtMoonPokeCenter1FRB
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext FisherText7_MtMoonPokeCenter1FRB
	waitbutton
	closetext
	end

FisherText1_MtMoonPokeCenter1FRB:
	text "Hey, you!"

	para "Listen up, this is"
	line "the deal of a"
	cont "lifetime here."

	para "What I have here"
	line "is a super-rare"
	cont "#MON!"

	para "And for only ¥500,"
	line "it can be yours!"

	para "Don't you want"
	line "this #MON?"
	done

FisherText2_MtMoonPokeCenter1FRB:
	text "Then here you go!"

	para "<PLAY_G> received"
	line "a MAGIKARP!"
	done

FisherText3_MtMoonPokeCenter1FRB:
	text "Well, that's it."
	line "No refunds."
	done

FisherText4_MtMoonPokeCenter1FRB:
	text "Are you sure?"
	line "You're missing out."
	done

FisherText5_MtMoonPokeCenter1FRB:
	text "WHAT?!"

	para "You have no room"
	line "in your party"
	cont "or PC box!"
	done

FisherText6_MtMoonPokeCenter1FRB:
	text "Your party is"
	line "full, so I sent"
	cont "it to the PC!"

	para "<PLAY_G> received"
	line "a MAGIKARP!"
	done

FisherText7_MtMoonPokeCenter1FRB:
	text "WHAT?!"

	para "You don't have"
	line "enough money!"
	done

MtMoonPokeCenter1FRB_GentlemanScript:
	faceplayer
	loadfont
	writetext MtMoonRBGentlemanText
	waitbutton
	closetext
	spriteface $5, UP
	end
	
MtMoonRBGentlemanText:
	text "TEAM ROCKET"
	line "attacks CERULEAN"
	cont "citizens<...>"
	
	para "TEAM ROCKET is"
	line "always in the"
	cont "news!"
	done
	
MtMoonPokeCenter1FRB_Youngster1Script:
	jumptextfaceplayer MtMoonRBYoungster1Text
	
MtMoonRBYoungster1Text:
	text "I've 6 # BALLs"
	line "set in my belt."
	
	para "At most, you can"
	line "carry 6 #MON."
	done
	
MtMoonPokeCenter1FRB_Youngster2Script:
	jumptextfaceplayer MtMoonRBYoungster2Text
	
MtMoonRBYoungster2Text:
	text "If you have too"
	line "many #MON, you"
	cont "should store them"
	cont "via PC!"
	done

MtMoonPokeCenter1FRB_LinkScript:
	jumpstd pokecenterlinkegk

MtMoonPokeCenter1FRB_MapEventHeader: ; 0x69935
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $5, 2, GROUP_ROUTE_3_RB, MAP_ROUTE_3_RB
	warp_def $7, $6, 2, GROUP_ROUTE_3_RB, MAP_ROUTE_3_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 7
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_MtMoonPokeCenter1FRB, -1
	person_event SPRITE_FISHER, 10, 16, $2, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FisherScript1_MtMoonPokeCenter1FRB, -1
	person_event SPRITE_PAPER, 6, 13, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_GENTLEMAN, 7, 13, $7, 0, 0, -1, -1, 0, 0, 0, MtMoonPokeCenter1FRB_GentlemanScript, -1
	person_event SPRITE_YOUNGSTER, 7, 10, $7, 0, 0, -1, -1, 0, 0, 0, MtMoonPokeCenter1FRB_Youngster1Script, -1
	person_event SPRITE_BUG_CATCHER, 8, 6, $9, 0, 0, -1, -1, 0, 0, 0, MtMoonPokeCenter1FRB_Youngster2Script, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, MtMoonPokeCenter1FRB_LinkScript, -1
; 0x6998b

