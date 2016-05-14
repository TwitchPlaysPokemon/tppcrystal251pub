Functiond627: ; d627
	call .IsMaximumMoreThan48Pixels
	jr c, .MoreThan48Pixels
	call .ComputePixels
.ShortAnimLoop
	push bc
	push hl
	call ShortAnim_UpdateVariables
	pop hl
	pop bc
	push af
	push bc
	push hl
	call ShortHPBarAnim_UpdateTiles
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .ShortAnimLoop
	ret

.MoreThan48Pixels
	call .ComputePixels
.LongAnimLoop
	push bc
	push hl
	call LongAnim_UpdateVariables
	pop hl
	pop bc
	; ret c
	push af
	push bc
	push hl
	call LongHPBarAnim_UpdateTiles
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	; jr .LongAnimLoop
	jr nc, .LongAnimLoop
	ret
; d65f

.IsMaximumMoreThan48Pixels
	ld a, [wHPBarAnimMaxHP + 1]
	and a
	jr nz, .asm_d66e
	ld a, [wHPBarAnimMaxHP]
	cp $30
	jr nc, .asm_d66e
	and a
	ret

.asm_d66e
	scf
	ret
; d670

.ComputePixels
	push hl
	ld hl, wHPBarAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call Functionc699
	ld a, e
	ld [wCurHPBarPixels], a
	ld a, [wHPBarAnimNewHP]
	ld c, a
	ld a, [wHPBarAnimNewHP + 1]
	ld b, a
	ld a, [wHPBarAnimMaxHP]
	ld e, a
	ld a, [wHPBarAnimMaxHP + 1]
	ld d, a
	call Functionc699
	ld a, e
	ld [wNewHPBarPixels], a
	push hl
	ld hl, wHPBarAnimOldHP
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .Damage
	ld a, [wHPBarAnimOldHP]
	ld [wHPBarAnimLowValue], a
	ld a, [wHPBarAnimNewHP]
	ld [wHPBarAnimHighValue], a
	ld bc, $1
	jr .Okay

.Damage
	ld a, [wHPBarAnimOldHP]
	ld [wHPBarAnimHighValue], a
	ld a, [wHPBarAnimNewHP]
	ld [wHPBarAnimLowValue], a
	ld a, e
	xor $ff
	inc a
	ld e, a
	ld a, d
	xor $ff
	ld d, a
	ld bc, -1
.Okay
	ld a, d
	ld [wHPBarAnimHPDifference], a
	ld a, e
	ld [wHPBarAnimHPDifference + 1], a
	ret
; d6e2

ShortAnim_UpdateVariables: ; d6e2
	; Since we're guaranteed less than 48 HP, we only need a 1-byte comparison.
	; If we're finished, set carry.
	ld hl, wCurHPBarPixels
	ld a, [wNewHPBarPixels]
	cp [hl]
	jr nz, .not_done_yet
	scf
	ret

.not_done_yet
	; Otherwise, add/subtract the pixel (c is 1 or -1), and recompute the HP
	; value.
	ld a, c
	add [hl]
	ld [hl], a
	call ShortAnim_UpdateHP
	and a
	ret
; d6f5

LongAnim_UpdateVariables: ; d6f5
.loop
; If, at any point, the HP bar animation finishes,
; return carry.
	ld hl, wHPBarAnimOldHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	cp [hl]
	jr nz, .update
	inc hl
	ld a, d
	cp [hl]
	jr nz, .update
	scf
	ret

.update
	ld l, e
	ld h, d
	add hl, bc
	ld a, l
	ld [wHPBarAnimOldHP], a
	ld a, h
	ld [wHPBarAnimOldHP + 1], a
	push de
	push bc
	ld a, [Options2]
	and 1
	jr z, .SlowHP
	ld a, [wLinkMode]
	and a
	jr nz, .SlowHP
	ld hl, wHPBarAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Functionc699
.SlowHP
	ld a, e
	pop bc
	pop de
	ld hl, wCurHPBarPixels
	cp [hl]
	jr z, .loop
.load
	ld [hl], a
	and a
	ret
; d730

ShortHPBarAnim_UpdateTiles: ; d730
	call HPBarAnim_UpdateHPRemaining
	ld d, $6 ; HP bar length (tiles)
	ld a, [wWhichHPBar]
	and $1
	ld b, a ; Bar end style
	ld a, [wCurHPBarPixels]
	ld e, a ; Num pixels
	ld c, a ; safety check
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret
; d749

LongHPBarAnim_UpdateTiles: ; d749
	call HPBarAnim_UpdateHPRemaining
	ld a, [wHPBarAnimOldHP]
	ld c, a
	ld a, [wHPBarAnimOldHP + 1]
	ld b, a
	ld a, [wHPBarAnimMaxHP]
	ld e, a
	ld a, [wHPBarAnimMaxHP + 1]
	ld d, a
	call Functionc699
	ld c, e ; safety check
	ld d, $6 ; HP bar length (tiles)
	ld a, [wWhichHPBar]
	and $1
	ld b, a ; Bar end style
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	call HPBarAnim_PaletteUpdate
	ret
; d771

HPBarAnim_RedrawHPBar: ; d771
	ld a, [wWhichHPBar]
	cp $2
	jr nz, .not_party_menu
	; Draw HP bar below the HP amount
	ld a, 2 * SCREEN_WIDTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
.not_party_menu
	call DrawHPBar
	ret
; d784

HPBarAnim_UpdateHPRemaining: ; d784
	ld a, [wWhichHPBar]
	and a
	ret z
	cp $1
	jr z, .battlemon
	ld de, SCREEN_WIDTH + 2
	jr .update_hp_number

.battlemon
	ld de, SCREEN_WIDTH + 1
.update_hp_number
	push hl
	add hl, de
	ld a, " "
	ld [hli], a
	ld [hli], a
	ld [hld], a
	dec hl
	ld a, [wHPBarAnimOldHP]
	ld [StringBuffer2 + 1], a
	ld a, [wHPBarAnimOldHP + 1]
	ld [StringBuffer2], a
	ld de, StringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret
; d7b4

HPBarAnim_PaletteUpdate: ; d7b4
	ld a, [hCGB]
	and a
	ret z
	ld hl, wHPBarTempHPPal
	call SetHPPal
	ld a, [wHPBarTempHPPal]
	ld c, a
	callba Function8c43
	ret
; d7c9

HPBarAnim_BGMapUpdate: ; d7c9
	ld a, [hCGB]
	and a
	jr nz, .cgb
	call DelayFrame
	call DelayFrame
	ret

.cgb
	ld a, [wWhichHPBar]
	and a
	jr z, .enemy_hp_bar
	cp $1
	jr z, .player_hp_bar
	; Party Menu
	ld a, [CurPartyMon]
	cp $3
	jr nc, .bottom_half_of_screen
	ld c, $0
	jr .got_third

.bottom_half_of_screen
	ld c, $1
.got_third
	push af
	cp $2
	jr z, .skip_delay
	cp $5
	jr z, .skip_delay
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
.skip_delay
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	pop af
	cp $2
	jr z, .two_frames
	cp $5
	jr z, .two_frames
	ret

.two_frames
	inc c
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret

.enemy_hp_bar
	ld c, $0
	jr .got_battle_third

.player_hp_bar
	ld c, $1
.got_battle_third
	call DelayFrame
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret
; d839

ShortAnim_UpdateHP: ; d839
	ld a, [wHPBarAnimMaxHP]
	ld c, a
	ld b, 0
	ld hl, 0
	; If our HP bar is full this frame, set cur HP equal to the max.
	ld a, [wCurHPBarPixels]
	cp $30
	jr nc, .full_hp
	; If our HP bar is empty this frame, set cur HP equal to 0.
	and a
	jr z, .zero_hp
	; hl = [wHPBarAnimMaxHP] * [wCurHPBarPixels]
	call AddNTimes
	; b = hl / 48
	; hl = hl - 48 * (b + 1)
	ld b, 0
.loop1
	ld a, l
	sub $30
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .next
	inc b
	jr .loop1

.next
	; hl = hl + 128
	push bc
	ld bc, $80
	add hl, bc
	pop bc
	; if hl >= 48: b = b + 1
	ld a, l
	sub $30
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .okay
	inc b
.okay
	; min/max
	ld a, [wHPBarAnimLowValue]
	cp b
	jr nc, .between_low_and_high
	ld a, [wHPBarAnimHighValue]
	cp b
	jr c, .between_low_and_high
	ld a, b
.between_low_and_high
	ld [wHPBarAnimOldHP], a
	ret

.zero_hp
	xor a
	ld [wHPBarAnimOldHP], a
	ret

.full_hp
	ld a, [wHPBarAnimMaxHP]
	ld [wHPBarAnimOldHP], a
	ret
; d88c
