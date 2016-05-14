CherrygroveCity_MapScriptHeader: ; 0x19c000
	; trigger count
	db 4

	; triggers
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0
	dw .Trigger3, 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19c00f
; 0x19c00d

.Trigger0: ; 0x19c00d
	end
; 0x19c00e

.Trigger1: ; 0x19c00e
	end

.Trigger2:
	priorityjump Cherrygrove_WashedUpOnShore
	end

.Trigger3:
	end

Cherrygrove_WashedUpOnShore:
	disappear $2
	moveperson $2, 14, 6
	appear $2
	applymovement $2, Movement_GuideGentWalksUpToPlayerAfterShipwreck
	spriteface $0, UP
	loadfont
	writetext Text_GuideGentExplainsWhatHappened
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow $2, $0
	applymovement $2, Movement_GuideGentTakesPlayerToPokecenter
	stopfollow
	pause 60
	spriteface $2, LEFT
	spriteface $0, RIGHT
	loadfont
	writetext Text_GuideGentForcesPlayerToHealParty
	waitbutton
	closetext
	special RestartMapMusic
	applymovement $2, Movement_GuideGentResetPosition
	dotrigger 3
	moveperson $2, 32, 6
	end

UnknownScript_0x19c00f: ; 0x19c00f
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return
; 0x19c013

GrampsScript_0x19c013: ; 0x19c013
	faceplayer
	loadfont
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .first_landed
	writetext UnknownText_0x19c1e3
	yesorno
	iffalse UnknownScript_0x19c0a4
	writetext UnknownText_0x19c26f
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow $2, $0
	applymovement $2, MovementData_0x19c195
	loadfont
	writetext UnknownText_0x19c285
	waitbutton
	closetext
	applymovement $2, MovementData_0x19c19b
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x19c304
	waitbutton
	closetext
	applymovement $2, MovementData_0x19c1a3
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x19c359
	waitbutton
	closetext
	applymovement $2, MovementData_0x19c1ac
	spriteface $0, $2
	loadfont
	writetext UnknownText_0x19c3a7
	waitbutton
	closetext
	applymovement $2, MovementData_0x19c1b6
	spriteface $0, $1
	pause 60
	spriteface $2, $2
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x19c3ec
	buttonsound
	checkflag ENGINE_MAP_CARD
	iftrue .alreadyhavemapcard
	stringtotext .mapcardname, $1
	scall .UnknownScript_0x19c097
	setflag ENGINE_MAP_CARD
	writetext UnknownText_0x19c438
	buttonsound
	writetext UnknownText_0x19c451
	jump .finish
.alreadyhavemapcard
	writetext Text_AlreadyHaveMapCard
.finish
	waitbutton
	closetext
	stopfollow
	showemote $0, $2, 15
	pause 15
	loadfont
	writetext Text_GuideGentHasRunningShoes2
	buttonsound
	stringtotext .runningshoesname, $1
	scall .UnknownScript_0x19c097
	writetext Text_GuideGentHasRunningShoes3
	waitbutton
	closetext
	special RestartMapMusic
	spriteface $0, $1
	applymovement $2, MovementData_0x19c1cb
	playsound SFX_ENTER_DOOR
	disappear $2
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.UnknownScript_0x19c097 ; 0x19c097
	jumpstd receiveitem
	end

.mapcardname ; 0x19c09b
	db "MAP CARD@"

.runningshoesname
	db "RUNNING SHOES@"
; 0x19c0a4
.first_landed
	checkevent EVENT_HEALED_IN_CHERRYGROVE
	iffalse .healyourpokemon
	writetext GuideGentDirectsPlayerToNewBark
	waitbutton
	closetext
	dotrigger 0
	end

.healyourpokemon
	writetext Text_PleaseHealYourPokemon
	waitbutton
	closetext
	end

UnknownScript_0x19c0a4: ; 0x19c0a4
	writetext UnknownText_0x19c49f
	waitbutton
	closetext
	end
; 0x19c0aa

UnknownScript_0x19c0aa: ; 0x19c0aa
	moveperson $3, $27, $7
; 0x19c0ae

UnknownScript_0x19c0ae: ; 0x19c0ae
	spriteface $0, $3
	showemote $0, $0, 15
	special Functionc48f
	pause 15
	appear $3
	applymovement $3, MovementData_0x19c1ce
	spriteface $0, $3
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x19c4e2
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x19c0ee
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x19c104
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_3
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	jump UnknownScript_0x19c126
; 0x19c0ee

UnknownScript_0x19c0ee: ; 0x19c0ee
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	jump UnknownScript_0x19c126
; 0x19c104

UnknownScript_0x19c104: ; 0x19c104
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_2
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	jump UnknownScript_0x19c126
; 0x19c11a

UnknownScript_0x19c11a: ; 0x19c11a
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x19c608
	waitbutton
	closetext
	jump UnknownScript_0x19c12f
; 0x19c126

UnknownScript_0x19c126: ; 0x19c126
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x19c59e
	waitbutton
	closetext
UnknownScript_0x19c12f: ; 0x19c12f
	playsound SFX_TACKLE
	applymovement $0, MovementData_0x19c1d4
	spriteface $0, $2
	applymovement $3, MovementData_0x19c1da
	disappear $3
	dotrigger $0
	special HealParty
	playmapmusic
	end
; 0x19c146

TeacherScript_0x19c146: ; 0x19c146
	faceplayer
	loadfont
	checkflag ENGINE_MAP_CARD
	iftrue UnknownScript_0x19c154
	writetext UnknownText_0x19c650
	waitbutton
	closetext
	end
; 0x19c154

UnknownScript_0x19c154: ; 0x19c154
	writetext UnknownText_0x19c6a8
	waitbutton
	closetext
	end
; 0x19c15a

YoungsterScript_0x19c15a: ; 0x19c15a
	faceplayer
	loadfont
	checkflag ENGINE_POKEDEX
	iftrue UnknownScript_0x19c168
	writetext UnknownText_0x19c6d6
	waitbutton
	closetext
	end
; 0x19c168

UnknownScript_0x19c168: ; 0x19c168
	writetext UnknownText_0x19c701
	; special SpecialPokeSeer
	waitbutton
	closetext
	end
; 0x19c16e

FisherScript_0x19c16e: ; 0x19c16e
	faceplayer
	loadfont
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue UnknownScript_0x19c183
	writetext UnknownText_0x19c766
	buttonsound
	verbosegiveitem MYSTIC_WATER, 1
	iffalse UnknownScript_0x19c187
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
UnknownScript_0x19c183: ; 0x19c183
	writetext UnknownText_0x19c7c1
	waitbutton
UnknownScript_0x19c187: ; 0x19c187
	closetext
	end
; 0x19c189

MapCherrygroveCitySignpost0Script: ; 0x19c189
	jumptext UnknownText_0x19c7e0
; 0x19c18c

MapCherrygroveCitySignpost1Script: ; 0x19c18c
	jumptext UnknownText_0x19c815
; 0x19c18f

MapCherrygroveCitySignpost3Script: ; 0x19c18f
	jumpstd pokecentersign
; 0x19c192

MapCherrygroveCitySignpost2Script: ; 0x19c192
	jumpstd martsign
; 0x19c195
Cherrygrove_PleaseHealYourPokemon:
	spriteface $2, DOWN
	spriteface $0, UP
	loadfont
	checkevent EVENT_HEALED_IN_CHERRYGROVE
	iftrue .directtonewbark
	writetext Text_PleaseHealYourPokemon
	waitbutton
	closetext
	applymovement $0, Movement_PlayerPushedBackIntoCherrygrove
	end

.directtonewbark
	writetext GuideGentDirectsPlayerToNewBark
	waitbutton
	closetext
	dotrigger 0
	end

CherrygroveYoungsterScript1:
	jumptext CherrygroveYoungsterText1
CherrygroveYoungsterScript2:
	jumptext CherrygroveYoungsterText2

MovementData_0x19c195: ; 0x19c195
	step_left
	step_left
	step_up
	step_left
	turn_head_up
	step_end
; 0x19c19b

MovementData_0x19c19b: ; 0x19c19b
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x19c1a3

MovementData_0x19c1a3: ; 0x19c1a3
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x19c1ac

MovementData_0x19c1ac: ; 0x19c1ac
	step_left
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_down
	turn_head_left
	step_end
; 0x19c1b6

MovementData_0x19c1b6: ; 0x19c1b6
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end
; 0x19c1cb

MovementData_0x19c1cb: ; 0x19c1cb
	step_up
	step_up
	step_end
; 0x19c1ce

MovementData_0x19c1ce: ; 0x19c1ce
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x19c1d4

MovementData_0x19c1d4: ; 0x19c1d4
	big_step_down
	turn_head_up
	step_end
; 0x19c1d7

MovementData_0x19c1d7: ; 0x19c1d7
	step_left
	turn_head_down
	step_end
; 0x19c1da

MovementData_0x19c1da: ; 0x19c1da
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x19c1e3

Movement_GuideGentWalksUpToPlayerAfterShipwreck:
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

Movement_GuideGentTakesPlayerToPokecenter:
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_right
	turn_head_up
	step_end

Movement_GuideGentResetPosition:
	step_down
	step_down
	step_right
	step_right
	turn_head_down
	step_end

Movement_PlayerPushedBackIntoCherrygrove:
	step_left
	step_end

UnknownText_0x19c1e3: ; 0x19c1e3
	text "Ah, <PLAYER>, good"
	line "to see you again!"

	para "Since you're back"
	line "here, care if I"
	cont "show you around?"
	done
; 0x19c26f

UnknownText_0x19c26f: ; 0x19c26f
	text "OK, then!"
	line "Follow me!"
	done
; 0x19c285

UnknownText_0x19c285: ; 0x19c285
	text "This is the #-"
	line "MON CENTER."

	para "I'm sure you're"
	line "quite familiar"
	cont "with them."
	done
; 0x19c304

UnknownText_0x19c304: ; 0x19c304
	text "Here's the local"
	line "#MON MART."

	para "It's always well-"
	line "stocked, so feel"
	cont "free to do some"
	cont "shopping while"
	cont "you're in town."
	done
; 0x19c359

UnknownText_0x19c359: ; 0x19c359
	text "ROUTE 30 is out"
	line "this way."

	para "Trainers will be"
	line "battling their"

	para "prized #MON"
	line "there."
	done
; 0x19c3a7

UnknownText_0x19c3a7: ; 0x19c3a7
	text $56, " ", $56, " ", $56
	line $56, " ", $56, " ", $56

	para "Perhaps we should"
	line "skip this part for"
	cont "now."
	done
; 0x19c3ec

UnknownText_0x19c3ec: ; 0x19c3ec
	text "Here<...>"

	para "It's my house!"
	line "Thanks for your"
	cont "company."

	para "Let me give you a"
	line "small gift."
	done
; 0x19c438

UnknownText_0x19c438: ; 0x19c438
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done
; 0x19c451

UnknownText_0x19c451: ; 0x19c451
	text "#GEAR becomes"
	line "more useful as you"
	cont "add CARDS."
	done
; 0x19c49f

UnknownText_0x19c49f: ; 0x19c49f
	text "Oh<...> It's something"
	line "I enjoy doing<...>"

	para "Fine. Come see me"
	line "when you like."
	done
; 0x19c4e2

UnknownText_0x19c4e2: ; 0x19c4e2
	text $56, " ", $56, " ", $56

	para "You got a #MON"
	line "at the LAB."

	para "What a waste."
	line "A wimp like you."

	para $56, " ", $56, " ", $56

	para "Don't you get what"
	line "I'm saying?"

	para "Well, I too, have"
	line "a good #MON."

	para "I'll show you"
	line "what I mean!"
	done
; 0x19c57f

UnknownText_0x19c57f: ; 0x19c57f
	text "Humph. Are you"
	line "happy you won?"
	done
; 0x19c59e

UnknownText_0x19c59e: ; 0x19c59e
	text $56, " ", $56, " ", $56

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done
; 0x19c5e6

UnknownText_0x19c5e6: ; 0x19c5e6
	text "Humph. That was a"
	line "waste of time."
	done
; 0x19c608

UnknownText_0x19c608: ; 0x19c608
	text $56, " ", $56, " ", $56

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done
; 0x19c650

UnknownText_0x19c650: ; 0x19c650
	text "Did you talk to"
	line "the old man by the"
	cont "#MON CENTER?"

	para "He'll put a MAP of"
	line "JOHTO on your"
	cont "#GEAR."
	done
; 0x19c6a8

UnknownText_0x19c6a8: ; 0x19c6a8
	text "When you're with"
	line "#MON, going"
	cont "anywhere is fun."
	done
; 0x19c6d6

UnknownText_0x19c6d6: ; 0x19c6d6
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done
; 0x19c701

UnknownText_0x19c701: ; 0x19c701
	text "I battled the"
	line "trainers on the"
	cont "road."

	para "My #MON lost."
	line "They're a mess! I"

	para "must take them to"
	line "a #MON CENTER."
	done
; 0x19c766

UnknownText_0x19c766: ; 0x19c766
	text "A #MON I caught"
	line "had an item."

	para "I think it's"
	line "MYSTIC WATER."

	para "I don't need it,"
	line "so do you want it?"
	done
; 0x19c7c1

UnknownText_0x19c7c1: ; 0x19c7c1
	text "Back to fishing"
	line "for me, then."
	done
; 0x19c7e0

UnknownText_0x19c7e0: ; 0x19c7e0
	text "CHERRYGROVE CITY"

	para "The City of Cute,"
	line "Fragrant Flowers"
	done
; 0x19c815

UnknownText_0x19c815: ; 0x19c815
	text "GUIDE GENT'S HOUSE"
	done
; 0x19c829

Text_GuideGentHasRunningShoes2:
	text "Oh yes, I nearly"
	line "forgot."

	para "I also want you to"
	line "have these, as a"
	cont "gift from me."
	done

Text_GuideGentHasRunningShoes3:
	text "<PLAY_G> put on the"
	line "RUNNING SHOES!"

	para "Those are"
	line "RUNNING SHOES."

	para "They came with"
	line "instructions."

	para "Hold down the B"
	line "button and race"
	cont "like the wind!"

	para "Should be an asset"
	line "for a TRAINER like"
	cont "yourself!"

	para "I wish you luck on"
	line "your journey!"
	done

Text_GuideGentExplainsWhatHappened:
	text "Are you alright,"
	line "child?"
	
	para "<...>"
	
	para "You were aboard"
	line "the S.S.ANNE when"
	cont "it crashed?"

	para "In all my years"
	line "I've never seen"
	
	para "such a grand ship"
	line "meet such a grim"
	cont "fate."

	para "You seem mostly"
	line "unhurt. That's a"
	cont "relief."

	para "Oh? But your #-"
	line "MON are all"
	cont "fainted!"

	para "Let's get them"
	line "fixed up."

	para "Follow me."
	done

Text_GuideGentForcesPlayerToHealParty:
	text "Here we are."

	para "Oh, my apologies."
	line "I never told you"
	cont "where <``>here<''> is!"

	para "You've made land"
	line "in CHERRYGROVE"
	cont "CITY."

	para "This is our local"
	line "#MON CENTER."
	
	para "The NURSE inside"
	line "will fix you right"
	cont "up."

	para "Go on, have a chat"
	line "with her!"
	done

Text_PleaseHealYourPokemon:
	text "Where are you"
	line "going?"

	para "You should heal"
	line "your #MON!"
	done

GuideGentDirectsPlayerToNewBark:
	text "Oh good, your"
	line "#MON look all"
	cont "healthy again!"

	para "Oh, where are my"
	line "manners? I never"
	cont "asked your name!"

	para $56, " ", $56, " ", $56
	line $56, " ", $56, " ", $56

	para "So, it's <PLAYER>?"
	line "That's a nice name."

	para "You can call me"
	line "the GUIDE GENT."

	para "And now, allow me"
	line "to guide you."

	para "If you need help"
	line "getting home, you"
	cont "should talk to"
	cont "PROF.ELM."

	para "He runs a lab in"
	line "NEW BARK TOWN, to"
	cont "the east of here."

	para "It's a short hop"
	line "down some ledges."

	para "I wish you the"
	line "best of luck!"
	done

CherrygroveYoungsterText1:
	text "I'm totally going"
	line "to win this match!"
	done

CherrygroveYoungsterText2:
	text "You, winning? Ha!"
	line "In your dreams!"
	done

Text_AlreadyHaveMapCard:
	text "Oh? But you seem"
	line "to already have"
	cont "a MAP CARD."

	para "It's even the la-"
	line "test version."
	done

CherrygroveCity_MapEventHeader: ; 0x19c829
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $3, $17, 2, GROUP_CHERRYGROVE_MART, MAP_CHERRYGROVE_MART
	warp_def $3, $1d, 1, GROUP_CHERRYGROVE_POKECENTER_1F, MAP_CHERRYGROVE_POKECENTER_1F
	warp_def $7, $11, 1, GROUP_CHERRYGROVE_GYM_SPEECH_HOUSE, MAP_CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def $9, $19, 1, GROUP_GUIDE_GENTS_HOUSE, MAP_GUIDE_GENTS_HOUSE
	warp_def $b, $1f, 1, GROUP_CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, MAP_CHERRYGROVE_EVOLUTION_SPEECH_HOUSE

	; xy triggers
	db 5
	xy_trigger 1, $6, $21, $0, UnknownScript_0x19c0ae, $0, $0
	xy_trigger 1, $7, $21, $0, UnknownScript_0x19c0aa, $0, $0
	xy_trigger 3, $7, $20, $0, Cherrygrove_PleaseHealYourPokemon, $0, $0
	xy_trigger 3, $8, $20, $0, Cherrygrove_PleaseHealYourPokemon, $0, $0
	xy_trigger 3, $9, $20, $0, Cherrygrove_PleaseHealYourPokemon, $0, $0

	; signposts
	db 4
	signpost 8, 30, $0, MapCherrygroveCitySignpost0Script
	signpost 9, 23, $0, MapCherrygroveCitySignpost1Script
	signpost 3, 24, $0, MapCherrygroveCitySignpost2Script
	signpost 3, 30, $0, MapCherrygroveCitySignpost3Script

	; people-events
	db 7
	person_event SPRITE_GRAMPS, 10, 36, $6, 0, 0, -1, -1, 0, 0, 0, GrampsScript_0x19c013, EVENT_GUIDE_GENT_VISIBLE_IN_HIS_HOUSE
	person_event SPRITE_SILVER, 10, 43, $3, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_SILVER_IN_CHERRYGROVE_CITY
	person_event SPRITE_TEACHER, 16, 31, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, TeacherScript_0x19c146, -1
	person_event SPRITE_YOUNGSTER, 11, 27, $5, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, YoungsterScript_0x19c15a, -1
	person_event SPRITE_FISHER, 16, 11, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FisherScript_0x19c16e, -1
	person_event SPRITE_YOUNGSTER, 7, 20, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CherrygroveYoungsterScript1, EVENT_GOT_A_POKEMON_FROM_ELM
	person_event SPRITE_YOUNGSTER, 7, 21, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CherrygroveYoungsterScript2, EVENT_GOT_A_POKEMON_FROM_ELM
; 0x19c8ad

