BillsHouseRB_MapScriptHeader:
	db 0
	db 0

BillsHouseRBComputerScript:
	checkevent EVENT_HELPED_BILL_RB
	iftrue .SystemStatusMonitor
	checkevent EVENT_000_STD
	iftrue .ActivateTeleporter
.SystemStatusMonitor
	jumptext _BillsHouseMonitorText

.ActivateTeleporter
	loadfont
	writetext _BillsHouseInitiatedText
	playmusic MUSIC_NONE
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 20
	playsound SFX_CHOOSE_PC_OPTION
	waitsfx
	pause 10
	playsound SFX_CHOOSE_PC_OPTION
	waitsfx
	pause 30
	playsound SFX_WARP_FROM
	waitsfx
	pause 20
	playsound SFX_WARP_TO
	waitsfx
	pause 30
	variablesprite SPRITE_EGK_BILL, SPRITE_BILL
	special Function14209
	moveperson $2, 1, 2
	appear $2
	playsound SFX_EXIT_BUILDING
	applymovement $2, Movement_BillExitsTeleporter
	waitsfx
	setevent EVENT_HELPED_BILL_RB
	playsound SFX_LEVEL_UP
	waitsfx
	special RestartMapMusic
	applymovement $2, Movement_BillWalksToPlayer
	spriteface 0, RIGHT
	applymovement $2, Movement_BillFinishesWalkToPlayer
	loadfont
BillsHouseRBBillScriptGiveTicket
	writetext _BillThankYouText
	buttonsound
	verbosegiveitem S_S_TICKET
	iffalse BillScriptRB_bag_full
	setevent EVENT_RECEIVED_S_S_TICKET_RB
	clearevent EVENT_CERULEAN_RB_ROCKET_1
	writetext _BillsHouseText_1e8cb
	waitbutton
BillScriptRB_bag_full:
	closetext
	applymovement $2, Movement_ResetBill
	moveperson $2, 6, 5
	end

BillsHouseRBBillScriptContinue:
	writetext _BillsHouseText_1e8cb
	waitbutton
	closetext
	end

BillsHouseRBBillScript:
	faceplayer
	loadfont
	checkevent EVENT_HELPED_BILL_RB
	iffalse .init_event
	checkevent EVENT_RECEIVED_S_S_TICKET_RB
	iftrue BillsHouseRBBillScriptContinue
	writetext _BillThankYouText
	buttonsound
	verbosegiveitem S_S_TICKET
	iffalse .bag_full
	setevent EVENT_RECEIVED_S_S_TICKET_RB
	clearevent EVENT_CERULEAN_RB_ROCKET_1
	writetext _BillsHouseText_1e8cb
	waitbutton
.bag_full
	closetext
	end


.init_event
	writetext _BillsHouseText_1e865
.loop
	yesorno
	iftrue .proceed
	writetext _BillsHouseText_1e86f
	jump .loop

.proceed
	writetext _BillsHouseText_1e86a
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal DOWN, .down
	spriteface $0, UP
	applymovement $2, Movement_BillGoesStraightIntoTeleporter
	disappear $2
	playsound SFX_ENTER_DOOR
	waitsfx
	end

.down
	spriteface $0, UP
	applymovement $2, Movement_BillMeandersAroundPlayerToEnterTeleporter
	disappear $2
	playsound SFX_ENTER_DOOR
	waitsfx
	end

Movement_BillGoesStraightIntoTeleporter:
	step_up
	step_up
	step_up
	step_end

Movement_BillMeandersAroundPlayerToEnterTeleporter:
	step_left
	step_up
	step_up
	step_right
	step_up
	step_end

Movement_BillWalksToPlayer:
	step_right
	step_down
	step_down
Movement_BillExitsTeleporter:
	step_down
	step_end

Movement_BillFinishesWalkToPlayer:
	step_left
	step_end

Movement_ResetBill:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

_BillsHouseText_1e865:
	text "Hiya! I'm a"
	line "#MON<...>"
	cont "<...>No I'm not!"

	para "Call me BILL!"
	line "I'm a true blue"
	cont "#MANIAC! Hey!"
	cont "What's with that"
	cont "skeptical look?"

	para "I'm not joshing"
	line "you, I screwed up"
	cont "an experiment and"
	cont "got combined with"
	cont "a #MON!"

	para "So, how about it?"
	line "Help me out here!"
	done

_BillsHouseText_1e86a:
	text "When I'm in the"
	line "TELEPORTER, go to"
	cont "my PC and run the"
	cont "Cell Separation"
	cont "System!"
	done

_BillsHouseText_1e86f:
	text "No!? Come on, you"
	line "gotta help a guy"
	cont "in deep trouble!"

	para "What do you say,"
	line "chief? Please?"
	cont "OK? All right!"
	done

_BillThankYouText:
	text "BILL: Yeehah!"
	line "Thanks, bud! I"
	cont "owe you one!"

	para "So, did you come"
	line "to see my #MON"
	cont "collection?"
	cont "You didn't?"
	cont "That's a bummer."

	para "I've got to thank"
	line "you<...> Oh here,"
	cont "maybe this'll do."
	done

_BillsHouseText_1e8cb:
	text "That cruise ship,"
	line "S.S.ANNE, is in"
	cont "VERMILION CITY."
	cont "Its passengers"
	cont "are all trainers!"

	para "They invited me"
	line "to their party,"
	cont "but I can't stand"
	cont "fancy do's. Why"
	cont "don't you go"
	cont "instead of me?"
	done

_BillsHouseText_1e8da:
	text "BILL: Look, bud,"
	line "just check out"
	cont "some of my rare"
	cont "#MON on my PC!"
	done

_BillsHouseMonitorText:
	text "TELEPORTER is"
	line "displayed on the"
	cont "PC monitor."
	done

_BillsHouseInitiatedText:
	text "<PLAYER> initiated"
	line "TELEPORTER's Cell"
	cont "Separator!"
	done

BillsHouseRB_MapEventHeader:
	db 0, 0
	db 2
	warp_def 7, 2, 1, GROUP_ROUTE_25_RB, MAP_ROUTE_25_RB
	warp_def 7, 3, 1, GROUP_ROUTE_25_RB, MAP_ROUTE_25_RB

	db 0

	db 1
	signpost 5, 0, $1, BillsHouseRBComputerScript

	db 1
	person_event SPRITE_EGK_BILL, 9, 10, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, BillsHouseRBBillScript, EVENT_000_STD
