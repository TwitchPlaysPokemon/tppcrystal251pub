GBCOnlyScreen: ; 4ea82

	ld a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ld hl, GBCOnlyGFX
	ld de, $d000
	ld a, [rSVBK]
	push af
	ld a, 0
	ld [rSVBK], a
	call Decompress
	pop af
	ld [rSVBK], a

	ld de, $d000
	ld hl, VTiles2
	lb bc, BANK(GBCOnlyGFX), $54
	call Get2bpp

	ld de, GBCOnlyGFX2
	ld hl, VTiles0
	lb bc, BANK(GBCOnlyGFX2), $54
	call Get2bpp

	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

	ld hl, rLCDC ; flicker interlace
; better luck next time
.loop
	set 4, [hl]
	call DelayFrame
	res 4, [hl]
	call DelayFrame
	jr .loop
; 4eac5


DrawGBCOnlyScreen: ; 4eac5

	call DrawGBCOnlyBorder

	; WutFace
	hlcoord 3, 2
	ld b, 5
	ld c, 6
	ld a, $8
	call DrawGBCOnlyGraphic

	; NotLikeThis
	hlcoord 11, 2
	ld b, 6
	ld c, 6
	ld a, $26
	call DrawGBCOnlyGraphic

	ld de, GBCOnlyString
	hlcoord 1, 10
	call PlaceString

	ret
; 4eaea


DrawGBCOnlyBorder: ; 4eaea

	hlcoord 0, 0
	ld [hl], 0 ; top-left

	inc hl
	ld a, 1 ; top
	call .FillRow

	ld [hl], 2 ; top-right

	hlcoord 0, 1
	ld a, 3 ; left
	call .FillColumn

	hlcoord 19, 1
	ld a, 4 ; right
	call .FillColumn

	hlcoord 0, 17
	ld [hl], 5 ; bottom-left

	inc hl
	ld a, 6 ; bottom
	call .FillRow

	ld [hl], 7 ; bottom-right
	ret
; 4eb15

.FillRow ; 4eb15
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret
; 4eb1c

.FillColumn ; 4eb1c
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret
; 4eb27


DrawGBCOnlyGraphic: ; 4eb27
	ld de, SCREEN_WIDTH
DrawBetBoyGraphic:
.y
	push bc
	push hl
.x
	ld [hli], a
	inc a
	dec b
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .y
	ret
; 4eb38

BlockFill:
.y
	push bc
	push hl
.x
	ld [hli], a
	dec c
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .y
	ret

_BetBoy::
	xor a
	ld [rSCX], a
	ld [rSCY], a
	ld [rIF], a
	ld [rIE], a
	ld a, $ff
	ld [rWX], a
	ld [rWY], a
	ld a, $61
	ld [rLCDC], a
	ld de, BetBoyGFX
	ld hl, VTiles2
	ld bc, BetBoyGFXEnd - BetBoyGFX
	call CopyDouble
	ld hl, VTiles2 + $7f0
	ld bc, 16
	xor a
	call ByteFill
	ld hl, VBGMap0
	ld bc, (SCREEN_HEIGHT << 8) | SCREEN_WIDTH
	ld de, 32
	ld a, $7f
	call BlockFill
	ld hl, VBGMap0 + $24
	ld bc, (12 << 8) | 2
	xor a
	ld de, 32
	call DrawBetBoyGraphic
	ld de, BetBoyString
	ld hl, VBGMap0 + $81
	ld bc, 32
	push hl
.loop
	ld a, [de]
	inc de
	cp "@"
	jr z, .done
	cp $4e
	jr z, .line
	ld [hli], a
	jr .loop
	ld de, BetBoyGFX
.line
	pop hl
	add hl, bc
	push hl
	jr .loop
.done
	pop hl
	pop bc
	ld hl, VBGMap0 + $145
	call PrintWordHex
	pop bc
	ld hl, VBGMap0 + $14f
	call PrintWordHex
	pop bc
	ld hl, VBGMap0 + $165
	call PrintWordHex
	pop bc
	ld hl, VBGMap0 + $16f
	call PrintWordHex
	pop bc
	push bc
	ld hl, VBGMap0 + $185
	call PrintWordHex
	pop hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld hl, VBGMap0 + $18a
	call PrintWordHex
	pop hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld hl, VBGMap0 + $18e
	call PrintWordHex
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, (SCREEN_HEIGHT << 8) | SCREEN_WIDTH
	ld de, 32
	xor a
	call BlockFill
	ld hl, VBGMap0 + $24
	ld bc, (2 << 8) | 12
	ld a, 1
	ld de, 32
	call BlockFill
	ld a, $80
	ld [rBGPI], a
	ld a, $c2
	ld [rBGPD], a
	ld a, $58
	ld [rBGPD], a
	ld a, $86
	ld [rBGPI], a
	ld a, $ff
	ld [rBGPD], a
	ld a, $7f
	ld [rBGPD], a
	ld a, $d6
	ld [rBGPD], a
	ld a, $5a
	ld [rBGPD], a
	ld a, $8e
	ld [rBGPI], a
	ld a, $c2
	ld [rBGPD], a
	ld a, $58
	ld [rBGPD], a
	call EnableLCD
	halt
.forever
	jr .forever

pwh: MACRO
	and $f
	cp $a
	jr c, .num\@
	add "A" - $a
	jr .print\@
.num\@
	add "0"
.print\@
	ld [hli], a
ENDM

PrintWordHex:
	ld a, b
	swap a
	pwh
	ld a, b
	pwh
	ld a, c
	swap a
	pwh
	ld a, c
	pwh
	ret

CopyDouble:
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, CopyDouble
	ret

BetBoyString:
	db   "A fatal exception"
	next " "
	next "BET-BOY"
	next " "
	next "has occurred."
	next " "
	next "AF:       BC:"
	next "DE:       HL:"
	next "SP:     (        )"
	next " "
	next "Please restart the"
	next " "
	next "game to continue.@"

BetBoyGFX:
INCBIN "gfx/misc/betboy_banner.w96.1bpp"
BetBoyGFXEnd

GBCOnlyString: ; 4eb38
	db   "This Game Pak is"
	next "designed only for"
	next "use on the"
	next "Game Boy Color.@"
; 4eb76


GBCOnlyGFX: ; 4eb76
INCBIN "gfx/misc/gbc_only.w112.2bpp.lz"
; 4f0bc
