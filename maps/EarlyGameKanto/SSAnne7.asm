SSAnne7_MapScriptHeader:
	db 0
	db 0

SSAnne7CaptainScript:
	checkevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	iftrue .rubbed_back
	loadfont
	writetext _SSAnne7RubText
	playmusic MUSIC_HEAL
	pause 60
	setevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	special RestartMapMusic
	waitbutton
	closetext
	faceplayer
	loadfont
	writetext _NotReceivingHM01Text
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	playmusic MUSIC_HEAL
	special HealParty
	blackoutmod GROUP_S_S_ANNE_10, MAP_S_S_ANNE_10
	pause 60
	special Function8c0ab
	special RestartMapMusic
	loadfont
	writetext _SSAnne7Text_61932
	waitbutton
	closetext
	follow $2, $0
	applymovement $2, Movement_CaptainReturnsToHisPost
	stopfollow
	loadfont
	writetext SSAnne7Text_CaptainSetsSail1
	pause 30
	writetext SSAnne7Text_CaptainSetsSail2
	pause 30
	writetext SSAnne7Text_CaptainSetsSail3
	pause 30
	closetext
	pause 15
	playsound SFX_BOAT
	earthquake 45
	pause 15
	faceplayer
	loadfont
	writetext SSAnne7Text_CaptainSetsSail4
	waitbutton
	closetext
	special StartSSAnneTimer
	disappear $2
	appear $3
	domaptrigger GROUP_S_S_ANNE_1, MAP_S_S_ANNE_1, 1
	end

.rubbed_back
	faceplayer
	loadfont
	writetext SSAnne7Text_CaptainSetsSail5
	waitbutton
	closetext
	checkflag ENGINE_51
	iffalse .end
	appear $4
	playsound SFX_EXIT_BUILDING
	waitsfx
	spriteface $3, DOWN
	spriteface $0, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement $4, SSAnne7_RocketRunsUpToCaptain
	spriteface $0, RIGHT
	appear $5
	playsound SFX_EXIT_BUILDING
	waitsfx
	spriteface $0, DOWN
	applymovement $5, SSAnne7_GiovanniRunsUpToCaptain
	spriteface $0, RIGHT
	spriteface $3, RIGHT
	loadfont
	writetext SSAnne7Text_RocketsText
	waitbutton
	closetext
	loadfont
	writetext SSAnne7Text_CaptainConfused
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $3
	disappear $4
	disappear $5
	clearevent EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	setevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	domaptrigger GROUP_S_S_ANNE_5, MAP_S_S_ANNE_5, 1
	domaptrigger GROUP_S_S_ANNE_3, MAP_S_S_ANNE_3, 1
	playmusic MUSIC_NONE
	playsound SFX_TACKLE
	waitsfx
	pause 15
	playsound SFX_TACKLE
	waitsfx
	pause 60
	special HealParty
	blackoutmod GROUP_S_S_ANNE_7, MAP_S_S_ANNE_7
	playsound SFX_EXIT_BUILDING
	waitsfx
	playsound SFX_EXIT_BUILDING
	waitsfx
	special Function8c0ab
	takeitem S_S_TICKET, 1
	playmapmusic
.end
	end

SSAnne7TrashcanScript:
	jumptext _SSAnne7Text2
SSAnne7SeasicknessBookScript:
	jumptext _SSAnne7Text3

Movement_CaptainReturnsToHisPost:
	step_left
	step_up
	step_left
	step_left
	turn_head_down
	step_end

SSAnne7_RocketRunsUpToCaptain:
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	turn_head_left
	step_end

SSAnne7_GiovanniRunsUpToCaptain:
	step_up
	step_up
	step_sleep 30
	step_right
	step_right
	step_up
	step_up
	turn_head_left
	step_end

_SSAnne7RubText:
	text "CAPTAIN: Ooargh<...>"
	line "I feel hideous<...>"
	cont "Urrp! Seasick<...>"

	para "<PLAYER> rubbed"
	line "the CAPTAIN's"
	cont "back!"

	para "Rub-rub<...>"
	line "Rub-rub<...>"
	done

_NotReceivingHM01Text:
	text "CAPTAIN: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my CUT technique?"

	para "I could show you"
	line "if I wasn't ill<...>"

	para "I know! Let me"
	line "heal your #MON."

	para "It's the least I"
	line "can do to thank"
	cont "you for healing"
	cont "me."
	done

_SSAnne7Text_61932:
	text "CAPTAIN: Whew!"

	para "Now that I'm not"
	line "sick any more, I"
	cont "guess it's time."
	done

SSAnne7Text_CaptainSetsSail1:
	text "All set for depar-"
	line "ture?"
	done

SSAnne7Text_CaptainSetsSail2:
	text "PA: Aye-aye, cap-"
	line "tain!"
	done

SSAnne7Text_CaptainSetsSail3:
	text "Then let's get out"
	line "to sea, lads!"
	done

SSAnne7Text_CaptainSetsSail4:
	text "And we're off!"

	para $56, " ", $56, " ", $56
	line $56, " ", $56, "Huh?"

	para "You wanted to get"
	line "off in VERMILION?"

	para "Oh, this is un-"
	line "usual<...>"

	para "If we go back now,"
	line "other passengers"
	cont "will be upset."

	para "It'll be another"
	line "year before we"
	cont "can return."

	para "Our next port of"
	line "call is OLIVINE"
	cont "CITY in around"
	cont "a week's time."

	para "If you get off in"
	line "OLIVINE, we can"
	cont "arrange FAST SHIP"
	cont "passage back to"
	cont "VERMILION CITY."

	para "Meanwhile, you're"
	line "welcome to enjoy"
	cont "our onboard"
	cont "luxury services."

	para "According to your"
	line "ticket<...>"

	para "Your cabin is on"
	line "the lower deck."

	para "Feel free to rest"
	line "up there."
	done

SSAnne7Text_CaptainSetsSail5:
	text "Ah, <PLAYER>!"

	para "Are you enjoying"
	line "your stay aboard"
	cont "the S.S.ANNE?"
	done

SSAnne7Text_RocketsText:
	text "Not another word,"
	line "CAPTAIN."
	cont "This is a mutiny."

	para "Come quietly, or"
	line "you will expe-"
	cont "rience a world of"
	cont "pain."
	done

SSAnne7Text_CaptainConfused:
	text "Wh-what's this"
	line "about? Mutiny?!"
	done

_SSAnne7Text2:
	text "Yuck! Shouldn't"
	line "have looked!"
	done

_SSAnne7Text3:
	text "How to Conquer"
	line "Seasickness<...>"
	para "The CAPTAIN's"
	line "reading this!"
	done

SSAnne7_MapEventHeader:
	db 0, 0
	db 1
	warp_def 7, 0, 9, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2

	db 0
	db 2
	signpost 1, 4, $0, SSAnne7TrashcanScript
	signpost 2, 1, $0, SSAnne7SeasicknessBookScript

	db 4
	person_event SPRITE_CAPTAIN, 6, 8, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne7CaptainScript, EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	person_event SPRITE_CAPTAIN, 5, 5, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne7CaptainScript, EVENT_S_S_ANNE_NOT_YET_DEPARTED
	person_event SPRITE_ROCKET, 10, 5, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_S_S_ANNE_7_ROCKETS
	person_event SPRITE_GIOVANNI, 10, 5, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_S_S_ANNE_7_ROCKETS
