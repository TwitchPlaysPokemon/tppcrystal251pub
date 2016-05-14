GS_Copyright_Intro: ; 39:49a8
	ld de, MUSIC_NONE
	call PlayMusic
	call WhiteBGMap
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, $20
	call GetSGBLayout
	call Function32f9
	ld c, 10
	call DelayFrames
	callab Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	callba GBCOnlyScreen
	call .InitGFX
.loop
	call .GameFreakLogo
	jr nc, .loop
	ld a, [wcf63]
	bit 6, a
	jr nz, .pressed_button
	and a
	ret

.pressed_button
	scf
	ret

.InitGFX: ; 39:49f3
	ld de, TppLogo
	ld hl, $8800
	lb bc, BANK(TppLogo), $24
	call Get1bpp

	ld de, GS_Gamefreak_GFX2
	ld hl, $8a20
	lb bc, BANK(GS_Gamefreak_GFX2), $5
	call Get2bpp

	ld de, TppLogo + $118
	ld hl, $8a70
	lb bc, BANK(TppLogo), $31
	call Get1bpp

	callba Function8cf53 ; ClearSpriteAnims

	ld hl, wc300 ; wObjectTileOverrides
	ld a, $6
	ld [hli], a
	ld a, $a2
	ld [hl], a
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, 1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld de, $24f8
	call DmgToCgbObjPals
	ret

.GameFreakLogo: ; 39:4a37
	call Functiona57
	ld a, [$ffa9]
	and $f
	jr nz, .button
	ld a, [wcf63]
	bit 7, a
	jr nz, .finished
	callba Function8cf69
	call .DoJumptable
	call DelayFrame
	and a
	ret

.button
	ld hl, wcf63
	set 6, [hl]
.finished
	callba Function8cf53
	call ClearTileMap
	call ClearSprites
	ld c, 16
	call DelayFrames
	scf
	ret

.DoJumptable: ; 39:4a6d
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Jumptable
	dw .Scene1
	dw .Scene2
	dw .Scene3
	dw .Scene4
	dw .Scene5
	dw .Scene6

.IncrementJumptableIndex: ; 39:4a88
	ld hl, wcf63
	inc [hl]
	ret

.asm_e4a8d ; 39:4a8d
	ld c, 64
	call DelayFrames
	call .IncrementJumptableIndex
	ret

.Scene1: ; 39:4a96
	xor a
	ld [wcf64], a
	lb de, $54, $58
	ld a, $4
	call Function3b2a ; InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $80
	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX
	call .IncrementJumptableIndex
	ret

.Scene2: ; 39:4ab2
	ld a, [wcf64]
	and a
	ret z
	; lb de, $54, $58
	; ld a, $2e
	; call Function3b2a ; InitSpriteAnimStruct
	hlcoord 7, 4
	ld a, $a7
	call .FillBox
	hlcoord 7, 4, AttrMap
	ld a, $1
	call .FillBoxAttr
	callba Function96b3
	callba Function96a4
	call .IncrementJumptableIndex
	ld a, $80
	ld [wcf65], a
	ret

.FillBox:
	ld b, 7
	ld de, $14
.row
	push hl
	ld c, 7
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ret

.FillBoxAttr:
	ld b, 7
	ld de, $14
.rowattr
	push hl
	ld c, 7
.colattr
	ld [hli], a
	dec c
	jr nz, .colattr
	pop hl
	add hl, de
	dec b
	jr nz, .rowattr
	ret

.Scene3: ; 39:4ac8
	ld hl, wcf65
	ld a, [hl]
	and a
	jr z, .go_to_scene4
	dec [hl]
	cp $3f
	call z, .PlaceGameFreakString
	call SpawnGameFreakShimmer
	ret

.go_to_scene4
	ld [hl], $80
	call .IncrementJumptableIndex
	ret

.PlaceGameFreakString
	hlcoord 2, 12
	ld de, .TPPDevsTopRow
	call PlaceString
	hlcoord 2, 13
	ld de, .TPPDevsBottomRow
	call PlaceString
	ret

.TPPDevsTopRow:
	db $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $50
	
.TPPDevsBottomRow:
	db $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f, $a0, $a1, $50

;null this out because we don't need it right now
.Scene4: ; 39:4af4
	;hlcoord 7, 14
	;ld de, .PresentsString
	;call PlaceString
	call .IncrementJumptableIndex
	ld a, $80
	ld [wcf65], a
	ret

.PresentsString:
	;   P   R   E   S   E   N   T   S
	db $87, $88, $89, $8a, $8b, $8c, $50

.Scene6: ; 39:4b0d
	ld hl, wcf63
	set 7, [hl]
	ret

.Scene5: ; 39:4b13
	ld hl, wcf65
	ld a, [hl]
	and a
	jr z, .finished_scene5
	dec [hl]
	call Functione4b20
	ret

.finished_scene5
	call .IncrementJumptableIndex
	ret

Functione4b20: ; 39:4b20
	ld a, [rOBP1]
	cp $90
	ret z
	ld a, [wcf65]
	and $f
	ret nz
	ld a, [rOBP1]
	rrca
	rrca
	call Functioncf8
	ret

SpawnGameFreakShimmer: ; 39:4b33
	ld d, a
	and 1
	ret nz
	ld a, d
	srl a
	push af
	lb de, $58, $58
	ld a, $5
	call Function3b2a ; InitSpriteAnimStruct
	pop af
	and $f
	ld e, a
	ld d, 0
	ld hl, .table_4b61
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, $b
	add hl, bc
	ld a, [de]
	ld [hl], a
	inc de
	ld hl, $c
	add hl, bc
	ld [hl], 0
	inc hl
	ld a, [de]
	ld [hl], a
	ret

.table_4b61
	dw $0300
	dw $0408
	dw $0304
	dw $020c
	dw $0210
	dw $0318
	dw $0414
	dw $031c
	dw $0220
	dw $0228
	dw $0324
	dw $042c
	dw $0430
	dw $0338
	dw $0234
	dw $043c

; GS_Gamefreak_GFX1: ; 39:4b81
; INCBIN "gfx/intro/gs_gfx1.w56.1bpp"
GS_Gamefreak_GFX2: ; 39:4c61
INCBIN "gfx/intro/gs_gfx2.2bpp"
