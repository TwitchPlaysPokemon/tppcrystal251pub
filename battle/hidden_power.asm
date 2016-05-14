HiddenPowerDamage: ; fbced
; Override Hidden Power's type and power based on the user's DVs.

	ld hl, BattleMonDVs
	ld a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, EnemyMonDVs
.got_dvs ;dvs location is stored in HL


; Power:

; Take the top bit from each stat

	; Attack
;	ld a, [hl]
;	swap a ;attack to little
;	and 8 ;keep only the 4th bit (bit 4 of attack)

	; Defense
;	ld b, a ;attack into b
;	ld a, [hli]
;	and 8; keep only bit 4 of defence
;	srl a; put it in 3
;	or b ; merge with a's bit

	; Speed
;	ld b, a
;	ld a, [hl]
;	swap a
;	and 8
;	srl a
;	srl a
;	or b
;
;	; Special
;	ld b, a
;	ld a, [hl]
;	and 8
;	srl a
;	srl a
;	srl a
;	or b
;
; Multiply by 5
;;	ld b, a ; b has the HP number
;	add a
;	add a
;	add b
;
;; Add Special & 3
;	ld b, a
;	ld a, [hld]
;	and 3
;	add b
;
;; Divide by 2 and add 31
;	srl a
;	add 31
;
;	ld d, a ;power is stored in D, to lock to 70


; Type:

	; Def & 3
	ld a, [hl]
	and 3
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hl]
	and 3 << 4
	swap a
	add a
	add a
	or b

; Skip Normal
	inc a

; Skip Bird
	cp BIRD
	jr c, .done
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add UNUSED_TYPES_END - UNUSED_TYPES

.done

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or (SPECIAL << 4)
	ld [hl], a

; Get the rest of the damage formula variables
; based on the new type, but keep base power.
	;ld a, d
	ld a, 70 ;sets power to 70, makes HP usable ingame
	push af
	callba BattleCommand06 ; damagestats
	pop af
	ld d, a
	ret
; fbd54

