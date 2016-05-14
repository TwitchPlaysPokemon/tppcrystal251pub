OlivineGym_MapScriptHeader: ; 0x9c12d
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c12f

JasmineScript_0x9c12f: ; 0x9c12f
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue JasminePostgameRematchScript
	checkevent EVENT_JASMINE_REMATCH
	iftrue JasmineAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue JasmineRematchScript
	checkevent EVENT_BEAT_JASMINE
	iftrue UnknownScript_0x9c159
	writetext UnknownText_0x9c1b9
	waitbutton
	closetext
	winlosstext UnknownText_0x9c2bb, $0000
	loadtrainer JASMINE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_JASMINE
	loadfont
	writetext UnknownText_0x9c33a
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall UnknownScript_0x9c178
UnknownScript_0x9c159: ; 0x9c159
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue UnknownScript_0x9c172
	writetext UnknownText_0x9c354
	buttonsound
	verbosegiveitem TM_FLASH_CANNON, 1
	iffalse UnknownScript_0x9c176
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext UnknownText_0x9c3a5
	waitbutton
	closetext
	end
; 0x9c172

JasmineRematchScript:
	writetext JasmineRematchTextBefore
	waitbutton
	closetext
	winlosstext JasmineRematchBeatenText, $0000
	loadtrainer JASMINE, 2
	startbattle
	returnafterbattle
	setevent EVENT_JASMINE_REMATCH
	loadfont

JasmineAfterRematch:
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

UnknownScript_0x9c172: ; 0x9c172
	writetext UnknownText_0x9c3d1
	waitbutton
UnknownScript_0x9c176: ; 0x9c176
	closetext
	end
; 0x9c178

UnknownScript_0x9c178: ; 0x9c178
	if_equal $7, UnknownScript_0x9c184
	if_equal $6, UnknownScript_0x9c181
	end
; 0x9c181

UnknownScript_0x9c181: ; 0x9c181
	jumpstd goldenrodrockets
; 0x9c184

UnknownScript_0x9c184: ; 0x9c184
	jumpstd radiotowerrockets
; 0x9c187

OlivineGymGuyScript: ; 0x9c187
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuyWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuyPreScript
	loadfont
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end
; 0x9c19b

.OlivineGymGuyWinScript
	loadfont
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end
; 0x9c1a2

.OlivineGymGuyPreScript
	loadfont
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end
; 0x9c1a9

MapOlivineGymSignpost1Script: ; 0x9c1a9
	checkflag ENGINE_MINERALBADGE
	iftrue UnknownScript_0x9c1b2
	jumpstd gymstatue1
; 0x9c1b2

UnknownScript_0x9c1b2: ; 0x9c1b2
	trainertotext JASMINE, 1, $1
	jumpstd gymstatue2
; 0x9c1b9

UnknownText_0x9c1b9: ; 0x9c1b9
	text "<...>Thank you for"
	line "your help at the"
	cont "LIGHTHOUSE<...>"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am JASMINE, a"
	line "GYM LEADER. I use"
	cont "the steel-type."

	para "<...>Do you know about"
	line "the steel-type?"

	para "It's a type that"
	line "was only recently"
	cont "discovered."

	para "<...>Um<...> May I begin?"
	done
; 0x9c2bb

JasmineRematchTextBefore:
	text "<...>Welcome back."

	para "<...>Um<...> Do you want a"
	line "rematch?"
	done

JasmineRematchBeatenText:
	text "True to your"
	line "reputation<...>"
	done


JasmineAfterRematchText:
	text "<...>You're better"
	line "than me."

	para "This is hard to"
	line "say<...>"

	para "But<...>"
	line "Good luck."
	done

UnknownText_0x9c2bb: ; 0x9c2bb
	text "<...>You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done
; 0x9c33a

UnknownText_0x9c33a: ; 0x9c33a
	text "<PLAYER> received"
	line "MINERALBADGE."
	done
; 0x9c354

UnknownText_0x9c354: ; 0x9c354
	text "MINERALBADGE"
	line "raises #MON's"
	cont "DEFENSE."

	para "<...>Um<...> Please take"
	line "this too<...>"
	done
; 0x9c393

UnknownText_0x9c393: ; 0x9c393
	text "<PLAYER> received"
	line "TM09!"
	done
; 0x9c3a5

UnknownText_0x9c3a5: ; 0x9c3a5
	text "<...>You could use"
	line "that TM to teach"
	cont "FLASH CANNON."
	done
; 0x9c3d1

UnknownText_0x9c3d1: ; 0x9c3d1
	text "Um<...> I don't know"
	line "how to say this,"
	cont "but good luck<...>"
	done
; 0x9c402

OlivineGymGuyText: ; 0x9c402
	text "JASMINE uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done
; 0x9c451

OlivineGymGuyWinText: ; 0x9c451
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done
; 0x9c4a8

OlivineGymGuyPreText: ; 0x9c4a8
	text "JASMINE, the GYM"
	line "LEADER, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #MON."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done
; 0x9c526

JasminePostgameRematchScript:
    writetext JasminePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer JASMINE, 2
    winlosstext JasminePostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext JasminePostgameAfterText
    waitbutton
.return
    closetext
    end
	
JasminePostgameRematchText:
	text "<...>Oh! Hi!"

	para "<...>You want to"
	line "battle me again?"

	done
	
JasminePostgameBeatenText:
	text "<...>Awe<...>"
	
	para "You're still so"
	line "much better<...>"
	done
	
JasminePostgameAfterText:

	text "<...>Um<...>"

	para "Thank you again"
	line "for battling with"
	cont "me<...>"
	
	para "<...>I really enjoyed"
	line "it!"
	done

OlivineGym_MapEventHeader: ; 0x9c526
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 2, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $f, $5, 2, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapOlivineGymSignpost1Script
	signpost 13, 6, $0, MapOlivineGymSignpost1Script

	; people-events
	db 2
	person_event SPRITE_JASMINE, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, JasmineScript_0x9c12f, EVENT_JASMINE_IN_OLIVINE_GYM
	person_event SPRITE_GYM_GUY, 17, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, OlivineGymGuyScript, -1
; 0x9c55a

