Function8cf53: ; 8cf53
	ld hl, wc300
	ld bc, $00c1
.asm_8cf59
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_8cf59
	ret
; 8cf62

Function8cf62: ; 8cf62
	call Function8cf69
	call DelayFrame
	ret
; 8cf69

Function8cf69: ; 8cf69
	push hl
	push de
	push bc
	push af
	ld a, $0
	ld [wc3b5], a ;load 0 into ???
	call Function8cf7a
	pop af
	pop bc
	pop de
	pop hl
	ret
; 8cf7a

Function8cf7a: ; 8cf7a
	ld hl, wc314 ; load ???
	ld e, $a
.asm_8cf7f
	ld a, [hl]
	and a
	jr z, .asm_8cf91 ;if ?? = 0, skip
	ld c, l
	ld b, h ;put wc314 into bc
	push hl
	push de
	call Function8d24b
	call Function8d04c
	pop de
	pop hl
	jr c, .asm_8cfa7
.asm_8cf91
	ld bc, $0010
	add hl, bc
	dec e
	jr nz, .asm_8cf7f
	ld a, [wc3b5]
	ld l, a
	ld h, $c4
.asm_8cf9e
	ld a, l
	cp $a0
	jr nc, .asm_8cfa7
	xor a
	ld [hli], a
	jr .asm_8cf9e

.asm_8cfa7
	ret
; 8cfa8

Function8cfa8: ; 8cfa8 (23:4fa8)
	ld hl, wc314
	ld e, $a
.asm_8cfad
	ld a, [hl]
	and a
	jr z, .asm_8cfbf
	ld c, l
	ld b, h
	push hl
	push de
	call Function8d24b
	call Function8d04c
	pop de
	pop hl
	jr c, .asm_8cfd5
.asm_8cfbf
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .asm_8cfad
	ld a, [wc3b5]
	ld l, a
	ld h, $c4
.asm_8cfcc
	ld a, l
	cp $40
	jr nc, .asm_8cfd5
	xor a
	ld [hli], a
	jr .asm_8cfcc

.asm_8cfd5
	ret

Function8cfd6:: ; 8cfd6
	push de
	push af
	ld hl, wc314
	ld e, $a
.asm_8cfdd
	ld a, [hl]
	and a
	jr z, .asm_8cfec
	ld bc, $0010
	add hl, bc
	dec e
	jr nz, .asm_8cfdd
	pop af
	pop de
	scf
	ret

.asm_8cfec
	ld c, l
	ld b, h
	ld hl, wc3b4
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .asm_8cff7
	inc [hl]
.asm_8cff7
	pop af
	ld e, a
	ld d, 0
	ld hl, Unknown_8d1c4
	add hl, de
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [wc3b4]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	call Function8d109
	ld [hli], a
	pop de
	ld hl, $0004
	add hl, bc
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	dec a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, c
	ld [wc3b8], a
	ld a, b
	ld [wc3b9], a
	ret
; 8d036

Function8d036: ; 8d036
	ld hl, $0000
	add hl, bc
	ld [hl], $0
	ret
; 8d03d

Function8d03d: ; 8d03d (23:503d)
	ld hl, wc314
	ld bc, $10
	ld e, $a
	xor a
.asm_8d046
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .asm_8d046
	ret

Function8d04c: ; 8d04c
	call Function8d0ec
	call Function8d132
	cp $fd
	jr z, .asm_8d0b9
	cp $fc
	jr z, .asm_8d0b6
	call Function8d1a2
	ld a, [wc3ba]
	add [hl]
	ld [wc3ba], a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld a, [wc3b5]
	ld e, a
	ld d, Sprites / $100
	ld a, [hli]
	ld c, a
.asm_8d071
	ld a, [wc3bc]
	ld b, a
	ld a, [wc3be]
	add b
	ld b, a
	ld a, [wc3bf]
	add b
	ld b, a
	call Function8d0be
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3bb]
	ld b, a
	ld a, [wc3bd]
	add b
	ld b, a
	ld a, [wc3c0]
	add b
	ld b, a
	call Function8d0ce
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3ba]
	add [hl]
	ld [de], a
	inc hl
	inc de
	call Function8d0de
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wc3b5], a
	cp SpritesEnd % $100
	jr nc, .asm_8d0bb
	dec c
	jr nz, .asm_8d071
	pop bc
	jr .asm_8d0b9

.asm_8d0b6
	call Function8d036
.asm_8d0b9
	and a
	ret

.asm_8d0bb
	pop bc
	scf
	ret
; 8d0be

Function8d0be: ; 8d0be
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 6, [hl]
	jr z, .asm_8d0cc
	add $8
	xor $ff
	inc a
.asm_8d0cc
	pop hl
	ret
; 8d0ce

Function8d0ce: ; 8d0ce
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 5, [hl]
	jr z, .asm_8d0dc
	add $8
	xor $ff
	inc a
.asm_8d0dc
	pop hl
	ret
; 8d0de

Function8d0de: ; 8d0de
	ld a, [wc3b8]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $1f
	or b
	ld b, a
	ld a, [wSpriteAnimPalOverrides]
	bit 7, a
	ld a, b
	ret z
	and $f8
	ld b, a
	ld a, [wSpriteAnimPalOverrides]
	and $7
	or b
	ret
; 8d0ec

Function8d0ec: ; 8d0ec
	xor a
	ld [wc3b8], a
	ld hl, $0003
	add hl, bc
	ld a, [hli]
	ld [wc3ba], a
	ld a, [hli]
	ld [wc3bb], a
	ld a, [hli]
	ld [wc3bc], a
	ld a, [hli]
	ld [wc3bd], a
	ld a, [hli]
	ld [wc3be], a
	xor a
	ld [wSpriteAnimPalOverrides], a
	ret
; 8d109

Function8d109: ; 8d109
	push hl
	push bc
	ld hl, wc300
	ld b, a
	ld c, $a
.asm_8d111
	ld a, [hli]
	cp b
	jr z, .asm_8d11c
	inc hl
	dec c
	jr nz, .asm_8d111
	xor a
	jr .asm_8d11d

.asm_8d11c
	ld a, [hl]
.asm_8d11d
	pop bc
	pop hl
	ret
; 8d120

Function8d120:: ; 8d120
	ld hl, $0001
	add hl, bc
	ld [hl], a
	ld hl, $0008
	add hl, bc
	ld [hl], $0
	ld hl, $000a
	add hl, bc
	ld [hl], $ff
	ret
; 8d132

Function8d132: ; 8d132
	ld hl, 1
	add hl, bc
	ld a, [hl]
	cp $11
	jr z, .is_player
	cp $1b
	jr z, .is_player
	cp $2d
	jr z, .is_player
	cp $2e
	jr nz, .asm_8d132
.is_player
	ld a, [wPlayerPalette]
	and a
	jr z, .asm_8d132
	and $7
	or $80
	ld [wSpriteAnimPalOverrides], a
.asm_8d132
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d142
	dec [hl]
	call Function8d189
	ld a, [hli]
	push af
	jr .asm_8d163

.asm_8d142
	ld hl, $000a
	add hl, bc
	inc [hl]
	call Function8d189
	ld a, [hli]
	cp $fe
	jr z, .asm_8d17b
	cp $ff
	jr z, .asm_8d16d
	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, $0009
	add hl, bc
	add [hl]
	ld hl, $0008
	add hl, bc
	ld [hl], a
	pop hl
.asm_8d163
	ld a, [hl]
	and $c0
	srl a
	ld [wc3b8], a
	pop af
	ret

.asm_8d16d
	xor a
	ld hl, $0008
	add hl, bc
	ld [hl], a
	ld hl, $000a
	add hl, bc
	dec [hl]
	dec [hl]
	jr .asm_8d132

.asm_8d17b
	xor a
	ld hl, $0008
	add hl, bc
	ld [hl], a
	dec a
	ld hl, $000a
	add hl, bc
	ld [hl], a
	jr .asm_8d132
; 8d189

Function8d189: ; 8d189
	ld hl, $0001
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_8d6e6
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $000a
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ret
; 8d1a2

Function8d1a2: ; 8d1a2
	ld e, a
	ld d, 0
	ld hl, Unknown_8d94d
	add hl, de
	add hl, de
	add hl, de
	ret
; 8d1ac

Function8d1ac: ; 8d1ac
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Unknown_8e706
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	push bc
	call Request2bpp
	pop bc
	ret
; 8d1c4

Unknown_8d1c4: ; 8d1c4
	db $01, $01, $00 ; 00
	db $07, $04, $00 ; 01
	db $08, $05, $05 ; 02
	db $0a, $06, $00 ; 03
	db $0b, $07, $06 ; 04
	db $0c, $08, $06 ; 05
	db $0d, $09, $07 ; 06
	db $0e, $0a, $07 ; 07
	db $10, $0b, $07 ; 08
	db $08, $0c, $05 ; 09
	db $11, $00, $00 ; 0a male on town map
	db $12, $0d, $08 ; 0b
	db $12, $0e, $08 ; 0c
	db $12, $0f, $08 ; 0d
	db $13, $10, $00 ; 0e
	db $15, $00, $00 ; 0f
	db $16, $11, $00 ; 10
	db $17, $12, $00 ; 11
	db $18, $12, $00 ; 12
	db $19, $13, $00 ; 13
	db $1a, $14, $00 ; 14
	db $1b, $00, $00 ; 15 male on train
	db $1d, $15, $00 ; 16
	db $1e, $00, $00 ; 17
	db $1d, $17, $00 ; 18
	db $1f, $00, $00 ; 19
	db $24, $19, $00 ; 1a
	db $25, $00, $00 ; 1b
	db $20, $13, $00 ; 1c
	db $26, $1a, $00 ; 1d
	db $2d, $00, $00 ; 1e female on town map
	db $2e, $00, $00 ; 1f female on train
	db $2f, $00, $00 ; 20
	db $30, $00, $00 ; 21
	db $31, $00, $00 ; 22
	db $32, $1b, $00 ; 23
	db $33, $1c, $00 ; 24
	db $34, $00, $00 ; 25
	db $35, $1d, $00 ; 26
	db $37, $1e, $00 ; 27
	db $38, $1e, $00 ; 28
	db $39, $20, $00 ; 29
	db $3f, $21, $00 ; 2a
	db $3e, $22, $00 ; 2b
	db $40, $00, $00 ; 2c
	db $42, $23, $00 ; 2d
	db $43, $24, $06 ; 2e
; 8d24b

INCLUDE "engine/sprite_anims.asm"
INCLUDE "data/sprite_engine.asm"

Unknown_8e706: ; 8e706
	dbbw $80, $01, Unknown_8e72a
	dbbw $80, $01, Unknown_8e72a
	dbbw $80, $01, Unknown_8e72a
	dbbw $80, $01, Unknown_8e72a
	dbbw $10, $37, Unknown_8e72a
	dbbw $10, $11, Unknown_8e72a
	dbbw $10, $39, Unknown_8e72a
	dbbw $10, $24, Unknown_8e72a
	dbbw $10, $21, Unknown_8e72a
Unknown_8e72a:
; 8e72a
