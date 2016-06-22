FuchsiaGym2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1

	dbw 5, FuchsiaGym2Callback

FuchsiaGym2Callback:
	checkevent EVENT_JANINE_REMATCH
	iftrue .revealall
	setevent EVENT_JANINE_INVISIBLE
	setevent EVENT_FAKE_JANINE_1
	setevent EVENT_FAKE_JANINE_2
	return
.revealall
	clearevent EVENT_JANINE_INVISIBLE
	clearevent EVENT_FAKE_JANINE_1
	clearevent EVENT_FAKE_JANINE_2
	return

InvisibleJanineSPScript:
	dw EVENT_JANINE_INVISIBLE, InvisibleJanineScript
InvisibleJanineScript:
	setlasttalked $2
	checkevent EVENT_BEAT_ELM
	iftrue JaninePostgameRematchScript
	checkevent EVENT_JANINE_REMATCH
	iftrue JanineAfterRematch
	loadfont
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	appear $2
	applymovement $2, MovementData_0x195f27_2
	faceplayer
	loadfont
	writetext JanineBeforeRematchText
	waitbutton
	closetext
	winlosstext JanineRematchBeatenText, $0000
	loadtrainer JANINE, 2
	startbattle
	returnafterbattle
	setevent EVENT_JANINE_REMATCH
	clearevent EVENT_FAKE_JANINE_1
	clearevent EVENT_FAKE_JANINE_2
	special Function1ad2
	loadfont ;fallthrough
	jump JanineJustAfterRematch

JanineAfterRematch:
	faceplayer
	loadfont
JanineJustAfterRematch:
	writetext JanineAfterRematchText
	waitbutton
	closetext
	end

FakeJanine1SPScript:
	dw EVENT_FAKE_JANINE_1, FakeJanine1Script
FakeJanine1Script:
	setlasttalked $3
	checkevent EVENT_FAKE_JANINE_1
	iffalse .revealed
	; clearevent EVENT_FAKE_JANINE_1
	loadfont
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	appear $3
	applymovement $3, MovementData_0x195f27_2
.revealed
	faceplayer
	loadfont
	writetext FakeJanine1Text
	waitbutton
	closetext
	end

FakeJanine2SPScript:
	dw EVENT_FAKE_JANINE_2, FakeJanine2Script
FakeJanine2Script:
	setlasttalked $4
	checkevent EVENT_FAKE_JANINE_2
	iffalse .revealed
	; clearevent EVENT_FAKE_JANINE_2
	loadfont
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	appear $4
	applymovement $4, MovementData_0x195f27_2
.revealed
	faceplayer
	loadfont
	writetext FakeJanine2Text
	waitbutton
	closetext
	end

FuchsiaGym2GuyScript:
	faceplayer
	loadfont
	checkevent EVENT_JANINE_REMATCH
	iftrue .FuchsiaGym2GuyWinScript
	writetext FuchsiaGym2GuyText
	waitbutton
	closetext
	end

.FuchsiaGym2GuyWinScript
	writetext FuchsiaGym2GuyWinText
	waitbutton
	closetext
	end

MapFuchsiaGym2Signpost1Script:
	trainertotext JANINE, 1, $1
	jumpstd gymstatue2

MovementData_0x195f27_2:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

InvisibleTrainerFoundText:
	text "Fufufu!"

	para "You have finally"
	line "found me!"
	done

FakeJanine1Text:
	text "Anyways, I'm not"
	line "JANINE<...>"
	done

FakeJanine2Text:
	text "Your LEADER is in"
	line "another room<...>"
	done

JanineBeforeRematchText:
	text "JANINE: The true"
	line "essence of a"
	cont "ninja's moves<...>"

	para "Honed and trained"
	line "to perfection<...>"

	para "Prepare to expe-"
	line "rience the horror"

	para "of the poison-type"
	line "#MON that have"

	para "mastered these"
	line "techniques!"
	done
; 0x1960e6

JanineRematchBeatenText:
	text "<...>!!!"
	line "So<...> So strong!"

	done

JanineAfterRematchText:
	text "JANINE: While I do"
	line "admire your"
	cont "victory,"

	para "I'm disappointed"
	line "that I lost<...>"

	para "I'll train with my"
	line "father to become"
	
	para "better than before"
	line "and challenge you"
	cont "again!"
	done

FuchsiaGym2GuyText: ; 0x196299
	text "Yo, CHAMP!"

	para "Having a hard time"
	line "finding JANINE?"

	para "I assure you she's"
	line "here somewhere,"

	para "hiding in this new"
	line "invisible maze."

	para "She's even made"
	line "herself invisible!"
	done
; 0x196325

FuchsiaGym2GuyWinText: ; 0x196325
	text "That was a great"
	line "battle, trainer!"
	done
; 0x196353

JaninePostgameRematchScript:
	faceplayer
	loadfont
    writetext JaninePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer JANINE, 2
    winlosstext JaninePostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext JaninePostgameAfterText
    waitbutton
.return
    closetext
    end
	
JaninePostgameRematchText:
	text "JANINE: I suppose"
	line "it's a bit easier"
	cont "finding me now."

	para "Let's keep this"
	line "talking short."

	para "Do you want to"
	line "battle again?"
	done
	
JaninePostgameBeatenText:
	text "<...>!!!"
	
	para "Still! So strong!!"
	done
	
JaninePostgameAfterText:
	text "JANINE: And again,"
	line "I lose."

	para "You have truly"
	line "honed your skills."
	
	para "I can only hope to"
	line "be that precise!"
	done

FuchsiaGym2_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $19, $6, 3, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $19, $7, 3, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; coord events
	db 0

	; bg events
	db 5
	signpost 23, 5, $0, MapFuchsiaGym2Signpost1Script
	signpost 23, 8, $0, MapFuchsiaGym2Signpost1Script
	signpost 10, 8, $5, InvisibleJanineSPScript
	signpost  6, 7, $5, FakeJanine1SPScript
	signpost 19, 8, $5, FakeJanine2SPScript

	; object events
	db 4
	person_event SPRITE_JANINE, 14, 12, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, InvisibleJanineScript, EVENT_JANINE_INVISIBLE
	person_event SPRITE_LASS, 10, 11, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FakeJanine1Script, EVENT_FAKE_JANINE_1
	person_event SPRITE_YOUNGSTER, 23, 12, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FakeJanine2Script, EVENT_FAKE_JANINE_2
	person_event SPRITE_GYM_GUY, 27, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FuchsiaGym2GuyScript, -1
