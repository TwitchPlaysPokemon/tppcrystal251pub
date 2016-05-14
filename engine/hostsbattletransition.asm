_HostsBattleTransition::
	xor a
	ld [hBGMapMode], a
	ld de, CommandsGFX
	ld hl, VTiles1 + $580
	lb bc, BANK(CommandsGFX), 8
	call Request2bpp
	ld hl, TileMap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call FillCommandChaos
	ld hl, TileMap
	ld a, (VBGMap1 + $1c0) % $100
	ld [hBGMapAddress], a
	ld a, (VBGMap1 + $1c0) / $100
	ld [hBGMapAddress + 1], a
	call FillCommandChaos
	xor a
	ld [hBGMapMode], a
	ld a, 6
	ld hl, AttrMap
	ld bc, AttrMapEnd - AttrMap
	call ByteFill
	ld a, 2
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	ld c, 4
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, CommandChaosPals
	ld de, BGPals + $30
	ld bc, CommandChaosPalsEnd - CommandChaosPals
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	di ; turn off all interrupts
	ld c, $eb ; tilemap1
	ld de, 143
.ccloop1
	ld a, 5 ; command chaos speed
	add d
	ld d, a
.waitline1
	ld a, [rLY]
	cp e
	jr nz, .waitline1
	ld a, d
	ld [rSCY], a ; change to the position of command chaos
	ld a, c
	ld [rLCDC], a ; switch to the map that has command chaos
.waitvblank1
	ld a, [rLY]
	cp $90
	jr nz, .waitvblank1
	ld a, $e3 ; tilemap0
	ld [rLCDC], a ; switch back to the main map
	call VBlank
	di
	dec e
	ld a, 72
	cp e
	jr c, .ccloop1
.ccloop2
; we can't call VBlank at this state right now since it returns
; after the first line due to the long updatesounds command
	ld a, 5 ; command chaos speed
	add d
	ld d, a
.waitline2
	ld a, [rLY]
	cp e
	jr nz, .waitline2
	ld a, d
	ld [rSCY], a ; change to the position of command chaos
	ld a, c
	ld [rLCDC], a ; switch to the map that has command chaos
	push bc
	push de
	call GameTimer
	ld a, [hSeconds]
	ld [$ffe3], a
	callba _UpdateSound
	pop de
	pop bc
.waitvblank2
	ld a, [rLY]
	cp $90
	jr nz, .waitvblank2
	ld a, $e3 ; tilemap0
	ld [rLCDC], a ; switch back to the main map
	xor a
	ld [rSCY], a
	dec e
	jr nz, .ccloop2
	ld a, c
	ld [rLCDC], a ; switch to the map that has command chaos
	ld a, d
	ld [hSCY], a
	ld b, 180
	ei
.ccloop3
	call DelayFrameWithCC
	dec b
	jr nz, .ccloop3
	call Fade2WhiteBT
	ld a, $e3 ; tilemap0
	ld [rLCDC], a ; switch back to the main map
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a ; switch tillemap update back to main map
	jp ClearTileMap

DelayFrameWithCC:
	ld a, [hSCY]
	add 5 ; command chaos speed
	ld [hSCY], a
	jp DelayFrame

FillCommandChaos:
	xor a
	ld [hBGMapMode], a
	ld e, (TileMapEnd - TileMap) / 5
.fillloop1
	call Random
	ld d, 5
	ld a, [hRandomAdd]
	ld b, a
	ld a, [hRandomSub]
	ld c, a
.fillloop2
	ld a, c
	and $7
	add $d8
	ld [hli], a
	rept 3
	srl b
	rr c
	endr
	dec d
	jr nz, .fillloop2
	dec e
	jr nz, .fillloop1
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	jp DelayFrames

Fade2WhiteBT:
; the same as the one in tpp credits but with slower speed,
; update all palettes and no update function attaching
	ld e, 32
.loop
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, BGPals
	ld d, 64
.loop2
	ld a, [hl]
	and $1f
	cp $1f
	jr z, .skip
	inc a
.skip
	ld c, a
	inc hl
	ld a, [hld]
	and $3
	ld b, a
	ld a, [hl]
	and $e0
	or b
	cp $e3
	jr z, .skip2
	and $e0
	add $20
	jr nc, .skip2
	inc b
.skip2
	or c
	ld [hli], a
	ld a, [hl]
	and $7c
	cp $7c
	jr z, .skip3
	add $4
.skip3
	or b
	ld [hli], a
	dec d
	jr nz, .loop2
	pop af
	ld [rSVBK], a
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrameWithCC
	call DelayFrameWithCC
	call DelayFrameWithCC
	dec e
	jr nz, .loop
	ret

CommandChaosPals:
	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 31, 31, 31
CommandChaosPalsEnd

_Function8c5dc:
	ld a, [OtherTrainerClass]
	and a ; Is this a trainer battle?
	jp z, Function8c673 ; If not, we don't need to be here
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	inc b
	inc c
	jr .asm_8c5f4

.asm_8c5f0
	ld a, [hl]
	or $7
	ld [hli], a
.asm_8c5f4
	dec c
	jr nz, .asm_8c5f0
	dec b
	jr nz, .asm_8c5f0
	call Function8c6b1
	hlcoord 2, 1
	ld b, $10
.asm_8c602
	push hl
	ld c, $2
.asm_8c605
	push hl
	ld a, [de]
	inc de
.asm_8c608
	and a
	jr z, .asm_8c614
	sla a
	jr nc, .asm_8c611
	ld [hl], $fe
.asm_8c611
	inc hl
	jr .asm_8c608

.asm_8c614
	pop hl
	push bc
	ld bc, $8
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_8c605
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_8c602
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, .asm_8c639
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	call DelayFrame
	call DelayFrame
	jr Function8c673

.asm_8c639
	ld hl, Unknown_8c6a1
	ld a, [TimeOfDayPal]
	and 3
	cp 3
	jr nz, .asm_8c648
	ld hl, Unknown_8c6a9
.asm_8c648
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	call Function8c677
	push hl
	ld de, Unkn1Pals + 8 * 7
	ld bc, $8
	call CopyBytes
	pop hl
	ld de, BGPals + 8 * 7
	ld bc, $8
	call CopyBytes
	pop af
	ld [rSVBK], a ; $ff00+$70
	ld a, $1
	ld [hCGBPalUpdate], a ; $ff00+$e5
	call DelayFrame
	call Function3238
Function8c673: ; 8c673 (23:4673)
	ld hl, wcf63
	inc [hl]
	ret

Function8c6b1: ; 8c6b1 (23:46b1)
	ld a, [OtherTrainerClass]
	cp RED
	jr nz, .notred
	ld a, [OtherTrainerID]
	dec a
	ld de, StartTrainerBattle_AbeGraphic
	jr z, .skip
	dec a
	ld de, StartTrainerBattle_RedGraphic
	jr z, .skip
	jr .notbaba
.notred
	cp CAL
	jr nz, .notaj
	ld a, [OtherTrainerID]
	cp 4
	ld de, StartTrainerBattle_AJGraphic
	jr z, .skip
	jr .notbaba
.notaj
	cp BABA
	ld de, StartTrainerBattle_BabaGraphic
	jr z, .skip
.notbaba
	ld de, StartTrainerBattle_PokeballGraphic
.skip
	ld a, [OtherTrainerClass]
	ret
; 8c6b8 (23:46b8)

Function8c677: ; 8c677 (23:4677)
	ld de, Unkn1Pals + 8 * 7
	call Function8c698
	ld de, BGPals + 8 * 7
	call Function8c698
	ld de, Unkn2Pals + 8 * 6
	call Function8c698
	ld de, OBPals + 8 * 6
	call Function8c698
	ld de, Unkn2Pals + 8 * 7
	call Function8c698
	ld de, OBPals + 8 * 7
Function8c698: ; 8c698 (23:4698)
	push hl
	ld bc, $8
	call CopyBytes
	pop hl
	ret
; 8c6a1 (23:46a1)

StartTrainerBattle_PokeballGraphic: ; 8c6b8
	bigdw %0000001111000000
	bigdw %0000111111110000
	bigdw %0011110000111100
	bigdw %0011000000001100
	bigdw %0110000000000110
	bigdw %0110001111000110
	bigdw %1100011001100011
	bigdw %1111110000111111
	bigdw %1111110000111111
	bigdw %1100011001100011
	bigdw %0110001111000110
	bigdw %0110000000000110
	bigdw %0011000000001100
	bigdw %0011110000111100
	bigdw %0000111111110000
	bigdw %0000001111000000
; 8c6d8

StartTrainerBattle_AJGraphic:
	bigdw %0000000100010000
	bigdw %0000001110111000
	bigdw %0110001111111000
	bigdw %0111010000000100
	bigdw %0011111111111110
	bigdw %1111100011111111
	bigdw %1111001000000001
	bigdw %0100001100000001
	bigdw %1000000111111010
	bigdw %1000100011111101
	bigdw %1011100000010001
	bigdw %1001001000101001
	bigdw %1011001101101101
	bigdw %0111100111101110
	bigdw %1001100111001100
	bigdw %1110111000111100

StartTrainerBattle_BabaGraphic:
	bigdw %0000110000000000
	bigdw %0000101000000000
	bigdw %0000100100000000
	bigdw %0001000010000000
	bigdw %0011111001000001
	bigdw %0100000111000011
	bigdw %1000111000100101
	bigdw %1001000100011001
	bigdw %1001010100000001
	bigdw %1001000100000001
	bigdw %1100111000010001
	bigdw %1110000010011001
	bigdw %1000000110010101
	bigdw %0100000000100011
	bigdw %0011100001000001
	bigdw %0000011110000000

StartTrainerBattle_AbeGraphic:
	bigdw %0000000110000000
	bigdw %0000001001000000
	bigdw %0000010000100000
	bigdw %0000100000010000
	bigdw %0000101001010000
	bigdw %0001011001101000
	bigdw %0010000000000100
	bigdw %0010110000110100
	bigdw %0100010000100010
	bigdw %0011000000001100
	bigdw %0101111111111010
	bigdw %1000100110010001
	bigdw %1000111001110001
	bigdw %1001100000011001
	bigdw %0101011111101010
	bigdw %0010000000000100

StartTrainerBattle_RedGraphic:
	bigdw %0000011111100000
	bigdw %0001100010011000
	bigdw %0010000010000100
	bigdw %0010000010000010
	bigdw %0111000010000010
	bigdw %0100110010000101
	bigdw %1000001011101001
	bigdw %1000000101010001
	bigdw %1011111001101001
	bigdw %1100001110101101
	bigdw %1000001010001011
	bigdw %1000111011110001
	bigdw %1001001100010010
	bigdw %1010011000010010
	bigdw %0100100110010100
	bigdw %0011000001111000

Unknown_8c6a1: ; 8c6a1
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; 8c6a9

Unknown_8c6a9: ; 8c6a9
	RGB 31, 18, 29
	RGB 31, 05, 05
	RGB 31, 05, 05
	RGB 31, 05, 05
; 8c6b1
