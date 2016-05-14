BattleCommand56: ; 37683
; spikes

	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, PlayerScreens
.asm_3768e

; Fails if 3 layers of spikes are already down!

	ld a, [hl]
	and $03
	cp 3
	jr z, .failed

; Nothing else stops it from working.
	push bc
	inc a
	ld b,a
	ld a, [hl]
	and $fc
	or b
	ld [hl], a
	pop bc
	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextBox

.failed
	jp Function37354
; 376a0

