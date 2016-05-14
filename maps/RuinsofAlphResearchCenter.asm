RuinsofAlphResearchCenter_MapScriptHeader: ; 0x59173
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x59180, $0000
	dw UnknownScript_0x59181, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x59185
; 0x59180

UnknownScript_0x59180: ; 0x59180
	end
; 0x59181

UnknownScript_0x59181: ; 0x59181
	priorityjump UnknownScript_0x59192
	end
; 0x59185

UnknownScript_0x59185: ; 0x59185
	checktriggers
	if_equal $1, UnknownScript_0x5918b
	return
; 0x5918b

UnknownScript_0x5918b: ; 0x5918b
	moveperson $4, $3, $7
	appear $4
	return
; 0x59192

UnknownScript_0x59192: ; 0x59192
	applymovement $4, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	spriteface $4, $0
	loadfont
	writetext UnknownText_0x59278
	waitbutton
	closetext
	applymovement $4, MovementData_0x59274
	loadfont
	writetext UnknownText_0x592fa
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext UnknownText_0x59311
	waitbutton
	closetext
	applymovement $4, MovementData_0x59276
	dotrigger $0
	special RestartMapMusic
	end
; 0x591d1

ScientistScript_0x591d1: ; 0x591d1
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x591df
	writetext UnknownText_0x59311
	waitbutton
	closetext
	end
; 0x591df

UnknownScript_0x591df: ; 0x591df
	writetext UnknownText_0x5935f
	waitbutton
	closetext
	end
; 0x591e5

ScientistScript_0x591e5: ; 0x591e5
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5920b
	checkflag ENGINE_UNOWN_DEX
	iftrue UnknownScript_0x59205
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x591ff
	writetext UnknownText_0x593ed
	waitbutton
	closetext
	end
; 0x591ff

UnknownScript_0x591ff: ; 0x591ff
	writetext UnknownText_0x59478
	waitbutton
	closetext
	end
; 0x59205

UnknownScript_0x59205: ; 0x59205
	writetext UnknownText_0x59445
	waitbutton
	closetext
	end
; 0x5920b

UnknownScript_0x5920b: ; 0x5920b
	writetext UnknownText_0x594cb
	waitbutton
	closetext
	clearevent EVENT_YOUNGSTERS_IN_RUINS_OF_ALPH_OUTSIDE
	end
; 0x59214

ScientistScript_0x59214: ; 0x59214
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x5922e
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x59228
	writetext UnknownText_0x5954f
	waitbutton
	closetext
	end
; 0x59228

UnknownScript_0x59228: ; 0x59228
	writetext UnknownText_0x595cb
	waitbutton
	closetext
	end
; 0x5922e

UnknownScript_0x5922e: ; 0x5922e
	writetext UnknownText_0x59769
	waitbutton
	closetext
	end
; 0x59234

MapRuinsofAlphResearchCenterSignpost1Script: ; 0x59234
	loadfont
	checkevent EVENT_SCIENTIST_IN_RUINS_OF_ALPH_RESEARCH_CENTER
	iftrue UnknownScript_0x59241
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59247
UnknownScript_0x59241: ; 0x59241
	writetext UnknownText_0x597b6
	waitbutton
	closetext
	end
; 0x59247

UnknownScript_0x59247: ; 0x59247
	writetext UnknownText_0x597d9
	waitbutton
	closetext
	end
; 0x5924d

MapRuinsofAlphResearchCenterSignpost2Script: ; 0x5924d
	loadfont
	checkevent EVENT_SCIENTIST_IN_RUINS_OF_ALPH_RESEARCH_CENTER
	iftrue UnknownScript_0x5925a
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x59260
UnknownScript_0x5925a: ; 0x5925a
	writetext UnknownText_0x5980e
	waitbutton
	closetext
	end
; 0x59260

UnknownScript_0x59260: ; 0x59260
	writetext UnknownText_0x5982d
	waitbutton
	special Functionc2cd
	closetext
	end
; 0x59269

UnknownScript_0x59269: ; 0x59269
	jumptext UnknownText_0x59848
; 0x5926c

MapRuinsofAlphResearchCenterSignpost0Script: ; 0x5926c
	jumptext UnknownText_0x59886
; 0x5926f

FossilRevivalGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_000_STD
	iftrue .PleaseWait
	checkevent EVENT_LEFT_FOSSIL_TO_BE_REVIVED
	iftrue .give_fossil
	writetext Text_IntroFossilGuy
	buttonsound
	waitsfx
	special FossilMenu
	iffalse .nope
	if_equal 1, .helix
	if_equal 2, .dome
	if_equal 3, .amber
.nope
	writetext Text_ComeBackWithAFossil
	waitbutton
	closetext
	end
.helix
	setevent EVENT_LEFT_HELIX_TO_BE_REVIVED
	takeitem HELIX_FOSSIL, 1
	jump .takeawalk
.dome
	setevent EVENT_LEFT_DOME_TO_BE_REVIVED
	takeitem DOME_FOSSIL, 1
	jump .takeawalk
.amber
	setevent EVENT_LEFT_AMBER_TO_BE_REVIVED
	takeitem OLD_AMBER, 1
.takeawalk
	setevent EVENT_LEFT_FOSSIL_TO_BE_REVIVED
	setevent EVENT_000_STD
	writetext Text_TakeAWalk
	waitbutton
	closetext
	end

.give_fossil
	writetext Text_WhereHaveYouBeen
	buttonsound
	waitsfx
	checkevent EVENT_LEFT_HELIX_TO_BE_REVIVED
	iftrue .omanyte
	checkevent EVENT_LEFT_DOME_TO_BE_REVIVED
	iftrue .kabuto
	; aerodactyl
	pokenamemem AERODACTYL, 0
	writetext Text_ReceiveRevivedPokemon
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 33
	jump .finish
.omanyte
	pokenamemem OMANYTE, 0
	writetext Text_ReceiveRevivedPokemon
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 23
	jump .finish
.kabuto
	pokenamemem KABUTO, 0
	writetext Text_ReceiveRevivedPokemon
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 23
.finish
	if_equal 2, .PartyAndBoxFull
	clearevent EVENT_LEFT_DOME_TO_BE_REVIVED
	clearevent EVENT_LEFT_HELIX_TO_BE_REVIVED
	clearevent EVENT_LEFT_AMBER_TO_BE_REVIVED
	clearevent EVENT_LEFT_FOSSIL_TO_BE_REVIVED
	writetext Text_ComeBackAgain
	waitbutton
	closetext
	end
.PleaseWait
	writetext Text_StillBusy
	waitbutton
	closetext
	end
.PartyAndBoxFull
	writetext Text_NoRoomForFossilMon
	waitbutton
	closetext
	end
MovementData_0x5926f: ; 0x5926f
	step_up
	step_up
	step_left
	turn_head_up
	step_end
; 0x59274

MovementData_0x59274: ; 0x59274
	step_down
	step_end
; 0x59276

MovementData_0x59276: ; 0x59276
	step_up
	step_end
; 0x59278

UnknownText_0x59278: ; 0x59278
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done
; 0x592fa

UnknownText_0x592fa: ; 0x592fa
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done
; 0x59311

UnknownText_0x59311: ; 0x59311
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done
; 0x5935f

UnknownText_0x5935f: ; 0x5935f
	text "You caught all the"
	line "UNOWN variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling UNOWN."

	para "Feel free to use"
	line "it anytime."
	done
; 0x593ed

UnknownText_0x593ed: ; 0x593ed
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done
; 0x59445

UnknownText_0x59445: ; 0x59445
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done
; 0x59478

UnknownText_0x59478: ; 0x59478
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done
; 0x594cb

UnknownText_0x594cb: ; 0x594cb
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done
; 0x5954f

UnknownText_0x5954f: ; 0x5954f
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done
; 0x595cb

UnknownText_0x595cb: ; 0x595cb
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm<...>"

	para "That must mean"
	line "there are many"
	cont "kinds of them<...>"
	done
; 0x59669

; possibly unused
;UnknownText_0x59669: ; 0x59669
;	text "We think something"
;	line "caused the cryptic"

;	para "patterns to appear"
;	line "in the RUINS."

	;para "We've focused our"
;	line "studies on that."
;	done
; 0x596d3

; possibly unused
;UnknownText_0x596d3: ; 0x596d3
;	text "According to my"
;	line "research<...>"

	;para "Those mysterious"
;	line "patterns appeared"

;	para "when the #COM"
;	line "CENTER was built."

;	para "It must mean that"
;	line "radio waves have"

;	para "some sort of a"
;	line "link<...>"
;	done
; 0x59769

UnknownText_0x59769: ; 0x59769
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens<...>"
	done
; 0x597b6

UnknownText_0x597b6: ; 0x597b6
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done
; 0x597d9

UnknownText_0x597d9: ; 0x597d9
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of 26"
	line "kinds found."
	done
; 0x5980e

UnknownText_0x5980e: ; 0x5980e
	text "This doesn't seem"
	line "to work yet."
	done
; 0x5982d

UnknownText_0x5982d: ; 0x5982d
	text "UNOWN may be"
	line "printed out."
	done
; 0x59848

; possibly unused
UnknownText_0x59848: ; 0x59848
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done
; 0x59886

UnknownText_0x59886: ; 0x59886
	text "There are many"
	line "academic books."

	para "Ancient Ruins<...>"
	line "Mysteries of the"
	cont "Ancients<...>"
	done
; 0x598d0

Text_IntroFossilGuy:
	text "Hello, I am a very"
	line "important resear-"
	cont "cher."

	para "I've developed a"
	line "technology that"

	para "revives #MON"
	line "from FOSSILs!"
	done

Text_TakeAWalk:
	text "It'll take me some"
	line "time to revive"
	cont "this."

	para "Why don't you go"
	line "take a walk?"

	para "It should be done"
	line "by the time you"
	cont "get back."
	done

Text_WhereHaveYouBeen:
	text "There you are!"
	line "Where have you"
	cont "been?"

	para "The experiment was"
	line "a success!"
	done

Text_ReceiveRevivedPokemon:
	text "We resurrected the"
	line "ancient #MON,"
	cont "@"
	TX_RAM StringBuffer3
	text "!"

	para "<PLAYER> received"
	line "@"
	TX_RAM StringBuffer3
	text "!"
	done

Text_StillBusy:
	text "Don't bother me!"
	line "I'm busy with the"

	para "FOSSIL you gave"
	line "me!"
	done

Text_ComeBackAgain:
	text "I did a good job,"
	line "didn't I?"

	para "Come back again if"
	line "you find another"
	cont "FOSSIL."
	done

Text_ComeBackWithAFossil:
	text "If you find a"
	line "FOSSIL, bring it"

	para "here, and I'll"
	line "revive it for you."
	done
Text_NoRoomForFossilMon:
	text "You've no room for"
	line "this."
	done

RuinsofAlphResearchCenter_MapEventHeader: ; 0x598d0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $3, 6, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 5, 6, $0, MapRuinsofAlphResearchCenterSignpost0Script
	signpost 4, 3, $0, MapRuinsofAlphResearchCenterSignpost1Script
	signpost 1, 7, $0, MapRuinsofAlphResearchCenterSignpost2Script

	; people-events
	db 4
	person_event SPRITE_SCIENTIST, 9, 8, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x591e5, -1
	person_event SPRITE_SCIENTIST, 6, 9, $2, 1, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x59214, -1
	person_event SPRITE_SCIENTIST, 9, 6, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x591d1, EVENT_SCIENTIST_IN_RUINS_OF_ALPH_RESEARCH_CENTER
	person_event SPRITE_SCIENTIST, 6, 4, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FossilRevivalGuyScript, -1
; 0x59916

