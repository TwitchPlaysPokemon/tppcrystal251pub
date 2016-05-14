VermilionGym2_MapScriptHeader:

.Triggers
	db 3
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

.Callbacks
	db 1
	dbw 5, .CheckTriggers

.CheckTriggers
	checkevent EVENT_SURGE_REMATCH
	iftrue .open_all_doors
	dotrigger $0
	return

.open_all_doors
	dotrigger $2
	changemap VermilionGym2Off_BlockData
	return

.Trigger0
	end
.Trigger1
	end
.Trigger2
	end

VermilionGymRematch_SwitchTrigger1:
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_THUNDER
	refreshscreen $0
	changemap VermilionGym2Red_BlockData
	closetext
	dotrigger $0
	end

VermilionGymRematch_SwitchTrigger0:
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_THUNDER
	refreshscreen $0
	changemap VermilionGym2Blue_BlockData
	closetext
	dotrigger $1
	end

Trainer_JugglerHorton2:
	trainer EVENT_BEAT_HORTON_2, JUGGLER, HORTON2, JugglerHorton2BeforeText, JugglerHorton2WinText, 0, .Script
.Script:
	talkaftercancel
	loadfont
	writetext JugglerHorton2AfterText
	waitbutton
	closetext
	end

Trainer_GentlemanGregory2:
	trainer EVENT_BEAT_GREGORY_2, GENTLEMAN, GREGORY2, GentlemanGregory2BeforeText, GentlemanGregory2WinText, 0, .Script
.Script:
	talkaftercancel
	loadfont
	writetext GentlemanGregory2AfterText
	waitbutton
	closetext
	end

Trainer_GuitaristVincent2:
	trainer EVENT_BEAT_VINCENT_2, GUITARIST, VINCENT2, GuitaristVincent2BeforeText, GuitaristVincent2WinText, 0, .Script
.Script:
	talkaftercancel
	loadfont
	writetext GuitaristVincent2AfterText
	waitbutton
	closetext
	end

Trainer_CooltrainerMChase:
	trainer EVENT_BEAT_CHASE, COOLTRAINERM, CHASE, CooltrainerMChaseBeforeText, CooltrainerMChaseWinText, 0, .Script
.Script:
	talkaftercancel
	loadfont
	writetext CooltrainerMChaseAfterText
	waitbutton
	closetext
	end

Trainer_SchoolboyBrett:
	trainer EVENT_BEAT_BRETT, SCHOOLBOY, BRETT, SchoolboyBrettBeforeText, SchoolboyBrettWinText, 0, .Script
.Script:
	talkaftercancel
	loadfont
	writetext SchoolboyBrettAfterText
	waitbutton
	closetext
	end

SurgeRematchScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue .Postgame
	checkevent EVENT_SURGE_REMATCH
	iftrue .AfterRematch
	checkevent EVENT_MEW_ISLAND_SURGE_CHALLENGE
	iftrue .WasChallenged
	writetext SurgeRematchTextBefore
	jump .StartBattle
.WasChallenged:
	writetext SurgeRematchTextBeforeChallenge
.StartBattle:
	waitbutton
	closetext
	winlosstext SurgeRematchBeatenText, $0000
	loadtrainer LT_SURGE, 2
	startbattle
	returnafterbattle
	setevent EVENT_SURGE_REMATCH
	setevent EVENT_BEAT_VINCENT_2
	setevent EVENT_BEAT_GREGORY_2
	setevent EVENT_BEAT_HORTON_2
	setevent EVENT_BEAT_CHASE
	setevent EVENT_BEAT_BRETT
	dotrigger $2
	changemap VermilionGym2Off_BlockData
	loadfont
.AfterRematch:
	checkevent EVENT_MEW_ISLAND_SURGE_CHALLENGE
	iftrue .WasChallenged2
	writetext SurgeAfterRematchText
	jump .StartBattle2
.WasChallenged2:
	writetext SurgeAfterRematchTextChallenge
.StartBattle2:
	waitbutton
	closetext
	end

.Postgame:
    writetext SurgePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer LT_SURGE, 2
    winlosstext SurgePostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext SurgePostgameAfterText
    waitbutton
.return
    closetext
    end

VermilionGymGuyRematchScript: ; 0x19211b
	faceplayer
	loadfont
	checkevent EVENT_SURGE_REMATCH
	iftrue .Won
	writetext VermilionGymGuyRematchText
	waitbutton
	closetext
	end

.Won
	writetext VermilionGymGuyWonRematchText
	waitbutton
	closetext
	end
; 0x19212f

MapVermilionGymRematchStatuesScript:
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2
; 0x192142

SurgeRematchTextBefore:
	text "SURGE: What's up?"
	line "I'm doing great!"

	para "Hey, you!"
	line "Battle me again!"
	cont "What do you say?"
	done

SurgeRematchTextBeforeChallenge:
	text "SURGE: What's up?"
	line "I'm doing great!"

	para "You want to go"
	line "chasing MEW?"

	para "That's no place for"
	line "kids to just go"
	cont "wandering around!"

	para "Tell ya what, you"
	line "prove youself on"
	cont "the battlefield,"

	para "and I'll give the"
	line "all-clear."

	para "Ten-hut!"
	done


SurgeRematchBeatenText:
	text "Arrrgh!"
	line "You are strong!"
	done

SurgeAfterRematchText:
	text "SURGE: You are way"
	line "too strong!"

	para "I'll have to go"
	line "back to camp and"
	
	para "brush up on my"
	line "training."

	done

SurgeAfterRematchTextChallenge:
	text "SURGE: You are"
	line "really strong!"

	para "You should be able"
	line "to handle GUYANA"
	cont "no problem!"

	done

SurgePostgameRematchText:
	text "SURGE: Hey, kid!"

	para "You still out"
	line "training, yeah?"

	para "Wanna go again?"
	done

SurgePostgameBeatenText:
	text "Woah, shocking!"
	done

SurgePostgameAfterText:
	text "SURGE: You are one"
	line "tough tyke!"

	para "I have no choice"
	line "but to admit my"
	cont "defeat<...> again."

	para "I should have you"
	line "come to training"

	para "camp to train my"
	line "crew!"
	done

VermilionGymGuyRematchText:
	text "Yo, CHAMP!"

	para "LT.SURGE has amped"
	line "up his game!"

	para "You may want to"
	line "take a moment to"

	para "look around be-"
	line "fore you charge"
	cont "in!"
	done

VermilionGymGuyWonRematchText:
	text "Impressive!"

	para "LT.SURGE is gonna"
	line "need to recharge"
	cont "after that battle!"
	done

SchoolboyBrettBeforeText:
	text "LT.SURGE taught me"
	line "and my #MON a"

	para "whole bunch of"
	line "electric-type"
	cont "moves."

	para "Can you help me"
	line "practice them?"
	done

SchoolboyBrettWinText:
	text "That didn't seem"
	line "right", $75
	done

SchoolboyBrettAfterText:
	text "I still have a lot"
	line "to learn about"
	cont "electric #MON."
	done

JugglerHorton2BeforeText:
	text "If you're gonna go"
	line "down, do so with"
	cont "honor."

	para "That's LT.SURGE's"
	line "motto!"
	done

JugglerHorton2WinText:
	text "KAPOW!!"
	done

JugglerHorton2AfterText:
	text "It's fun to go out"
	line "with a bang."

	para "But how can you"
	line "win if your own"

	para "#MON also"
	line "faints?"
	done

CooltrainerMChaseBeforeText:
	text "The air in this"
	line "GYM is tense and"
	cont "charged!"
	done

CooltrainerMChaseWinText:
	text "THUNDER detonates"
	line "with a BOOM!!"
	done

CooltrainerMChaseAfterText:
	text "It seems that my"
	line "physical condition"
	cont "is not so good."
	done

GentlemanGregory2BeforeText:
	text "You're here for a"
	line "rematch with"
	cont "LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregory2WinText:
	text "Sorry I failed you"
	line "again, LT.SURGE,"
	cont "sir!"
	done

GentlemanGregory2AfterText:
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done

GuitaristVincent2BeforeText: ; 0x1923e8
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done
; 0x192437

GuitaristVincent2WinText: ; 0x192437
	text "Ooh, how shocking!"
	done
; 0x19244b

GuitaristVincent2AfterText: ; 0x19244b
	text "Even if I didn't"
	line "beat you here,"

	para "the GYM's traps"
	line "surely will!"
	done
; 0x192487

VermilionGym2_MapEventHeader:
	db 0, 0
; warps
	db 2
	warp_def 27, 9, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def 27, 10, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

; xy triggers
	db 11
	xy_trigger 0, 21,  0, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 17,  1, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 25, 16, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 13, 18, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0,  5,  9, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 1, 25,  0, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 21,  2, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 17, 13, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 21, 18, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1,  9,  9, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1,  5, 17, $0, VermilionGymRematch_SwitchTrigger1, $0, $0

; signposts
	db 2
	signpost 25,  8, $0, MapVermilionGymRematchStatuesScript
	signpost 25, 11, $0, MapVermilionGymRematchStatuesScript

; people events
	db 7
	person_event SPRITE_SURGE, 5, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, SurgeRematchScript, -1
	person_event SPRITE_GENTLEMAN, 8, 8, $6, 0, 0, -1, -1, 0, 2, 2, Trainer_GentlemanGregory2, -1
	person_event SPRITE_ROCKER, 30, 5, $7, 0, 0, -1, -1, 0, 2, 1, Trainer_GuitaristVincent2, -1
	person_event SPRITE_YOUNGSTER, 29, 23, $8, 0, 0, -1, -1, 0, 2, 3, Trainer_SchoolboyBrett, -1
	person_event SPRITE_SUPER_NERD, 21, 14, $a, 0, 0, -1, -1, 0, 2, 1, Trainer_JugglerHorton2, -1
	person_event SPRITE_COOLTRAINER_M, 8, 24, $6, 0, 0, -1, -1, 0, 2, 2, Trainer_CooltrainerMChase, -1
	person_event SPRITE_GYM_GUY, 29, 14, $6, 0, 0, -1, -1, 0, 0, 0, VermilionGymGuyRematchScript, -1
