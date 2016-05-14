StdScripts:: ; bc000
	dba PokeCenterNurseScript ; $00
	dba DifficultBookshelfScript ; $01
	dba PictureBookshelfScript ; $02
	dba MagazineBookshelfScript ; $03
	dba TeamRocketOathScript ; $04
	dba IncenseBurnerScript ; $05
	dba MerchandiseShelfScript ; $06
	dba TownMapScript ; $07
	dba WindowScript ; $08
	dba TVScript ; $09
	dba HomepageScript ; $0a
	dba Radio1Script ; $0b
	dba Radio2Script ; $0c
	dba TrashCanScript ; $0d
	dba StrengthBoulderScript ; $0e
	dba SmashRockScript ; $0f
	dba PokeCenterSignScript ; $10
	dba MartSignScript ; $11
	dba GoldenrodRocketsScript ; $12
	dba RadioTowerRocketsScript ; $13
	dba ElevatorButtonScript ; $14
	dba DayToTextScript ; $15
	dba BugContestResultsWarpScript ; $16
	dba BugContestResultsScript ; $17
	dba InitializeEventsScript ; $18
	dba AskNumber1MScript ; $19
	dba AskNumber2MScript ; $1a
	dba RegisteredNumberMScript ; $1b
	dba NumberAcceptedMScript ; $1c
	dba NumberDeclinedMScript ; $1d
	dba PhoneFullMScript ; $1e
	dba RematchMScript ; $1f
	dba GiftMScript ; $20
	dba PackFullMScript ; $21
	dba RematchGiftMScript ; $22
	dba AskNumber1FScript ; $23
	dba AskNumber2FScript ; $24
	dba RegisteredNumberFScript ; $25
	dba NumberAcceptedFScript ; $26
	dba NumberDeclinedFScript ; $27
	dba PhoneFullFScript ; $28
	dba RematchFScript ; $29
	dba GiftFScript ; $2a
	dba PackFullFScript ; $2b
	dba RematchGiftFScript ; $2c
	dba GymStatue1Script ; $2d
	dba GymStatue2Script ; $2e
	dba ReceiveItemScript ; $2f
	dba ReceiveTogepiEggScript ; $30
	dba PCScript ; $31
	dba GameCornerCoinVendorScript ; $32
	dba HappinessCheckScript ; $33
	dba IndigoPlateauStatue1Script ; $34
	dba IndigoPlateauStatue2Script ; $35
	dba PokeCenterOldLinkScript
	dba PokeCenterLinkEGKScript
; bc09c

CheckNotAllEggs::
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp $ff
	jr z, .nope
	cp EGG
	jr z, .loop
	ld a, 1
	jr .done

.nope
	xor a
.done
	ld [ScriptVar], a
	ret

PokeCenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	loadfont
	checkcode VAR_PARTYCOUNT
	iffalse .no_pokemon
	if_greater_than 6, .too_many_pokemon
	callasm CheckNotAllEggs
	iffalse .no_pokemon
	checkmorn
	iftrue .morn
	checkday
	iftrue .day
	checknite
	iftrue .nite
	jump .ok

.morn
	;checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	;iftrue .morn_comcenter
	farwritetext UnknownText_0x1b0000
	buttonsound
	jump .ok
;.morn_comcenter
;	farwritetext UnknownText_0x1b008a
;	buttonsound
;	jump .ok

.day
;	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
;	iftrue .day_comcenter
	farwritetext UnknownText_0x1b002b
	buttonsound
	jump .ok
;.day_comcenter
;	farwritetext UnknownText_0x1b00d6
;	buttonsound
;	jump .ok

.nite
;	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
;	iftrue .nite_comcenter
	farwritetext UnknownText_0x1b004f
	buttonsound
	jump .ok
;.nite_comcenter
;	farwritetext UnknownText_0x1b011b
;	buttonsound
;	jump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext UnknownText_0x1b017a
	yesorno
	iffalse .done

	farwritetext UnknownText_0x1b01bd
	pause 20
	special Function1060a2
	spriteface $fe, LEFT
	pause 10
	special HealParty
	; checkcode VAR_MAPGROUP
	; if_not_equal GROUP_CHERRYGROVE_CITY, .skip_cherrygrove
	; checkevent EVENT_HEALED_PKMN_IN_CHERRYGROVE
	; iftrue .skip_cherrygrove
	; setevent EVENT_HEALED_PKMN_IN_CHERRYGROVE
; .skip_cherrygrove
	special SaveMusic
	playmusic MUSIC_NONE
	writebyte 0
	special HealMachineAnim
	pause 30
	special RestoreMusic
	spriteface $fe, DOWN
	pause 10

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_POKERUS ; nurse already talked about pokerus
	iftrue .no
	special SpecialCheckPokerus
	iftrue .pokerus
.no

	farwritetext UnknownText_0x1b01d7
	pause 20

.done
	farwritetext UnknownText_0x1b020b

	spriteface $fe, UP
	pause 10
	spriteface $fe, DOWN
	pause 10

	waitbutton
	closetext
	end

.pokerus
	; already cleared earlier in the script
	;checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	;iftrue .pokerus_comcenter

	farwritetext UnknownText_0x1b0241
	waitbutton
	closetext
	;jump .pokerus_done

;.pokerus_comcenter
;	farwritetext UnknownText_0x1b02d6
;	waitbutton
;	closetext

;.pokerus_done
	checkflag ENGINE_PHONE_CARD
	iffalse .skip
	setflag ENGINE_POKERUS
	specialphonecall 1 ; elm calls about pokerus
.skip
	end

.no_pokemon
	farwritetext NoPokemonHealText
	pause 20
	jump .done

.too_many_pokemon
	farwritetext TooManyPokemonHealText
	pause 20
	jump .done
	
DifficultBookshelfScript: ; 0xbc162
	farjumptext UnknownText_0x1b035a
; 0xbc166

PictureBookshelfScript: ; 0xbc166
	farjumptext UnknownText_0x1b0378
; 0xbc16a

MagazineBookshelfScript: ; 0xbc16a
	farjumptext UnknownText_0x1b03a3
; 0xbc16e

TeamRocketOathScript: ; 0xbc16e
	farjumptext UnknownText_0x1b03d9
; 0xbc172

IncenseBurnerScript: ; 0xbc172
	farjumptext UnknownText_0x1b0448
; 0xbc176

MerchandiseShelfScript: ; 0xbc176
	farjumptext UnknownText_0x1b0472
; 0xbc17a

TownMapScript: ; 0xbc17a
	loadfont
	farwritetext UnknownText_0x1b048d
	waitbutton
	special Functionc2c0
	closetext
	end
; 0xbc185

WindowScript: ; 0xbc185
	farjumptext UnknownText_0x1b04a0
; 0xbc189

TVScript: ; 0xbc189
	loadfont
	farwritetext UnknownText_0x1b04be
	waitbutton
	closetext
	end
; 0xbc191

HomepageScript: ; 0xbc191
	farjumptext UnknownText_0x1b04c9
; 0xbc195

Radio1Script: ; 0xbc195
	loadfont
	writebyte $0
	special Functionc355
	closetext
	end
; 0xbc19d

Radio2Script: ; 0xbc19d
	loadfont
	writebyte $4
	special Functionc355
	closetext
	end
; 0xbc1a5

TrashCanScript: ; 0xbc1a5
	farjumptext UnknownText_0x1b0526
; 0xbc1a9

PCScript: ; 0xbc1a9
	loadfont
	special Function1559a
	closetext
	end
; 0xbc1af

ElevatorButtonScript: ; 0xbc1af
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end
; 0xbc1b8

StrengthBoulderScript: ; 0xbc1b8
	farjump UnknownScript_0xcd4b
; 0xbc1bc

SmashRockScript: ; 0xbc1bc
	farjump AskRockSmashScript
; 0xbc1c0

PokeCenterSignScript: ; 0xbc1c0
	farjumptext UnknownText_0x1b057f
; 0xbc1c4

MartSignScript: ; 0xbc1c4
	farjumptext UnknownText_0x1b059c
; 0xbc1c8

DayToTextScript: ; 0xbc1c8
	checkcode VAR_WEEKDAY
	if_equal MONDAY, UnknownScript_0xbc1e7
	if_equal TUESDAY, UnknownScript_0xbc1ec
	if_equal WEDNESDAY, UnknownScript_0xbc1f1
	if_equal THURSDAY, UnknownScript_0xbc1f6
	if_equal FRIDAY, UnknownScript_0xbc1fb
	if_equal SATURDAY, UnknownScript_0xbc200
	stringtotext UnknownRawText_0xbc205, $0
	end
; 0xbc1e7

UnknownScript_0xbc1e7: ; 0xbc1e7
	stringtotext UnknownRawText_0xbc20c, $0
	end
; 0xbc1ec

UnknownScript_0xbc1ec: ; 0xbc1ec
	stringtotext UnknownRawText_0xbc213, $0
	end
; 0xbc1f1

UnknownScript_0xbc1f1: ; 0xbc1f1
	stringtotext UnknownRawText_0xbc21b, $0
	end
; 0xbc1f6

UnknownScript_0xbc1f6: ; 0xbc1f6
	stringtotext UnknownRawText_0xbc225, $0
	end
; 0xbc1fb

UnknownScript_0xbc1fb: ; 0xbc1fb
	stringtotext UnknownRawText_0xbc22e, $0
	end
; 0xbc200

UnknownScript_0xbc200: ; 0xbc200
	stringtotext UnknownRawText_0xbc235, $0
	end
; 0xbc205

UnknownRawText_0xbc205: ; bc205
	db "SUNDAY@"
; bc20c

UnknownRawText_0xbc20c: ; bc20c
	db "MONDAY@"
; bc213

UnknownRawText_0xbc213: ; bc213
	db "TUESDAY@"
; bc21b

UnknownRawText_0xbc21b: ; bc21b
	db "WEDNESDAY@"
; bc225

UnknownRawText_0xbc225: ; bc225
	db "THURSDAY@"
; bc22e

UnknownRawText_0xbc22e: ; bc22e
	db "FRIDAY@"
; bc235

UnknownRawText_0xbc235: ; bc235
	db "SATURDAY@"
; bc23e

GoldenrodRocketsScript: ; 0xbc23e
	clearevent EVENT_ROCKET_IN_GOLDENROD_2
	end
; 0xbc242

RadioTowerRocketsScript: ; 0xbc242
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_CIVILIANS_EVACUATED_GOLDENROD
	setevent EVENT_BLACKBELT_BLOCKS_ACCESS_TO_UPPER_RADIO_TOWER_FLOORS
	clearevent EVENT_ROCKET_TAKEOVER_OF_GOLDENROD
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_POKEFAN_M_IN_MAHOGANY_TOWN
	specialphonecall $0004
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end
; 0xbc25c

BugContestResultsWarpScript: ; 0xbc25c
	special WhiteBGMap
	scall UnknownScript_0xbc380 ;clear contestent flags that are not active?
	setevent EVENT_NATIONALPARK_ROUTE36_GATE_OFFICER
	clearevent EVENT_NATIONALPARK_ROUTE36_GATE_OFFICER_2
	setevent EVENT_JUMPSTD_0016_2D2 ;skip NPC check on entry
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, MovementData_0xbcea1

BugContestResultsScript: ; bc274
	clearflag ENGINE_BUG_CONTEST_TIMER ; end the timer
	clearevent EVENT_JUMPSTD_0016_2D2 ; clear skip NPC check on entry flag
		;clearevent EVENT_CONTEST_ADMIN_HOLDING_PRIZE ;clear "Item is held" flag
		;clearevent EVENT_CONTEST_ADMIN_HOLDING_OLD_AMBER
		;clearevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
		;clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	loadfont
	farwritetext UnknownText_0x1b05bf ;announce start of judging
	waitbutton
	special Functionc34a ;put players position into scriptvar (0 is non-place)
	RAM2MEM $0
	if_equal 1, ContestResults_FirstPlaceScript
	if_equal 2, ContestResults_SecondPlaceScript
	if_equal 3, ContestResults_ThirdPlaceScript
	copybytetovar wContestMonSpecies
	iffalse .SkipPrize
	farwritetext UnknownText_0x1b0681
	buttonsound
	;waitsfx
	givemoney 0 , 1000
	jump UnknownScript_0xbc2a9

.SkipPrize
	farwritetext NoPrizeForLazyPeople
	buttonsound

UnknownScript_0xbc2a9:
	farwritetext UnknownText_0x1b06b7
	buttonsound
	jump UnknownScript_0xbc2b6
; 0xbc2b1

ClearSunHold:
	clearevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
UnknownScript_0xbc2b1: ; 0xbc2b1
	farwritetext UnknownText_0x1b065b ;please join next contest
	buttonsound

UnknownScript_0xbc2b6:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_YOUR_POKEMON ;if start with more then 1 mon, fall through to put back to normal, else jump
	iffalse UnknownScript_0xbc2c4
	farwritetext UnknownText_0x1b06d9 ;say they return kept mon
	waitbutton
	special Function13a31 ;reset party to normal
	checkcode VAR_PARTYCOUNT
	if_less_than $6, UnknownScript_0xbc2c4
	checkcode VAR_BOXSPACE
	if_equal $0, PCIsFullToo
UnknownScript_0xbc2c4:
	copybytetovar wContestMonSpecies
	iffalse .SkipBugQuestion
	farwritetext DoYouWantToKeepTheBug
	yesorno
	iffalse ClearContestMon
.SkipBugQuestion
	special Function4d9e5 ;insert mon into party or into PC box in top slot. return 0 in scriptvar if mon went to party, 1 if they went to box and 2 if no mon was caught
	if_equal $0, UnknownScript_0xbc2d4 ;if sent to party or no mon, skip box text
	if_equal $2, UnknownScript_0xbc2d4
	if_equal $3, PCIsFullToo
	farwritetext UnknownText_0x1b070d ;sent to box text
	waitbutton
UnknownScript_0xbc2d4:
	closetext
	dotrigger $0
	domaptrigger GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE, $0 ;reset map triggers
	setevent EVENT_NATIONALPARK_CONTESTANT_1 ;set all contestent eventvflags
	setevent EVENT_NATIONALPARK_CONTESTANT_2
	setevent EVENT_NATIONALPARK_CONTESTANT_3
	setevent EVENT_NATIONALPARK_CONTESTANT_4
	setevent EVENT_NATIONALPARK_CONTESTANT_5
	setevent EVENT_NATIONALPARK_CONTESTANT_6
	setevent EVENT_NATIONALPARK_CONTESTANT_7
	setevent EVENT_NATIONALPARK_CONTESTANT_8
	setevent EVENT_NATIONALPARK_CONTESTANT_9
	setevent EVENT_NATIONALPARK_CONTESTANT_10
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_1
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_2
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_3
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_4
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_5
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_6
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_7
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_8
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_9
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_10
	;setflag ENGINE_51
	special PlayMapMusic
	end
; 0xbc31e

ClearContestMon:
	loadvar wdf9c, 0
	jump UnknownScript_0xbc2d4

PCIsFullToo:
	farwritetext YouWantTheBugButPCIsFull
	waitbutton
	jump UnknownScript_0xbc2d4

ContestResults_FirstPlaceScript: ; 0xbc31e
	setevent EVENT_000_STD ;set "player won" flag
	checkevent EVENT_CONTEST_ADMIN_HOLDING_PRIZE
	iftrue ContestResultsFirstRepeat ;if already won amber, win something else
	itemtotext OLD_AMBER, $1
	farwritetext UnknownText_0x1b0621 ; say what the player won
	waitbutton
	verbosegiveitem OLD_AMBER, 1
	setevent EVENT_CONTEST_ADMIN_HOLDING_PRIZE
	iffalse UnknownScript_0xbc35f
	jump UnknownScript_0xbc2b1
; 0xbc332

ContestResultsFirstRepeat:
	writetext FirstPlaceQuestion
	yesorno
	iffalse ContestFirstChoseBalls
	checkevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
	iftrue ContestAlreadyHoldingSun
	writetext SunStoneChosenText
	waitbutton
	verbosegiveitem SUN_STONE, 1
	iffalse UnknownScript_0xbc36a
	jump UnknownScript_0xbc2b1

ContestAlreadyHoldingSun:
	verbosegiveitem SUN_STONE, 2
	iftrue ClearSunHold
	itemtotext SUN_STONE, $1
	writetext ContestAlreadyHolding
	waitbutton
	jump ContestChooseBall

ContestResults_SecondPlaceScript: ; 0xbc332 prize script for balls
		;itemtotext EVERSTONE, $1
	writetext ContestSecondPrizeText
	waitbutton
	jump ContestChooseBall

ContestFirstChoseBalls:
	writetext BallsChosenText
	; scall ContestChooseBall

ContestChooseBall: ;choose ball based on day of week
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, ContestFriend
	if_equal MONDAY, ContestMoon
	if_equal TUESDAY, ContestLevel
	if_equal WEDNESDAY, ContestLure
	if_equal THURSDAY, ContestFast
	if_equal FRIDAY, ContestLove
	if_equal SATURDAY, ContestHeavy

ContestFriend:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingFriend
	verbosegiveitem FRIEND_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingFriend:
	itemtotext FRIEND_BALL, $1
	verbosegiveitem FRIEND_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestMoon:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingMoon
	verbosegiveitem MOON_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingMoon:
	itemtotext MOON_BALL, $1
	verbosegiveitem MOON_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestLevel:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingLevel
	verbosegiveitem LEVEL_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingLevel:
	itemtotext LEVEL_BALL, $1
	verbosegiveitem LEVEL_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestLure:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingLure
	verbosegiveitem LURE_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingLure:
	itemtotext LURE_BALL, $1
	verbosegiveitem LURE_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestFast:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingFast
	verbosegiveitem FAST_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingFast:
	itemtotext FAST_BALL, $1
	verbosegiveitem FAST_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestLove:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingLove
	verbosegiveitem LOVE_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingLove:
	itemtotext LOVE_BALL, $1
	verbosegiveitem LOVE_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestHeavy:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iftrue ContestHoldingHeavy
	verbosegiveitem HEAVY_BALL, 8
	iffalse UnknownScript_0xbc375
	jump UnknownScript_0xbc2b1

ContestHoldingHeavy:
	itemtotext HEAVY_BALL, $1
	verbosegiveitem HEAVY_BALL, 16
	iffalse ContestFullBag
	jump ContestBallFlagClear

ContestFullBag:
	writetext ContestAlreadyHolding
	buttonsound
	writetext BagFullPrizeText
	waitbutton
	givemoney 0 , 8000
	jump UnknownScript_0xbc2b1

ContestBallFlagClear:
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump UnknownScript_0xbc2b1

ContestResults_ThirdPlaceScript: ; 0xbc343
	writetext ContestThirdPlaceText
	waitbutton
	givemoney 0 , 4000
	jump UnknownScript_0xbc2b1
; 0xbc354

ContestThirdPlaceText
	text $52, ", the No.3"
	line "finisher, wins"
	cont $f0, "4000!"
	done

BagFullPrizeText:
	text "As we can't give"
	line "you anything else,"
	cont "take ", $f0, "8000."
	done

UnknownScript_0xbc354: ; 0xbc354
;	farwritetext UnknownText_0x1b08cc
;	buttonsound
;	setevent EVENT_CONTEST_ADMIN_HOLDING_PRIZE
;	jump UnknownScript_0xbc2b1
; 0xbc35f

UnknownScript_0xbc35f: ; 0xbc35f
	farwritetext UnknownText_0x1b08cc
	buttonsound
	setevent EVENT_CONTEST_ADMIN_HOLDING_OLD_AMBER
	jump UnknownScript_0xbc2b1
; 0xbc36a

UnknownScript_0xbc36a: ; 0xbc36a
	farwritetext UnknownText_0x1b08cc ;pack is full text for sun stone
	buttonsound
	setevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
	jump UnknownScript_0xbc2b1


; 0xbc375

UnknownScript_0xbc375: ; 0xbc375
	farwritetext UnknownText_0x1b08cc
	buttonsound
	setevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump UnknownScript_0xbc2a9
; 0xbc380

UnknownScript_0xbc380: ; 0xbc380 ;clear contestent flags that are not active?
	checkevent EVENT_NATIONALPARK_CONTESTANT_1
	iftrue .skip1
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_1
.skip1
	checkevent EVENT_NATIONALPARK_CONTESTANT_2
	iftrue .skip2
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_2
.skip2
	checkevent EVENT_NATIONALPARK_CONTESTANT_3
	iftrue .skip3
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_3
.skip3
	checkevent EVENT_NATIONALPARK_CONTESTANT_4
	iftrue .skip4
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_4
.skip4
	checkevent EVENT_NATIONALPARK_CONTESTANT_5
	iftrue .skip5
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_5
.skip5
	checkevent EVENT_NATIONALPARK_CONTESTANT_6
	iftrue .skip6
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_6
.skip6
	checkevent EVENT_NATIONALPARK_CONTESTANT_7
	iftrue .skip7
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_7
.skip7
	checkevent EVENT_NATIONALPARK_CONTESTANT_8
	iftrue .skip8
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_8
.skip8
	checkevent EVENT_NATIONALPARK_CONTESTANT_9
	iftrue .skip9
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_9
.skip9
	checkevent EVENT_NATIONALPARK_CONTESTANT_10
	iftrue .skip10
	clearevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_10
.skip10
	end

FirstPlaceQuestion:
	text $52, ", the No.1"
	line "finisher, has"
	cont "won a SUN STONE!"

	para "However, you may"
	line "choose to take a"
	cont "different prize."

	para "Do you want the"
	line "SUN STONE?"
	done

SunStoneChosenText:
	text "Please accept"
	line "your prize."
	done

ContestAlreadyHolding
	text "We are already"
	line "holding a"

	para "@"
	text_from_ram StringBuffer4
	text ""
	line "for you."

	para "You'll have to take"
	line "another prize."
	done

BallsChosenText:
	text "In that case"
	line "please accept"
	para "these Apricorn"
	line "Balls."
	done

ContestSecondPrizeText:
	text $52, ", the No.2"
	line "finisher, wins"
	cont "8 Apricorn Balls."
	done
; 0xbc3db

InitializeEventsScript: ; 0xbc3db
	setevent EVENT_EARL_INSIDE
	setevent EVENT_ROCKET_TAKEOVER_OF_GOLDENROD
	setevent EVENT_ROCKET_IN_GOLDENROD_2
	setevent EVENT_CIVILIANS_EVACUATED_RADIO_TOWER_UPPER_FLOORS
	setevent EVENT_APPRENTICE_IN_ILEX_FOREST
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_MASTER_IN_ILEX_FOREST
	setevent EVENT_LANCE_IN_MAHOGANY_MART
	setevent EVENT_ROCKET_WHO_FIGHTS_LANCE_IN_ROCKET_BASE_B2F
	setevent EVENT_EXECUTIVEF_IN_ROCKET_BASE_B2F
	setevent EVENT_DRAGONITE_IN_ROCKET_BASE_B2F
	setevent EVENT_SILVER_IN_TEAM_ROCKET_BASE
	setevent EVENT_GUY_NOT_BLOCKING_BLACKTHORN_GYM
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_SILVER_IN_CHERRYGROVE_CITY
	setevent EVENT_UNKNOWN_ROCKET_IN_AZALEA_TOWN
	setevent EVENT_SILVER_IN_GOLDENROD_UNDERGROUND
	setevent EVENT_SLOWPOKE_IN_AZALEA_TOWN
	setevent EVENT_SLOWPOKE_IN_KURTS_HOUSE
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_OFFICER_IN_ELMS_LAB
	setevent EVENT_SCIENTIST_OUTSIDE_RUINS_OF_ALPH
	setevent EVENT_SCIENTIST_IN_RUINS_OF_ALPH_RESEARCH_CENTER
	setevent EVENT_BOULDER_IN_ICE_PATH_1
	setevent EVENT_BOULDER_IN_ICE_PATH_2
	setevent EVENT_BOULDER_IN_ICE_PATH_3
	setevent EVENT_BOULDER_IN_ICE_PATH_4
	setevent EVENT_YOUNGSTER_JOEY_ON_ROUTE_30
	setevent EVENT_NATIONALPARK_CONTESTANT_1
	setevent EVENT_NATIONALPARK_CONTESTANT_2
	setevent EVENT_NATIONALPARK_CONTESTANT_3
	setevent EVENT_NATIONALPARK_CONTESTANT_4
	setevent EVENT_NATIONALPARK_CONTESTANT_5
	setevent EVENT_NATIONALPARK_CONTESTANT_6
	setevent EVENT_NATIONALPARK_CONTESTANT_7
	setevent EVENT_NATIONALPARK_CONTESTANT_8
	setevent EVENT_NATIONALPARK_CONTESTANT_9
	setevent EVENT_NATIONALPARK_CONTESTANT_10
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_1
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_2
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_3
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_4
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_5
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_6
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_7
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_8
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_9
	setevent EVENT_NATIONALPARK_ROUTE36GATE_CONTESTANT_10
	setevent EVENT_FAST_SHIP_GRANDFATHER_BUMPED_INTO_YOU
	setevent EVENT_FAST_SHIP_B1F_SAILOR_2
	setevent EVENT_FAST_SHIP_GOOD_FOR_NOTHING_SAILOR
	setevent EVENT_LAKE_OF_RAGE_TRAINERS
	setevent EVENT_MAHOGANY_MART_TRUE_OWNERS
	setevent EVENT_HO_OH_IS_HERE
	setevent EVENT_LUGIA_IS_HERE
	setevent EVENT_YOUR_HOUSE_CONSOLE
	setevent EVENT_YOUR_HOUSE_DOLL1
	setevent EVENT_YOUR_HOUSE_DOLL2
	setevent EVENT_YOUR_HOUSE_BIGDOLL
	setevent EVENT_JUMPSTD_0018_2AF
	setevent EVENT_RIVAL_ROUTE_22_RB
	setevent EVENT_MAGNET_TRAIN_PRESIDENT_IN_GOLDENROD_STATION
	setevent EVENT_JASMINE_IN_OLIVINE_GYM
	setevent EVENT_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	setevent EVENT_BILL_IN_GOLDENROD_BILLS_HOUSE
	setevent EVENT_BILL_IN_ECRUTEAK_POKECENTER_1F
	setevent EVENT_MYSTERY_GIFT_DELIVERY_MAN
	setevent EVENT_LANCE_IN_LAKE_OF_RAGE
	setevent EVENT_GOLDENROD_DEPT_STORE_BASEMENT_LAYOUT_1
	setevent EVENT_GOLDENROD_DEPT_STORE_BASEMENT_LAYOUT_4
	setevent EVENT_CLAIR_IN_DRAGONS_DEN
	setevent EVENT_SILVER_IN_OLIVINE_CITY
	setevent EVENT_SILVER_IN_VICTORY_ROAD
	setevent EVENT_SILVER_IN_DRAGONS_DEN
	setevent EVENT_MARY_AND_OAK_IN_LANCES_ROOM
	setevent EVENT_FAST_SHIP_GRANDDAUGHTER_IN_CAPTAINS_QUARTERS
	setevent EVENT_DOGS_IN_BURNED_TOWER
	setevent EVENT_RED_IN_SILVER_CAVE
	setevent EVENT_OLIVINE_PORT_IN_SERVICE_CROWD
	setevent EVENT_FAST_SHIP_POPULATION_2
	setevent EVENT_FAST_SHIP_POPULATION_3
	setevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_KURT_IN_HIS_HOUSE_2
	setevent EVENT_KURTS_GRANDDAUGHTER_2
	setevent EVENT_SAGE_IN_ECRUTEAK_HOUSE
	setevent EVENT_FLOWER_SHOP_LASS_IN_GOLDENROD_FLOWER_SHOP
	setevent EVENT_FLOWER_SHOP_LASS_ON_ROUTE_36
	setevent EVENT_POKEFAN_M_IN_GOLDENROD_CITY
	setevent EVENT_FISHER_IN_RUINS_OF_ALPH_OUTSIDE
	setevent EVENT_YOUNGSTERS_IN_RUINS_OF_ALPH_OUTSIDE
	setevent EVENT_CLAIR_IN_DRAGON_SHRINE
	setevent EVENT_YOUNGSTER_IN_BATTLE_TOWER_BATTLE_ROOM
	setevent EVENT_NEIGHBOR_IN_HER_HOUSE
	setevent EVENT_KURT_OUTSIDE_IN_AZALEA_TOWN
	setevent EVENT_KURT_OUTSIDE_IN_AZALEA_TOWN
	setevent EVENT_KURT_IN_ILEX_FOREST
	setevent EVENT_TEACHER_IN_ILEX_FOREST_ROUTE_34_GATE_2
	setevent EVENT_LASS_IN_ILEX_FOREST_ROUTE_34_GATE_2
	setevent EVENT_GOLDENROD_DEPT_STORE_ROOF_SET_1
	setevent EVENT_OLD_MAN_OUTSIDE_BURNED_TOWER
	setevent EVENT_EUSINE_IN_BURNED_TOWER_B1F
	setevent EVENT_MOM_POSITION_2
	setevent EVENT_WISE_TRIO_IN_PASSAGEWAY_TRAINERS
	setevent EVENT_EUSINE_IN_CIANWOOD_CITY
	setevent EVENT_EUSINE_IN_TIN_TOWER_1F
	setevent EVENT_WISE_TRIO_IN_TIN_TOWER_1F
	setevent EVENT_WISE_TRIO_HANG_OUT_IN_TIN_TOWER_1F
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_BATTLE_TOWER_SPRITE_SET_INIT
	setevent EVENT_MORTY_IS_AT_BACK_OF_GYM
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite SPRITE_WEIRD_TREE, SPRITE_SUDOWOODO
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_ROCKET
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	variablesprite SPRITE_EGK_BILL, SPRITE_FAIRY
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rival_is_male
	variablesprite SPRITE_EGK_RIVAL, SPRITE_AZURE
	jump .done_rival

.rival_is_male
	variablesprite SPRITE_EGK_RIVAL, SPRITE_RUST
.done_rival
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setevent EVENT_ROCKET_IN_CERULEAN_GYM
	setevent EVENT_ROCKET_ON_ROUTE_24
	setevent EVENT_MISTY_AND_HER_DATE_ON_CERULEAN_CAPE
	setevent EVENT_CERULEAN_GYM_POPULATION
	setevent EVENT_COPYCATS_DOLL_IN_HER_ROOM
	setevent EVENT_BLUE_IN_HIS_GYM
	setevent EVENT_GYM_GUY_IN_SEAFOAM_GYM
	setevent EVENT_CLEFAIRY_IN_MOUNT_MOON_SQUARE
	setevent EVENT_LADIES_IN_SAFFRON_STATION
	setevent EVENT_SILVER_IN_INDIGO_PLATEAU_POKECENTER
	setevent EVENT_SET_IN_YOUR_ROOM_036
	setevent EVENT_SIMON_IN_VOLCANO
	setevent EVENT_MOLTRES_BOULDER_1b
	setevent EVENT_MOLTRES_BOULDER_2b
	setevent EVENT_MOLTRES_BOULDER_3b
	setevent EVENT_MOLTRES_BOULDER_4b
	setevent EVENT_MOLTRES_BOULDER_1c
	setevent EVENT_MOLTRES_BOULDER_2c
	setevent EVENT_MOLTRES_BOULDER_3c
	setevent EVENT_MOLTRES_BOULDER_4c
	setevent EVENT_STATIC_RAIKOU
	setevent EVENT_STATIC_ENTEI
	setevent EVENT_STATIC_SUICUNE
	setevent EVENT_PALLET_TOWN_RB_OAK
	setevent EVENT_OAKS_LAB_OAK
	setevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
	setevent EVENT_CERULEAN_CITY_RB_NOT_YET_ROBBERY
	setevent EVENT_BEAT_RIVAL_IN_EGK_CERULEAN
	setevent EVENT_CERULEAN_RB_ROCKET_1
	setevent EVENT_CERULEAN_RB_ROCKET_2
	setevent EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	setevent EVENT_SS_ANNE_EGK_RIVAL
	setevent EVENT_ROCKETS_SS_ANNE_2
	setevent EVENT_ROCKETS_SS_ANNE_1
	setevent EVENT_SS_ANNE_SIMON
	setevent EVENT_S_S_ANNE_7_ROCKETS
	setevent EVENT_S_S_ANNE_NOT_YET_DEPARTED
	setevent EVENT_SIMON_IN_PEWTER_CITY
	setevent EVENT_LAVENDER_HAUNTER
	setevent EVENT_SCARED_LASS
	setevent EVENT_ELM_IN_SILVER_CAVE_RUINS
	setevent EVENT_MEWTWO_IN_VOLCANO_LAB
	return
; 0xbc574

AskNumber1MScript: ; 0xbc574
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack: ; bc5c9
	farwritetext UnknownText_0x1b09fe
	end
; 0xbc5ce

.Huey: ; 0xbc5ce
	farwritetext UnknownText_0x1b0d9f
	end
; 0xbc5d3

.Gaven: ; 0xbc5d3
	farwritetext UnknownText_0x1b102e
	end
; 0xbc5d8

.Jose: ; 0xbc5d8
	farwritetext UnknownText_0x1b142d
	end
; 0xbc5dd

.Joey: ; 0xbc5dd
	farwritetext UnknownText_0x1b1800
	end
; 0xbc5e2

.Wade: ; 0xbc5e2
	farwritetext UnknownText_0x1b1a71
	end
; 0xbc5e7

.Ralph: ; 0xbc5e7
	farwritetext UnknownText_0x1b1cd5
	end
; 0xbc5ec

.Anthony: ; 0xbc5ec
	farwritetext UnknownText_0xa4000
	end
; 0xbc5f1

.Todd: ; 0xbc5f1
	farwritetext UnknownText_0xa41c0
	end
; 0xbc5f6

.Irwin: ; 0xbc5f6
	farwritetext UnknownText_0xa4642
	end
; 0xbc5fb

.Arnie: ; 0xbc5fb
	farwritetext UnknownText_0xa4829
	end
; 0xbc600

.Alan: ; 0xbc600
	farwritetext UnknownText_0xa4a31
	end
; 0xbc605

.Chad: ; 0xbc605
	farwritetext UnknownText_0xa4ed4
	end
; 0xbc60a

.Derek: ; 0xbc60a
	farwritetext UnknownText_0xa50d5
	end
; 0xbc60f

.Tully: ; 0xbc60f
	farwritetext UnknownText_0xa52e2
	end
; 0xbc614

.Brent: ; 0xbc614
	farwritetext UnknownText_0xa5545
	end
; 0xbc619

.Vance: ; 0xbc619
	farwritetext UnknownText_0xa5937
	end
; 0xbc61e

.Wilton: ; 0xbc61e
	farwritetext UnknownText_0xa5bc4
	end
; 0xbc623

.Kenji: ; 0xbc623
	farwritetext UnknownText_0xa5dc6
	end
; 0xbc628

.Parry: ; 0xbc628
	farwritetext UnknownText_0xa600c
	end
; 0xbc62d

AskNumber2MScript: ; 0xbc62d
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack: ; bc682
	farwritetext UnknownText_0x1b0a82
	end
; 0xbc687

.Huey: ; 0xbc687
	farwritetext UnknownText_0x1b0e2c
	end
; 0xbc68c

.Gaven: ; 0xbc68c
	farwritetext UnknownText_0x1b10d3
	end
; 0xbc691

.Jose: ; 0xbc691
	farwritetext UnknownText_0x1b14e4
	end
; 0xbc696

.Joey: ; 0xbc696
	farwritetext UnknownText_0x1b187b
	end
; 0xbc69b

.Wade: ; 0xbc69b
	farwritetext UnknownText_0x1b1b1d
	end
; 0xbc6a0

.Ralph: ; 0xbc6a0
	farwritetext UnknownText_0x1b1d85
	end
; 0xbc6a5

.Anthony: ; 0xbc6a5
	farwritetext UnknownText_0xa40a9
	end
; 0xbc6aa

.Todd: ; 0xbc6aa
	farwritetext UnknownText_0xa426a
	end
; 0xbc6af

.Irwin: ; 0xbc6af
	farwritetext UnknownText_0xa470b
	end
; 0xbc6b4

.Arnie: ; 0xbc6b4
	farwritetext UnknownText_0xa48fc
	end
; 0xbc6b9

.Alan: ; 0xbc6b9
	farwritetext UnknownText_0xa4b03
	end
; 0xbc6be

.Chad: ; 0xbc6be
	farwritetext UnknownText_0xa4fc8
	end
; 0xbc6c3

.Derek: ; 0xbc6c3
	farwritetext UnknownText_0xa5175
	end
; 0xbc6c8

.Tully: ; 0xbc6c8
	farwritetext UnknownText_0xa5383
	end
; 0xbc6cd

.Brent: ; 0xbc6cd
	farwritetext UnknownText_0xa5621
	end
; 0xbc6d2

.Vance: ; 0xbc6d2
	farwritetext UnknownText_0xa59bc
	end
; 0xbc6d7

.Wilton: ; 0xbc6d7
	farwritetext UnknownText_0xa5c4b
	end
; 0xbc6dc

.Kenji: ; 0xbc6dc
	farwritetext UnknownText_0xa5e63
	end
; 0xbc6e1

.Parry: ; 0xbc6e1
	farwritetext UnknownText_0xa6076
	end
; 0xbc6e6

RegisteredNumberMScript: ; 0xbc6e6
	farwritetext UnknownText_0x1b09c4
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end
; 0xbc6f0

NumberAcceptedMScript: ; 0xbc6f0
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, UnknownScript_0xbc742
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbc749
	if_equal PHONE_COOLTRAINERM_GAVEN, UnknownScript_0xbc750
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbc757
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbc75e
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbc765
	if_equal PHONE_FISHER_RALPH, UnknownScript_0xbc76c
	if_equal PHONE_HIKER_ANTHONY, UnknownScript_0xbc773
	if_equal PHONE_CAMPER_TODD, UnknownScript_0xbc77a
	if_equal PHONE_JUGGLER_IRWIN, UnknownScript_0xbc781
	if_equal PHONE_BUG_CATCHER_ARNIE, UnknownScript_0xbc788
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbc78f
	if_equal PHONE_SCHOOLBOY_CHAD, UnknownScript_0xbc796
	if_equal PHONE_POKEFANM_DEREK, UnknownScript_0xbc79d
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbc7a4
	if_equal PHONE_POKEMANIAC_BRENT, UnknownScript_0xbc7ab
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbc7b2
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbc7b9
	if_equal PHONE_BLACKBELT_KENJI, UnknownScript_0xbc7c0
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbc7c7

UnknownScript_0xbc742:
	farwritetext UnknownText_0x1b0adb
	waitbutton
	closetext
	end
; 0xbc749

UnknownScript_0xbc749: ; 0xbc749
	farwritetext UnknownText_0x1b0e89
	waitbutton
	closetext
	end
; 0xbc750

UnknownScript_0xbc750: ; 0xbc750
	farwritetext UnknownText_0x1b1136
	waitbutton
	closetext
	end
; 0xbc757

UnknownScript_0xbc757: ; 0xbc757
	farwritetext UnknownText_0x1b1553
	waitbutton
	closetext
	end
; 0xbc75e

UnknownScript_0xbc75e: ; 0xbc75e
	farwritetext UnknownText_0x1b18d7
	waitbutton
	closetext
	end
; 0xbc765

UnknownScript_0xbc765: ; 0xbc765
	farwritetext UnknownText_0x1b1b8e
	waitbutton
	closetext
	end
; 0xbc76c

UnknownScript_0xbc76c: ; 0xbc76c
	farwritetext UnknownText_0x1b1db9
	waitbutton
	closetext
	end
; 0xbc773

UnknownScript_0xbc773: ; 0xbc773
	farwritetext UnknownText_0xa40f8
	waitbutton
	closetext
	end
; 0xbc77a

UnknownScript_0xbc77a: ; 0xbc77a
	farwritetext UnknownText_0xa42ab
	waitbutton
	closetext
	end
; 0xbc781

UnknownScript_0xbc781: ; 0xbc781
	farwritetext UnknownText_0xa4730
	waitbutton
	closetext
	end
; 0xbc788

UnknownScript_0xbc788: ; 0xbc788
	farwritetext UnknownText_0xa494d
	waitbutton
	closetext
	end
; 0xbc78f

UnknownScript_0xbc78f: ; 0xbc78f
	farwritetext UnknownText_0xa4b47
	waitbutton
	closetext
	end
; 0xbc796

UnknownScript_0xbc796: ; 0xbc796
	farwritetext UnknownText_0xa502e
	waitbutton
	closetext
	end
; 0xbc79d

UnknownScript_0xbc79d: ; 0xbc79d
	farwritetext UnknownText_0xa51ac
	waitbutton
	closetext
	end
; 0xbc7a4

UnknownScript_0xbc7a4: ; 0xbc7a4
	farwritetext UnknownText_0xa53de
	waitbutton
	closetext
	end
; 0xbc7ab

UnknownScript_0xbc7ab: ; 0xbc7ab
	farwritetext UnknownText_0xa5666
	waitbutton
	closetext
	end
; 0xbc7b2

UnknownScript_0xbc7b2: ; 0xbc7b2
	farwritetext UnknownText_0xa5a28
	waitbutton
	closetext
	end
; 0xbc7b9

UnknownScript_0xbc7b9: ; 0xbc7b9
	farwritetext UnknownText_0xa5c8e
	waitbutton
	closetext
	end
; 0xbc7c0

UnknownScript_0xbc7c0: ; 0xbc7c0
	farwritetext UnknownText_0xa5ea8
	waitbutton
	closetext
	end
; 0xbc7c7

UnknownScript_0xbc7c7: ; 0xbc7c7
	farwritetext UnknownText_0xa60b5
	waitbutton
	closetext
	end
; 0xbc7ce

NumberDeclinedMScript: ; 0xbc7ce
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, UnknownScript_0xbc820
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbc827
	if_equal PHONE_COOLTRAINERM_GAVEN, UnknownScript_0xbc82e
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbc835
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbc83c
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbc843
	if_equal PHONE_FISHER_RALPH, UnknownScript_0xbc84a
	if_equal PHONE_HIKER_ANTHONY, UnknownScript_0xbc851
	if_equal PHONE_CAMPER_TODD, UnknownScript_0xbc858
	if_equal PHONE_JUGGLER_IRWIN, UnknownScript_0xbc85f
	if_equal PHONE_BUG_CATCHER_ARNIE, UnknownScript_0xbc866
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbc86d
	if_equal PHONE_SCHOOLBOY_CHAD, UnknownScript_0xbc874
	if_equal PHONE_POKEFANM_DEREK, UnknownScript_0xbc87b
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbc882
	if_equal PHONE_POKEMANIAC_BRENT, UnknownScript_0xbc889
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbc890
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbc897
	if_equal PHONE_BLACKBELT_KENJI, UnknownScript_0xbc89e
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbc8a5

UnknownScript_0xbc820:
	farwritetext UnknownText_0x1b0afd
	waitbutton
	closetext
	end
; 0xbc827

UnknownScript_0xbc827: ; 0xbc827
	farwritetext UnknownText_0x1b0ea2
	waitbutton
	closetext
	end
; 0xbc82e

UnknownScript_0xbc82e: ; 0xbc82e
	farwritetext UnknownText_0x1b117b
	waitbutton
	closetext
	end
; 0xbc835

UnknownScript_0xbc835: ; 0xbc835
	farwritetext UnknownText_0x1b1584
	waitbutton
	closetext
	end
; 0xbc83c

UnknownScript_0xbc83c: ; 0xbc83c
	farwritetext UnknownText_0x1b1908
	waitbutton
	closetext
	end
; 0xbc843

UnknownScript_0xbc843: ; 0xbc843
	farwritetext UnknownText_0x1b1bd2
	waitbutton
	closetext
	end
; 0xbc84a

UnknownScript_0xbc84a: ; 0xbc84a
	farwritetext UnknownText_0x1b1df4
	waitbutton
	closetext
	end
; 0xbc851

UnknownScript_0xbc851: ; 0xbc851
	farwritetext UnknownText_0xa4126
	waitbutton
	closetext
	end
; 0xbc858

UnknownScript_0xbc858: ; 0xbc858
	farwritetext UnknownText_0xa42f2
	waitbutton
	closetext
	end
; 0xbc85f

UnknownScript_0xbc85f: ; 0xbc85f
	farwritetext UnknownText_0xa4794
	waitbutton
	closetext
	end
; 0xbc866

UnknownScript_0xbc866: ; 0xbc866
	farwritetext UnknownText_0xa498a
	waitbutton
	closetext
	end
; 0xbc86d

UnknownScript_0xbc86d: ; 0xbc86d
	farwritetext UnknownText_0xa4b87
	waitbutton
	closetext
	end
; 0xbc874

UnknownScript_0xbc874: ; 0xbc874
	farwritetext UnknownText_0xa505f
	waitbutton
	closetext
	end
; 0xbc87b

UnknownScript_0xbc87b: ; 0xbc87b
	farwritetext UnknownText_0xa51ee
	waitbutton
	closetext
	end
; 0xbc882

UnknownScript_0xbc882: ; 0xbc882
	farwritetext UnknownText_0xa5412
	waitbutton
	closetext
	end
; 0xbc889

UnknownScript_0xbc889: ; 0xbc889
	farwritetext UnknownText_0xa56b6
	waitbutton
	closetext
	end
; 0xbc890

UnknownScript_0xbc890: ; 0xbc890
	farwritetext UnknownText_0xa5a5a
	waitbutton
	closetext
	end
; 0xbc897

UnknownScript_0xbc897: ; 0xbc897
	farwritetext UnknownText_0xa5cc5
	waitbutton
	closetext
	end
; 0xbc89e

UnknownScript_0xbc89e: ; 0xbc89e
	farwritetext UnknownText_0xa5ed6
	waitbutton
	closetext
	end
; 0xbc8a5

UnknownScript_0xbc8a5: ; 0xbc8a5
	farwritetext UnknownText_0xa60e2
	waitbutton
	closetext
	end
; 0xbc8ac

PhoneFullMScript: ; 0xbc8ac
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, UnknownScript_0xbc8fe
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbc905
	if_equal PHONE_COOLTRAINERM_GAVEN, UnknownScript_0xbc90c
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbc913
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbc91a
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbc921
	if_equal PHONE_FISHER_RALPH, UnknownScript_0xbc928
	if_equal PHONE_HIKER_ANTHONY, UnknownScript_0xbc92f
	if_equal PHONE_CAMPER_TODD, UnknownScript_0xbc936
	if_equal PHONE_JUGGLER_IRWIN, UnknownScript_0xbc93d
	if_equal PHONE_BUG_CATCHER_ARNIE, UnknownScript_0xbc944
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbc94b
	if_equal PHONE_SCHOOLBOY_CHAD, UnknownScript_0xbc952
	if_equal PHONE_POKEFANM_DEREK, UnknownScript_0xbc959
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbc960
	if_equal PHONE_POKEMANIAC_BRENT, UnknownScript_0xbc967
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbc96e
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbc975
	if_equal PHONE_BLACKBELT_KENJI, UnknownScript_0xbc97c
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbc983

UnknownScript_0xbc8fe:
	farwritetext UnknownText_0x1b0b42
	waitbutton
	closetext
	end
; 0xbc905

UnknownScript_0xbc905: ; 0xbc905
	farwritetext UnknownText_0x1b0ebc
	waitbutton
	closetext
	end
; 0xbc90c

UnknownScript_0xbc90c: ; 0xbc90c
	farwritetext UnknownText_0x1b11c4
	waitbutton
	closetext
	end
; 0xbc913

UnknownScript_0xbc913: ; 0xbc913
	farwritetext UnknownText_0x1b15b6
	waitbutton
	closetext
	end
; 0xbc91a

UnknownScript_0xbc91a: ; 0xbc91a
	farwritetext UnknownText_0x1b1936
	waitbutton
	closetext
	end
; 0xbc921

UnknownScript_0xbc921: ; 0xbc921
	farwritetext UnknownText_0x1b1c06
	waitbutton
	closetext
	end
; 0xbc928

UnknownScript_0xbc928: ; 0xbc928
	farwritetext UnknownText_0x1b1e50
	waitbutton
	closetext
	end
; 0xbc92f

UnknownScript_0xbc92f: ; 0xbc92f
	farwritetext UnknownText_0xa4158
	waitbutton
	closetext
	end
; 0xbc936

UnknownScript_0xbc936: ; 0xbc936
	farwritetext UnknownText_0xa434a
	waitbutton
	closetext
	end
; 0xbc93d

UnknownScript_0xbc93d: ; 0xbc93d
	farwritetext UnknownText_0xa47eb
	waitbutton
	closetext
	end
; 0xbc944

UnknownScript_0xbc944: ; 0xbc944
	farwritetext UnknownText_0xa49bd
	waitbutton
	closetext
	end
; 0xbc94b

UnknownScript_0xbc94b: ; 0xbc94b
	farwritetext UnknownText_0xa4bcd
	waitbutton
	closetext
	end
; 0xbc952

UnknownScript_0xbc952: ; 0xbc952
	farwritetext UnknownText_0xa508c
	waitbutton
	closetext
	end
; 0xbc959

UnknownScript_0xbc959: ; 0xbc959
	farwritetext UnknownText_0xa5216
	waitbutton
	closetext
	end
; 0xbc960

UnknownScript_0xbc960: ; 0xbc960
	farwritetext UnknownText_0xa5446
	waitbutton
	closetext
	end
; 0xbc967

UnknownScript_0xbc967: ; 0xbc967
	farwritetext UnknownText_0xa56e2
	waitbutton
	closetext
	end
; 0xbc96e

UnknownScript_0xbc96e: ; 0xbc96e
	farwritetext UnknownText_0xa5aa6
	waitbutton
	closetext
	end
; 0xbc975

UnknownScript_0xbc975: ; 0xbc975
	farwritetext UnknownText_0xa5cfa
	waitbutton
	closetext
	end
; 0xbc97c

UnknownScript_0xbc97c: ; 0xbc97c
	farwritetext UnknownText_0xa5f06
	waitbutton
	closetext
	end
; 0xbc983

UnknownScript_0xbc983: ; 0xbc983
	farwritetext UnknownText_0xa6144
	waitbutton
	closetext
	end
; 0xbc98a

RematchMScript: ; 0xbc98a
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, UnknownScript_0xbc9d0
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbc9d7
	if_equal PHONE_COOLTRAINERM_GAVEN, UnknownScript_0xbc9de
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbc9e5
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbc9ec
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbc9f3
	if_equal PHONE_FISHER_RALPH, UnknownScript_0xbc9fa
	if_equal PHONE_HIKER_ANTHONY, UnknownScript_0xbca01
	if_equal PHONE_CAMPER_TODD, UnknownScript_0xbca08
	if_equal PHONE_BUG_CATCHER_ARNIE, UnknownScript_0xbca0f
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbca16
	if_equal PHONE_SCHOOLBOY_CHAD, UnknownScript_0xbca1d
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbca24
	if_equal PHONE_POKEMANIAC_BRENT, UnknownScript_0xbca2b
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbca32
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbca39
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbca40

UnknownScript_0xbc9d0:
	farwritetext UnknownText_0x1b0b75
	waitbutton
	closetext
	end
; 0xbc9d7

UnknownScript_0xbc9d7: ; 0xbc9d7
	farwritetext UnknownText_0x1b0edc
	waitbutton
	closetext
	end
; 0xbc9de

UnknownScript_0xbc9de: ; 0xbc9de
	farwritetext UnknownText_0x1b11fe
	waitbutton
	closetext
	end
; 0xbc9e5

UnknownScript_0xbc9e5: ; 0xbc9e5
	farwritetext UnknownText_0x1b15d5
	waitbutton
	closetext
	end
; 0xbc9ec

UnknownScript_0xbc9ec: ; 0xbc9ec
	farwritetext UnknownText_0x1b1954
	waitbutton
	closetext
	end
; 0xbc9f3

UnknownScript_0xbc9f3: ; 0xbc9f3
	farwritetext UnknownText_0x1b1c32
	waitbutton
	closetext
	end
; 0xbc9fa

UnknownScript_0xbc9fa: ; 0xbc9fa
	farwritetext UnknownText_0x1b1e98
	waitbutton
	closetext
	end
; 0xbca01

UnknownScript_0xbca01: ; 0xbca01
	farwritetext UnknownText_0xa418d
	waitbutton
	closetext
	end
; 0xbca08

UnknownScript_0xbca08: ; 0xbca08
	farwritetext UnknownText_0xa4382
	waitbutton
	closetext
	end
; 0xbca0f

UnknownScript_0xbca0f: ; 0xbca0f
	farwritetext UnknownText_0xa49fc
	waitbutton
	closetext
	end
; 0xbca16

UnknownScript_0xbca16: ; 0xbca16
	farwritetext UnknownText_0xa4bec
	waitbutton
	closetext
	end
; 0xbca1d

UnknownScript_0xbca1d: ; 0xbca1d
	farwritetext UnknownText_0xa50b1
	waitbutton
	closetext
	end
; 0xbca24

UnknownScript_0xbca24: ; 0xbca24
	farwritetext UnknownText_0xa548c
	waitbutton
	closetext
	end
; 0xbca2b

UnknownScript_0xbca2b: ; 0xbca2b
	farwritetext UnknownText_0xa571e
	waitbutton
	closetext
	end
; 0xbca32

UnknownScript_0xbca32: ; 0xbca32
	farwritetext UnknownText_0xa5ada
	waitbutton
	closetext
	end
; 0xbca39

UnknownScript_0xbca39: ; 0xbca39
	farwritetext UnknownText_0xa5d1d
	waitbutton
	closetext
	end
; 0xbca40

UnknownScript_0xbca40: ; 0xbca40
	farwritetext UnknownText_0xa6175
	waitbutton
	closetext
	end
; 0xbca47

GiftMScript: ; 0xbca47
	checkcode VAR_CALLERID
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbca65
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbca6b
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbca71
	if_equal PHONE_POKEFANM_DEREK, UnknownScript_0xbca77
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbca7d
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbca83
	if_equal PHONE_BLACKBELT_KENJI, UnknownScript_0xbca89

UnknownScript_0xbca65:
	farwritetext UnknownText_0x1b1607
	buttonsound
	end
; 0xbca6b

UnknownScript_0xbca6b: ; 0xbca6b
	farwritetext UnknownText_0x1b1c57
	buttonsound
	end
; 0xbca71

UnknownScript_0xbca71: ; 0xbca71
	farwritetext UnknownText_0xa4c24
	buttonsound
	end
; 0xbca77

UnknownScript_0xbca77: ; 0xbca77
	farwritetext UnknownText_0xa523a
	buttonsound
	end
; 0xbca7d

UnknownScript_0xbca7d: ; 0xbca7d
	farwritetext UnknownText_0xa54e3
	buttonsound
	end
; 0xbca83

UnknownScript_0xbca83: ; 0xbca83
	farwritetext UnknownText_0xa5d4d
	buttonsound
	end
; 0xbca89

UnknownScript_0xbca89: ; 0xbca89
	farwritetext UnknownText_0xa5f37
	buttonsound
	end
; 0xbca8f

PackFullMScript: ; 0xbca8f
	checkcode VAR_CALLERID
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbcabd
	if_equal PHONE_BIRDKEEPER_JOSE, UnknownScript_0xbcac4
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbcacb
	if_equal PHONE_BUG_CATCHER_WADE, UnknownScript_0xbcad2
	if_equal PHONE_SCHOOLBOY_ALAN, UnknownScript_0xbcad9
	if_equal PHONE_POKEFANM_DEREK, UnknownScript_0xbcae0
	if_equal PHONE_FISHER_TULLY, UnknownScript_0xbcae7
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbcaee
	if_equal PHONE_FISHER_WILTON, UnknownScript_0xbcaf5
	if_equal PHONE_BLACKBELT_KENJI, UnknownScript_0xbcafc
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbcb03

UnknownScript_0xbcabd:
	farwritetext UnknownText_0x1b0eff
	waitbutton
	closetext
	end
; 0xbcac4

UnknownScript_0xbcac4: ; 0xbcac4
	farwritetext UnknownText_0x1b164d
	waitbutton
	closetext
	end
; 0xbcacb

UnknownScript_0xbcacb: ; 0xbcacb
	farwritetext UnknownText_0x1b1978
	waitbutton
	closetext
	end
; 0xbcad2

UnknownScript_0xbcad2: ; 0xbcad2
	farwritetext UnknownText_0x1b1c91
	waitbutton
	closetext
	end
; 0xbcad9

UnknownScript_0xbcad9: ; 0xbcad9
	farwritetext UnknownText_0xa4c47
	waitbutton
	closetext
	end
; 0xbcae0

UnknownScript_0xbcae0: ; 0xbcae0
	farwritetext UnknownText_0xa52a0
	waitbutton
	closetext
	end
; 0xbcae7

UnknownScript_0xbcae7: ; 0xbcae7
	farwritetext UnknownText_0xa5513
	waitbutton
	closetext
	end
; 0xbcaee

UnknownScript_0xbcaee: ; 0xbcaee
	farwritetext UnknownText_0xa5aff
	waitbutton
	closetext
	end
; 0xbcaf5

UnknownScript_0xbcaf5: ; 0xbcaf5
	farwritetext UnknownText_0xa5d9a
	waitbutton
	closetext
	end
; 0xbcafc

UnknownScript_0xbcafc: ; 0xbcafc
	farwritetext UnknownText_0xa5faa
	waitbutton
	closetext
	end
; 0xbcb03

UnknownScript_0xbcb03: ; 0xbcb03
	farwritetext UnknownText_0xa61c9
	waitbutton
	closetext
	end
; 0xbcb0a

RematchGiftMScript: ; 0xbcb0a
	loadfont
	checkcode VAR_CALLERID
	if_equal PHONE_SAILOR_HUEY, UnknownScript_0xbcb1d
	if_equal PHONE_YOUNGSTER_JOEY, UnknownScript_0xbcb23
	if_equal PHONE_BIRDKEEPER_VANCE, UnknownScript_0xbcb29
	if_equal PHONE_HIKER_PARRY, UnknownScript_0xbcb2f

UnknownScript_0xbcb1d:
	farwritetext UnknownText_0x1b0f2f
	buttonsound
	end
; 0xbcb23

UnknownScript_0xbcb23: ; 0xbcb23
	farwritetext UnknownText_0x1b19be
	buttonsound
	end
; 0xbcb29

UnknownScript_0xbcb29: ; 0xbcb29
	farwritetext UnknownText_0xa5b3f
	buttonsound
	end
; 0xbcb2f

UnknownScript_0xbcb2f: ; 0xbcb2f
	farwritetext UnknownText_0xa6200
	buttonsound
	end
; 0xbcb35

AskNumber1FScript: ; 0xbcb35
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcb57
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbcb5c
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbcb61
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbcb66
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcb6b
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcb70
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcb75
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcb7a

UnknownScript_0xbcb57:
	farwritetext UnknownText_0x1b0bb6
	end
; 0xbcb5c

UnknownScript_0xbcb5c: ; 0xbcb5c
	farwritetext UnknownText_0x1b1239
	end
; 0xbcb61

UnknownScript_0xbcb61: ; 0xbcb61
	farwritetext UnknownText_0x1b1690
	end
; 0xbcb66

UnknownScript_0xbcb66: ; 0xbcb66
	farwritetext UnknownText_0x1b1ebe
	end
; 0xbcb6b

UnknownScript_0xbcb6b: ; 0xbcb6b
	farwritetext UnknownText_0xa4405
	end
; 0xbcb70

UnknownScript_0xbcb70: ; 0xbcb70
	farwritetext UnknownText_0xa4c8c
	end
; 0xbcb75

UnknownScript_0xbcb75: ; 0xbcb75
	farwritetext UnknownText_0xa574a
	end
; 0xbcb7a

UnknownScript_0xbcb7a: ; 0xbcb7a
	farwritetext UnknownText_0xa6295
	end
; 0xbcb7f

AskNumber2FScript: ; 0xbcb7f
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcba1
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbcba6
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbcbab
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbcbb0
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcbb5
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcbba
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcbbf
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcbc4

UnknownScript_0xbcba1:
	farwritetext UnknownText_0x1b0c37
	end
; 0xbcba6

UnknownScript_0xbcba6: ; 0xbcba6
	farwritetext UnknownText_0x1b1314
	end
; 0xbcbab

UnknownScript_0xbcbab: ; 0xbcbab
	farwritetext UnknownText_0x1b1710
	end
; 0xbcbb0

UnknownScript_0xbcbb0: ; 0xbcbb0
	farwritetext UnknownText_0x1b1f4e
	end
; 0xbcbb5

UnknownScript_0xbcbb5: ; 0xbcbb5
	farwritetext UnknownText_0xa44db
	end
; 0xbcbba

UnknownScript_0xbcbba: ; 0xbcbba
	farwritetext UnknownText_0xa4d36
	end
; 0xbcbbf

UnknownScript_0xbcbbf: ; 0xbcbbf
	farwritetext UnknownText_0xa57e3
	end
; 0xbcbc4

UnknownScript_0xbcbc4: ; 0xbcbc4
	farwritetext UnknownText_0xa6316
	end
; 0xbcbc9

RegisteredNumberFScript: ; 0xbcbc9
	farwritetext UnknownText_0x1b09e1
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end
; 0xbcbd3

NumberAcceptedFScript: ; 0xbcbd3
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcbf5
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbcbfc
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbcc03
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbcc0a
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcc11
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcc18
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcc1f
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcc26

UnknownScript_0xbcbf5:
	farwritetext UnknownText_0x1b0c9b
	waitbutton
	closetext
	end
; 0xbcbfc

UnknownScript_0xbcbfc: ; 0xbcbfc
	farwritetext UnknownText_0x1b1392
	waitbutton
	closetext
	end
; 0xbcc03

UnknownScript_0xbcc03: ; 0xbcc03
	farwritetext UnknownText_0x1b1755
	waitbutton
	closetext
	end
; 0xbcc0a

UnknownScript_0xbcc0a: ; 0xbcc0a
	farwritetext UnknownText_0x1b1faa
	waitbutton
	closetext
	end
; 0xbcc11

UnknownScript_0xbcc11: ; 0xbcc11
	farwritetext UnknownText_0xa451d
	waitbutton
	closetext
	end
; 0xbcc18

UnknownScript_0xbcc18: ; 0xbcc18
	farwritetext UnknownText_0xa4d72
	waitbutton
	closetext
	end
; 0xbcc1f

UnknownScript_0xbcc1f: ; 0xbcc1f
	farwritetext UnknownText_0xa5820
	waitbutton
	closetext
	end
; 0xbcc26

UnknownScript_0xbcc26: ; 0xbcc26
	farwritetext UnknownText_0xa6359
	waitbutton
	closetext
	end
; 0xbcc2d

NumberDeclinedFScript: ; 0xbcc2d
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcc4f
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbcc56
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbcc5d
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbcc64
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcc6b
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcc72
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcc79
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcc80

UnknownScript_0xbcc4f:
	farwritetext UnknownText_0x1b0ce0
	waitbutton
	closetext
	end
; 0xbcc56

UnknownScript_0xbcc56: ; 0xbcc56
	farwritetext UnknownText_0x1b13af
	waitbutton
	closetext
	end
; 0xbcc5d

UnknownScript_0xbcc5d: ; 0xbcc5d
	farwritetext UnknownText_0x1b178a
	waitbutton
	closetext
	end
; 0xbcc64

UnknownScript_0xbcc64: ; 0xbcc64
	farwritetext UnknownText_0x1b1fdd
	waitbutton
	closetext
	end
; 0xbcc6b

UnknownScript_0xbcc6b: ; 0xbcc6b
	farwritetext UnknownText_0xa4542
	waitbutton
	closetext
	end
; 0xbcc72

UnknownScript_0xbcc72: ; 0xbcc72
	farwritetext UnknownText_0xa4dcd
	waitbutton
	closetext
	end
; 0xbcc79

UnknownScript_0xbcc79: ; 0xbcc79
	farwritetext UnknownText_0xa5842
	waitbutton
	closetext
	end
; 0xbcc80

UnknownScript_0xbcc80: ; 0xbcc80
	farwritetext UnknownText_0xa638c
	waitbutton
	closetext
	end
; 0xbcc87

PhoneFullFScript: ; 0xbcc87
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcca9
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbccb0
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbccb7
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbccbe
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbccc5
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcccc
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbccd3
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbccda

UnknownScript_0xbcca9:
	farwritetext UnknownText_0x1b0d0b
	waitbutton
	closetext
	end
; 0xbccb0

UnknownScript_0xbccb0: ; 0xbccb0
	farwritetext UnknownText_0x1b13e4
	waitbutton
	closetext
	end
; 0xbccb7

UnknownScript_0xbccb7: ; 0xbccb7
	farwritetext UnknownText_0x1b17ba
	waitbutton
	closetext
	end
; 0xbccbe

UnknownScript_0xbccbe: ; 0xbccbe
	farwritetext UnknownText_0x1b1ffa
	waitbutton
	closetext
	end
; 0xbccc5

UnknownScript_0xbccc5: ; 0xbccc5
	farwritetext UnknownText_0xa4573
	waitbutton
	closetext
	end
; 0xbcccc

UnknownScript_0xbcccc: ; 0xbcccc
	farwritetext UnknownText_0xa4e01
	waitbutton
	closetext
	end
; 0xbccd3

UnknownScript_0xbccd3: ; 0xbccd3
	farwritetext UnknownText_0xa5881
	waitbutton
	closetext
	end
; 0xbccda

UnknownScript_0xbccda: ; 0xbccda
	farwritetext UnknownText_0xa63cc
	waitbutton
	closetext
	end
; 0xbcce1

RematchFScript: ; 0xbcce1
	checkcode VAR_CALLERID
	if_equal PHONE_COOLTRAINERF_BETH, UnknownScript_0xbccff
	if_equal PHONE_COOLTRAINERF_REENA, UnknownScript_0xbcd06
	if_equal PHONE_PICNICKER_LIZ, UnknownScript_0xbcd0d
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcd14
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcd1b
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcd22
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcd29

UnknownScript_0xbccff:
	farwritetext UnknownText_0x1b1409
	waitbutton
	closetext
	end
; 0xbcd06

UnknownScript_0xbcd06: ; 0xbcd06
	farwritetext UnknownText_0x1b17de
	waitbutton
	closetext
	end
; 0xbcd0d

UnknownScript_0xbcd0d: ; 0xbcd0d
	farwritetext UnknownText_0x1b201f
	waitbutton
	closetext
	end
; 0xbcd14

UnknownScript_0xbcd14: ; 0xbcd14
	farwritetext UnknownText_0xa4595
	waitbutton
	closetext
	end
; 0xbcd1b

UnknownScript_0xbcd1b: ; 0xbcd1b
	farwritetext UnknownText_0xa4e21
	waitbutton
	closetext
	end
; 0xbcd22

UnknownScript_0xbcd22: ; 0xbcd22
	farwritetext UnknownText_0xa58a3
	waitbutton
	closetext
	end
; 0xbcd29

UnknownScript_0xbcd29: ; 0xbcd29
	farwritetext UnknownText_0xa63f1
	waitbutton
	closetext
	end
; 0xbcd30

GiftFScript: ; 0xbcd30
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcd42
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcd48
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcd4e
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcd54

UnknownScript_0xbcd42:
	farwritetext UnknownText_0x1b0d2c
	buttonsound
	end
; 0xbcd48

UnknownScript_0xbcd48: ; 0xbcd48
	farwritetext UnknownText_0xa45c9
	buttonsound
	end
; 0xbcd4e

UnknownScript_0xbcd4e: ; 0xbcd4e
	farwritetext UnknownText_0xa4e4c
	buttonsound
	end
; 0xbcd54

UnknownScript_0xbcd54: ; 0xbcd54
	farwritetext UnknownText_0xa58d5
	buttonsound
	end
; 0xbcd5a

PackFullFScript: ; 0xbcd5a
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, UnknownScript_0xbcd70
	if_equal PHONE_PICNICKER_GINA, UnknownScript_0xbcd77
	if_equal PHONE_LASS_DANA, UnknownScript_0xbcd7e
	if_equal PHONE_PICNICKER_TIFFANY, UnknownScript_0xbcd85
	if_equal PHONE_PICNICKER_ERIN, UnknownScript_0xbcd8c

UnknownScript_0xbcd70:
	farwritetext UnknownText_0x1b0d69
	waitbutton
	closetext
	end
; 0xbcd77

UnknownScript_0xbcd77: ; 0xbcd77
	farwritetext UnknownText_0xa4603
	waitbutton
	closetext
	end
; 0xbcd7e

UnknownScript_0xbcd7e: ; 0xbcd7e
	farwritetext UnknownText_0xa4e8f
	waitbutton
	closetext
	end
; 0xbcd85

UnknownScript_0xbcd85: ; 0xbcd85
	farwritetext UnknownText_0xa5914
	waitbutton
	closetext
	end
; 0xbcd8c

UnknownScript_0xbcd8c: ; 0xbcd8c
	farwritetext UnknownText_0xa6411
	waitbutton
	closetext
	end
; 0xbcd93

RematchGiftFScript: ; 0xbcd93
; This is redundant because there's only one phone number in the game that would be checked.
	checkcode VAR_CALLERID
	if_equal PHONE_PICNICKER_ERIN, .ok
.ok
	loadfont
	farwritetext UnknownText_0xa6454
	buttonsound
	end
; 0xbcda0

GymStatue1Script: ; 0xbcda0
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	special SpecialRegionCheck
	iftrue .rival_won
	waitbutton
	closetext
	end
; 0xbcdaa
.rival_won
	buttonsound
	farwritetext EGKGymStatueTextBefore
	waitbutton
	closetext
	end

GymStatue2Script: ; 0xbcdaa
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	buttonsound
	special SpecialRegionCheck
	iftrue .rival_won
	farwritetext UnknownText_0x1b075c
	waitbutton
	closetext
	end
; 0xbcdb9
.rival_won
	farwritetext EGKGymStatueTextAfter
	waitbutton
	closetext
	end

ReceiveItemScript: ; 0xbcdb9
	waitsfx
	farwritetext UnknownText_0x1b0648
	playsound SFX_ITEM
	waitsfx
	end
; 0xbcdc3

ReceiveTogepiEggScript: ; 0xbcdc3
	waitsfx
	farwritetext UnknownText_0x1b0648
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	end
; 0xbcdcd

GameCornerCoinVendorScript: ; 0xbcdcd
	faceplayer
	loadfont
	farwritetext UnknownText_0x1b077f
	buttonsound
	checkitem COIN_CASE
	iftrue UnknownScript_0xbcde0
	farwritetext UnknownText_0x1b079c
	waitbutton
	closetext
	end
; 0xbcde0

UnknownScript_0xbcde0: ; 0xbcde0
	farwritetext UnknownText_0x1b07e3

UnknownScript_0xbcde4: ; 0xbcde4
	special Function24b4e
	loadmenudata MenuDataHeader_0xbce54
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0xbcdf7
	if_equal $2, UnknownScript_0xbce1b
	jump UnknownScript_0xbce4d
; 0xbcdf7

UnknownScript_0xbcdf7: ; 0xbcdf7
	checkmoney $0, 1000
	if_equal $2, UnknownScript_0xbce3f
	checkcoins MAX_COINS - 49
	if_equal $0, UnknownScript_0xbce46
	givecoins 50
	takemoney $0, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext UnknownText_0x1b0830
	waitbutton
	jump UnknownScript_0xbcde4
; 0xbce1b

UnknownScript_0xbce1b: ; 0xbce1b
	checkmoney $0, 10000
	if_equal $2, UnknownScript_0xbce3f
	checkcoins MAX_COINS - 499
	if_equal $0, UnknownScript_0xbce46
	givecoins 500
	takemoney $0, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext UnknownText_0x1b084f
	waitbutton
	jump UnknownScript_0xbcde4
; 0xbce3f

UnknownScript_0xbce3f: ; 0xbce3f
	farwritetext UnknownText_0x1b086f
	waitbutton
	closetext
	end
; 0xbce46

UnknownScript_0xbce46: ; 0xbce46
	farwritetext UnknownText_0x1b088c
	waitbutton
	closetext
	end
; 0xbce4d


UnknownScript_0xbce4d: ; 0xbce4d
	farwritetext UnknownText_0x1b08ad
	waitbutton
	closetext
	end
; 0xbce54


MenuDataHeader_0xbce54: ; 0xbce54
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0xbce5c
	db 1 ; default option
; 0xbce5c

MenuData2_0xbce5c: ; 0xbce5c
	db $80 ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"
; 0xbce7f


HappinessCheckScript: ; 0xbce7f
	faceplayer
	loadfont
	special Function718d
	if_less_than 50, UnknownScript_0xbce9a
	if_less_than 150, UnknownScript_0xbce93
	farwritetext UnknownText_0x1b092a
	waitbutton
	closetext
	end
; 0xbce93

UnknownScript_0xbce93: ; 0xbce93
	farwritetext UnknownText_0x1b0954
	waitbutton
	closetext
	end
; 0xbce9a

UnknownScript_0xbce9a: ; 0xbce9a
	farwritetext UnknownText_0x1b0989
	waitbutton
	closetext
	end
; 0xbcea1

MovementData_0xbcea1: ; bcea1
	step_right
	step_down
	turn_head_up
	step_end
; bcea5


IndigoPlateauStatue1Script:
	loadfont
	farwritetext _IndigoPlateauStatuesText1
	waitbutton
	closetext
	end

IndigoPlateauStatue2Script:
	loadfont
	farwritetext _IndigoPlateauStatuesText2
	waitbutton
	closetext
	end

PokeCenterOldLinkScript:
	loadfont
	farwritetext OldLinkCenterReceptionistText
	waitbutton
	closetext
	end	
	
PokeCenterLinkEGKScript:
	loadfont
	farwritetext LinkCenterReceptionistEGKText
	waitbutton
	closetext
	end	