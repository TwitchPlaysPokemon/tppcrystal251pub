BattleTentPCRoom_MapScriptHeader:
	db 0

	db 0

LeaguePCScript:
	loadfont
	writetext tppPcIntroText
	playsound SFX_BOOT_PC
	waitsfx
	checkevent EVENT_READ_PC_EXPLANATION
	iftrue .skip_lengthly_intro
.intro
	writetext tppPcIntroText2
	buttonsound
	setevent EVENT_READ_PC_EXPLANATION
.skip_lengthly_intro
	writetext tppPcIntroText3
	loadmenudata tppPc_Options_Header
	interpretmenu2
	writebackup
	iffalse tppPcEndBattle
	if_equal ULTIMATE, tppPcUltimateTeamBattle
	if_equal MIRROR, tppPcMirrorBattle
	if_equal PC_SURVIVAL, TPPPC_SurvivalModeScript
	if_equal 4, .intro
tppPcEndBattle:
	writetext tppPcLogOffText
	playsound SFX_SHUT_DOWN_PC
	pause 20
	closetext
	end

tppPcUltimateTeamBattle:
	writetext tppPcHealText
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	writetext tppPcBeginUltimateBattleText
	waitbutton
	closetext
	loadtrainer TPPPC, ULTIMATE
	jump tppPcStartBattle

tppPcMirrorBattle:
	writetext tppPcHealText
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	writetext tppPcBeginMirrorBattleText
	waitbutton
	closetext
	loadtrainer TPPPC, MIRROR
tppPcStartBattle:
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	winlosstext tppPcWonText, tppPcLostText
	startbattle
	reloadmap
	special RestartMapMusic
	special HealParty
	loadfont
	jump tppPcEndBattle

TPPPC_SurvivalModeScript:
	writetext tppPcHealText
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	writebyte 0
	copyvartobyte wSurvivalModeWinStreak
.loop
	special SampleRandomSurvival
	copybytetovar wSurvivalModeWinStreak
	if_less_than 200, .not_max
	writetext SurvivalModeBattleStartText_200plus
	jump .okay1

.not_max
	writetext SurvivalModeBattleStartText
.okay1
	waitbutton
	closetext
	loadtrainer TPPPC, PC_SURVIVAL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	winlosstext tppPcWonText, tppPcLostText
	startbattle
	reloadmap
	loadfont
	iftrue .finish
	jump .loop

.finish
	special HealParty
	copybytetovar wSurvivalModeWinStreak
	if_less_than 200, .not_max2
	writetext SurvivalModeExitText_200plus
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	jump tppPcEndBattle

.not_max2
	writetext SurvivalModeExitText
	playsound SFX_ITEM
	waitsfx
	jump tppPcEndBattle

tppPc_Options_Header: ; 0x56478
	db $40 ; flags
	db 02, 02 ; start coords
	db 13, 17 ; end coords
	dw tppPc_Options
	db 1 ; default option
; 0x56480

tppPc_Options: ; 0x56480
	db $80 ; flags
	db 5 ; items
	db "ULTIMATE TEAM@"
	db "YOUR OWN TEAM@"
	db "SURVIVAL MODE@"
	db "EXPLANATION@"
	db "CANCEL@"

SurvivalModeBattleStartText:
	text "Now loading battle"
	line "number @"
	deciram wSurvivalModeWinStreak, $25
	text "<...>"
	done

SurvivalModeBattleStartText_200plus:
	text "Now loading the"
	line "next battle<...>"
	done

SurvivalModeExitText:
	text "You have survived"
	line "@"
	deciram wSurvivalModeWinStreak, $25
	text " battles."

	para "Good job."
	done

SurvivalModeExitText_200plus:
	text "You have survived"
	line "over 200 battles."

	para "Congratulations!"
	done

SurvivalModeShutdownText:
	text "Shutting down<...>"
	done


tppPcIntroText:
	text "<PLAY_G> turned"
	line "on the PC!"

	para "#MON LEAGUE"
	line "BATTLE SIMULATOR"
	done

tppPcIntroText2:
	text "In this software,"
	line "you can fight a"

	para "team of the most"
	line "powerful #MON"
	cont "known to man."

	para "Or, you can battle"
	line "a copy of your own"
	cont "party of #MON."

	para "For a different"
	line "challenge, try the"
	cont "new SURVIVAL MODE,"

	para "where you battle a"
	line "horde of randomly-"
	cont "generated teams"

	para "until you can no"
	line "longer fight."
	done

tppPcIntroText3:
	text "Please make your"
	line "selection."
	done

tppPcHealText:
	text "Before we begin,"
	line "we will restore"

	para "your #MON to"
	line "full health."
	done

tppPcWonText:
	text "Results: The"
	line "challenger won."
	done

tppPcLostText:
	text "Results: The"
	line "challenger lost."
	done

tppPcBeginUltimateBattleText:
	text "Now loading the"
	line "Ultimate Team."
	done

tppPcBeginMirrorBattleText:
	text "Now copying your"
	line "team to memory."
	done

tppPcLogOffText:
	text "Terminating"
	line "execution."

	para "Good bye!"
	done

BattleTentPCRoom_MapEventHeader:
	db 0, 0

	db 2
	warp_def 7, 3, 3, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM
	warp_def 7, 4, 3, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM

	db 0

	db 1
	signpost 2, 3, 1, LeaguePCScript

	db 0