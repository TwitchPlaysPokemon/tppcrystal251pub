ViridianGym_MapScriptHeader: ; 0x9aa24
	; trigger count
	db 0

	; callback count
	db 0
; 0x9aa26

BlueScript_0x9aa26: ; 0x9aa26
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue BluePostgameRematchScript
	checkevent EVENT_BLUE_REMATCH
	iftrue BlueAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue BlueRematchScript
	checkflag ENGINE_EARTHBADGE
	iftrue UnknownScript_0x9aa51
	writetext UnknownText_0x9aa7b
	waitbutton
	closetext
	winlosstext UnknownText_0x9abae, $0000
	loadtrainer BLUE, 2
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_COOLSIBS_ARA_BELLA
	setevent EVENT_BEAT_COOLSIBS_ELAN_IDA
	setevent EVENT_BEAT_COOLTRAINERM_BONITA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	loadfont
	writetext UnknownText_0x9ac0f
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext UnknownText_0x9ac27
	waitbutton
	closetext
	end

BlueRematchScript:
	checkcode VAR_DEXCAUGHT
	if_less_than 151, BlueReject
	writetext BlueRematchTextBefore
	waitbutton
	closetext
	winlosstext BlueRematchBeatenText, $0000
	loadtrainer BLUE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BLUE_REMATCH
	checkevent EVENT_GOT_RESEARCH_NOTES
	iffalse .skip
	setevent EVENT_COOLTRAINER_BLOCKING_CERULEAN_CAVE
.skip
	loadfont ;fallthrough

BlueAfterRematch:
	writetext BlueAfterRematchText
	waitbutton
	closetext
	end

BlueReject:
	writetext BlueRejectText
	waitbutton
	closetext
	end

BlueRejectText:
	text "BLUE: 3 months"
	line "ago<...>"

	para "I had a RIVAL."

	para "He was the only"
	line "TRAINER who could"
	para "match my power in"
	line "battle."

	para "If you think you"
	line "are my equal, then"
	para "conquer his grea-"
	line "test feat!"

	para "Catch 151 species"
	line "of #MON!"
	done

BlueRematchTextBefore:
	text "BLUE: You caught"
	line "plenty of #MON"
	cont "I see<...>"

	para "Just as I expec-"
	line "ted!"

	para "Now!"

	para "Let me show you"
	line "the true power of"

	para "the best of KANTO's"
	line "best!"
	done

BlueRematchBeatenText:
	text "BLUE: You're the"
	line "real deal!"
	done

BlueAfterRematchText:
	text "BLUE: You're tough,"
	line "I'll give you"
	cont "that."

	para "But there's always"
	line "someone better."

	para "You have to be"
	line "more dedicated!"

	para "Legends tell of a"
	line "truly powerful"

	para "#MON deep with-"
	line "in CERULEAN CAVE."

	para "Most trainers are"
	line "forbidden to enter"

	para "because it is so"
	line "dangerous."

	para "Even I've had trou-"
	line "ble against it."

	para "But you've proven"
	line "you can handle"
	cont "yourself."

	para "I'll call the"
	line "guard there to let"
	cont "you in."

	para "You better not"
	line "lose to that #-"
	cont "MON, you hear?"
	done

; 0x9aa51

Trainer_CoolSibsAraBella1:
	dw EVENT_BEAT_COOLSIBS_ARA_BELLA
	db COOL_SIBLINGS, ARA_BELLA1
	dw CoolSibsAraBellaSeenText1
	dw CoolSibsAraBellaBeatenText
	dw $0000
	dw CoolSibsAraBella1Script

CoolSibsAraBella1Script:
	talkaftercancel
	loadfont
	writetext CoolSibsAraBella1Text
	waitbutton
	closetext
	end

Trainer_CoolSibsAraBella2:
	dw EVENT_BEAT_COOLSIBS_ARA_BELLA
	db COOL_SIBLINGS, ARA_BELLA2
	dw CoolSibsAraBellaSeenText2
	dw CoolSibsAraBellaBeatenText
	dw $0000
	dw CoolSibsAraBella2Script

CoolSibsAraBella2Script:
	talkaftercancel
	loadfont
	writetext CoolSibsAraBella2Text
	waitbutton
	closetext
	end

Trainer_CoolSibsElanIda1:
	dw EVENT_BEAT_COOLSIBS_ELAN_IDA
	db COOL_SIBLINGS, ELAN_IDA1
	dw CoolSibsElanIdaSeenText1
	dw CoolSibsElanIdaBeatenText
	dw $0000
	dw CoolSibsElanIda1Script

CoolSibsElanIda1Script:
	talkaftercancel
	loadfont
	writetext CoolSibsElanIda1Text
	waitbutton
	closetext
	end

Trainer_CoolSibsElanIda2:
	dw EVENT_BEAT_COOLSIBS_ELAN_IDA
	db COOL_SIBLINGS, ELAN_IDA2
	dw CoolSibsElanIdaSeenText2
	dw CoolSibsElanIdaBeatenText
	dw $0000
	dw CoolSibsElanIda2Script

CoolSibsElanIda2Script:
	talkaftercancel
	loadfont
	writetext CoolSibsElanIda2Text
	waitbutton
	closetext
	end

Trainer_CooltrainerMBonita:
	dw EVENT_BEAT_COOLTRAINERM_BONITA
	db COOLTRAINERM, BONITA
	dw CooltrainerMBonitaSeenText
	dw CooltrainerMBonitaBeatenText
	dw $0000
	dw CooltrainerMBonitaScript

CooltrainerMBonitaScript:
	talkaftercancel
	loadfont
	writetext CooltrainerMBonitaText
	waitbutton
	closetext
	end

Trainer_CooltrainerFSalma:
	dw EVENT_BEAT_COOLTRAINERF_SALMA
	db COOLTRAINERF, SALMA
	dw CooltrainerFSalmaSeenText
	dw CooltrainerFSalmaBeatenText
	dw $0000
	dw CooltrainerFSalmaScript

CooltrainerFSalmaScript:
	talkaftercancel
	loadfont
	writetext CooltrainerFSalmaText
	waitbutton
	closetext
	end

UnknownScript_0x9aa51: ; 0x9aa51
	writetext UnknownText_0x9acab
	waitbutton
	closetext
	end
; 0x9aa57

ViridianGymGuyScript: ; 0x9aa57
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end
; 0x9aa6b

MapViridianGymSignpost1Script: ; 0x9aa6b
	trainertotext BLUE, 1, $1
	checkflag ENGINE_EARTHBADGE
	iftrue UnknownScript_0x9aa74
	jumpstd gymstatue1
; 0x9aa74

UnknownScript_0x9aa74: ; 0x9aa74
	jumpstd gymstatue2
; 0x9aa7b

UnknownText_0x9aa7b: ; 0x9aa7b
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "<...>"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done
; 0x9abae

UnknownText_0x9abae: ; 0x9abae
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "<...>"

	para "Tch, all right<...>"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done
; 0x9ac0f

UnknownText_0x9ac0f: ; 0x9ac0f
	text "<PLAYER> received"
	line "EARTHBADGE."
	done
; 0x9ac27

UnknownText_0x9ac27: ; 0x9ac27
	text "BLUE: <...>"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "I'm going to call"
	line "CELADON and tell"
	
	para "them they can open"
	line "the TM DEPOT for"
	cont "you."

	para "Someday I'm going"
	line "to beat you."

	para "Don't you forget"
	line "it!"
	done
; 0x9acab

UnknownText_0x9acab: ; 0x9acab
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done
; 0x9acee

ViridianGymGuyText: ; 0x9acee
	text "Yo, CHAMP!"

	para "How's it going?"

	para "The GYM LEADER is"
	line "a guy who battled"
	
	para "the CHAMPION three"
	line "months ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got,"
	
	para "because you're in"
	line "for a wild ride!"
	done
; 0x9ada0

ViridianGymGuyWinText: ; 0x9ada0
	text "Man, you are"
	line "really tough<...>"

	para "That was an"
	line "inspirational"
	cont "battle!"
	
	para "It brought tears"
	line "to my eyes!"
	done
; 0x9ae04

CooltrainerFSalmaSeenText:
	text "What do you think?"

	para "You've never seen"
	line "such a wonderful"

	para "GYM before, have"
	line "you?"
	done

CooltrainerFSalmaBeatenText:
	text "Whatever!"
	done

CooltrainerFSalmaText:
	text "There are many"
	line "kinds of GYMs in"

	para "the world, but I"
	line "really like this"
	cont "one!"
	done

CoolSibsAraBellaSeenText1:
	text "ARA: Anyway, fight"
	line "me and see!"
	done

CoolSibsAraBellaSeenText2:
	text "BELLA: Want to"
	line "know why they call"
	cont "us COOL SIBLINGS?"
	done

CoolSibsAraBellaBeatenText:
	text "ARA: I was"
	line "deceived!"

	para "BELLA: Too strong!"
	done

CoolSibsAraBella1Text:
	text "ARA: Me, I should"
	line "be a pretty good"
	cont "practice partner<...>"
	done

CoolSibsAraBella2Text:
	text "BELLA: You"
	line "shouldn't say that"
	cont "about yourself!"
	done

CoolSibsElanIdaSeenText1:
	text "IDA: I'm IDA! Next"
	line "to me is ELAN!"

	para "Together we are"
	line "COOL SIBLINGS!"
	done

CoolSibsElanIdaSeenText2:
	text "ELAN: All right,"
	line "let's get this"
	cont "fight started!"

	para "Come on!"
	done

CoolSibsElanIdaBeatenText:
	text "IDA: Wow. You're"
	line "really something."

	para "ELAN: Well, this"
	line "is surprising."
	done

CoolSibsElanIda1Text:
	text "IDA: If the only"
	line "thing GYM TRAIN-"
	cont "ERs have is"
	cont "strength, they"
	cont "won't do well."

	para "Bringing out your"
	line "opponent's"
	cont "strength is also"
	cont "important!"
	done

CoolSibsElanIda2Text:
	text "ELAN: You're"
	line "stronger than we"
	cont "anticipated!"
	done

CooltrainerMBonitaSeenText:
	text "Looking around the"
	line "room like that,"

	para "doesn't it make"
	line "you a little"
	cont "dizzy?"
	done

CooltrainerMBonitaBeatenText:
	text "All of my #MON"
	line "are dizzy<...>"
	done

CooltrainerMBonitaText:
	text "Looks like you've"
	line "still got some"
	cont "energy left."
	done

BluePostgameRematchScript:
    writetext BluePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer BLUE, 2
    winlosstext CooltrainerFSalmaBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext BluePostgameAfterText
    waitbutton
.return
    closetext
    end

BluePostgameRematchText:
	text "BLUE: Yo CHAMP."
	
	para "What are you doing"
	line "back here?"
	
	para "Couldn't get"
	line "enough of my wild"
	cont "GYM maze? Haha!"
	
	para "<...>Oh! You want"
	line "a rematch?"
	done

BluePostgameAfterText:
	text "BLUE: Well, what"
	line "can I say?"

	para "You're stronger"
	line "than I've ever"
	cont "been."

	para "I can see now why"
	line "you're still the"
	cont "CHAMPION!"
	done
	
ViridianGym_MapEventHeader: ; 0x9ae04
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $2d, $6, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $2d, $7, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 43, 5, $0, MapViridianGymSignpost1Script
	signpost 43, 8, $0, MapViridianGymSignpost1Script

	; people-events
	db 8
	person_event SPRITE_BLUE, 7, 11, $6, 0, 0, -1, -1, 0, 0, 0, BlueScript_0x9aa26, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_GYM_GUY, 45, 12, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianGymGuyScript, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 12, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsElanIda1, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 12, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsElanIda2, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 24, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CooltrainerMBonita, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 38, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CooltrainerFSalma, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 39, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsAraBella1, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 39, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsAraBella2, EVENT_BLUE_IN_HIS_GYM
; 0x9ae38

