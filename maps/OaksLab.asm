OaksLab_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b3c7

UnknownScript_0x19b3c7: ; 0x19b3c7
	end
; 0x19b3c8

OakScript_0x19b3c8: ; 0x19b3c8
	faceplayer
	loadfont
	checkevent EVENT_ALLOWED_INTO_ROUTE_28
	iftrue OakAfterAll
	checkevent EVENT_BEAT_ELITE_REMATCH
	iftrue OakAfterE4
	checkevent EVENT_OAK_DEFEATED
	iftrue OakAfterDefeat
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue RematchCheck
	checkevent EVENT_TALKED_TO_OAK_IN_HIS_LAB
	iftrue UnknownScript_0x19b3dd
	writetext UnknownText_0x19b427
	buttonsound
	setevent EVENT_TALKED_TO_OAK_IN_HIS_LAB
UnknownScript_0x19b3dd: ; 0x19b3dd
	checkcode VAR_BADGES
	if_equal $10, UnknownScript_0x19b3f7
	if_equal $8, UnknownScript_0x19b401
	jump UnknownScript_0x19b408
; 0x19b3ea

RematchCheck:
	special Special_CheckRematches
	if_less_than 16, UnknownScript_0x19b3ea
	writetext OakBeforeBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_BULBASAUR_FROM_OAK
	iftrue .OakHasBlastoise
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .OakHasVenusaur
	loadtrainer POKEMON_PROF, 3
	jump .got_oaks_team

.OakHasBlastoise:
	loadtrainer POKEMON_PROF, 1
	jump .got_oaks_team

.OakHasVenusaur:
	loadtrainer POKEMON_PROF, 2
.got_oaks_team
	winlosstext OakDefeated, $0000
	startbattle
	returnafterbattle
	loadfont
	writetext OakAfterBattle
	setevent EVENT_OAK_DEFEATED
	waitbutton
	closetext
	end

OakBeforeBattle:
	text "To defeat all 16"
	line "GYM LEADERS"

	para "without handicaps"
	line "is a rare feat."

	para "The ELITE FOUR"
	line "saw your potential"

	para "and asked me to"
	line "test you."

	para "So far you have"
	line "passed, but there"

	para "is one more foe"
	line "you must defeat."

	para "Do not hold back."

	done

OakAfterBattle:
	text "Well done."
	line "That was an"
	cont "amazing battle."

	para "The ELITE FOUR"
	line "challenge you,"

	para "this time using"
	line "their strongest"
	cont "teams."

	para "They await at"
	line "INDIGO PLATEAU."

	done

OakDefeated:
	text "Wow, I'm"
	line "speechless!"

	para "You are as good as"
	line "they say you are."

	done

OakAfterDefeatText:
	text "The ELITE FOUR"
	line "await at INDIGO"
	cont "PLATEAU."

	para "Good luck!"
	done

OakAfterDefeat: ; 0x19b3ea
	checkevent EVENT_OAK_KNOWS_DEX_FULL
	iftrue SkipfterDefeatDexCheck
	writetext UnknownText_0x19b4a2
	waitbutton
	special ProfOaksPCBoot
	checkcode VAR_DEXCAUGHT
	if_equal 251, PGKOak_FullDex
SkipfterDefeatDexCheck:
	writetext OakAfterDefeatText
	waitbutton
	closetext
	end

OakAfterE4:
	writetext UnknownText_0x19b4a2
	waitbutton
	special ProfOaksPCBoot
	checkcode VAR_DEXCAUGHT
	if_equal 251, PGKOak_FullDex
	writetext OakAfterE4Text
	waitbutton
	closetext
	end

OakAfterE4Text:
	text "Keep it up! Soon"
	line "you'll have caught"
	cont "them all!"
	done

OakAfterAll:
	writetext OakAfterAllText
	waitbutton
	closetext
	end

OakAfterAllText:
	text "The path to"
	line "MT.SILVER lies"
	cont "west of ROUTE 22."
	done

UnknownScript_0x19b3ea: ; 0x19b3ea
	checkevent EVENT_OAK_KNOWS_DEX_FULL
	iftrue .skip_dex_check
	writetext UnknownText_0x19b4a2
	waitbutton
	special ProfOaksPCBoot
	checkcode VAR_DEXCAUGHT
	if_equal 251, PGKOak_FullDex
.skip_dex_check
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iffalse .dont_mention_rematches
	writetext UnknownText_0x19b4c8
	waitbutton
	closetext
	end
.dont_mention_rematches
	writetext UnknownText_0x19b4c8_2
	waitbutton
	closetext
	end
; 0x19b3f7

PGKOak_FullDex
	checkevent EVENT_BEAT_ELITE_REMATCH
	iftrue OakLabUnlock28
	writetext OakDexButNotE4Text
	setevent EVENT_OAK_KNOWS_DEX_FULL
	waitbutton
	closetext
	end

OakDexButNotE4Text:
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"

	para "Remember to"
	line "get a DIPLOMA"
	para "from CELADON as"
	line "proof of your"
	cont "accomplishment."
	done

OakLabUnlock28:
	farwritetext OakFullDex
	buttonsound
	farwritetext OakCongrats
	setevent EVENT_ALLOWED_INTO_ROUTE_28
	waitbutton
	closetext
	end


UnknownScript_0x19b3f7: ; 0x19b3f7
	writetext UnknownText_0x19b4fc
	buttonsound
	setevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	clearevent EVENT_MORTY_IS_AT_BACK_OF_GYM
	jump UnknownScript_0x19b3ea
; 0x19b401

UnknownScript_0x19b401: ; 0x19b401
	writetext UnknownText_0x19b6a2
	buttonsound
	jump UnknownScript_0x19b3ea
; 0x19b408

UnknownScript_0x19b408: ; 0x19b408
	writetext UnknownText_0x19b73c
	buttonsound
	jump UnknownScript_0x19b3ea
; 0x19b40f

ScientistScript_0x19b40f: ; 0x19b40f
	jumptextfaceplayer UnknownText_0x19b7fb
; 0x19b412

ScientistScript_0x19b412: ; 0x19b412
	jumptextfaceplayer UnknownText_0x19b859
; 0x19b415

ScientistScript_0x19b415: ; 0x19b415
	jumptextfaceplayer UnknownText_0x19b8a7
; 0x19b418

MapOaksLabSignpost11Script: ; 0x19b418
	jumpstd difficultbookshelf
; 0x19b41b

MapOaksLabSignpost12Script: ; 0x19b41b
	jumptext UnknownText_0x19b8ea
; 0x19b41e

MapOaksLabSignpost13Script: ; 0x19b41e
	jumptext UnknownText_0x19b909
; 0x19b421

MapOaksLabSignpost14Script: ; 0x19b421
	jumptext UnknownText_0x19b945
; 0x19b424

MapOaksLabSignpost15Script: ; 0x19b424
	jumptext UnknownText_0x19b95e
; 0x19b427

UnknownText_0x19b427: ; 0x19b427
	text "OAK: Ah, <PLAY_G>!"
	line "Welcome home!"

	para "You've been away"
	line "for such a long"
	cont "time."

	para "What do you think"
	line "of the trainers"
	cont "around here?"

	para "You're not the"
	line "only one who's"
	cont "gotten stronger!"
	done
; 0x19b4a2

UnknownText_0x19b4a2: ; 0x19b4a2
	text "How is your #-"
	line "DEX coming?"

	para "Let's see<...>"
	done
; 0x19b4c8

UnknownText_0x19b4c8: ; 0x19b4c8
	text "Come back once you"
	line "defeat all 16 GYM"

	para "LEADERs at their"
	line "best."
	done
; 0x19b4fc

UnknownText_0x19b4c8_2: ; 0x19b4c8
	text "Come back once you"
	line "collect all 16 GYM"
	cont "BADGES."
	done

UnknownText_0x19b4fc: ; 0x19b4fc
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Hmm<...>"

	para "Now that you have"
	line "proven yourself as"

	para "a truly remar-"
	line "kable TRAINER<...>"

	para "The GYM LEADERS"
	line "may want to test"

	para "again, no holds"
	line "barred."

	para "If you manage to"
	line "defeat them all at"

	para "their best, come"
	line "back and see me."
	done
; 0x19b6a2

UnknownText_0x19b6a2: ; 0x19b6a2
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done
; 0x19b73c

UnknownText_0x19b73c: ; 0x19b73c
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done
; 0x19b7fb

UnknownText_0x19b7fb: ; 0x19b7fb
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done
; 0x19b859

UnknownText_0x19b859: ; 0x19b859
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done
; 0x19b8a7

UnknownText_0x19b8a7: ; 0x19b8a7
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done
; 0x19b8ea

UnknownText_0x19b8ea: ; 0x19b8ea
	text "Press START to"
	line "open the MENU."
	done
; 0x19b909

UnknownText_0x19b909: ; 0x19b909
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done
; 0x19b945

UnknownText_0x19b945: ; 0x19b945
	text "There's nothing in"
	line "here<...>"
	done
; 0x19b95e

UnknownText_0x19b95e: ; 0x19b95e
	text "There's an e-mail"
	line "message on the PC."

	para "<...>"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done
; 0x19ba33

OaksLab_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $b, $5, 3, GROUP_PALLET_TOWN, MAP_PALLET_TOWN

	; xy triggers
	db 0

	; signposts
	db 16
	signpost 1, 6, $0, MapOaksLabSignpost11Script
	signpost 1, 7, $0, MapOaksLabSignpost11Script
	signpost 1, 8, $0, MapOaksLabSignpost11Script
	signpost 1, 9, $0, MapOaksLabSignpost11Script
	signpost 7, 0, $0, MapOaksLabSignpost11Script
	signpost 7, 1, $0, MapOaksLabSignpost11Script
	signpost 7, 2, $0, MapOaksLabSignpost11Script
	signpost 7, 3, $0, MapOaksLabSignpost11Script
	signpost 7, 6, $0, MapOaksLabSignpost11Script
	signpost 7, 7, $0, MapOaksLabSignpost11Script
	signpost 7, 8, $0, MapOaksLabSignpost11Script
	signpost 7, 9, $0, MapOaksLabSignpost11Script
	signpost 0, 4, $0, MapOaksLabSignpost12Script
	signpost 0, 5, $0, MapOaksLabSignpost13Script
	signpost 3, 9, $0, MapOaksLabSignpost14Script
	signpost 1, 0, $0, MapOaksLabSignpost15Script

	; people-events
	db 4
	person_event SPRITE_OAK, 6, 8, $6, 0, 0, -1, -1, 0, 0, 0, OakScript_0x19b3c8, -1
	person_event SPRITE_SCIENTIST, 12, 5, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x19b40f, -1
	person_event SPRITE_SCIENTIST, 13, 12, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x19b412, -1
	person_event SPRITE_SCIENTIST, 8, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x19b415, -1
; 0x19bac7



