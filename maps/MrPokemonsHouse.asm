MrPokemonsHouse_MapScriptHeader: ; 0x196e47
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x196e51, $0000
	dw UnknownScript_0x196e55, $0000

	; callback count
	db 0
; 0x196e51

UnknownScript_0x196e51: ; 0x196e51
	priorityjump UnknownScript_0x196e56
	end
; 0x196e55

UnknownScript_0x196e55: ; 0x196e55
	end
; 0x196e56

UnknownScript_0x196e56: ; 0x196e56
	showemote $0, $2, 15
	spriteface $2, $0
	loadfont
	writetext UnknownText_0x196f66
	waitbutton
	closetext
	applymovement $0, MovementData_0x196f5a
	loadfont
	writetext UnknownText_0x196fa8
	buttonsound
	waitsfx
	giveitem MYSTERY_EGG, $1
	writetext UnknownText_0x196fd2
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	writetext UnknownText_0x196feb
	buttonsound
	spriteface $2, $3
	writetext UnknownText_0x197092
	buttonsound
	spriteface $2, $0
	spriteface $3, $2
	writetext UnknownText_0x1970b7
	waitbutton
	closetext
	jump UnknownScript_0x196ec9
; 0x196e97

GentlemanScript_0x196e97: ; 0x196e97
	faceplayer
	loadfont
	checkitem RED_SCALE
	iftrue UnknownScript_0x196eb0
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196eaa
	writetext UnknownText_0x197134
	waitbutton
	closetext
	end
; 0x196eaa

UnknownScript_0x196eaa: ; 0x196eaa
	writetext UnknownText_0x19714a
	waitbutton
	closetext
	end
; 0x196eb0

UnknownScript_0x196eb0: ; 0x196eb0
	writetext UnknownText_0x197476
	yesorno
	iffalse UnknownScript_0x196ec3
	checkevent EVENT_GOT_EXP_SHARE_FROM_SIMON
	iffalse .give_exp_share
	verbosegiveitem SLEEP_GUARD, 1
	iffalse UnknownScript_0x196ec7
	jump .take_red_scale
.give_exp_share
	verbosegiveitem EXP_SHARE, 1
	iffalse UnknownScript_0x196ec7
.take_red_scale
	takeitem RED_SCALE, 1
	jump UnknownScript_0x196eaa
; 0x196ec3

UnknownScript_0x196ec3: ; 0x196ec3
	writetext UnknownText_0x19750d
	waitbutton
UnknownScript_0x196ec7: ; 0x196ec7
	closetext
	end
; 0x196ec9

UnknownScript_0x196ec9: ; 0x196ec9
	playmusic MUSIC_PROF_OAK
	applymovement $3, MovementData_0x196f5d
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x197185
	buttonsound
	waitsfx
	special ProfOaksPCBoot
	buttonsound
	waitsfx
	writetext UnknownText_0x197185_2
	buttonsound
	waitsfx
	writetext UnknownText_0x1973cc
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_DEX_UPGRADED
	writetext UnknownText_0x1973de
	waitbutton
	closetext
	spriteface $0, $0
	applymovement $3, MovementData_0x196f61
	playsound SFX_EXIT_BUILDING
	disappear $3
	waitsfx
	special RestartMapMusic
	pause 15
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x1970ed
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	playmusic MUSIC_HEAL
	special Function1060a2
	special HealParty
	pause 60
	special Function8c0ab
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x197134
	waitbutton
	closetext
	setevent EVENT_SILVER_IN_NEW_BARK_TOWN
	setevent EVENT_NEIGHBOR_IN_YOUR_HOUSE_1F
	clearevent EVENT_NEIGHBOR_IN_HER_HOUSE
	dotrigger $1
	domaptrigger GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, $1
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $3
	specialphonecall $2
	clearevent EVENT_OFFICER_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x196f49
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x196f4d
	setevent EVENT_TOTODILE_POKEBALL
	end
; 0x196f49

UnknownScript_0x196f49: ; 0x196f49
	setevent EVENT_CHIKORITA_POKEBALL
	end
; 0x196f4d

UnknownScript_0x196f4d: ; 0x196f4d
	setevent EVENT_CYNDAQUIL_POKEBALL
	end
; 0x196f51

MapMrPokemonsHouseSignpost1Script: ; 0x196f51
	jumptext UnknownText_0x197543
; 0x196f54

MapMrPokemonsHouseSignpost3Script: ; 0x196f54
	jumptext UnknownText_0x197584
; 0x196f57

MapMrPokemonsHouseSignpost4Script: ; 0x196f57
	jumptext UnknownText_0x1975ac
; 0x196f5a

MovementData_0x196f5a: ; 0x196f5a
	step_right
	step_up
	step_end
; 0x196f5d

MovementData_0x196f5d: ; 0x196f5d
	step_down
	step_left
	step_left
	step_end
; 0x196f61

MovementData_0x196f61: ; 0x196f61
	step_down
	step_left
	turn_head_down
	db $3f ; movement
	step_end
; 0x196f66

UnknownText_0x196f66: ; 0x196f66
	text "Hello, hello! You"
	line "must be <PLAY_G>."

	para "PROF.ELM said that"
	line "you would visit."
	done
; 0x196fa8

UnknownText_0x196fa8: ; 0x196fa8
	text "This is what I"
	line "want PROF.ELM to"
	cont "examine."
	done
; 0x196fd2

UnknownText_0x196fd2: ; 0x196fd2
	text "<PLAYER> received"
	line "MYSTERY EGG."
	done
; 0x196feb

UnknownText_0x196feb: ; 0x196feb
	text "I know a couple"
	line "who run a #MON"
	cont "DAY-CARE service."

	para "They gave me that"
	line "EGG."

	para "I was intrigued,"
	line "so I sent mail to"
	cont "PROF.ELM."

	para "For #MON evolu-"
	line "tion, PROF.ELM is"
	cont "the authority."
	done
; 0x197092

UnknownText_0x197092: ; 0x197092
	text "Even PROF.OAK here"
	line "recognizes that."
	done
; 0x1970b7

UnknownText_0x1970b7: ; 0x1970b7
	text "If my assumption"
	line "is correct, PROF."
	cont "ELM will know it."
	done
; 0x1970ed

UnknownText_0x1970ed: ; 0x1970ed
	text "You are returning"
	line "to PROF.ELM?"

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done
; 0x197134

UnknownText_0x197134: ; 0x197134
	text "I'm depending on"
	line "you!"
	done
; 0x19714a

UnknownText_0x19714a: ; 0x19714a
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done
; 0x197185

UnknownText_0x197185: ; 0x197185
	text "OAK: Ah, <PLAY_G>!"
	line "What a surprise!"

	para "I heard what hap-"
	line "pened on the S.S."
	cont "ANNE."

	para "You're safe! That's"
	line "great news!"

	para "Ah! Let me check"
	line "your #DEX."
	done
; 0x1973cc
UnknownText_0x197185_2:
	text "Ah, yes, I almost"
	line "forgot."

	para "Here, it's the"
	line "latest upgrade for"
	cont "your #DEX!"

	para "I was working on"
	line "developing it"
	cont "since you set out."
	done

UnknownText_0x1973cc: ; 0x1973cc
	text "<PLAYER>'s #DEX"
	line "was upgraded!"
	done
; 0x1973de

UnknownText_0x1973de: ; 0x1973de
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"

	para "But I've stayed"
	line "too long."

	para "I have to get to"
	line "GOLDENROD for my"
	cont "usual radio show."

	para "<PLAY_G>, I'm"
	line "counting on you!"
	done
; 0x197476

UnknownText_0x197476: ; 0x197476
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it<...>"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "SLEEP GUARD I got"
	cont "from PROF.OAK."
	done
; 0x19750d

UnknownText_0x19750d: ; 0x19750d
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done
; 0x197543

UnknownText_0x197543: ; 0x197543
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles<...>"
	done
; 0x197584

UnknownText_0x197584: ; 0x197584
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done
; 0x1975ac

UnknownText_0x1975ac: ; 0x1975ac
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country<...>"
	done
; 0x1975ef

MrPokemonsHouse_MapEventHeader: ; 0x1975ef
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_30, MAP_ROUTE_30
	warp_def $7, $3, 2, GROUP_ROUTE_30, MAP_ROUTE_30

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 1, 0, $0, MapMrPokemonsHouseSignpost1Script
	signpost 1, 1, $0, MapMrPokemonsHouseSignpost1Script
	signpost 1, 6, $0, MapMrPokemonsHouseSignpost3Script
	signpost 1, 7, $0, MapMrPokemonsHouseSignpost3Script
	signpost 4, 6, $0, MapMrPokemonsHouseSignpost4Script

	; people-events
	db 2
	person_event SPRITE_GENTLEMAN, 9, 7, $9, 0, 0, -1, -1, 0, 0, 0, GentlemanScript_0x196e97, -1
	person_event SPRITE_OAK, 9, 10, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_OAK_IN_MR_POKEMONS_HOUSE
; 0x197632

