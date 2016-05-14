BattleTowerBattleRoom_MapScriptHeader: ; 0x9f40f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9f419, $0000
	dw UnknownScript_0x9f420, $0000

	; callback count
	db 0
; 0x9f419

UnknownScript_0x9f419: ; 0x9f419
	disappear $2
	priorityjump UnknownScript_0x9f421
	dotrigger $1
; 0x9f420

UnknownScript_0x9f420: ; 0x9f420
	end
; 0x9f421

UnknownScript_0x9f421: ; 0x9f421
	applymovement $0, MovementData_0x9e58c
UnknownScript_0x9f425: ; 0x9f425
	writebyte $2
	special Function170b44 ;generate trainer and load thier sprite into mapobject 2
	appear $2
	warpsound
	waitsfx
	applymovement $2, MovementData_0x9e592
	loadfont
	storetext 1
	buttonsound
	closetext
	setlasttalked $2
	special Function170215 ;run battle, loop until done
	special Function8c084 ;pallette stuff
	reloadmap
	if_not_equal $0, UnknownScript_0x9f4c2 ;if lose fight, run lose text
	copybytetovar wcf64
	if_equal $7, UnknownScript_0x9f4d9 ;if won all, run win script, else ready next fight
	applymovement $2, MovementData_0x9e597
	warpsound
	disappear $2
	applymovement $3, MovementData_0x9e59c
	applymovement $0, MovementData_0x9e5a7
	loadfont
	writetext UnknownText_0x9ee92 ;your mon will be healed
	; waitbutton
	; closetext
	playmusic MUSIC_HEAL
	; special Function8c084 ;pallette stuff
	special Function1047eb ; mobile
	pause 60
	; special Function8c079 ;pallette stuff
	special RestartMapMusic
	; loadfont
	writetext UnknownText_0x9eebc ;next opponent text
	yesorno
	iffalse UnknownScript_0x9f483 ;if not ready, else loop
UnknownScript_0x9f477: ; 0x9f477
	closetext
	applymovement $0, MovementData_0x9e5a9
	applymovement $3, MovementData_0x9e5a1
	jump UnknownScript_0x9f425
; 0x9f483

UnknownScript_0x9f483: ; 0x9f483
	writetext UnknownText_0x9ef5e ;save and end the session
	yesorno
	iffalse UnknownScript_0x9f4a3 ;if yes prepare to reset
	writebyte $7
	special Function170687 ;load d800 into $be47
	writebyte $1f
	special Function170687 ;copy 8 bytes from options to $a000, resetting no text delay
	writebyte $3
	special Function170687 ;set $be45 to 1
	playsound SFX_SAVE
	waitsfx
	special Function8c084
	special Reset

UnknownScript_0x9f4a3: ; 0x9f4a3
	writetext UnknownText_0x9efbf ;cancel your challenge?
	yesorno
	iffalse UnknownScript_0x9f477 ;if no back to loop, else quit out
	special CalculateTowerWinningsOnQuit
	loadfont
	writetext WonTowerMoneyText
	waitbutton
	writebyte $4
	special Function170687 ;load 0 into $be45
	writebyte $6
	special Function170687 ;if $be46 = 0, scriptvar = 0, else if if $aa8c >= 2,scriptvar = 8 and $be46 $aa8b and $aa8c = 0, else do stuff
	closetext
	special Function8c084 ;pallette stuff
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	loadfont
	jump UnknownScript_0x9e4b0 ;exit
; 0x9f4c2

UnknownScript_0x9f4c2: ; 0x9f4c2
	pause 60
	special Function8c092 ;pallete stuff
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7 ;warp downstairs
	loadfont
	copybytetovar wcf64
	if_equal 1, .NoWinnings
	special CalculateTowerWinnings
	writetext WonTowerMoneyText
	buttonsound
.NoWinnings
	writetext UnknownText_0x9ea49 ;thanks for visiting
	waitbutton
	writebyte $4
	special Function170687 ;load 0 into $be45
	closetext
	end
; 0x9f4d9

WonTowerMoneyText:
	text "For @"
	deciram wcf64, $11
	text " win(s),"
	line "your prize is"
	cont $f0, "@"
	deciram $ffc3, $36
	text "."
	done

UnknownScript_0x9f4d9: ; 0x9f4d9
	pause 60
	special Function8c092
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4: ; 0x9f4e4
	special CalculateTowerVictory
	loadfont
	writetext WonTowerMoneyText
	waitbutton
	closetext
	end
; 0x9f4eb

;UnknownScript_0x9f4eb: ; 0x9f4eb
;	writebyte $4
;	special Function170687
;	loadfont
;	writetext UnknownText_0x9f0c1
;	waitbutton
;	closetext
;	end
; 0x9f4f7

;UnknownScript_0x9f4f7: ; 0x9f4f7
;	writebyte $4
;	special Function170687
;	writebyte $6
;	special Function170687
;	loadfont
;	writetext UnknownText_0x9ea49
;	writetext UnknownText_0x9ec09
;	waitbutton
;	closetext
;	end
; 0x9f50b


UnknownText_0x9f50b: ; 0x9f50b
	text "You'll be returned"
	line "after you SAVE."
	done
; 0x9f52e


BattleTowerBattleRoom_MapEventHeader: ; 0x9f52e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $7, $4, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_YOUNGSTER, 4, 8, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_YOUNGSTER_IN_BATTLE_TOWER_BATTLE_ROOM
	person_event SPRITE_RECEPTIONIST, 10, 5, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
; 0x9f558

