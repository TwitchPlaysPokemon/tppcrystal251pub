VioletGym_MapScriptHeader: ; 0x683c0
	; trigger count
	db 0

	; callback count
	db 0
; 0x683c2

FalknerScript_0x683c2: ; 0x683c2
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue FalknerPostgameRematchScript
	checkevent EVENT_FALKNER_REMATCH
	iftrue FalknerAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue FalknerRematchScript
	checkevent EVENT_BEAT_FALKNER
	iftrue UnknownScript_0x683ec
	writetext UnknownText_0x68473
	waitbutton
	closetext
	winlosstext UnknownText_0x6854a, $0000
	loadtrainer FALKNER, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_FALKNER
	loadfont
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall UnknownScript_0x68418
UnknownScript_0x683ec: ; 0x683ec
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue UnknownScript_0x68412
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $2
	specialphonecall $3
	writetext UnknownText_0x685c8
	buttonsound
	verbosegiveitem TM_SKY_ATTACK, 1
	iffalse UnknownScript_0x68416
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext UnknownText_0x68648
	waitbutton
	closetext
	end
; 0x68412

FalknerRematchScript:
	checkevent EVENT_FOUGHT_ARTICUNO
	iffalse FalknerReject
	checkevent EVENT_FOUGHT_ZAPDOS
	iffalse FalknerReject
	checkevent EVENT_FOUGHT_MOLTRES
	iffalse FalknerReject
	writetext FalknerRematchTextBefore
	waitbutton
	closetext
	winlosstext FalknerRematchBeatenText, $0000
	loadtrainer FALKNER, 2
	startbattle
	returnafterbattle
	setevent EVENT_FALKNER_REMATCH
	loadfont

FalknerAfterRematch:
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

FalknerReject:
	writetext FalknerRejectText
	waitbutton
	closetext
	end

FalknerPostgameRematchScript:
    writetext FalknerPostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer FALKNER, 2
    winlosstext FalknerPostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext FalknerPostgameAfterText
    waitbutton
.return
    closetext
    end
	
FalknerRejectText:
	text "ARTICUNO<...>"

	para "ZAPDOS<...>"

	para "MOLTRES<...>"

	para "Taming these"
	line "legendary bird"

	para "#MON has been"
	line "the ultimate test"

	para "of power in my"
	line "family for gene-"
	cont "rations."

	para "You're on a quest"
	line "to fill your #-"
	cont "DEX, right?"

	para "Then you should"
	line "take on this chal-"
	cont "lenge yourself."

	para "Go find the three"
	line "legendary birds"

	para "and catch them"
	line "where they roost!"

	para "Once you have done"
	line "that, come back"
	cont "here."

	para "Come back and show"
	line "me how high you"
	cont "can soar!"
	done

UnknownScript_0x68412: ; 0x68412
	writetext UnknownText_0x68735
	waitbutton
UnknownScript_0x68416: ; 0x68416
	closetext
	end
; 0x68418

UnknownScript_0x68418: ; 0x68418
	if_equal $7, UnknownScript_0x68424
	if_equal $6, UnknownScript_0x68421
	end
; 0x68421

UnknownScript_0x68421: ; 0x68421
	jumpstd goldenrodrockets
; 0x68424

UnknownScript_0x68424: ; 0x68424
	jumpstd radiotowerrockets
; 0x68427

TrainerBird_keeperRod: ; 0x68427
	; bit/flag number
	dw $3fb

	; trainer group && trainer id
	db BIRD_KEEPER, ROD

	; text when seen
	dw Bird_keeperRodSeenText

	; text when trainer beaten
	dw Bird_keeperRodBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperRodScript
; 0x68433

Bird_keeperRodScript: ; 0x68433
	talkaftercancel
	loadfont
	writetext UnknownText_0x68837
	waitbutton
	closetext
	end
; 0x6843b

TrainerBird_keeperAbe: ; 0x6843b
	; bit/flag number
	dw $3fc

	; trainer group && trainer id
	db BIRD_KEEPER, ABE

	; text when seen
	dw Bird_keeperAbeSeenText

	; text when trainer beaten
	dw Bird_keeperAbeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperAbeScript
; 0x68447

Bird_keeperAbeScript: ; 0x68447
	talkaftercancel
	loadfont
	writetext UnknownText_0x688c7
	waitbutton
	closetext
	end
; 0x6844f

VioletGymGuyScript: ; 0x6844f
	faceplayer
	loadfont
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end
; 0x68463

MapVioletGymSignpost1Script: ; 0x68463
	checkflag ENGINE_ZEPHYRBADGE
	iftrue UnknownScript_0x6846c
	jumpstd gymstatue1
; 0x6846c

UnknownScript_0x6846c: ; 0x6846c
	trainertotext FALKNER, 1, $1
	jumpstd gymstatue2
; 0x68473

UnknownText_0x68473: ; 0x68473
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "People say you can"
	line "clip flying-type"

	para "#MON's wings"
	line "with a jolt of"
	cont "electricity<...>"

	para "I won't allow such"
	line "insults to bird"
	cont "#MON!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done
; 0x6854a

FalknerRematchTextBefore:
	text "Welcome back."

	para "Long ago, my"
	line "father tamed the"
	
	para "three ultimate"
	line "bird #MON."

	para "You, who have"
	line "matched this feat,"
	para "stand before me,"
	line "his legacy."

	para "Let me show you"
	line "our true power!"
	done

FalknerRematchBeatenText:
	text "<...>No! Not even"
	line "the ultimate"
	cont "bird #MON<...>"
	done

FalknerAfterRematchText:
	text "A defeat is a"
	line "defeat."

	para "You are strong"
	line "indeed."

	para "I'm going to train"
	line "harder with my"
	para "#MON to become"
	line "the greatest BIRD"
	cont "KEEPER of all!"

	done

FalknerPostgameRematchText:
	text "Hello again."

	para "You've been"
	line "training, I see<...>"

	para "Do you wish to"
	line "battle again?"

	done
	
FalknerPostgameBeatenText:
	text "My bird #MON<...>"
	
	para "We still aren't"
	line "strong enough."
	done
	
FalknerPostgameAfterText:

	text "Your power is"
	line "truly fantastic!"

	para "It's no surprise"
	line "you were able to"
	
	para "tame even the"
	line "legendary #MON<...>"

	done

UnknownText_0x6854a: ; 0x6854a
	text "<...>Darn! My dad's"
	line "cherished bird"
	cont "#MON<...>"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done
; 0x685af

UnknownText_0x685af: ; 0x685af
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done
; 0x685c8

UnknownText_0x685c8: ; 0x685c8
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLY, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done
; 0x68648

UnknownText_0x68648: ; 0x68648
	text "TM31 contains"
	line "SKY ATTACK."

	para "It's the strongest"
	line "flying type"
	cont "attack!"

	para "It charges up a"
	line "tremendous power,"

	para "then focuses it"
	line "all at the foe."

	para "Use it to rule"
	line "the skies!"
	done
; 0x68735

UnknownText_0x68735: ; 0x68735
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these GYMS."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done
; 0x687cd

Bird_keeperRodSeenText: ; 0x687cd
	text "I was born and"
	line "raised in the"
	cont "KANTO region!"

	para "I flew to JOHTO"
	line "by riding on my"
	cont "bird #MON!"

	para "Think you can rise"
	line "above me? Come on!"
	done
; 0x6882f

Bird_keeperRodBeatenText: ; 0x6882f
	text "Gaaah!"
	done
; 0x68837

UnknownText_0x68837: ; 0x68837
	text "I fly on the wings"
	line "of my FEAROW!"
	done
; 0x6887f

Bird_keeperAbeSeenText: ; 0x6887f
	text "Our #MON all"
	line "come from KANTO."

	para "They're far supe-"
	line "rior to the local"
	cont "flying types."
	done
; 0x688b3

Bird_keeperAbeBeatenText: ; 0x688b3
	text "This can't be"
	line "true!"
	done
; 0x688c7

UnknownText_0x688c7: ; 0x688c7
	text "Bird #MON are"
	line "more common in the"
	cont "KANTO region!"

	para "You usually only"
	line "see HOOTHOOT"
	cont "around here<...>"
	done
; 0x688f9

VioletGymGuyText: ; 0x688f9
	text "Yo, CHAMP in the"
	line "making!"

	para "You're challenging"
	line "the GYMs in JOHTO?"

	para "The #MON here"
	line "are tougher than"
	cont "in KANTO's GYMs!"

	para "FALKNER, the GYM"
	line "LEADER, specia-"
	cont "lizes in flying-"
	cont "type #MON."

	para "If you have a team"
	line "of grass-type"

	para "#MON, you bet-"
	line "ter watch out!"
	done
; 0x689c8

VioletGymGuyWinText: ; 0x689c8
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done
; 0x68a0c

VioletGym_MapEventHeader: ; 0x68a0c
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 2, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $f, $5, 2, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapVioletGymSignpost1Script
	signpost 13, 6, $0, MapVioletGymSignpost1Script

	; people-events
	db 4
	person_event SPRITE_FALKNER, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FalknerScript_0x683c2, -1
	person_event SPRITE_YOUNGSTER, 10, 11, $8, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerBird_keeperRod, -1
	person_event SPRITE_YOUNGSTER, 14, 6, $9, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerBird_keeperAbe, -1
	person_event SPRITE_GYM_GUY, 17, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, VioletGymGuyScript, -1
; 0x68a5a

