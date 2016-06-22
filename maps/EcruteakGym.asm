EcruteakGym_MapScriptHeader: ; 0x99d49
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x99d53, $0000
	dw UnknownScript_0x99d57, $0000

	; callback count
	db 0
; 0x99d53

UnknownScript_0x99d53: ; 0x99d53
	priorityjump UnknownScript_0x99dc6
	end
; 0x99d57

UnknownScript_0x99d57: ; 0x99d57
	end
; 0x99d58

MortyScript_0x99d58: ; 0x99d58
	faceplayer
	loadfont
	checkevent EVENT_MORTY_REMATCH
	iftrue MortyAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue MortyRematchScript
	checkevent EVENT_BEAT_MORTY
	iftrue UnknownScript_0x99d8c
	writetext UnknownText_0x99e65
	waitbutton
	closetext
	winlosstext UnknownText_0x9a00a, $0000
	loadtrainer MORTY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MORTY
	loadfont
	writetext UnknownText_0x9a043
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall UnknownScript_0x99db7
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $1
	setevent EVENT_SAGE_IN_ECRUTEAK_HOUSE
	setevent EVENT_SAGE_IN_ECRUTEAK_HOUSE_2
UnknownScript_0x99d8c: ; 0x99d8c
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue UnknownScript_0x99db1
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext UnknownText_0x9a059
	buttonsound
	verbosegiveitem TM_SHADOW_CLAW, 1
	iffalse UnknownScript_0x99db5
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext UnknownText_0x9a0ec
	waitbutton
	closetext
	end
; 0x99db1

MortyAfterRematch:
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

MortyRematchScript:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse MortyReject
	writetext MortyRematchTextBefore
	waitbutton
	closetext
	winlosstext MortyRematchBeatenText, $0000
	loadtrainer MORTY, 2
	startbattle
	returnafterbattle
	setevent EVENT_MORTY_REMATCH
	loadfont
	jump MortyAfterRematch

UnknownScript_0x99db1: ; 0x99db1
	writetext UnknownText_0x9a145
	waitbutton
UnknownScript_0x99db5: ; 0x99db5
	closetext
	end
; 0x99db7

MortyReject:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse MortyRejectSuicuneInTower
	special SpecialBeastsCheck
	iffalse MortyRejectTowerClosed
	writetext MortyRejectTowerOpen
	waitbutton
	closetext
	end

MortyRejectSuicuneInTower:
	writetext MortyRejectSuicuneInTowerText
	waitbutton
	closetext
	end

MortyRejectSuicuneInTowerText:
	text "There's a distur-"
	line "bance at TIN"
	cont "TOWER."

	para "Oh? That's the"
	line "CLEAR BELL!"

	para "The sound of that"
	line "bell can tame even"

	para "the toughest of"
	line "beasts."

	para "Perhaps it may"
	line "calm the beast"
	cont "in TIN TOWER."
	done

MortyRejectTowerClosed:
	writetext MortyRejectTowerClosedText
	waitbutton
	closetext
	end


MortyRejectTowerClosedText:
	text "RAIKOU, ENTEI, and"
	line "SUICUNE<...>"

	para "The day we first"
	line "met in the BURNT"

	para "TOWER, they fled"
	line "from your pre-"
	cont "sence."

	para "Legends tell of"
	line "three #MON who"

	para "perished in the"
	line "blaze that claimed"
	cont "the tower."

	para "Perhaps<...>"

	para "Could the beasts"
	line "be reincarnations"
	cont "of those #MON?"

	para "Could the RAINBOW"
	line "#MON be wai-"
	cont "ting for their"
	cont "return?"
	done

MortyRejectTowerOpen:
	text "I<...> I can't"
	line "believe it!"

	para "It landed! The"
	line "RAINBOW #MON"
	cont "has returned!"

	para "But<...>"

	para "I admit I am not"
	line "worthy to meet"

	para "the RAINBOW #-"
	line "MON myself<...>"

	para "<PLAYER>!"

	para "You caught the 3"
	line "beasts, did you"
	cont "not?"

	para "Perhaps the"
	line "RAINBOW #MON"

	para "will appear before"
	line "you!"

	para "Go, to TIN TOWER!"

	para "Go and fulfill my"
	line "lifelong dream!"
	done

UnknownScript_0x99db7: ; 0x99db7
	if_equal $7, UnknownScript_0x99dc3
	if_equal $6, UnknownScript_0x99dc0
	end
; 0x99dc0

UnknownScript_0x99dc0: ; 0x99dc0
	jumpstd goldenrodrockets
; 0x99dc3

UnknownScript_0x99dc3: ; 0x99dc3
	jumpstd radiotowerrockets
; 0x99dc6

UnknownScript_0x99dc6: ; 0x99dc6
	applymovement $0, MovementData_0x99e5d
	applymovement $8, MovementData_0x99e63
	loadfont
	writetext UnknownText_0x9a49c
	waitbutton
	closetext
	follow $0, $8
	applymovement $0, MovementData_0x99e5f
	stopfollow
	special Function8c084
	playsound SFX_ENTER_DOOR
	waitsfx
	warp GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY, $6, $1b
	end
; 0x99de9

TrainerSageJeffrey: ; 0x99de9
	; bit/flag number
	dw $415

	; trainer group && trainer id
	db SAGE, JEFFREY

	; text when seen
	dw SageJeffreySeenText

	; text when trainer beaten
	dw SageJeffreyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageJeffreyScript
; 0x99df5

SageJeffreyScript: ; 0x99df5
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a263
	waitbutton
	closetext
	end
; 0x99dfd

TrainerSagePing: ; 0x99dfd
	; bit/flag number
	dw $416

	; trainer group && trainer id
	db SAGE, PING

	; text when seen
	dw SagePingSeenText

	; text when trainer beaten
	dw SagePingBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SagePingScript
; 0x99e09

SagePingScript: ; 0x99e09
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a2b7
	waitbutton
	closetext
	end
; 0x99e11

TrainerMediumMartha: ; 0x99e11
	; bit/flag number
	dw $58b

	; trainer group && trainer id
	db MEDIUM, MARTHA

	; text when seen
	dw MediumMarthaSeenText

	; text when trainer beaten
	dw MediumMarthaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumMarthaScript
; 0x99e1d

MediumMarthaScript: ; 0x99e1d
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a318
	waitbutton
	closetext
	end
; 0x99e25

TrainerMediumGrace: ; 0x99e25
	; bit/flag number
	dw $58c

	; trainer group && trainer id
	db MEDIUM, GRACE

	; text when seen
	dw MediumGraceSeenText

	; text when trainer beaten
	dw MediumGraceBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumGraceScript
; 0x99e31

MediumGraceScript: ; 0x99e31
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a38a
	waitbutton
	closetext
	end
; 0x99e39

EcruteakGymGuyScript: ; 0x99e39
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end
; 0x99e4d

MapEcruteakGymSignpost1Script: ; 0x99e4d
	checkflag ENGINE_FOGBADGE
	iftrue UnknownScript_0x99e56
	jumpstd gymstatue1
; 0x99e56

UnknownScript_0x99e56: ; 0x99e56
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2
; 0x99e5d

MovementData_0x99e5d: ; 0x99e5d
	step_up
	step_end
; 0x99e5f

MovementData_0x99e5f: ; 0x99e5f
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end
; 0x99e63

MovementData_0x99e63: ; 0x99e63
	slow_step_down
	step_end
; 0x99e65

UnknownText_0x99e65: ; 0x99e65
	text "Good of you to"
	line "have come."

	para "Here in ECRUTEAK,"
	line "#MON have been"
	cont "revered."

	para "It's said that a"
	line "rainbow-colored"

	para "#MON will come"
	line "down to appear"

	para "before a truly"
	line "powerful trainer."

	para "I believed that"
	line "tale, so I have"

	para "secretly trained"
	line "here all my life."

	para "As a result, I can"
	line "now see what"
	cont "others cannot."

	para "Just a bit more<...>"

	para "With a little"
	line "more, I could see"

	para "a future in which"
	line "I meet the #MON"
	cont "of rainbow colors."

	para "You're going to"
	line "help me reach that"
	cont "level!"
	done
; 0x9a00a

MortyRematchTextBefore:
	text "Welcome back,"
	line "<PLAY_G>."

	para "So the legend was"
	line "true, and HO-OH"
	cont "chose you<...>"

	para "But that does not"
	line "mean that I have"
	cont "lost out on my"
	cont "future."

	para "Show me the power"
	line "I've trained for!"
	done

MortyRematchBeatenText:
	text "How is this"
	line "possible<...>"
	done

MortyAfterRematchText:
	text "Our potentials"
	line "aren't so"
	cont "different."

	para "But you seem to"
	line "have something<...>"

	para "Something more"
	line "than that<...>"
	done

UnknownText_0x9a00a: ; 0x9a00a
	text "I'm not good"
	line "enough yet<...>"

	para "All right. This"
	line "BADGE is yours."
	done
; 0x9a043

UnknownText_0x9a043: ; 0x9a043
	text "<PLAYER> received"
	line "FOGBADGE."
	done
; 0x9a059

UnknownText_0x9a059: ; 0x9a059
	text "By having FOG-"
	line "BADGE, #MON who"
	cont "know SURF will be"
	cont "able to use that"
	cont "move anytime."

	para "I want you to have"
	line "this too."
	done
; 0x9a0ec

UnknownText_0x9a0ec: ; 0x9a0ec
	text "It's SHADOW CLAW."
	line "It causes damage"

	para "and is likely"
	line "to inflict"
	cont "critical hits."

	para "Use it if it"
	line "appeals to you."
	done
; 0x9a145

UnknownText_0x9a145: ; 0x9a145
	text "I see<...>"

	para "Your journey has"
	line "taken you to far-"
	cont "away places."

	para "And you have wit-"
	line "nessed much more"
	cont "than I."

	para "I envy you for"
	line "that<...>"
	done
; 0x9a1bd

SageJeffreySeenText: ; 0x9a1bd
	text "Unlike most"
	line "trainers here,"

	para "the bond I have"
	line "with my #MON"

	para "has been built"
	line "over a long time."

	para "That is the key"
	line "getting stronger!"
	done
; 0x9a23d

SageJeffreyBeatenText: ; 0x9a23d
	text "Wins and losses, I"
	line "experienced both."
	done
; 0x9a263

UnknownText_0x9a263: ; 0x9a263
	text "Our bond isn't"
	line "strong enough<...>"
	done
; 0x9a27e

SagePingSeenText: ; 0x9a27e
	text "Have you prepared"
	line "to face ghost-"
	cont "type #MON?"

	para "Then you are in"
	line "for a surprise!"
	done
; 0x9a2a7

SagePingBeatenText: ; 0x9a2a7
	text "Ah! Well done!"
	done
; 0x9a2b7

UnknownText_0x9a2b7: ; 0x9a2b7
	text "Only MORTY uses"
	line "ghost #MON."

	para "Still, none of"
	line "us can stand up"
	cont "against him!"
	done
; 0x9a2fb

MediumMarthaSeenText: ; 0x9a2fb
	text "Defense is the"
	line "best offense!"
	done
; 0x9a309

MediumMarthaBeatenText: ; 0x9a309
	text "Or not<...>"
	done
; 0x9a318

UnknownText_0x9a318: ; 0x9a318
	text "MORTY is powerful."

	para "He changes what"
	line "#MON he uses"
	cont "depending on the"
	cont "opponent's skill."
	done
; 0x9a33e

MediumGraceSeenText: ; 0x9a33e
	text "Dark #MON have"
	line "an advantage"
	cont "against ghost"
	cont "#MON."

	para "Someday, MORTY"
	line "will be defeated!"
	done
; 0x9a37f

MediumGraceBeatenText: ; 0x9a37f
	text "Wha-what?"
	done
; 0x9a38a

UnknownText_0x9a38a: ; 0x9a38a
	text "If I can't"
	line "defeat you<...>"

	para "How will I ever"
	line "defeat MORTY?"
	done
; 0x9a3e8

EcruteakGymGuyText: ; 0x9a3e8
	text "This gym used to"
	line "be a ghost-type"
	cont "only gym."

	para "Lately though,"
	line "it has attracted"

	para "a lot of dark-"
	line "type trainers."

	done
; 0x9a452

EcruteakGymGuyWinText: ; 0x9a452
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done
; 0x9a49c

UnknownText_0x9a49c: ; 0x9a49c
	text "MORTY, the GYM"
	line "LEADER, is absent."

	para "Sorry, but you'll"
	line "have to leave."

	para "Hohohoho."
	done
; 0x9a4e9

EcruteakGym_MapEventHeader: ; 0x9a4e9
	; filler
	db 0, 0

	; warps
	db 33
	warp_def $11, $4, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $11, $5, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $e, $4, 4, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $5, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $7, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $9, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $d, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapEcruteakGymSignpost1Script
	signpost 15, 6, $0, MapEcruteakGymSignpost1Script

	; people-events
	db 8
	person_event SPRITE_MORTY, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MortyScript_0x99d58, EVENT_SET_BY_OAK_AFTER_16_BADGES
	person_event SPRITE_SAGE, 11, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerSageJeffrey, -1
	person_event SPRITE_SAGE, 17, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerSagePing, -1
	person_event SPRITE_GRANNY, 9, 11, $8, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 1, TrainerMediumMartha, -1
	person_event SPRITE_GRANNY, 13, 11, $8, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 1, TrainerMediumGrace, -1
	person_event SPRITE_GYM_GUY, 19, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, EcruteakGymGuyScript, -1
	person_event SPRITE_GRAMPS, 18, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_MORTY_RETURNED_TO_ECRUTEAK_GYM
	person_event SPRITE_MORTY, 19, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MortyScript_0x99d58, EVENT_MORTY_IS_AT_BACK_OF_GYM
; 0x9a5f9

