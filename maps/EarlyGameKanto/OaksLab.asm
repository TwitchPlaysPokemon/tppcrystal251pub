OaksLabRB_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 5
	dw .Trigger0, $0000
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000
	dw .Trigger4, $0000

	; callback count
	db 1
	dbw 4, .SetSprites
; 0x19b3c7
.Trigger0:
	end

.Trigger1:
	priorityjump WalkUpWithOak
	end

.Trigger2:
	end

.Trigger3:
	end

.Trigger4:
	end

.SetSprites:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .skip
	spriteface $2, UP
	moveperson $2, $5, $a
.skip
	return

WalkUpWithOak:
	follow $2, $0
	applymovement $2, MovementData_OakWalksUp
	stopfollow
	spriteface $2, DOWN
	spriteface $6, UP
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_1
	writetext _OaksLabRivalWaitingTextF
	jump .done_text_1

.male_rival_1
	writetext _OaksLabRivalWaitingText
.done_text_1
	waitbutton
	closetext
	loadfont
	writetext _OaksLabChooseMonText
	waitbutton
	closetext
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _OaksLabRivalInterjectionTextF
	jump .done_text_2

.male_rival_2
	writetext _OaksLabRivalInterjectionText
.done_text_2
	waitbutton
	closetext
	loadfont
	writetext _OaksLabBePatientText
	waitbutton
	closetext
	dotrigger $2
	end

CharmanderPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	spriteface $2, DOWN
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabCharmanderText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $7
	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .facing_right
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	jump .RivalPicksMon

.facing_right
	applymovement $6, Movement_RivalTakesOneStepDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	spriteface $6, UP
.RivalPicksMon
	scall OaksLab_PrintRivalPickingMonText
	pokenamemem SQUIRTLE, $1
	disappear $8
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

BulbasaurPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabBulbasaurText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $9
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5
	closetext
	applymovement $6, Movement_RivalTakesOneStepDown
	applymovement $6, Movement_RivalTakesTwoStepsRight
	spriteface $6, UP
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem CHARMANDER, $1
	disappear $7
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

SquirtlePokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabSquirtleText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $8
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesFourStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem BULBASAUR, $1
	disappear $9
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

OaksLab_PrintRivalPickingMonText:
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalPickingMonTextF
	buttonsound
	end

.male_rival
	writetext _OaksLabRivalPickingMonText
	buttonsound
	end

OaksLabRB_DidntChooseStarterScript:
	closetext
	end

OaksLab_LastMonScript:
	jumptext _OaksLabLastMonText

OaksLab_LookAtPokeballScript:
	jumptext _OaksLabText39

OaksLab_RivalBattleTriggerLeft:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesFourStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepRight
	spriteface $0, RIGHT
	jump OaksLab_RivalFinishesLeaving

OaksLab_RivalBattleTriggerRight:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesOneStepLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepLeft
	spriteface $0, LEFT
	jump OaksLab_RivalFinishesLeaving
OaksLab_RivalBattleIntroScript:
	setlasttalked $6
	playmusic MUSIC_RIVAL_RB
	spriteface $6, DOWN
	spriteface $2, DOWN
	spriteface $0, UP
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalChallengeTextF
	jump .done_text

.male_rival
	writetext _OaksLabRivalChallengeText
.done_text
	waitbutton
	closetext
	end

OaksLab_DoRivalBattle:
	winlosstext _OaksLabText_1d3be, _OaksLabText_1d3c3
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext _OaksLabText_1d3beF, _OaksLabText_1d3c3F
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	special RestartMapMusic
	special HealParty
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext _OaksLabRivalToughenUpTextF
	jump .done_text

.male_rival
	writetext _OaksLabRivalToughenUpText
.done_text
	waitbutton
	closetext
	setevent EVENT_RB_BEAT_RIVAL_IN_LAB
	playmusic MUSIC_RIVAL_AFTER_RB
	end

OaksLab_RivalFinishesLeaving:
	applymovement $6, Movement_RivalTakesTwoStepsDown
	spriteface $0, DOWN
	applymovement $6, Movement_RivalTakesFourStepsDown
	disappear $6
	playsound SFX_EXIT_BUILDING
	waitsfx
	special RestartMapMusic
	dotrigger $4
	end

OakScript_OaksLabRB:
	checkflag ENGINE_POKEDEX
	iftrue .RatePokedex
	checkevent EVENT_GOT_PARCEL
	iftrue .GivePokedex
	checkevent EVENT_RB_BEAT_RIVAL_IN_LAB
	iftrue .AfterRivalBattle
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f0
.BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f5
.AfterRivalBattle
	jumptextfaceplayer _OaksLabText_1d2fa
.RatePokedex
	faceplayer
	loadfont
	checkevent EVENT_001_STD
	iftrue .AroundTheWorld
	writetext _OaksLabText_1d31d
	waitbutton
	special ProfOaksPCBoot
	closetext
	end

.AroundTheWorld
	writetext _OaksLabAroundWorldText
	waitbutton
	closetext
	end

.GivePokedex
	setevent EVENT_001_STD
	faceplayer
	loadfont
	writetext _OaksLabDeliverParcelText1
	playsound SFX_KEY_ITEM
	waitsfx
	buttonsound
	takeitem OAKS_PARCEL, 1
	writetext _OaksLabDeliverParcelText2
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_RB
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_1
	writetext _OaksLabText21F
	jump .done_text_1

.male_rival_1
	writetext _OaksLabText21
.done_text_1
	waitbutton
	closetext
	spriteface $2, DOWN
	checkcode VAR_FACING
	if_equal UP, .rivalwalksfivesteps
	if_equal DOWN, .rivalwalksthreesteps
	moveperson $6, 4, 7
	appear $6
	applymovement $6, Movement_RivalTakesFourStepsUp
	jump .continuewithdex
.rivalwalksthreesteps
	moveperson $6, 4, 6
	appear $6
	applymovement $6, Movement_RivalTakesThreeStepsUp
	jump .continuewithdex
.rivalwalksfivesteps
	moveperson $6, 4, 8
	appear $6
	applymovement $6, Movement_RivalTakesFiveStepsUp
.continuewithdex
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _OaksLabText22F
	jump .done_text_2

.male_rival_2
	writetext _OaksLabText22
.done_text_2
	waitbutton
	closetext
	loadfont
	writetext _OaksLabText23
	buttonsound
	writetext _OaksLabText24
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .right
	applymovement $2, OaksLabMovement_OakGrabsDexes
	pause 8
	disappear $a
	pause 2
	disappear $b
	pause 8
	applymovement $2, OaksLabMovement_OakReturnsWithDexes
	jump .finish_giving_dex

.right
	applymovement $2, OaksLabMovement_OakGrabsDexes2
	spriteface $0, LEFT
	spriteface $6, LEFT
	pause 8
	disappear $a
	pause 2
	disappear $b
	pause 8
	spriteface $2, RIGHT
.finish_giving_dex
	loadfont
	writetext _OaksLabText25
	setflag ENGINE_POKEDEX
	setevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_LYING_DOWN
	clearevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
	domaptrigger GROUP_ROUTE_22_RB, MAP_ROUTE_22_RB, $1
	domaptrigger GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB, $1
	clearevent EVENT_RIVAL_ROUTE_22_RB
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	writetext _OaksLabGivePokeballsText1
	giveitem POKE_BALL, 5
	playsound SFX_ITEM
	waitsfx
	waitbutton
	writetext _OaksLabGivePokeballsText2
	buttonsound
	itemnotify
	writetext _OaksLabText26
	waitbutton
	closetext
	faceperson $0, $6
	faceperson $6, $0
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_3
	writetext _OaksLabText27F
	jump .done_text_3

.male_rival_3
	writetext _OaksLabText27
.done_text_3
	waitbutton
	closetext
	spriteface $0, DOWN
	playmusic MUSIC_RIVAL_AFTER_RB
	applymovement $6, Movement_RivalTakesSixStepsDown
	disappear $6
	playsound SFX_EXIT_BUILDING
	waitsfx
	special RestartMapMusic
	end

BlueScript_OaksLabRB:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .MyMonIsTheBest
	checkevent EVENT_OAKS_LAB_OAK
	iffalse .HurryUpAndChoose
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male1
	jumptextfaceplayer _OaksLabGaryText1F
.male1
	jumptextfaceplayer _OaksLabGaryText1

.HurryUpAndChoose
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male2
	jumptextfaceplayer _OaksLabText40F
.male2
	jumptextfaceplayer _OaksLabText40

.MyMonIsTheBest
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male3
	jumptextfaceplayer _OaksLabText41F
.male3
	jumptextfaceplayer _OaksLabText41

OaksLabRB_WaitComeBack:
	spriteface $0, UP
	loadfont
	writetext _OaksLabLeavingText
	waitbutton
	closetext
	applymovement $0, Movement_PlayerTakesOneStepUp
	end

BlankEncyclopoediaScript:
	jumptext _OaksLabText_1d32c

Scientist1Script_OaksLabRB:
Scientist2Script_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d405

LassScript_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d340

MapOaksLabRBSignpost11Script:
	jumpstd difficultbookshelf

MapOaksLabRBSignpost15Script:
	jumptext _OakLabEmailText

MapOaksLabRBSignpost12Script:
	jumptext _PushStartText

MapOaksLabRBSignpost13Script:
	checkcode VAR_DEXCAUGHT
	if_less_than 2, .saveoption
	jumptext _StrengthsAndWeaknessesText
.saveoption
	jumptext _SaveOptionText

MapOaksLabRBSignpost14Script
	jumpstd trashcan


Movement_RivalTakesFiveStepsUp:
	slow_step_up
Movement_RivalTakesFourStepsUp:
	slow_step_up
Movement_RivalTakesThreeStepsUp:
	slow_step_up
Movement_RivalTakesTwoStepsUp:
	slow_step_up
Movement_RivalTakesOneStepUp:
	slow_step_up
	step_end

MovementData_OakWalksUp:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
Movement_PlayerTakesOneStepUp:
	step_up
	step_end

OaksLabMovement_OakGrabsDexes:
	step_left
	step_left
	turn_head_up
	step_end

OaksLabMovement_OakReturnsWithDexes:
	step_right
	step_right
	turn_head_down
	step_end

OaksLabMovement_OakGrabsDexes2:
	step_down
	step_down
	step_left
	step_left
	step_up
	step_up
	step_end

; OaksLabMovement_OakReturnsWithDexes2:
	; turn_head_right
	; step_end

Movement_RivalTakesFourStepsLeft:
	slow_step_left
Movement_RivalTakesThreeStepsLeft:
	slow_step_left
Movement_RivalTakesTwoStepsLeft:
	slow_step_left
Movement_RivalTakesOneStepLeft:
	slow_step_left
	step_end

Movement_RivalTakesFourStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesThreeStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesTwoStepsLeftOneStepDown:
	slow_step_left
Movement_RivalTakesOneStepLeftOneStepDown:
	slow_step_left
	slow_step_down
	step_end

Movement_RivalTakesSevenStepsDown:
	slow_step_down
Movement_RivalTakesSixStepsDown:
	slow_step_down
	slow_step_down
Movement_RivalTakesFourStepsDown:
	slow_step_down
Movement_RivalTakesThreeStepsDown:
	slow_step_down
Movement_RivalTakesTwoStepsDown:
	slow_step_down
Movement_RivalTakesOneStepDown:
	slow_step_down
	step_end

Movement_RivalTakesFourStepsRight:
	slow_step_right
Movement_RivalTakesThreeStepsRight:
	slow_step_right
Movement_RivalTakesTwoStepsRight:
	slow_step_right
Movement_RivalTakesOneStepRight:
	slow_step_right
	step_end

_OaksLabGaryText1:
	text "<GREEN>: Hey-ya,"
	line "<PLAYER>! Ol' Pappy"
	cont "ain't around!"
	done

_OaksLabText40:
	text "<GREEN>: Meh, I"
	line "don't need to be"
	cont "in a rush like"
	cont "you!"

	para "Go right ahead,"
	line "and pick, <PLAYER>!"
	done

_OaksLabText41:
	text "<GREEN>: This"
	line "#MON I picked"
	cont "looks a lot"
	cont "stronger."
	done

_OaksLabGaryText1F:
	text "<GREEN>: Oh, hello"
	line "<PLAYER>."

	para "The professor's"
	line "not around."
	done

_OaksLabText40F:
	text "<GREEN>: Oh, me?"
	line "I'm not in a rush."

	para "Go right ahead,"
	line "<PLAYER>."
	done

_OaksLabText41F:
	text "<GREEN>: I wanted"
	line "this #MON"
	cont "anyway<...>"
	done

_OaksLabText39:
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
	done

_OaksLabCharmanderText:
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

_OaksLabSquirtleText:
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

_OaksLabBulbasaurText:
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

_OaksLabMonEnergeticText:
	text "This #MON is"
	line "really energetic!"
	done

_OaksLabReceivedMonText:
	text "<PLAYER> received"
	line "a @"
	text_from_ram StringBuffer3
	text "!"
	done

_OaksLabLastMonText:
	text "That's PROF.OAK's"
	line "last #MON!"
	done

_OaksLabText_1d2f0:
	text "OAK: Now, <PLAYER>,"
	line "which #MON do"
	cont "you want?"
	done

_OaksLabText_1d2f5:
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

_OaksLabText_1d2fa:
	text "OAK: <PLAYER>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

_OaksLabDeliverParcelText1:
	text "OAK: Oh, <PLAYER>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAYER> delivered"
	line "OAK'S PARCEL."
	done

_OaksLabDeliverParcelText2:
	text "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

_OaksLabAroundWorldText:
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

_OaksLabGivePokeballsText1:
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> received"
	line "# BALL!"
	done

_OaksLabGivePokeballsText2:
	text "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	cont "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

_OaksLabPleaseVisitText:
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

_OaksLabText_1d31d:
	text "OAK: Good to see "
	line "you! How is your "
	cont "#DEX coming? "
	cont "Here, let me take"
	cont "a look!"
	done

_OaksLabText_1d32c:
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

_OaksLabText_1d340:
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

_OaksLabRivalWaitingText:
	text "<GREEN>: Come"
	line "on Pappy! I'm"
	cont "tired of waiting!"
	done

_OaksLabRivalWaitingTextF:
	text "<GREEN>: Oh,"
	line "there you are!"
	cont "Are we getting"
	cont "#MON now?"
	done

_OaksLabChooseMonText:
	text "OAK: <GREEN>?"
	line "Let me think<...>"

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, <PLAYER>!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only a few"
	cont "left, but you can"
	cont "have one! Choose!"
	done

_OaksLabRivalInterjectionText:
	text "<GREEN>: Hey!"
	line "Pop! What about"
	cont "me?"
	done

_OaksLabRivalInterjectionTextF:
	text "<GREEN>: Will"
	line "I get my turn"
	cont "after him?"
	done

_OaksLabBePatientText:
	text "OAK: Be patient!"
	line "<GREEN>, you can"
	cont "have one too!"
	done

_OaksLabLeavingText:
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

_OaksLabRivalPickingMonText:
	text "<GREEN>: I'll be"
	line "taking this one,"
	cont "then!"
	done

_OaksLabRivalPickingMonTextF:
	text "<GREEN>: Then"
	line "I will just take"
	cont "this one<...>"
	done

_OaksLabRivalReceivedMonText:
	text "<GREEN> received"
	line "a @"
	text_from_ram StringBuffer4
	text "!"
	done

_OaksLabRivalChallengeText:
	text "<GREEN>: Hey!"
	line "<PLAYER>!"

	para "Let's duke it"
	line "out with our"
	cont "#MON!"

	para "Bring it on!"
	done

_OaksLabText_1d3be:
	text "HUH!?"
	line "How'd I lose?"
	done

_OaksLabText_1d3c3:
	text "<GREEN>: Aw yeah!"
	line "Am I good or what?"
	done

_OaksLabRivalToughenUpText:
	text "<GREEN>: Well,"
	line "I'm gonna make"
	cont "my #MON"
	cont "tougher from"
	cont "now on!"

	para "<PLAYER>! Pops!"
	line "See ya later!"
	done

_OaksLabRivalChallengeTextF:
	text "<GREEN>: Wait"
	line "a minute,"
	cont "<PLAYER>!"

	para "Let's try battling"
	line "our #MON"

	para "like we always"
	line "wanted!"

	para "Alright! Here I"
	line "come!"
	done

_OaksLabText_1d3beF:
	text "Oh my<...>"
	line "It looks like"
	cont "I have more to"
	cont "learn about this."
	done

_OaksLabText_1d3c3F:
	text "<GREEN>: Oh, um<...>"
	line "Should I have gone"
	cont "easier on you?"
	done

_OaksLabRivalToughenUpTextF:
	text "<GREEN>: Okay!"
	line "I'll work hard"
	cont "to raise my"
	cont "#MON with love"
	cont "and care!"

	para "<PLAYER>! Profes-"
	line "sor!"
	cont "See you later!"
	done

_OaksLabText21:
	text "<GREEN>: Pops!"
	done

_OaksLabText22:
	text "<GREEN>: What did"
	line "you call me for?"
	done

_OaksLabText21F:
	text "<GREEN>: Hey<...>!"
	done

_OaksLabText22F:
	text "<GREEN>: You"
	line "called for me?"
	done

_OaksLabText23:
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

_OaksLabText24:
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

_OaksLabText25:
	text "OAK: <PLAYER> and"
	line "<GREEN>! Take"
	cont "these with you!"

	para "<PLAYER> got"
	line "#DEX from OAK!"
	done

_OaksLabText26:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world<...>"

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabText27:
	text "<GREEN>: Alright"
	line "Pappy! Leave the"
	cont "catching to me!"

	para "<PLAYER>, I hate"
	line "saying this, but I"

	para "don't need your"
	line "help here!"

	para "Heh, I know! I'll"
	line "borrow a MAP CARD"
	cont "from my sis!"

	para "I'll ask her not"
	line "to give you one,"
	cont "<PLAYER>! Haha!"
	done

_OaksLabText27F:
	text "<GREEN>: Okay,"
	line "this sounds like"
	cont "fun."

	para "Oh, I know!"
	line "<PLAYER>, I'll"
	cont "race you to"
	cont "completing one!"

	para "I don't want"
	line "things to be"
	cont "unfair for you<...>"

	para "<...>so I'll ask my"
	line "sister to lend you"
	cont "a MAP CARD."

	para "I'll be seeing"
	line "you!"
	done

_OaksLabText_1d405:
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

_OakLabEmailText:
	text "There's an e-mail"
	line "message here!"

	para "<...>"

	para "Calling all"
	line "#MON trainers!"

	para "The elite trainers"
	line "of #MON LEAGUE"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#MON and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#MON LEAGUE HQ"
	line "INDIGO PLATEAU"

	para "PS: PROF.OAK,"
	line "please visit us!"
	cont "<...>"
	done

_PushStartText:
	text "Push START to"
	line "open the MENU!"
	done

_SaveOptionText:
	text "The SAVE option is"
	line "on the MENU"
	cont "screen."
	done

_StrengthsAndWeaknessesText:
	text "All #MON types"
	line "have strong and"
	para "weak points"
	line "against others."
	done


OaksLabRB_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $b, $5, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB

	; xy triggers
	db 4
	xy_trigger 2, 6, 4, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 2, 6, 5, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 3, 6, 4, 0, OaksLab_RivalBattleTriggerLeft, 0, 0
	xy_trigger 3, 6, 5, 0, OaksLab_RivalBattleTriggerRight, 0, 0

	; signposts
	db 17
	signpost 1, 6, $0, MapOaksLabRBSignpost11Script
	signpost 1, 7, $0, MapOaksLabRBSignpost11Script
	signpost 1, 8, $0, MapOaksLabRBSignpost11Script
	signpost 1, 9, $0, MapOaksLabRBSignpost11Script
	signpost 7, 0, $0, MapOaksLabRBSignpost11Script
	signpost 7, 1, $0, MapOaksLabRBSignpost11Script
	signpost 7, 2, $0, MapOaksLabRBSignpost11Script
	signpost 7, 3, $0, MapOaksLabRBSignpost11Script
	signpost 7, 6, $0, MapOaksLabRBSignpost11Script
	signpost 7, 7, $0, MapOaksLabRBSignpost11Script
	signpost 7, 8, $0, MapOaksLabRBSignpost11Script
	signpost 7, 9, $0, MapOaksLabRBSignpost11Script
	signpost 0, 4, $0, MapOaksLabRBSignpost12Script
	signpost 0, 5, $0, MapOaksLabRBSignpost13Script
	signpost 3, 9, $0, MapOaksLabRBSignpost14Script
	signpost 1, 0, $0, MapOaksLabRBSignpost15Script
	signpost 1, 1, $0, MapOaksLabRBSignpost15Script

	; people-events
	db 10
	person_event SPRITE_OAK, 6, 9, $6, 0, 0, -1, -1, 0, 0, 0, OakScript_OaksLabRB, EVENT_OAKS_LAB_OAK
	person_event SPRITE_SCIENTIST, 12, 6, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist1Script_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 13, 12, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist2Script_OaksLabRB, -1
	person_event SPRITE_TEACHER, 15, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LassScript_OaksLabRB, -1
	person_event SPRITE_EGK_RIVAL, 7, 8, $3, 0, 0, -1, -1, 0, 0, 0, BlueScript_OaksLabRB, EVENT_RB_RIVAL_IN_LAB
	person_event SPRITE_POKE_BALL, 7, 10, $0, 0, 0, -1, -1, 0, 0, 0, CharmanderPokeballScript, EVENT_SOMEONE_GOT_CHARMANDER_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 11, $0, 0, 0, -1, -1, 0, 0, 0, SquirtlePokeballScript, EVENT_SOMEONE_GOT_SQUIRTLE_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BulbasaurPokeballScript, EVENT_SOMEONE_GOT_BULBASAUR_FROM_OAK
	person_event SPRITE_POKEDEX, 5, 6, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
	person_event SPRITE_POKEDEX, 5, 7, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
; 0x19bac7
