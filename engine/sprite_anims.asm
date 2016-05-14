Function8d24b: ; 8d24b ;jump to program set in wc316
	ld hl, $0002
	add hl, bc ;hl = wc316
	ld e, [hl] ;load ?? into e
	ld d, 0
	ld hl, Jumptable_8d25b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8d25b

Jumptable_8d25b: ; 8d25b (23:525b)
	dw Function8d2a1
	dw Function8d2a2
	dw Function8d2b9
	dw Function8d2ea
	dw Function8d302
	dw Function8d36c
	dw Function8d37a
	dw Function8d381
	dw Function8d3c3
	dw Function8d422
	dw Function8d429
	dw Function8d43e
	dw Function8d373
	dw Function8d46e
	dw Function8d47c
	dw Function8d475
	dw Function8d483
	dw Function8d52a
	dw Function8d543
	dw Function8d54a
	dw Function8d578
	dw Function8d57f
	dw Function8d5b0
	dw Function8d5e2
	dw Function8d607
	dw Function8d35a
	dw Function8d6b7
	dw Function8d630
	dw Function8d637
	dw Function8d63e
	dw Function8d666
	dw Function8d6be
	dw Function8d680
	dw Function8d6a2
	dw Function8d6ae
	dw SpriteAnimSeq_VoltorbFlip
	dw SpriteAnimSeq_GSIntro

Function8d2a1: ; 8d2a1 (23:52a1)
	ret

Function8d2a2: ; 8d2a2 (23:52a2)
	ld a, [wcfa9]
	ld hl, $0
	add hl, bc
	cp [hl]
	jr z, Function8d2b9
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ret

Function8d2b9: ; 8d2b9 (23:52b9)
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz
	ld hl, $d
	add hl, bc
	ld e, [hl]
	ld hl, $7
	add hl, bc
	ld a, d
	and $10
	jr z, .asm_8d2df
	ld a, e
	and a
	jr z, .asm_8d2e6
	cp $1
	jr z, .asm_8d2e2
.asm_8d2df
	xor a
	ld [hl], a
	ret

.asm_8d2e2
	ld a, $ff
	ld [hl], a
	ret

.asm_8d2e6
	ld a, $fe
	ld [hl], a
	ret

Function8d2ea: ; 8d2ea (23:52ea)
	ld a, [wcfa9]
	ld hl, $0
	add hl, bc
	cp [hl]
	jr z, .asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ret

.asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ret

Function8d302: ; 8d302 (23:5302)
	call Function8d6c5
	jp [hl]
; 8d306 (23:5306)
; Anonymous jumptable (see Function8d6c5)

	dw Function8d30a
	dw Function8d321
; 8d30a

Function8d30a: ; 8d30a
	call Function8d6d8
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	ld hl, $000d
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a
	ld hl, $000c
	add hl, bc
	ld [hl], a
Function8d321: ; 8d321
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d356
	ld hl, $000d
	add hl, bc
	add $4
	ld hl, $0004
	add hl, bc
	ld [hl], a
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld hl, $000d
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, $2
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call Function8d6de
	ld hl, $0007
	add hl, bc
	ld [hl], a
	ret

.asm_8d356
	call Function8d036
	ret
; 8d35a

Function8d35a: ; 8d35a (23:535a)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, $2
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

Function8d36c: ; 8d36c (23:536c)
	callab Function11a3b
	ret

Function8d373: ; 8d373 (23:5373)
	callab Function120c1
	ret

Function8d37a: ; 8d37a (23:537a)
	callab Functione46ed
	ret

Function8d381: ; 8d381 (23:5381)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba
	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_8d395
	ld hl, $d
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call Function8d036
	ret

Function8d3c3: ; 8d3c3 (23:53c3)
	ld hl, $c
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e
	ld hl, $f
	add hl, bc
	ld d, [hl]
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $e
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $fff0
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.asm_8d41e
	call Function8d036
	ret

Function8d422: ; 8d422 (23:5422)
	callab Function9321d
	ret

Function8d429: ; 8d429 (23:5429)
	callab Function932ac
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, $f
	call Function8d120
	ret

Function8d43e: ; 8d43e (23:543e)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .asm_8d462
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $78
	jr c, .asm_8d461
	call Function8d036
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.asm_8d461
	inc [hl]
.asm_8d462
	ld a, e
	ld d, $20
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

Function8d46e: ; 8d46e (23:546e)
	callab Functione00ed
	ret

Function8d475: ; 8d475 (23:5475)
	callab Function90d41
	ret

Function8d47c: ; 8d47c (23:547c)
	callab Functione21a1
	ret

Function8d483: ; 8d483 (23:5483)
	call Function8d6c5
	jp [hl]
; 8d487 (23:5487)
; Anonymous jumptable (see Function8d6c5)

	dw Function8d493
	dw Function8d4d5
	dw Function8d4a5
	dw Function8d4b8
	dw Function8d4e8
	dw Function8d526
; 8d493

Function8d493: ; 8d493
	ld a, $14
	call Function8d120
	ld hl, $000b
	add hl, bc
	ld [hl], $2
	ld hl, $000c
	add hl, bc
	ld [hl], $20
	ret
; 8d4a5

Function8d4a5: ; 8d4a5
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call Function8d6d8
	ld hl, $000c
	add hl, bc
	ld [hl], $40
Function8d4b8: ; 8d4b8
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call Function8d6de
	ld hl, $0007
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr Function8d526
; 8d4d5

Function8d4d5: ; 8d4d5
	ld hl, $000b
	add hl, bc
	ld [hl], $4
	ld hl, $000c
	add hl, bc
	ld [hl], $30
	ld hl, $000d
	add hl, bc
	ld [hl], $24
	ret
; 8d4e8

Function8d4e8: ; 8d4e8
	ld hl, $000d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	call Function8e72c
	ld hl, $0007
	add hl, bc
	ld [hl], a
	ld hl, $000c
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $000c
	add hl, bc
	ld [hl], $20
	ld hl, $000d
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a
	ld hl, $0007
	add hl, bc
	ld [hl], a
	call Function8d6d8
	ret

Function8d526: ; 8d526
	call Function8d036
	ret
; 8d52a

Function8d52a: ; 8d52a (23:552a)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp $b0
	jr nc, .asm_8d53f
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.asm_8d53f
	call Function8d036
	ret

Function8d543: ; 8d543 (23:5543)
	callab Function29676
	ret

Function8d54a: ; 8d54a (23:554a)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_8d574
	ld d, a
	add $8
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	push af
	push de
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.asm_8d574
	call Function8d036
	ret

Function8d578: ; 8d578 (23:5578)
	callab Function91640
	ret

Function8d57f: ; 8d57f (23:557f)
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $d
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

Function8d5b0: ; 8d5b0 (23:55b0)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c
	ld hl, $5
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .asm_8d5d3
	add $8
	ld [hl], a
.asm_8d5d3
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

Function8d5e2: ; 8d5e2 (23:55e2)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $b8
	jr nc, .asm_8d603
	inc [hl]
	inc [hl]
	ld hl, $5
	add hl, bc
	dec [hl]
	ld d, $40
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.asm_8d603
	call Function8d036
	ret

Function8d607: ; 8d607 (23:5607)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $54
	ret z
	ld hl, $5
	add hl, bc
	inc [hl]
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

Function8d630: ; 8d630 (23:5630)
	callba Function108bc7
	ret

Function8d637: ; 8d637 (23:5637)
	callba Function108be0
	ret

Function8d63e: ; 8d63e (23:563e)
	ld a, [wcf65]
	and a
	jr nz, .asm_8d645
	ret

.asm_8d645
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ld hl, $d
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld a, $36
	call Function8d120
	ret

Function8d666: ; 8d666 (23:5666)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $14
	jr nc, .asm_8d67f
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
.asm_8d67f
	ret

Function8d680: ; 8d680 (23:5680)
	ld hl, $b
	add hl, bc
	ld d, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld hl, $c
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Function8d6de
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Function8d6e2
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

Function8d6a2: ; 8d6a2 (23:56a2)
	ld a, [wcf64]
	cp $40
	ret nz
	ld a, $3d
	call Function8d120
	ret

Function8d6ae: ; 8d6ae (23:56ae)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	add $10
	ld [hl], a
	ret

SpriteAnimSeq_VoltorbFlip:
	callba UpdateVoltorbFlipCursor
	ret

SpriteAnimSeq_GSIntro:
	callab Functione4b20
	ret

Function8d6b7: ; 8d6b7 (23:56b7)
	callba Function11d0b6
	ret

Function8d6be: ; 8d6be (23:56be)
	callba Function49aa2
	ret

Function8d6c5: ; 8d6c5 (23:56c5)
	ld hl, [sp+$0]
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld hl, $b
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8d6d8 (23:56d8)

Function8d6d8: ; 8d6d8
	ld hl, $000b
	add hl, bc
	inc [hl]
	ret
; 8d6de

Function8d6de: ; 8d6de (23:56de)
	call Function8e72c
	ret

Function8d6e2: ; 8d6e2 (23:56e2)
	call Function8e72a
	ret
; 8d6e6 (23:56e6)
