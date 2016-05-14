Route3RB_MapScriptHeader: ; 0x1adf63
	; trigger count
	db 0

	; callback count
	db 0
; 0x1adf65

Route3RBSuperNerdScript:
	jumptextfaceplayer _Route3Text1

Trainer_BugCatcherGreg:
	trainer EVENT_BUG_CATCHER_GREG, BUG_CATCHER, GREG_RB, _Route3BattleText1, _Route3EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText1
	waitbutton
	closetext
	end

Trainer_YoungsterBen:
	trainer EVENT_YOUNGSTER_BEN, YOUNGSTER, BEN_RB, _Route3BattleText2, _Route3EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText2
	waitbutton
	closetext
	end

Trainer_LassJanice:
	trainer EVENT_LASS_JANICE, LASS, JANICE_RB, _Route3BattleText3, _Route3EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText3
	waitbutton
	closetext
	end

Trainer_BugCatcherColton:
	trainer EVENT_BUG_CATCHER_COLTON, BUG_CATCHER, COLTON_RB, _Route3BattleText4, _Route3EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText4
	waitbutton
	closetext
	end

Trainer_LassSally:
	trainer EVENT_LASS_SALLY, LASS, SALLY_RB, _Route3BattleText5, _Route3EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText5
	waitbutton
	closetext
	end

Trainer_YoungsterCalvin:
	trainer EVENT_YOUNGSTER_CALVIN, YOUNGSTER, CALVIN_RB, _Route3BattleText6, _Route3EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText6
	waitbutton
	closetext
	end

Trainer_BugCatcherJames:
	trainer EVENT_BUG_CATCHER_JAMES, BUG_CATCHER, JAMES_RB, _Route3BattleText7, _Route3EndBattleText7, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText7
	waitbutton
	closetext
	end

Trainer_LassRobin:
	trainer EVENT_LASS_ROBIN, LASS, ROBIN_RB, _Route3BattleText8, _Route3EndBattleText8, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route3AfterBattleText8
	waitbutton
	closetext
	end

Route3RBRocketsScript:
	applymovement $b, Route3RBMovement_HalfStepRight
	loadfont
	writetext Route3RBRocketsText1
	waitbutton
	closetext
	applymovement $c, Route3RBMovement_HalfStepLeft
	loadfont
	writetext Route3RBRocketsText2
	waitbutton
	closetext
	pause 16
	faceperson $b, $0
	faceperson $c, $0
	loadfont
	checkflag ENGINE_BOULDERBADGE
	iftrue .battle
	writetext Route3RBRocketsText3
	waitbutton
	closetext
	spriteface $b, RIGHT
	spriteface $c, LEFT
	end

.battle
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext Route3RBRocketsText4
	waitbutton
	closetext
	loadtrainer GRUNTM, 32
	winlosstext Route3RBRocketsWinText1, 0
	setlasttalked $b
	startbattle
	returnafterbattle
	playmusic MUSIC_HIKER_ENCOUNTER
	loadfont
	writetext Route3RBRocketsText5
	waitbutton
	closetext
	loadtrainer GRUNTM, 33
	winlosstext Route3RBRocketsWinText2, 0
	setlasttalked $c
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	writetext Route3RBRocketsText6
	waitbutton
	closetext
	follow $b, $c
	applymovement $b, Route3RBMovement_StepUp
	stopfollow
	disappear $b
	playsound SFX_EXIT_BUILDING
	applymovement $c, Route3RBMovement_StepUp
	disappear $c
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

Route3RBLassScript:
	checkevent EVENT_ROUTE_3_ROCKETS
	iftrue .true
	jumptextfaceplayer Route3RBLassTextBeforeRockets
.true
	jumptextfaceplayer Route3RBLassText

MapRoute3RBSignpost0Script:
	jumptext _Route3Text10

MapRoute3RBPokecenterSign:
	jumpstd pokecentersign

Route3RBMovement_HalfStepRight:
	half_step_right
	step_end

Route3RBMovement_HalfStepLeft
	half_step_left
	step_end

Route3RBMovement_StepUp
	step_up
	step_end

_Route3Text1:
	text "Whew<...> I better"
	line "take a rest<...>"
	cont "Groan<...>"

	para "That tunnel from"
	line "CERULEAN takes a"
	cont "lot out of you!"
	done

_Route3BattleText1:
	text "Hey! I met you in"
	line "VIRIDIAN FOREST!"
	done

_Route3EndBattleText1:
	text "You beat me again!"
	done

_Route3AfterBattleText1:
	text "There are other"
	line "kinds of #MON"
	cont "than those found"
	cont "in the forest!"
	done

_Route3BattleText2:
	text "Hi! I like shorts!"
	line "They're comfy and"
	cont "easy to wear!"
	done

_Route3EndBattleText2:
	text "I don't believe"
	line "it!"
	done

_Route3AfterBattleText2:
	text "Are you storing"
	line "your #MON on"
	cont "PC? Each BOX can"
	cont "hold 20 #MON!"
	done

_Route3BattleText3:
	text "You looked at me,"
	line "didn't you?"
	done

_Route3EndBattleText3:
	text "You're mean!"
	done

_Route3AfterBattleText3:
	text "Quit staring if"
	line "you don't want to"
	cont "fight!"
	done

_Route3BattleText4:
	text "Are you a trainer?"
	line "Let's fight!"
	done

_Route3EndBattleText4:
	text "If I had new"
	line "#MON, I would've"
	cont "won!"
	done

_Route3AfterBattleText4:
	text "If a #MON BOX"
	line "on the PC gets"
	cont "full, just switch"
	cont "to another BOX!"
	done

_Route3BattleText5:
	text "That look you"
	line "gave me, it's so"
	cont "intriguing!"
	done

_Route3EndBattleText5:
	text "Be nice!"
	done

_Route3AfterBattleText5:
	text "Avoid fights by"
	line "not letting"
	cont "people see you!"
	done

_Route3BattleText6:
	text "Hey! You're not"
	line "wearing shorts!"
	done

_Route3EndBattleText6:
	text "Lost! Lost! Lost!"
	done

_Route3AfterBattleText6:
	text "I always wear"
	line "shorts, even in"
	cont "winter!"
	done

_Route3BattleText7:
	text "You can fight my"
	line "new #MON!"
	done

_Route3EndBattleText7:
	text "Done like dinner!"
	done

_Route3AfterBattleText7:
	text "Trained #MON"
	line "are stronger than"
	cont "the wild ones!"
	done

_Route3BattleText8:
	text "Eek! Did you"
	line "touch me?"
	done

_Route3EndBattleText8:
	text "That's it?"
	done

_Route3AfterBattleText8:
	text "ROUTE 4 is at the"
	line "foot of MT.MOON."
	done

_Route3Text10:
	text "ROUTE 3"
	line "MT.MOON AHEAD"
	done

Route3RBRocketsText1:
	text "<...>"

	para "So BOSS wants us"
	line "to go down there"
	cont "for some dirty old"
	cont "rocks?"
	done

Route3RBRocketsText2:
	text "I don't get it"
	line "either."

	para "It's almost like he"
	line "worships them."
	done

Route3RBRocketsText3:
	text "Hey! This is a"
	line "private conver-"
	cont "sation! Get lost!"
	done

Route3RBRocketsText4:
	text "Hey! Were you"
	line "eavesdropping?"

	para "You've heard far"
	line "too much, squirt."

	para "Now prepare to"
	line "feel the wrath of"
	cont "TEAM ROCKET!"
	done

Route3RBRocketsWinText1:
	text "What the-?"
	done

Route3RBRocketsText5:
	text "Now it's my turn."
	line "I'll make you cry!"
	done

Route3RBRocketsWinText2:
	text "This power<...>"
	done

Route3RBRocketsText6:
	text "We're TEAM ROCKET."
	line "We exist to con-"
	cont "trol all #MON."

	para "You dare to meddle"
	line "in our BOSS's"
	cont "schemes?"
	cont "Bring it on!"

	para "<...> I'd say that, but"
	line "you trashed us"
	cont "good, kid. We'll"
	cont "remember you."
	done

Route3RBLassTextBeforeRockets:
	text "Those shady-"
	line "looking men<...>"

	para "What are they"
	line "talking about?"
	done

Route3RBLassText:
	text "Ouch! I tripped"
	line "over a rocky"
	cont "#MON, GEODUDE!"
	done

Route3RB_MapEventHeader: ; 0x1ae18a
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $1, $34, 1, GROUP_MT_MOON_B1F_RB, MAP_MT_MOON_B1F_RB
	warp_def $3, $2f, 1, GROUP_MOUNT_MOON_POKECENTER_1F_RB, MAP_MOUNT_MOON_POKECENTER_1F_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 49, $0, MapRoute3RBSignpost0Script
	signpost  3, 48, $0, MapRoute3RBPokecenterSign

	; people-events
	db 12
	person_event SPRITE_SUPER_NERD, 16, 56, $3, 0, 0, -1, -1, 0, 0, 0, Route3RBSuperNerdScript, -1
	person_event SPRITE_BUG_CATCHER, 8, 10, $9, 0, 0, -1, -1, 0, 2, 2, Trainer_BugCatcherGreg, -1
	person_event SPRITE_YOUNGSTER, 6, 14, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_YoungsterBen, -1
	person_event SPRITE_LASS, 11, 16, $8, 0, 0, -1, -1, 0, 2, 2, Trainer_LassJanice, -1
	person_event SPRITE_BUG_CATCHER, 7, 19, $6, 0, 0, -1, -1, 0, 2, 1, Trainer_BugCatcherColton, -1
	person_event SPRITE_LASS, 6, 23, $8, 0, 0, -1, -1, 0, 2, 4, Trainer_LassSally, -1
	person_event SPRITE_YOUNGSTER, 11, 22, $8, 0, 0, -1, -1, 0, 2, 3, Trainer_YoungsterCalvin, -1
	person_event SPRITE_BUG_CATCHER, 8, 24, $9, 0, 0, -1, -1, 0, 2, 3, Trainer_BugCatcherJames, -1
	person_event SPRITE_LASS, 17, 28, $7, 0, 0, -1, -1, 0, 2, 2, Trainer_LassRobin, -1
	person_event SPRITE_ROCKET, 6, 56, $9, 0, 0, -1, -1, 0, 0, 0, Route3RBRocketsScript, EVENT_ROUTE_3_ROCKETS
	person_event SPRITE_ROCKET, 6, 57, $8, 0, 0, -1, -1, 0, 0, 0, Route3RBRocketsScript, EVENT_ROUTE_3_ROCKETS
	person_event SPRITE_LASS, 7, 54, $4, 2, 0, -1, -1, 0, 0, 0, Route3RBLassScript, -1
; 0x1ae1ce

