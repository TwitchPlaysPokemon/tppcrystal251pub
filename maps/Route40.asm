Route40_MapScriptHeader: ; 0x1a6160
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, MonicaCallback

MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_SPRITE_SET_INIT
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .MonicaAppears
	disappear $a
	return

.MonicaAppears
	appear $a
	return

TrainerSwimmerfElaine: ; 0x1a6174
	; bit/flag number
	dw $3e8

	; trainer group && trainer id
	db SWIMMERF, ELAINE

	; text when seen
	dw SwimmerfElaineSeenText

	; text when trainer beaten
	dw SwimmerfElaineBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfElaineScript
; 0x1a6180

SwimmerfElaineScript: ; 0x1a6180
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a637b
	waitbutton
	closetext
	end
; 0x1a6188

TrainerSwimmerfPaula: ; 0x1a6188
	; bit/flag number
	dw $3e9

	; trainer group && trainer id
	db SWIMMERF, PAULA

	; text when seen
	dw SwimmerfPaulaSeenText

	; text when trainer beaten
	dw SwimmerfPaulaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfPaulaScript
; 0x1a6194

SwimmerfPaulaScript: ; 0x1a6194
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a63f5
	waitbutton
	closetext
	end
; 0x1a619c

TrainerSwimmermSimon: ; 0x1a619c
	; bit/flag number
	dw $595

	; trainer group && trainer id
	db SWIMMERM, SIMON

	; text when seen
	dw SwimmermSimonSeenText

	; text when trainer beaten
	dw SwimmermSimonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermSimonScript
; 0x1a61a8

SwimmermSimonScript: ; 0x1a61a8
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6282
	waitbutton
	closetext
	end
; 0x1a61b0

TrainerSwimmermRandall: ; 0x1a61b0
	; bit/flag number
	dw $596

	; trainer group && trainer id
	db SWIMMERM, RANDALL

	; text when seen
	dw SwimmermRandallSeenText

	; text when trainer beaten
	dw SwimmermRandallBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermRandallScript
; 0x1a61bc

SwimmermRandallScript: ; 0x1a61bc
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a62fa
	waitbutton
	closetext
	end
; 0x1a61c4

LassScript_0x1a61c4: ; 0x1a61c4
	jumptextfaceplayer UnknownText_0x1a6429
; 0x1a61c7

PokefanMScript_0x1a61c7: ; 0x1a61c7
	special Function10630f
	iftrue UnknownScript_0x1a61d0
	jumptextfaceplayer UnknownText_0x1a646a
; 0x1a61d0

UnknownScript_0x1a61d0: ; 0x1a61d0
	jumptextfaceplayer UnknownText_0x1a649b
; 0x1a61d3

LassScript_0x1a61d3: ; 0x1a61d3
	jumptextfaceplayer UnknownText_0x1a64e6
; 0x1a61d6

StandingYoungsterScript_0x1a61d6: ; 0x1a61d6
	jumptextfaceplayer UnknownText_0x1a6564
; 0x1a61d9

MonicaScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue MonicaMondayScript
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, MonicaNotMondayScript
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK, 1
	iffalse MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

MonicaMondayScript:
	writetext MonicaMondayText
	waitbutton
MonicaDoneScript:
	closetext
	end

MonicaNotMondayScript:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

MapRoute40Signpost0Script: ; 0x1a6213
	jumptext UnknownText_0x1a6767
; 0x1a6216

RockScript_0x1a6216: ; 0x1a6216
	jumpstd smashrock
; 0x1a6219

MapRoute40SignpostItem1: ; 0x1a6219
	dw $00ab
	db HYPER_POTION
; 0x1a621c

MovementData_0x1a621c: ; 0x1a621c
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a6224

MovementData_0x1a6224: ; 0x1a6224
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a622a

MovementData_0x1a622a: ; 0x1a622a
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a622f

SwimmermSimonSeenText: ; 0x1a622f
	text "A famous burglar"
	line "shares my name!"

	para "I'm sweet, though."
	done
; 0x1a626e

SwimmermSimonBeatenText: ; 0x1a626e
	text "OK! Uncle! I give!"
	done
; 0x1a6282

UnknownText_0x1a6282: ; 0x1a6282
	text "A BURGLAR named"
	line "SIMON has been"

	para "making headlines"
	line "in JOHTO and"
	cont "KANTO."

	para "The POLICE think"
	line "he may have had an"
	cont "accomplice, too."

	para "I wonder where his"
	line "partner went."
	done
; 0x1a62b4

SwimmermRandallSeenText: ; 0x1a62b4
	text "I work as a mover!"

	para "I need a break."

	para "Want a battle"
	line "by this cliff?"
	done
; 0x1a62ea

SwimmermRandallBeatenText: ; 0x1a62ea
	text "Uh-oh. I lost<...>"
	done
; 0x1a62fa

UnknownText_0x1a62fa: ; 0x1a62fa
	text "I put furniture"
	line "on my LAPRAS"
	cont "and my #MON"
	cont "holds on to them!"
	done
; 0x1a632d

SwimmerfElaineSeenText: ; 0x1a632d
	text "Are you going to"
	line "CIANWOOD?"

	para "How about a quick"
	line "battle first?"
	done
; 0x1a6369

SwimmerfElaineBeatenText: ; 0x1a6369
	text "I lost that one!"
	done
; 0x1a637b

UnknownText_0x1a637b: ; 0x1a637b
	text "I'd say I'm a bet-"
	line "ter swimmer than"
	cont "you. Yeah!"
	done
; 0x1a63a9

SwimmerfPaulaSeenText: ; 0x1a63a9
	text "No inner tube for"
	line "me."

	para "I'm hanging on to"
	line "a sea #MON!"
	done
; 0x1a63dd

SwimmerfPaulaBeatenText: ; 0x1a63dd
	text "Ooh, I'm feeling"
	line "dizzy!"
	done
; 0x1a63f5

UnknownText_0x1a63f5: ; 0x1a63f5
	text "While I float like"
	line "this, the waves"
	cont "carry me along."
	done
; 0x1a6429

UnknownText_0x1a6429: ; 0x1a6429
	text "Although you can't"
	line "see it from here,"

	para "CIANWOOD is across"
	line "the sea."
	done
; 0x1a646a

UnknownText_0x1a646a: ; 0x1a646a
	text "Hm! There's a big"
	line "building up ahead!"

	para "What is it?"
	done
; 0x1a649b

UnknownText_0x1a649b: ; 0x1a649b
	text "Hm! Look at all"
	line "those serious-"
	cont "looking trainers"
	cont "streaming in."

	para "What? What?"
	done
; 0x1a64e6

UnknownText_0x1a64e6: ; 0x1a64e6
	text "I came to OLIVINE"
	line "by ship to see the"

	para "sights and soak up"
	line "the atmosphere."

	para "Being a port, it"
	line "feels so different"
	cont "from a big city."
	done
; 0x1a6564

UnknownText_0x1a6564: ; 0x1a6564
	text "Have you gone to"
	line "the BATTLE TOWER?"

	para "I think a lot of"
	line "tough trainers"

	para "have gathered"
	line "there already."

	para "But since you have"
	line "so many BADGES,"

	para "you shouldn't do"
	line "badly at all."
	done
; 0x1a6606

MeetMonicaText:
	text "MONICA: Glad to"
	line "meet you. I'm"

	para "MONICA of Monday."
	done

MonicaGivesGiftText:
	text "As a token of our"
	line "friendship, I have"
	cont "a gift for you!"
	done

MonicaGaveGiftText:
	text "MONICA: It's an"
	line "item that raises"

	para "the power of fly-"
	line "ing-type moves."

	para "You should equip a"
	line "bird #MON with"
	cont "that item."
	done

MonicaMondayText:
	text "MONICA: My broth-"
	line "ers and sisters"

	para "are all over the"
	line "place."

	para "See if you could"
	line "find them all!"
	done

MonicaNotMondayText:
	text "MONICA: I don't"
	line "think today is"
	cont "Monday. How sad<...>"
	done

UnknownText_0x1a6767: ; 0x1a6767
	text "ROUTE 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done
; 0x1a678e

Route40_MapEventHeader: ; 0x1a678e
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $9, 1, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 10, 14, $0, MapRoute40Signpost0Script
	signpost 8, 7, $7, MapRoute40SignpostItem1

	; people-events
	db 12
	person_event SPRITE_OLIVINE_RIVAL, 19, 18, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 4, TrainerSwimmermSimon, -1
	person_event SPRITE_OLIVINE_RIVAL, 34, 22, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 5, TrainerSwimmermRandall, -1
	person_event SPRITE_SWIMMER_GIRL, 23, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 4, TrainerSwimmerfElaine, -1
	person_event SPRITE_SWIMMER_GIRL, 29, 14, $1f, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerSwimmerfPaula, -1
	person_event SPRITE_ROCK, 15, 11, $18, 0, 0, -1, -1, 0, 0, 0, RockScript_0x1a6216, -1
	person_event SPRITE_ROCK, 13, 10, $18, 0, 0, -1, -1, 0, 0, 0, RockScript_0x1a6216, -1
	person_event SPRITE_ROCK, 12, 11, $18, 0, 0, -1, -1, 0, 0, 0, RockScript_0x1a6216, -1
	person_event SPRITE_LASS, 17, 15, $6, 0, 0, -1, -1, 0, 0, 0, LassScript_0x1a61c4, -1
	person_event SPRITE_BUENA, 14, 12, $3, 0, 0, -1, -1, 0, 0, 0, MonicaScript, EVENT_MONICA_OF_MONDAY
	person_event SPRITE_POKEFAN_M, 10, 11, $9, 0, 0, -1, -1, 0, 0, 0, PokefanMScript_0x1a61c7, -1
	person_event SPRITE_LASS, 8, 17, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, LassScript_0x1a61d3, -1
	person_event SPRITE_STANDING_YOUNGSTER, 13, 16, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, StandingYoungsterScript_0x1a61d6, EVENT_BATTLE_TOWER_SPRITE_SET_INIT
