; cd60
VFLIP_VOLTORB EQU 2
VFLIP_FLIPPED EQU 3
VFLIP_FLAGGED EQU 4

SECTION "Voltorb Flip", ROMX

VoltorbFlip:
	ld hl, Options
	set NO_TEXT_SCROLL, [hl]
	call .InitAll
	call DelayFrame
.loop
	callba Function8cf62
	call VFlipLoop
	jr nc, .loop
	ld a, [wVoltorbFlipHighestLevel]
	ld [ScriptVar], a
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	call WhiteBGMap
	ld hl, Options
	res NO_TEXT_SCROLL, [hl]
	ld hl, rLCDC
	res 2, [hl]
	ret

.InitAll
	call WhiteBGMap
	call ClearTileMap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD

	callba Function8cf53
	call Functione51
	call Functione5f

	ld hl, wVoltorbFlip
	ld bc, wVoltorbFlipEnd - wVoltorbFlip
	xor a
	call ByteFill

	ld hl, VoltorbFlipObjTiles
	ld de, VTiles0
	ld bc, $10
	call CopyBytes

	ld hl, VoltorbFlipBGTiles
	ld de, VTiles2
	ld bc, $250
	call CopyBytes

	call VoltorbFlip_InitLayout
	call EnableLCD
	call Function3200
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	call DelayFrame

	ld hl, wcf63
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	inc a
	ld [wVoltorbFlipLevel], a

	ld de, MUSIC_GAME_CORNER
	call PlayMusic
	ret

VoltorbFlip_InitLayout:
	call VoltorbFlip_InitBoardPals
	hlcoord 0, 0
	ld bc, $0168
	ld a, $23
	call ByteFill

	hlcoord 8, 2
	ld b, 5
.row
	ld c, 5
	ld de, $14
	push hl
.col
	push hl
	xor a
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	add hl, de
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	inc hl
	inc hl
	dec c
	jr nz, .col
	pop hl
	ld de, $28
	add hl, de
	dec b
	jr nz, .row

	hlcoord 8, 0
	ld b, 5
	ld de, $14
.loop
	call .LoadCounters
	inc hl
	inc hl
	dec b
	jr nz, .loop

	hlcoord 18, 2
	ld b, 5
	ld de, $14
.loop2
	call .LoadCounters
	add hl, de
	add hl, de
	dec b
	jr nz, .loop2

	hlcoord 0, 0
	lb bc, 1, 6
	call TextBox

	hlcoord 0, 3
	lb bc, 1, 6
	call TextBox

	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret

.LoadCounters
	push hl
	ld a, $22
	ld [hli], a
	ld a, $18
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a
	pop hl
	ret

VoltorbFlip_InitStrings:
	hlcoord 1, 0
	ld de, .Coins
	call PlaceString

	call VoltorbFlip_PrintCoins

	hlcoord 1, 3
	ld de, .Payout
	call PlaceString

	call VoltorbFlip_PrintPayout

	jp VoltorbFlip_PrintLevel

.Coins
	db "COINS@"
.Payout
	db "PAYOUT@"

VoltorbFlip_InitBoardPals:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, VoltorbFlipBG0Pal
	ld de, Unkn1Pals
	ld bc, $8
	call CopyBytes

	ld hl, VoltorbFlipBG7Pal
	ld de, Unkn1Pals + $38
	ld bc, $8
	call CopyBytes

	ld hl, VoltorbFlipOBPal
	ld de, Unkn2Pals
	ld bc, $8
	call CopyBytes

	pop af
	ld [rSVBK], a

	hlcoord 0, 0, AttrMap
	ld bc, $0168
	xor a
	call ByteFill
	ret

VoltorbFlip_PrintLevel:
	hlcoord 1, 7
	ld a, $24
	ld [hli], a
	ld a, [wVoltorbFlipLevel]
	ld b, a
	cp 10
	jr nc, .load_10
	ld a, $23
.finish
	ld [hli], a
	ld a, b
	add $18
	ld [hl], a
	ret

.load_10
	ld a, b
	ld c, 0
.loop
	inc c
	sub 10
	jr nc, .loop
	add 10
	dec c
	ld b, a
	ld a, c
	add $18
	jr .finish

VoltorbFlip_PrintPayout:
	hlcoord 2, 4
	ld de, wVoltorbFlipPayout
	jr continue_printing_amount

VoltorbFlip_PrintCoins:
	hlcoord 2, 1
	ld de, Coins
continue_printing_amount
	push de
	push hl
	ld a, " "
	ld bc, 3
	call ByteFill
	pop hl
	pop de
	lb bc, $c0 | 2, 5
	jp PrintNum

VFlipLoop:
	ld a, [wcf63]
	bit 7, a
	jr nz, .Quit
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp [hl]

.return
	and a
	ret

.Quit
	scf
	ret

.Jumptable
	dw VoltorbFlip_AskPlayWithThreeCoins ; 0
	dw VoltorbFlip_StartGame             ; 1
	dw VoltorbFlip_HandleJoypad          ; 2
	dw VoltorbFlip_CheckTile             ; 3
	dw VoltorbFlip_HandleOutcome         ; 4
	dw VoltorbFlip_PlayAgain             ; 5
	dw VoltorbFlip_QuitGame              ; 6

VoltorbFlip_QuitGame:
	ld hl, wcf63
	set 7, [hl]
	ret

VoltorbFlip_Next:
	ld hl, wcf63
	inc [hl]
	ret

VoltorbFlip_AskPlayWithThreeCoins:
	call VoltorbFlip_InitStrings
	xor a
	ld [$ffc3], a
	ld a, 3
	ld [$ffc4], a
	ld bc, $ffc3
	callba Function160a1 ; CheckCoins
	jr c, VoltorbFlip_NotEnoughCoins
	ld hl, VoltorbFlip_PlayWithThreeCoinsText
VoltorbFlip_AskPlayAgain:
	call PrintText
	call YesNoBox
	jr c, VoltorbFlip_QuitGame
	xor a
	ld [$ffc3], a
	ld a, 3
	ld [$ffc4], a
	ld bc, $ffc3
	callba Function1608f ; TakeCoins
	call VoltorbFlip_PrintCoins
	call VoltorbFlip_ClearBoard
	call VoltorbFlip_SampleBoard
	ld hl, wVoltorbFlipPayout
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	ld de, SFX_SLOT_MACHINE_START
	call PlaySFX
	call WaitSFX
	ld hl, wcf63
	ld [hl], $1
	ret

VoltorbFlip_NotEnoughCoins:
	ld hl, .NotEnoughCoinsText
	call PrintText
	ld hl, wcf63
	ld [hl], $6
	ret

.NotEnoughCoinsText
	text "You don't have"
	line "enough coins."
	done

VoltorbFlip_PlayWithThreeCoinsText
	text "Play with 3 coins?"
	done

VoltorbFlip_StartGame:
	call VoltorbFlip_InitLayout
	call VoltorbFlip_InitStrings
	call VoltorbFlip_PlaceCounts
	ld hl, wVoltorbFlipCursor
	xor a
	ld [hl], a
	lb de, $20, $48
	ld a, $2d
	call Function3b2a
	ld hl, .PickACardText
	call PrintText
	jp VoltorbFlip_Next

.PickACardText
	text "A: Choose"
	line "SELECT: Flag"
	done

VoltorbFlip_HandleJoypad:
	call Functiona57
	ld hl, $ffa9
	ld a, [hl]
	and A_BUTTON
	jp nz, VoltorbFlip_Next
	ld a, [hl]
	and SELECT
	jr nz, .select
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .d_right
	ret

.d_down
	ld hl, wVoltorbFlipCursor
	ld a, [hl]
	and $f
	cp 4
	jr nz, .okay_down
	ld a, -1
.okay_down
	inc a
	jr .finish_vertical

.d_up
	ld hl, wVoltorbFlipCursor
	ld a, [hl]
	and $f
	jr nz, .okay_up
	ld a, 5
.okay_up
	dec a
.finish_vertical
	ld b, a
	ld a, [hl]
	and $f0
	or b
	ld [hl], a
	ret

.d_right
	ld hl, wVoltorbFlipCursor
	ld a, [hl]
	and $f0
	cp $40
	jr nz, .okay_right
	ld a, $f0
.okay_right
	add $10
	jr .finish_horizontal

.d_left
	ld hl, wVoltorbFlipCursor
	ld a, [hl]
	and $f0
	jr nz, .okay_left
	ld a, $50
.okay_left
	sub $10
.finish_horizontal
	ld b, a
	ld a, [hl]
	and $f
	or b
	ld [hl], a
	ret

.select
	ld hl, wVoltorbFlipCursor
	ld a, [hl]
	and $f
	ld c, a
	ld a, [hl]
	and $f0
	swap a
	ld b, a
	push bc
	ld a, c
	ld bc, 5
	ld hl, wVoltorbFlipBoard
	call AddNTimes
	pop bc
	ld c, b
	ld b, 0
	add hl, bc
	bit VFLIP_FLIPPED, [hl]
	ret nz
	bit VFLIP_FLAGGED, [hl]
	jr z, .flag
	res VFLIP_FLAGGED, [hl]
	xor a
	jr .continue_select

.flag
	set VFLIP_FLAGGED, [hl]
	ld a, $14
.continue_select
	push af
	hlcoord 8, 2
	ld a, [wVoltorbFlipCursor]
	and $f
	ld bc, $28
	call AddNTimes
	ld a, [wVoltorbFlipCursor]
	srl a
	srl a
	srl a
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld de, $14
	add hl, de
	ld [hli], a
	inc a
	ld [hl], a
	ret

VoltorbFlip_CheckTile:
	call VoltorbFlip_CheckSquare
	jr c, .fail
	cp 2
	jp z, VoltorbFlip_Next
	ld hl, wcf63
	ld [hl], $2
	ret

.fail
	ld hl, wVoltorbFlipLevel
	ld a, [hl]
	cp 1
	jr z, .skip
	dec a
	ld [hl], a
	ld hl, .BummerText
	call PrintText
	call VoltorbFlip_PrintLevel
	ld c, 64
	call DelayFrames
	ld c, 64
	call DelayFrames
.skip
	ld hl, wcf63
	ld [hl], $5
	ret

.BummerText
	text "Bummer! Dropped"
	line "to level @"
	deciram wVoltorbFlipLevel, $12
	text "."
	done

VoltorbFlip_HandleOutcome:
	ld hl, .EndRoundText
	call PrintText
	ld de, SFX_2ND_PLACE
	call PlaySFX
	call WaitSFX

	ld a, -1
	ld [wcf64], a
	inc a
	ld [$ffc3], a
	inc a
	ld [$ffc4], a
.payout_loop
	ld hl, wVoltorbFlipPayout
	ld a, [hli]
	or [hl]
	jr z, .RevealTiles
	ld a, [hl]
	dec [hl]
	dec hl
	and a
	jr nz, .dont_dec
	dec [hl]
.dont_dec
	ld bc, $ffc3
	callba Function1606f ; GiveCoins
	call VoltorbFlip_PrintPayout
	call VoltorbFlip_PrintCoins
	ld a, [wcf64]
	inc a
	ld [wcf64], a
	and $7
	jr nz, .delay_frame
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
.delay_frame
	call DelayFrame
	jr .payout_loop

.RevealTiles
	call VoltorbFlip_RevealBoard
	ld hl, wVoltorbFlipLevel
	ld a, [hli]
	cp [hl]
	jr c, .dont_load_max
	ld [hl], a
.dont_load_max
	dec hl
	cp 10
	jr nc, .okay
	inc a
	ld [hl], a
	ld hl, .AdvancedLevelText
	call PrintText
	call VoltorbFlip_PrintLevel
	ld de, SFX_1ST_PLACE
	call PlaySFX
	call WaitSFX
	ld c, 64
	call DelayFrames
.okay
	jp VoltorbFlip_Next

.EndRoundText
	text "You found all the"
	line "coins this round!"
	done

.AdvancedLevelText
	text "Yes! Advanced to"
	line "level @"
	deciram wVoltorbFlipLevel, $12
	text "!"
	done

VoltorbFlip_RevealTile
	ld a, [de]
	and $3
	inc a
	sla a
	sla a
	push hl
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	push de
	ld de, $14
	add hl, de
	pop de
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	ret

VoltorbFlip_PlayAgain:
	callba Function8cf53
	xor a
	ld [$ffc3], a
	ld a, 3
	ld [$ffc4], a
	ld bc, $ffc3
	callba Function160a1 ; CheckCoins
	jr c, .NotEnoughCoins
	ld hl, wcf63
	ld [hl], 0
	ld hl, .PlayAgainText
	jp VoltorbFlip_AskPlayAgain

.NotEnoughCoins
	ld hl, .NotEnoughCoinsText
	call PrintText
	ld hl, wcf63
	ld [hl], $6
	ret

.PlayAgainText
	text "Play again?"
	done

.NotEnoughCoinsText
	text "You've run out of"
	line "coins."
	done

VoltorbFlip_RevealBoard:
	ld c, 24
	call DelayFrames
	ld de, wVoltorbFlipBoard
	hlcoord 8, 2
	lb bc, 5, 5
.row
	push bc
.col
	call VoltorbFlip_RevealTile
	inc de
	inc hl
	inc hl
	dec c
	jr nz, .col
	ld bc, 30
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld c, 64
	call DelayFrames
	ld c, 64
	jp DelayFrames

VoltorbFlip_PlaceCounts:
	ld c, 0
	hlcoord 9, 0
.col
	push hl
	ld a, c
	push bc
	call VoltorbFlip_CountVoltorbInCol
	pop bc
	add $18
	pop hl
	ld [hl], a
	push hl
	ld de, $13
	add hl, de
	push hl
	ld a, c
	push bc
	call VoltorbFlip_SumCoinsInCol
	pop bc
	ld e, a
	ld d, 0
	cp 10
	jr c, .units_only
.subtract
	sub 10
	inc d
	jr nc, .subtract
	add 10
	dec d
	ld e, a
.units_only
	pop hl
	ld a, d
	add $18
	ld [hli], a
	ld a, e
	add $18
	ld [hl], a
	pop hl
	inc hl
	inc hl
	inc c
	ld a, c
	cp 5
	jr nz, .col

	ld c, 0
	hlcoord 19, 2
.row
	push hl
	ld a, c
	push bc
	call VoltorbFlip_CountVoltorbInRow
	pop bc
	add $18
	pop hl
	ld [hl], a
	push hl
	ld de, $13
	add hl, de
	push hl
	ld a, c
	push bc
	call VoltorbFlip_SumCoinsInRow
	pop bc
	ld e, a
	ld d, 0
	cp 10
	jr c, .units_only_row
.subtract_row
	sub 10
	inc d
	jr nc, .subtract_row
	add 10
	dec d
	ld e, a
.units_only_row
	pop hl
	ld a, d
	add $18
	ld [hli], a
	ld a, e
	add $18
	ld [hl], a
	pop hl
	ld de, $28
	add hl, de
	inc c
	ld a, c
	cp 5
	jr nz, .row
	ret

VoltorbFlip_ClearBoard:
	ld hl, wVoltorbFlipBoard
	ld c, 25
	xor a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

VoltorbFlip_SampleBoard:
	ld a, [wVoltorbFlipLevel]
	dec a
	ld e, a
	ld d, 0
	ld hl, .MinMax
	add hl, de
	add hl, de
	ld de, wVoltorbFlipMinPayout
	ld bc, 4
	call CopyBytes
.TryAgain
	ld a, [wVoltorbFlipLevel]
	srl a
	add 6
	ld b, a
.loop
	call Random
	and $1f
	cp 25
	jr nc, .loop
	ld e, a
	ld d, 0
	ld hl, wVoltorbFlipBoard
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld a, 1 << VFLIP_VOLTORB
	ld [hl], a
	dec b
	jr nz, .loop
	ld a, [wVoltorbFlipLevel]
	dec a
	ld e, a
	ld d, 0
	ld hl, .Odds
	add hl, de
	add hl, de
	ld de, wVoltorbFlipBoard
	ld b, 25
.loop2
	ld a, [de]
	and a
	jr nz, .next
	push bc
	push hl
	ld c, 1
	call Random
	ld b, a
.loop3
	ld a, b
	cp [hl]
	jr c, .okay
	jr z, .okay
	inc hl
	inc c
	ld a, c
	cp 3
	jr nz, .loop3
.okay
	pop hl
	ld a, [de]
	or c
	ld [de], a
	pop bc
.next
	inc de
	dec b
	jr nz, .loop2
	call VoltorbFlip_CountTotalNumberOfCoins
	jr c, .resample
	call VoltorbFlip_Count2sAnd3s
	ret nz
.resample
	call VoltorbFlip_ClearBoard
	jp .TryAgain

.Odds
	db  80 percent,  96 percent
	db  75 percent,  92 percent
	db  70 percent,  88 percent
	db  65 percent,  84 percent
	db  60 percent,  80 percent
	db  55 percent,  76 percent
	db  50 percent,  72 percent
	db  45 percent,  68 percent
	db  40 percent,  64 percent
	db  35 percent,  60 percent

.MinMax
	bigdw    20
	bigdw    50
	bigdw   100
	bigdw   200
	bigdw   500
	bigdw  1000
	bigdw  2000
	bigdw  3000
	bigdw  5000
	bigdw  7000
	bigdw 10000

VoltorbFlip_CountVoltorbInRow:
	ld hl, wVoltorbFlipBoard
	ld bc, 5
	call AddNTimes
	xor a
	ld c, 5
.loop
	bit VFLIP_VOLTORB, [hl]
	jr z, .next
	inc a
.next
	inc hl
	dec c
	jr nz, .loop
	ret

VoltorbFlip_CountVoltorbInCol:
	ld hl, wVoltorbFlip
	ld c, a
	ld b, 0
	add hl, bc
	ld c, 5
	push de
	ld de, 5
	xor a
.loop
	bit VFLIP_VOLTORB, [hl]
	jr z, .next
	inc a
.next
	add hl, de
	dec c
	jr nz, .loop
	pop de
	ret

VoltorbFlip_SumCoinsInRow:
	ld hl, wVoltorbFlipBoard
	ld bc, 5
	call AddNTimes
	lb bc, 0, 5
.loop
	ld a, [hli]
	and $3
	add b
	ld b, a
	dec c
	jr nz, .loop
	ld a, b
	ret

VoltorbFlip_SumCoinsInCol:
	ld hl, wVoltorbFlipBoard
	ld c, a
	ld b, 0
	add hl, bc
	lb bc, 0, 5
	ld de, 5
.loop
	ld a, [hl]
	and $3
	add b
	ld b, a
	add hl, de
	dec c
	jr nz, .loop
	ld a, b
	ret

VoltorbFlip_Count2sAnd3s:
	ld hl, wVoltorbFlipBoard
	ld b, 0
	ld c, 25
.loop
	ld a, [hli]
	and $3
	jr z, .next
	dec a
	jr z, .next
	inc b
.next
	dec c
	jr nz, .loop
	ld a, b
	ld [wVoltorbFlipNum2s3s], a
	and a
	ret

UpdateVoltorbFlipCursor:
	ld a, [wcf63]
	and a
	jr z, .deinit
	cp 5
	jr nc, .deinit
	ld hl, 7 ; SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [wVoltorbFlipCursor]
	and $f
	swap a
	ld [hld], a ; SPRITEANIMSTRUCT_XOFFSET
	ld a, [wVoltorbFlipCursor]
	and $f0
	ld [hl], a
	ret

.deinit
	xor a
	ld [bc], a
	call ClearSprites
	ret

VoltorbFlip_CountTotalNumberOfCoins:
	ld de, wVoltorbFlipBoard
	ld c, 25
	ld hl, 1
.loop
	ld a, [de]
	inc de
	and $3
	jr z, .next
	dec a
	jr z, .next
	push de
	ld d, h
	ld e, l
.loop2
	add hl, de
	jr c, .pop_fail
	dec a
	jr nz, .loop2
	pop de
.next
	ld a, 50000 / $100
	cp h
	jr c, .fail
	jr nz, .okay
	ld a, 50000 % $100
	cp l
	jr c, .fail
.okay
	dec c
	jr nz, .loop
	ld d, h
	ld e, l
	ld hl, wVoltorbFlipPotentialPayout
	ld [hl], d
	inc hl
	ld [hl], e
	dec hl
	ld de, wVoltorbFlipMinPayout
	push hl
	ld c, 2
	call StringCmp
	pop hl
	jr z, .check_max
	jr nc, .fail
.check_max
	ld de, wVoltorbFlipMaxPayout
	ld c, 2
	call StringCmp
	ret c
	and a
	ret

.pop_fail
	pop de
.fail
	scf
	ret

VoltorbFlip_CheckSquare:
	ld a, [wVoltorbFlipNum2s3s]
	cp 1
	jr nz, .skip_sfx
	call Random
	ld a, [hRandomAdd]
	and a
	jr nz, .skip_sfx
	ld a, [hRandomSub]
	cp $20
	jr nz, .skip_sfx
	ld de, SFX_CHOOSE_A_CARD
	call PlaySFX
	call WaitSFX
.skip_sfx
	ld hl, wVoltorbFlipBoard
	ld a, [wVoltorbFlipCursor]
	and $f
	jr z, .first_row
	ld bc, 5
	call AddNTimes
.first_row
	ld a, [wVoltorbFlipCursor]
	and $f0
	jr z, .first_col
	swap a
	ld e, a
	ld d, 0
	add hl, de
.first_col
	ld a, [hl]
	bit VFLIP_FLIPPED, a
	jr nz, .already_upturned
	push af
	call .RevealTile
	ld de, SFX_STOP_SLOT
	call PlaySFX
	call WaitSFX
	pop af
	bit VFLIP_VOLTORB, a
	jr nz, .voltorb
	and $3
	cp 1
	jr z, .no_multiplier
	ld [wVoltorbFlipMultiplier], a
	ld [hMultiplier], a
	ld hl, wVoltorbFlipPayout
	xor a
	ld [hMultiplicand], a
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a
	push hl
	call Multiply
	pop hl
	ld a, [hProduct + 3]
	ld [hld], a
	ld a, [hProduct + 2]
	ld [hl], a
	ld hl, .MultiplierText
	call PrintText
	ld de, SFX_3RD_PLACE
	call PlaySFX
	call WaitSFX
	ld hl, wVoltorbFlipPayout
	ld a, [hli]
	cp 50000 / $100
	jr nc, .max_out
	jr c, .okay
	ld a, [hl]
	cp 50000 % $100
	jr c, .okay
	jr z, .okay
.max_out
	ld a, 50000 % $100
	ld [hld], a
	ld a, 50000 / $100
	ld [hl], a
.okay
	call VoltorbFlip_PrintPayout
	ccf
	ld hl, wVoltorbFlipNum2s3s
	dec [hl]
	ld a, 2
	ret z
.no_multiplier
	xor a
	ret

.already_upturned
	ld a, 1
	and a
	ret

.voltorb
	ld hl, wc314
	xor a
	ld [hl], a
	callba Function8cf62
	ld hl, .KAPOW
	call PrintText
	xor a
	ld hl, wVoltorbFlipPayout
	ld [hli], a
	ld [hl], a
	call VoltorbFlip_PrintPayout
	ld de, SFX_EGG_BOMB
	call PlaySFX
	call WaitSFX
	ld c, 64
	call DelayFrames
	ld hl, .NotThisTime
	call PrintText
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	ld c, 64
	call DelayFrames
	call VoltorbFlip_RevealBoard
	scf
	ret

.RevealTile
	set VFLIP_FLIPPED, [hl]
	push hl
	ld d, h
	ld e, l
	call VoltorbFlip_Cursor2Tile
	call VoltorbFlip_RevealTile
	pop hl
	ret

.MultiplierText
	text "×@"
	deciram wVoltorbFlipMultiplier, $11
	text "! Won @"
	deciram wVoltorbFlipPayout, $24
	text ""
	line "coins!"
	done

.KAPOW
	text "KAPOW!!"
	done

.NotThisTime
	text "Not this time."
	done

VoltorbFlip_Cursor2Tile:
	hlcoord 8, 2
	ld a, [wVoltorbFlipCursor]
	and $f
	jr z, .okay
	ld bc, $28
	call AddNTimes
.okay
	ld a, [wVoltorbFlipCursor]
	and $f0
	swap a
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ret

VoltorbFlipObjTiles: INCBIN "gfx/voltorbflip/ObjTiles.2bpp"
VoltorbFlipBGTiles:  INCBIN "gfx/voltorbflip/BGTiles.2bpp"

VoltorbFlipBG0Pal:
	RGB 31, 31, 31
	RGB 11, 31,  8
	RGB 31,  0,  0
	RGB  0,  0,  0

VoltorbFlipBG7Pal:
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 10, 10, 10
	RGB  0,  0,  0

VoltorbFlipOBPal:
	RGB 31,  0,  0
	RGB 31,  0,  0
	RGB 31,  0,  0
	RGB  0,  0,  0
