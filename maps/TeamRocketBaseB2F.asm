TeamRocketBaseB2F_MapScriptHeader: ; 0x6cf70
	; trigger count
	db 4

	; triggers
	dw UnknownScript_0x6cf85, $0000
	dw UnknownScript_0x6cf86, $0000
	dw UnknownScript_0x6cf87, $0000
	dw UnknownScript_0x6cf88, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x6cf89
; 0x6cf85

UnknownScript_0x6cf85: ; 0x6cf85
	end
; 0x6cf86

UnknownScript_0x6cf86: ; 0x6cf86
	end
; 0x6cf87

UnknownScript_0x6cf87: ; 0x6cf87
	end
; 0x6cf88

UnknownScript_0x6cf88: ; 0x6cf88
	end
; 0x6cf89

UnknownScript_0x6cf89: ; 0x6cf89
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue UnknownScript_0x6cf90
	return
; 0x6cf90

UnknownScript_0x6cf90: ; 0x6cf90
	changeblock $e, $c, $7
	return
; 0x6cf95

UnknownScript_0x6cf95: ; 0x6cf95
	moveperson $4, $9, $d
	jump UnknownScript_0x6cfac
; 0x6cf9c

UnknownScript_0x6cf9c: ; 0x6cf9c
	moveperson $3, $15, $10
	moveperson $2, $15, $10
	moveperson $5, $a, $d
	moveperson $4, $a, $d
UnknownScript_0x6cfac: ; 0x6cfac
	appear $3
	appear $2
	loadfont
	writetext UnknownText_0x6d2ad
	waitbutton
	closetext
	spriteface $0, $0
	showemote $0, $0, 15
	applymovement $0, MovementData_0x6d21f
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement $3, MovementData_0x6d224
	spriteface $0, $1
	applymovement $2, MovementData_0x6d22f
	loadfont
	writetext UnknownText_0x6d2c3
	waitbutton
	closetext
	cry DRAGONITE
	spriteface $3, $2
	spriteface $0, $2
	appear $5
	applymovement $5, MovementData_0x6d236
	applymovement $3, MovementData_0x6d23b
	applymovement $2, MovementData_0x6d24c
	appear $4
	applymovement $4, MovementData_0x6d244
	loadfont
	writetext UnknownText_0x6d38c
	waitbutton
	closetext
	spriteface $0, $3
	applymovement $3, MovementData_0x6d241
	loadfont
	writetext UnknownText_0x6d3bd
	waitbutton
	closetext
	applymovement $2, MovementData_0x6d24a
	applymovement $3, MovementData_0x6d248
	winlosstext UnknownText_0x6d45c, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEF, 2
	startbattle
	disappear $5
	setevent EVENT_EXECUTIVEF_IN_ROCKET_BASE_B2F
	setevent EVENT_ROCKET_WHO_FIGHTS_LANCE_IN_ROCKET_BASE_B2F
	setevent EVENT_LANCE_IN_ROCKET_BASE_B2F
	returnafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_570
	loadfont
	writetext UnknownText_0x6d4c6
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $2
	disappear $3
	disappear $c
	disappear $d
	disappear $e
	pause 15
	special Function8c0ab
	dotrigger $2
	clearevent EVENT_LANCE_IN_ROCKET_BASE_B2F
	spriteface $4, $0
	loadfont
	writetext UnknownText_0x6d5d8
	waitbutton
	closetext
	applymovement $4, MovementData_0x6d250
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x6d64e
	waitbutton
	closetext
	follow $4, $0
	applymovement $4, MovementData_0x6d254
	stopfollow
	applymovement $4, MovementData_0x6d258
	loadfont
	writetext UnknownText_0x6d6cf
	waitbutton
	closetext
	applymovement $4, MovementData_0x6d267
	disappear $4
; 0x6d075

UnknownScript_0x6d075: ; 0x6d075
	applymovement $0, MovementData_0x6d271
	end
; 0x6d07a

UnknownScript_0x6d07a: ; 0x6d07a
	loadfont
	writetext UnknownText_0x6d7ea
	waitbutton
	closetext
	applymovement $0, MovementData_0x6d278
	end
; 0x6d085

UnknownScript_0x6d085: ; 0x6d085
	spriteface $0, $1
	jump UnknownScript_0x6d091
; 0x6d08b

UnknownScript_0x6d08b: ; 0x6d08b
	spriteface $0, $3
	spriteface $4, $2
UnknownScript_0x6d091: ; 0x6d091
	loadfont
	writetext UnknownText_0x6da97
	waitbutton
	closetext
	special Function8c084
	special Function1060a2
	playsound SFX_FULL_HEAL
	special HealParty
	special Function8c079
	loadfont
	writetext UnknownText_0x6daf7
	waitbutton
	closetext
	dotrigger $1
	setevent EVENT_HEALED_BY_LANCE_ROCKET_BASE
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x6d0be
	applymovement $4, MovementData_0x6d212
	disappear $4
	end
; 0x6d0be

UnknownScript_0x6d0be: ; 0x6d0be
	applymovement $4, MovementData_0x6d219
	disappear $4
	end
; 0x6d0c5

TrainerGruntM17: ; 0x6d0c5
	; bit/flag number
	dw $501

	; trainer group && trainer id
	db GRUNTM, 17

	; text when seen
	dw GruntM17SeenText

	; text when trainer beaten
	dw GruntM17BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM17Script
; 0x6d0d1

GruntM17Script: ; 0x6d0d1
	talkaftercancel
	loadfont
	writetext UnknownText_0x6db88
	waitbutton
	closetext
	end
; 0x6d0d9

TrainerGruntM18: ; 0x6d0d9
	; bit/flag number
	dw $502

	; trainer group && trainer id
	db GRUNTM, 18

	; text when seen
	dw GruntM18SeenText

	; text when trainer beaten
	dw GruntM18BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM18Script
; 0x6d0e5

GruntM18Script: ; 0x6d0e5
	talkaftercancel
	loadfont
	writetext UnknownText_0x6dc1a
	waitbutton
	closetext
	end
; 0x6d0ed

TrainerGruntM19: ; 0x6d0ed
	; bit/flag number
	dw $503

	; trainer group && trainer id
	db GRUNTM, 19

	; text when seen
	dw GruntM19SeenText

	; text when trainer beaten
	dw GruntM19BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM19Script
; 0x6d0f9

GruntM19Script: ; 0x6d0f9
	talkaftercancel
	loadfont
	writetext UnknownText_0x6dcd1
	waitbutton
	closetext
	end
; 0x6d101

VoltorbScript_0x6d101: ; 0x6d101
	cry ELECTRODE
	loadpokedata ELECTRODE, 40
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $6
	disappear $9
	checkevent EVENT_ROCKET_BASE_ELECTRODE_1
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_2
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_3
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special PlayMapMusic
	applymovement $0, MovementData_0x6d28c
	jump UnknownScript_0x6d184
; 0x6d12c

VoltorbScript_0x6d12c: ; 0x6d12c
	cry ELECTRODE
	loadpokedata ELECTRODE, 40
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $7
	disappear $a
	checkevent EVENT_ROCKET_BASE_ELECTRODE_1
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_2
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_3
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special PlayMapMusic
	applymovement $0, MovementData_0x6d299
	jump UnknownScript_0x6d184
; 0x6d157

VoltorbScript_0x6d157: ; 0x6d157
	cry ELECTRODE
	loadpokedata ELECTRODE, 40
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $8
	disappear $b
	checkevent EVENT_ROCKET_BASE_ELECTRODE_1
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_2
	iffalse UnknownScript_0x6d182
	checkevent EVENT_ROCKET_BASE_ELECTRODE_3
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special PlayMapMusic
	applymovement $0, MovementData_0x6d2a4
	jump UnknownScript_0x6d184
; 0x6d182

UnknownScript_0x6d182: ; 0x6d182
	returnafterbattle
	end
; 0x6d184

UnknownScript_0x6d184: ; 0x6d184
	moveperson $4, $12, $6
	appear $4
	applymovement $4, MovementData_0x6d27a
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x6d809
	buttonsound
	verbosegiveitem HM_SURF, 1
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext UnknownText_0x6d8f8
	waitbutton
	closetext
	spriteface $4, $0
	loadfont
	writetext UnknownText_0x6d994
	waitbutton
	closetext
	spriteface $0, $0
	applymovement $4, MovementData_0x6d283
	disappear $4
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROCKETS_IN_ROUTE_43_GATE
	setevent EVENT_FISHER_BLOCKING_GYM_IN_MAHOGANY_TOWN
	dotrigger $3
	clearevent EVENT_LAKE_OF_RAGE_TRAINERS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SUPER_NERD
	end
; 0x6d1d7

MapTeamRocketBaseB2FSignpostPtr1: ; 0x6d1d7
	dw $0300
	dw MapTeamRocketBaseB2FSignpost1Script

; 0x6d1db

MapTeamRocketBaseB2FSignpost1Script: ; 0x6d1db
	loadfont
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue UnknownScript_0x6d1e8
	writetext UnknownText_0x6dd39
	waitbutton
	closetext
	end
; 0x6d1e8

UnknownScript_0x6d1e8: ; 0x6d1e8
	writetext UnknownText_0x6dd6b
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock $e, $c, $7
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end
; 0x6d1fa

MapTeamRocketBaseB2FSignpost21Script: ; 0x6d1fa
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x6d207
	writetext UnknownText_0x6dda7
	waitbutton
	closetext
	end
; 0x6d207

UnknownScript_0x6d207: ; 0x6d207
	writetext UnknownText_0x6de03
	waitbutton
	closetext
	end
; 0x6d20d

ItemFragment_0x6d20d: ; 0x6d20d
	db TM_DARK_PULSE, 1
; 0x6d20f

MapTeamRocketBaseB2FSignpostItem22: ; 0x6d20f
	dw $0087
	db FULL_HEAL

; 0x6d212

MovementData_0x6d212: ; 0x6d212
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d219

MovementData_0x6d219: ; 0x6d219
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d21f

MovementData_0x6d21f: ; 0x6d21f
	step_down
	step_down
	step_down
	turn_head_right
	step_end
; 0x6d224

MovementData_0x6d224: ; 0x6d224
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	turn_head_down
	step_end
; 0x6d22f

MovementData_0x6d22f: ; 0x6d22f
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x6d236

MovementData_0x6d236: ; 0x6d236
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6d23b

MovementData_0x6d23b: ; 0x6d23b
	fix_facing
	db $39 ; movement
	jump_step_right
	db $38 ; movement
	remove_fixed_facing
	step_end
; 0x6d241

MovementData_0x6d241: ; 0x6d241
	slow_step_down
	turn_head_left
	step_end
; 0x6d244

MovementData_0x6d244: ; 0x6d244
	step_right
	step_right
	step_right
	step_end
; 0x6d248

MovementData_0x6d248: ; 0x6d248
	big_step_left
	step_end
; 0x6d24a

MovementData_0x6d24a: ; 0x6d24a
	big_step_left
	step_end
; 0x6d24c

MovementData_0x6d24c: ; 0x6d24c
	big_step_left
	big_step_up
	turn_head_left
	step_end
; 0x6d250

MovementData_0x6d250: ; 0x6d250
	step_right
	step_right
	turn_head_down
	step_end
; 0x6d254

MovementData_0x6d254: ; 0x6d254
	step_up
	step_up
	step_up
	step_end
; 0x6d258

MovementData_0x6d258: ; 0x6d258
	accelerate_last
	step_left
	step_left
	turn_head_up
	accelerate_last
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	accelerate_last
	step_left
	step_left
	turn_head_down
	step_end
; 0x6d267

MovementData_0x6d267: ; 0x6d267
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x6d271

MovementData_0x6d271: ; 0x6d271
	step_up
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x6d278

MovementData_0x6d278: ; 0x6d278
	step_left
	step_end
; 0x6d27a

MovementData_0x6d27a: ; 0x6d27a
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end
; 0x6d283

MovementData_0x6d283: ; 0x6d283
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x6d28c

MovementData_0x6d28c: ; 0x6d28c
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d299

MovementData_0x6d299: ; 0x6d299
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d2a4

MovementData_0x6d2a4: ; 0x6d2a4
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d2ad

UnknownText_0x6d2ad: ; 0x6d2ad
	text "Hold it right"
	line "there!"
	done
; 0x6d2c3

UnknownText_0x6d2c3: ; 0x6d2c3
	text "We can't have a"
	line "brat like you on"
	cont "the loose."

	para "It's harmful to"
	line "TEAM ROCKET's"
	cont "pride, you see."

	para "However strong you"
	line "may be, you can't"

	para "take both of us at"
	line "the same time."

	para "Sorry, baby. Now"
	line "get ready to be"
	cont "thrashed."
	done
; 0x6d38c

UnknownText_0x6d38c: ; 0x6d38c
	text "Hey! Don't be so"
	line "selfish. Spread"
	cont "the fun around."
	done
; 0x6d3bd

UnknownText_0x6d3bd: ; 0x6d3bd
	text "What? You had an"
	line "accomplice?"

	para "Where is your"
	line "sense of honor?"

	para "As the interim"
	line "boss in place of"

	para "GIOVANNI, I'll"
	line "show you how wrong"

	para "it is to meddle"
	line "with TEAM ROCKET!"
	done
; 0x6d45c

UnknownText_0x6d45c: ; 0x6d45c
	text "Tch, you really"
	line "are strong."

	para "It's too bad."

	para "If you were to"
	line "join TEAM ROCKET,"

	para "you could become"
	line "an EXECUTIVE."
	done
; 0x6d4c6

UnknownText_0x6d4c6: ; 0x6d4c6
	text "<...>This hideout is"
	line "done for<...>"

	para "But that's fine."
	line "The broadcast ex-"
	cont "periment was a"
	cont "total success."

	para "It doesn't matter"
	line "what happens to"
	cont "this hideout now."

	para "We have much big-"
	line "ger plans."

	para "You'll come to"
	line "appreciate TEAM"

	para "ROCKET's true"
	line "power soon enough."

	para "Enjoy yourself"
	line "while you can<...>"

	para "Fufufufu<...>"
	done
; 0x6d5d8

UnknownText_0x6d5d8: ; 0x6d5d8
	text "LANCE: That did"
	line "it. We defeated"

	para "all of the"
	line "ROCKETS here."

	para "But I'm concerned"
	line "about the young"

	para "guy I battled in"
	line "the process<...>"
	done
; 0x6d64e

UnknownText_0x6d64e: ; 0x6d64e
	text "Sorry, <PLAY_G>."
	line "I saw how well you"

	para "were doing, so I"
	line "just hung back."

	para "Now all there is"
	line "left to do is to"

	para "turn off that odd"
	line "radio signal."
	done
; 0x6d6cf

UnknownText_0x6d6cf: ; 0x6d6cf
	text "It's this machine"
	line "that's causing all"
	cont "the problems."

	para "I don't see a"
	line "switch on it<...>"

	para "We have no choice."
	line "We have to make"

	para "all of the"
	line "ELECTRODE faint."

	para "That should stop"
	line "this machine from"

	para "transmitting that"
	line "strange signal."

	para "It's no fault of"
	line "the #MON, so it"

	para "makes me feel"
	line "guilty."

	para "<PLAY_G>, let's"
	line "split the job."
	done
; 0x6d7ea

UnknownText_0x6d7ea: ; 0x6d7ea
	text "LANCE: Leave this"
	line "side to me."
	done
; 0x6d809

UnknownText_0x6d809: ; 0x6d809
	text "LANCE: That odd"
	line "signal has finally"
	cont "stopped."

	para "The LAKE should be"
	line "back to normal."

	para "You're the hero!"
	line "Let me thank you"

	para "on behalf of all"
	line "the #MON."

	para "Oh, yes. You"
	line "should take this."

	para "I found it a"
	line "while back but I"
	cont "don't have any need"
	cont "for it."
	done
; 0x6d8e6

UnknownText_0x6d8e6: ; 0x6d8e6
	text "<PLAYER> received"
	line "HM03."
	done
; 0x6d8f8

UnknownText_0x6d8f8: ; 0x6d8f8
	text "That's SURF."
	line "Teach it to a"

	para "#MON to get"
	line "across water."

	para "But keep this in"
	line "mind."

	para "You can use that"
	line "out of battle only"

	para "with the BADGE"
	line "from ECRUTEAK GYM."
	done
; 0x6d994

UnknownText_0x6d994: ; 0x6d994
	text "<PLAY_G><...>"

	para "The journey to be-"
	line "coming the #MON"

	para "MASTER is long and"
	line "difficult."

	para "Knowing that, will"
	line "you keep going?"

	para "<...>"

	para "I see. No, you're"
	line "right."

	para "If you would give"
	line "up that easily,"

	para "you would have"
	line "never chased that"

	para "dream in the first"
	line "place."

	para "I look forward to"
	line "seeing you again!"
	done
; 0x6da97

UnknownText_0x6da97: ; 0x6da97
	text "LANCE: Are you all"
	line "right?"

	para "Your #MON are"
	line "hurt and tired."

	para "Here, give them"
	line "some of my medi-"
	cont "cine."
	done
; 0x6daf7

UnknownText_0x6daf7: ; 0x6daf7
	text "LANCE: <PLAY_G>,"
	line "let's give it our"
	cont "best for #MON."
	done
; 0x6db22

GruntM17SeenText: ; 0x6db22
	text "Have you ever"
	line "heard about"
	cont "'night bat'?"

	para "ZUBAT family is"
	line "common at night!"
	done
; 0x6db79

GruntM17BeatenText: ; 0x6db79
	text "Bringing bats"
	line "inside wasn't"
	cont "a good idea<...>"
	done
; 0x6db88

UnknownText_0x6db88: ; 0x6db88
	text "ZUBAT family cons-"
	line "ists of poison-"
	cont "type #MON."

	para "They are weak to"
	line "psychic-type"
	cont "#MON like"
	cont "STARMIE."
	done
; 0x6dbca

GruntM18SeenText: ; 0x6dbca
	text "I'll teach you"
	line "a thing or two"

	para "about #MON"
	line "evolution!"
	done
; 0x6dc09

GruntM18BeatenText: ; 0x6dc09
	text "Not even close<...>"
	done
; 0x6dc1a

UnknownText_0x6dc1a: ; 0x6dc1a
	text "If you try to"
	line "evolve by grinding"
	cont "your #MON,"

	para "it can be easy"
	line "to cancel it."

	para "This isn't the"
	line "case if you use"
	cont "a RARE CANDY."

	para "ONIX doesn't"
	line "evolve by leveling"
	cont "up alone, though."
	done
; 0x6dcb0

GruntM19SeenText: ; 0x6dcb0
	text "You rotten little"
	line "pest!"
	done
; 0x6dcc9

GruntM19BeatenText: ; 0x6dcc9
	text "Grrrr<...>"
	done
; 0x6dcd1

UnknownText_0x6dcd1: ; 0x6dcd1
	text "Heh, only the boss"
	line "knows the password"
	cont "for that door."

	para "Where's the boss?"
	line "Who knows? Go look"
	cont "for yourself."
	done
; 0x6dd39

UnknownText_0x6dd39: ; 0x6dd39
	text "The door's closed<...>"

	para "It needs a pass-"
	line "word to open."
	done
; 0x6dd6b

UnknownText_0x6dd6b: ; 0x6dd6b
	text "The door's closed<...>"

	para "<PLAYER> entered"
	line "the password."

	para "The door opened!"
	done
; 0x6dda7

UnknownText_0x6dda7: ; 0x6dda7
	text "It's the radio"
	line "transmitter that's"

	para "sending the"
	line "sinister signal."

	para "It's working at"
	line "full capacity."
	done
; 0x6de03

UnknownText_0x6de03: ; 0x6de03
	text "The radio trans-"
	line "mitter has finally"

	para "stopped its evil"
	line "broadcast."
	done
; 0x6de44

TeamRocketBaseB2F_MapEventHeader: ; 0x6de44
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $e, $3, 2, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F
	warp_def $2, $3, 1, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $2, $1b, 2, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $6, $3, 3, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $e, $1b, 4, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F

	; xy triggers
	db 9
	xy_trigger 0, $e, $5, $0, UnknownScript_0x6d085, $0, $0
	xy_trigger 0, $d, $4, $0, UnknownScript_0x6d08b, $0, $0
	xy_trigger 1, $b, $e, $0, UnknownScript_0x6cf95, $0, $0
	xy_trigger 1, $b, $f, $0, UnknownScript_0x6cf9c, $0, $0
	xy_trigger 2, $c, $e, $0, UnknownScript_0x6d075, $0, $0
	xy_trigger 2, $c, $f, $0, UnknownScript_0x6d075, $0, $0
	xy_trigger 2, $3, $c, $0, UnknownScript_0x6d07a, $0, $0
	xy_trigger 2, $a, $c, $0, UnknownScript_0x6d07a, $0, $0
	xy_trigger 2, $b, $c, $0, UnknownScript_0x6d07a, $0, $0

	; signposts
	db 23
	signpost 12, 14, $6, MapTeamRocketBaseB2FSignpostPtr1
	signpost 12, 15, $6, MapTeamRocketBaseB2FSignpostPtr1
	signpost 9, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 16, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 15, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 14, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 13, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 8, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 6, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 5, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 13, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 14, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 15, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 16, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 5, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 6, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 8, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 26, $7, MapTeamRocketBaseB2FSignpostItem22

	; people-events
	db 14
	person_event SPRITE_ROCKET, 20, 24, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_WHO_FIGHTS_LANCE_IN_ROCKET_BASE_B2F
	person_event SPRITE_ROCKET_GIRL, 20, 24, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ObjectEvent, EVENT_EXECUTIVEF_IN_ROCKET_BASE_B2F
	person_event SPRITE_LANCE, 17, 9, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_LANCE_IN_ROCKET_BASE_B2F
	person_event SPRITE_DRAGON, 17, 13, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_DRAGONITE_IN_ROCKET_BASE_B2F
	person_event SPRITE_VOLTORB, 9, 11, $16, 0, 0, -1, -1, 0, 0, 0, VoltorbScript_0x6d101, EVENT_ROCKET_BASE_ELECTRODE_1
	person_event SPRITE_VOLTORB, 11, 11, $16, 0, 0, -1, -1, 0, 0, 0, VoltorbScript_0x6d12c, EVENT_ROCKET_BASE_ELECTRODE_2
	person_event SPRITE_VOLTORB, 13, 11, $16, 0, 0, -1, -1, 0, 0, 0, VoltorbScript_0x6d157, EVENT_ROCKET_BASE_ELECTRODE_3
	person_event SPRITE_VOLTORB, 9, 26, $16, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_BASE_ELECTRODE_1
	person_event SPRITE_VOLTORB, 11, 26, $16, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_BASE_ELECTRODE_2
	person_event SPRITE_VOLTORB, 13, 26, $16, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_BASE_ELECTRODE_3
	person_event SPRITE_ROCKET, 17, 29, $6, 0, 0, -1, -1, 0, 2, 3, TrainerGruntM17, EVENT_ROCKETS_POPULATE_ROCKET_BASE
	person_event SPRITE_ROCKET, 5, 8, $a, 0, 0, -1, -1, 0, 2, 1, TrainerGruntM18, EVENT_ROCKETS_POPULATE_ROCKET_BASE
	person_event SPRITE_ROCKET, 18, 25, $8, 0, 0, -1, -1, 0, 2, 4, TrainerGruntM19, EVENT_ROCKETS_POPULATE_ROCKET_BASE
	person_event SPRITE_POKE_BALL, 14, 7, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x6d20d, EVENT_ITEM_TEAM_ROCKET_BASE_B2F_TM_THIEF
; 0x6dfd4

