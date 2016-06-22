;Written by Sanqui, v2 by Pigu

MusicTestGFX:
INCBIN "gfx/misc/music_test.2bpp"
MusicTestOAMGFX:
INCBIN "gfx/misc/music_test_oam.2bpp"
NarrowFontGFX:
INCBIN "gfx/misc/font_narrow.w64.1bpp"
MPPals:
	RGB 5, 6, 8
	RGB 6, 10, 12
	RGB 6, 14, 12
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 7, 31, 7
	RGB 7, 7, 31
	RGB 31, 7, 7
	RGB 8, 3, 3
	RGB 31, 7, 7
	RGB 0, 0, 0
	RGB 31, 27, 27
	RGB 3, 3, 8
	RGB 7, 7, 31
	RGB 0, 0, 0
	RGB 27, 27, 31
	RGB 3, 8, 3
	RGB 7, 31, 7
	RGB 0, 0, 0
	RGB 27, 31, 27
	RGB 8, 8, 3
	RGB 31, 31, 7
	RGB 0, 0, 0
	RGB 31, 31, 27
	RGB 2, 2, 3
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 31, 30, 5
	RGB 30, 5, 12
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
MPPalsEnd
NotePals:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 30, 5
	RGB 31, 25, 7
	RGB 31, 31, 31
NotePalsEnd

placestring_: MACRO
	hlcoord \1, \2
	ld de, \3
	call PlaceString
	ENDM

jbutton: MACRO
	ld a, [hJoyPressed]
	and \1
	jp nz, \2 ; TODO jx
	ENDM

jbuttond: MACRO
	ld a, [hJoyDown]
	and \1
	jp nz, \2 ; TODO jx
	ENDM

printbit: MACRO
	ld hl, \1
	bit \2, [hl]
	decoord \3, \4
	jr z, .notset\@
	ld a, \5
	ld [de], a
	jr .end\@
.notset\@
	ld a, \6
	ld [de], a
.end\@
	inc de
	ENDM

textbox: MACRO
	hlcoord \1, \2
	ld bc, ( (\4-\2) << 8) + (\3-\1)
	call TextBox
	ENDM

copy: MACRO
	ld hl, \1
	ld de, \2
	ld bc, \3
	call CopyBytes
	ENDM

fill: MACRO
	ld a, \1
	ld hl, \2
	ld bc, \3
	call ByteFill
	ENDM

MPLoadPalette:
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

	copy MPPals, BGPals, MPPalsEnd-MPPals
	copy NotePals, OBPals, NotePalsEnd-NotePals

	pop af
	ld [rSVBK], a

; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret

MusicPlayer::
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [rSVBK]
	push af
	ld a, 4
	ld [rSVBK], a
	copy TileMap, wMPTileMapBackup, TileMapEnd - TileMap
	pop af
	ld [rSVBK], a
	call ClearTileMap
	hlcoord 6, 5
	ld de, LoadingText
	call PlaceString
	xor a
	ld [hBGMapThird], a
	call DelayFrame

	ld b, BANK(MusicTestGFX) ;load the gfx
	ld c, 128
	ld de, MusicTestGFX
	ld hl, VTiles1
	ld a, 1
	ld [rVBK], a
	call Request2bpp
	xor a
	ld [rVBK], a
	ld b, BANK(MusicTestOAMGFX) ;load the gfx
	ld c, 12
	ld de, MusicTestOAMGFX
	ld hl, VTiles0
	call Request2bpp

	call DelayFrame
	call MPLoadPalette
	ld hl, rLCDC
	set 7, [hl]
	ei

	call ClearSprites

	ld hl, Options2
	set 7, [hl]
	ld a, [rSVBK]
	ld [hMPTmp], a
	ld a, 4
	ld [rSVBK], a

	fill 0, wMPFlags, wMPInitClearEnd - wMPFlags
	fill $ff, wChLastNotes, 9
	ld a, $a0
	ld [wNoteTile], a
	ld a, $80
	ld [wNoteMask], a
	ld hl, wMPFlags
	set 0, [hl]
	set 2, [hl]

	copy NoteOAM, Sprites, NoteOAMEnd - NoteOAM
	copy NoteOAM, wChannelSelectorOAM, 4
	call DelayFrame

	ld a, [rLCDC]
	ld [hMPTmp3], a
	call DisableLCD
	ld a, [rIE]
	push af
	call DoubleSpeed
	pop af
	ld [rIE], a
	ld a, $63
	ld [rLCDC], a
	ld d, $80
	ld bc, 32 * 8
	ld hl, VBGMap0
	call FillInc
	ld d, 0
	ld bc, 32 * 4
	call FillInc
	ld hl, VBGMap0 + $180
	ld de, MPTilemap
	ld b, (MPTilemapEnd - MPTilemap) / 20
.mptilemaploop
	push bc
	ld c, 20
.mptilemaploop2
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .mptilemaploop2
	ld bc, 12
	add hl, bc
	pop bc
	dec b
	jr nz, .mptilemaploop
	ld hl, VBGMap1
	ld de, MPTilemap2
	ld b, (MPTilemap2End - MPTilemap2) / 20
.mptilemap2loop
	push bc
	ld c, 20
.mptilemap2loop2
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .mptilemap2loop2
	ld bc, 12
	add hl, bc
	pop bc
	dec b
	jr nz, .mptilemap2loop
	ld a, $80
	ld b, 14
	ld de, 13
.borderloop
	ld [hl], $fc
	inc hl
	ld c, 18
.borderloop2
	ld [hli], a
	inc a
	dec c
	jr nz, .borderloop2
	ld [hl], $fc
	add hl, de
	dec b
	jr nz, .borderloop
	ld [hl], $fd
	inc hl
	ld bc, 18
	ld a, $fb
	call ByteFill
	ld a, $fd
	ld [VBGMap1 + $233], a
	fill 0, VTiles1, $1000
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, 256
	call ByteFill
	fill 9, VBGMap0 + $100, 128
	fill 8, VBGMap0 + $180, 128
	fill 8, VBGMap1, 96
	fill 0, VTiles2, $800
	ld a, 10 ; ch1
	ld hl, VBGMap1
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch2
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch3
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, VBGMap1 + $20
	inc a ; mpname
	rept 8
	ld [hli], a
	endr
	inc a ; selection
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, VBGMap1 + $30
	ld a, 10 ; visual intensities
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	xor a
	ld b, 14
	ld de, 13
	ld hl, VBGMap1 + $60
.border2loop
	ld [hl], $8
	inc hl
	ld [hl], $4
	inc hl
	ld [hl], $4
	inc hl
	ld c, 16
.border2loop2
	ld [hli], a
	dec c
	jr nz, .border2loop2
	ld [hl], $8
	add hl, de
	dec b
	jr nz, .border2loop
	ld bc, 20
	ld a, $8
	call ByteFill
	ld a, $28 ; xflip
	ld [VBGMap1 + $4c], a
	ld [VBGMap1 + $53], a
	ld a, $48 ; yflip
	ld [VBGMap1 + $220], a
	ld a, $68 ; xyflip
	ld [VBGMap1 + $233], a
	xor a
	ld [rVBK], a
	ld [hSCX], a
	ld a, $80
	ld [hWY], a
	ld [rWY], a
	fill 0, LYOverrides, LYOverridesEnd - LYOverrides + 1
	di
	ld a, rSCX % $100
	ld [hLCDStatCustom], a
	ld a, $5f
	ld [rLYC], a
	ld a, $50 ; VBlank + LYC
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld a, 2 ; LCD
	ld [rIE], a
	ei
	call EnableLCD

	ld a, [wSongSelection]
	and a ;let's see if a song is currently selected
	jr z, .getsong
	jp .redraw
.getsong ;get the current song
	ld a, 1
	jp .redraw
.loop
	call UpdateDataAndDelayFrame

	call GetJoypad
	ld a, [wSelectionState]
	and a
	jp nz, .songEditor
	jbutton B_BUTTON, .exit
	jbutton D_LEFT, .left
	jbutton D_RIGHT, .right
	jbutton D_DOWN, .down
	jbutton D_UP, .up
	jbutton A_BUTTON, .a
	jbutton SELECT, .select
	jbutton START, .start

	jr .loop
.left
	ld a, [wSongSelection]
	dec a
	jr nz, .redraw
	ld a, NUM_MUSIC-1
	jr .redraw
.right
	ld a, [wSongSelection]
	inc a
	cp a, NUM_MUSIC
	jr nz, .redraw
	ld a, 1
	jr .redraw
.down
	ld a, [wSongSelection]
	sub a, 10
	jr z, .zerofix
	jr nc, .redraw
.zerofix
	ld a, NUM_MUSIC-1
	jr .redraw
.up
	ld a, [wSongSelection]
	add a, 10
	cp a, NUM_MUSIC
	jr c, .redraw
	ld a, 1
	jr .redraw
.select
	call .waitinfo
	xor a
	call SongSelector
	jp .loop
.redraw
	ld [wSongSelection], a

	xor a
	ld [wInfoDrawState], a ; reset info draw queue
	call DrawSelectorNum
	ld hl, wMPFlags
	set 1, [hl] ; song info redraw occurred
	res 6, [hl] ; reset leftover additional draw queue

; draw song info
	fill " ", wMusicNameChars, wMusicInfoCharsEnd - wMusicNameChars
	fill 0, wMusicNameGFX, wMusicInfoGFXEnd - wMusicNameGFX
	ld a, [wSongSelection]
	call GetSongInfo
	jp c, .loop ; no data

	ld a, [hli]
	ld d, [hl]
	ld e, a
	push hl
	push de
	call UpdateDataAndDelayFrame
	ld hl, wMPFlags
	set 7, [hl]
	res 6, [hl]
	pop de
	ld hl, wMusicNameChars
	ld bc, wMusicNameGFX
	ld a, 30
	call PlaceString_MP
	pop de
	inc de
	push de
	ld hl, Origin - 2
	call GetSongInfo2
	ld hl, wMusicOriginChars
	ld bc, wMusicOriginGFX
	ld a, 30
	call PlaceString_MP
	call UpdateDataAndDelayFrame
	pop de
	inc de
	push de
	ld hl, Artist - 2
	call GetSongInfo2
	ld hl, wMusicComposerChars
	ld bc, wMusicComposerGFX
	ld a, 30
	call PlaceString_MP
	pop de
	inc de
	ld a, [de]
	and a
	jp z, .loop
	ld hl, Artist - 2
	call GetSongInfo2
	ld hl, wMusicAdditionalChars
	ld bc, wMusicAdditionalGFX
	ld a, 20
	call PlaceString_MP
	ld hl, wMPFlags
	set 6, [hl]
	jp .loop
	
.waitinfo
	ld hl, wMPFlags
	bit 7, [hl]
	ret z
	call UpdateDataAndDelayFrame
	jr .waitinfo

.a
	call .waitinfo
	fill 0, wC1Vol, wMPInitClearEnd - wC1Vol
	ld hl, wMPFlags
	set 0, [hl]
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [wSongSelection]
	ld e, a
	ld d, 0
	call PlayMusic
	fill $ff, wChLastNotes, 9
	jp .loop

.start
	ld a, 1
	ld [wSelectionState], a
	ld b, -1
	ld hl, wChannelSelectorOAM
	jp .movecursor

.exit
	ld hl, Options2
	res 7, [hl]
	call DisableLCD
	; get the font gfx back
	ld hl, Font
	ld de, VTiles1
	ld bc, FontEnd - Font
	ld a, BANK(Font)
	call FarCopyBytesDouble
	; get the option screen back
	xor a
	ld [hSCX], a
	ld [rSCX], a
	ld a, 5
	ld [rSVBK], a
	copy Unkn1Pals, BGPals, $80
	call ForceUpdateCGBPals
	ld a, 4
	ld [rSVBK], a
	copy wMPTileMapBackup, TileMap, TileMapEnd - TileMap
	ld hl, wMPTileMapBackup
	ld de, VBGMap0
	ld b, 18
.exloop
	ld c, 20
.exloop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .exloop2
	push hl
	ld hl, 12
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .exloop
	ld a, 1
	ld [rVBK], a
	fill 7, VBGMap0, 32 * 18
	xor a
	ld [rVBK], a
	call Functione5f
	call ClearSprites
	ld a, [rIE]
	push af
	call NormalSpeed
	pop af
	ld [rIE], a
	call EnableLCD
	xor a
	ld [hVBlank], a ; VBlank0
	ld a, [hMPTmp3]
	ld [rLCDC], a
	ld a, $90
	ld [hWY], a
	di
	ld a, 8 ; normal HBlank int
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld [hLCDStatCustom], a
	ld a, $f
	ld [rIE], a
	ei
	ld a, [hMPTmp]
	ld [rSVBK], a
	ret

.songEditor
	jbutton D_LEFT, .songEditorleft
	jbutton D_RIGHT, .songEditorright
	jbutton A_BUTTON, .songEditora
	jbutton B_BUTTON, .songEditorb
	jbutton START, .songEditorstart
	jp .loop

.songEditorleft
	ld hl, wChannelSelectorOAM + 1
	ld a, [wChannelSelector]
	dec a
	cp -1
	jr nz, .noOverflow
	ld a, 3
	ld [wChannelSelector], a
	ld b, 3
	jr .movecursor
.noOverflow
	ld [wChannelSelector], a
	ld b, -1
	jr .movecursor

.songEditorright
	ld hl, wChannelSelectorOAM + 1
	ld a, [wChannelSelector]
	inc a
	cp 4
	jr nz, .noOverflow2
	xor a
	ld [wChannelSelector], a
	ld b, -3
	jr .movecursor
.noOverflow2
	ld [wChannelSelector], a
	ld b, 1
	ld hl, wChannelSelectorOAM + 1
	jr .movecursor

.songEditora
	ld a, [wChannelSelector]
	ld c, 1
	and a
	jr z, .noshift
.shiftloop
	sla c
	dec a
	jr nz, .shiftloop
.noshift
	ld a, [wMutedChannels]
	xor c
	ld [wMutedChannels], a
	jp .loop

.songEditorstart
.songEditorb
	xor a
	ld [wSelectionState], a
	ld b, 1
	ld hl, wChannelSelectorOAM
	jr .movecursor

.movecursor
	ld c, 8
.movecursorloop
	push bc
	push hl
	ld a, [hl]
	add b
	ld [hl], a
	call UpdateDataAndDelayFrame
	pop hl
	pop bc
	dec c
	jr nz, .movecursorloop
	jp .loop

DrawSelectorNum:
	ld hl, wSelectorChars + 4
	ld a, "@"
	ld [hld], a
	ld a, " "
	ld [hld], a
	ld [hld], a
	ld [hld], a
	ld a, $e5
	ld [hli], a
	ld de, wSongSelection
	ld bc, $0103
	call PrintNum
	ld hl, wSelectorChars
	ld de, wSelectorGFX
	jp RenderNarrowText

DrawSelectorNum@VBlank:
	ld a, 2
	ld [Requested1bpp], a
	ld a, wSelectorGFX % $100
	ld [Requested1bppSource], a
	ld a, wSelectorGFX / $100
	ld [Requested1bppSource + 1], a
	ld a, $60
	ld [Requested1bppDest], a
	ld a, $8e
	ld [Requested1bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve1bppRequest
	xor a
	ld [rVBK], a
	ret

FillInc:
	ld a, d
	ld [hli], a
	inc d
	dec bc
	ld a, b
	or c
	jr nz, FillInc
	ret

RenderWaveform:
	fill 0, wWaveformTmpGFX, 64

	ld hl, wWaveformTmpGFX
	ld de, wWaveformTmp
	ld bc, $1080

.drawloop
	ld a, [de]
	inc de
	push de
	push hl
	ld d, 8
	ld e, a
	swap a
	rrca
	cpl
	and 7
	jr z, .draw
.seek
	inc hl
	inc hl
	dec d
	dec a
	jr nz, .seek
.draw
	ld a, [hl]
	or c
	ld [hli], a
	ld a, [hl]
	or c
	ld [hli], a
	dec d
	jr z, .done
.drawl
	ld a, [hl]
	or c
	ld [hli], a
	inc hl
	dec d
	jr nz, .drawl
.done
	pop hl
	push hl
	srl c
	ld d, 8
	ld a, e
	rrca
	cpl
	and 7
	jr z, .draw2
.seek2
	inc hl
	inc hl
	dec d
	dec a
	jr nz, .seek2
.draw2
	ld a, [hl]
	or c
	ld [hli], a
	ld a, [hl]
	or c
	ld [hli], a
	dec d
	jr z, .done2
.drawl2
	ld a, [hl]
	or c
	ld [hli], a
	inc hl
	dec d
	jr nz, .drawl2
.done2
	pop hl
	srl c
	jr nc, .nonewblock
	ld de, $10
	add hl, de
	ld c, $80
.nonewblock
	pop de
	dec b
	jr nz, .drawloop
	ret

DrawNotes:
	ld a, 0
	ld [wTmpCh], a
	call DrawNote
	ld a, 1
	ld [wTmpCh], a
	call DrawNote
	ld a, 2
	ld [wTmpCh], a
	jp DrawNote

DrawNote:
	ld a, [wMutedChannels]
	ld b, a
	ld a, [wTmpCh]
	and a
	jr z, .skipshift
.shiftloop
	srl b
	dec a
	jr nz, .shiftloop
.skipshift
	srl b
	jp c, .nonote
	ld a, [wTmpCh]
	add a
	ld c, a
	ld b, 0
	ld hl, wC1Vol
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nonote
; get the note from tone frequency
; e = ⌊96.5-12*log₂(k/Freq("C2")/(2048-[wCxFreq]))⌋
;   = ⌊96.5-12*(log₂(k/Freq("C2"))-log₂(2048-[wCxFreq]))⌋
; k = 131072 when wTmpCh != 2
; k =  65536 when wTmpCh =  2
; Freq("C2") is 65.4064Hz in A440
	ld hl, wC1Freq
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl] ; [wCxFreq]
	ld a, 2048 % $100
	sub c
	ld l, a
	ld a, 2048 / $100
	sbc b
	ld h, a ; 2048-[wCxFreq]
	ld a, h
	and a
	ld a, l
	jr nz, .skip0check
	cp 1
	jr z, .logshiftdone
	jr c, .nonote
.skip0check
	ld bc, 0
	ld d, c
.logshiftloop
	srl h
	rr l
	rr c
	inc d
	ld a, h
	and a
	jr nz, .logshiftloop
	ld a, l
	cp 1
	jr nz, .logshiftloop
.logshiftdone
	ld hl, LogTable
	add hl, bc
	ld e, [hl] ; log₂(2048-[wCxFreq])
	ld a, [wTmpCh]
	cp 2
	ld hl, $af7 ; log₂(65536/Freq("C2"))
	jr z, .ch3
	ld hl, $bf7 ; log₂(131072/Freq("C2"))
.ch3
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a ; log₂(k/Freq("C2"))-log₂(2048-[wCxFreq])
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl ; 12*(log₂(k/Freq("C2"))-log₂(2048-[wCxFreq]))
	ld b, h
	ld c, l ; 12*(log₂(k/Freq("C2"))-log₂(2048-[wCxFreq]))
	ld a, $80
	sub l
	ld a, $60 ; 96.5
	sbc h
	ld e, a ; ⌊96.5-12*(log₂(k/Freq("C2"))-log₂(2048-[wCxFreq]))⌋
	ld a, [wTmpCh]
	ld c, a
	ld b, 0
	ld hl, wChLastNotes
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, e
	ld [hli], a
	srl a
	srl a
	and $fe
	ld [hli], a
	ld a, e
	and 7
	sla a
	ld [hli], a
	ret

.nonote
	ld a, [wTmpCh]
	ld c, a
	ld b, 0
	ld hl, wChLastNotes
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

UpdateVisualIntensity:
	ld hl, wVolTimer
	ld a, [hl]
	add 32
	ld [hl], a
.loop
	push hl
; update NR10 freq mod
	ld a, [wNR10Sub]
	and a
	jr z, .nofreqmod
	dec a
	ld [wNR10Sub], a
	jr nz, .nofreqmod
	ld a, [SoundInput]
	ld d, a
	swap a
	and 7
	ld [wNR10Sub], a
	ld a, 7
	and d
	ld e, a
	ld a, [wC1Freq]
	ld l, a
	ld c, a
	ld a, [wC1Freq + 1]
	ld h, a
	ld b, a
	ld a, e
	and a
	jr z, .skipshift
.shiftloop
	srl b
	rr c
	dec e
	jr nz, .shiftloop
.skipshift
	bit 3, d
	jr z, .inc
	ld a, c
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc c
	jr nz, .noincb
	inc b
.noincb
	add hl, bc
	ld a, h
	cp 2048 / $100
	jr c, .noovf
	ld hl, 0
	jr .noovf
.inc
	add hl, bc
	jr nc, .noovf
	ld hl, 2047
.noovf
	ld a, l
	ld [wC1Freq], a
	ld a, h
	ld [wC1Freq + 1], a
.nofreqmod
	ld hl, wC1Vol
	ld e, 4
.updateChannels
	inc hl
	ld a, [hl]
	and a
	jr z, .nextChannel2
	dec a
	ld [hl], a
	jr nz, .nextChannel2
	push hl
	ld a, 4
	sub e
	ld hl, Channel1Intensity
	ld bc, Channel2 - Channel1
	call AddNTimes
	ld a, [hl]
	pop hl
	ld b, a
	and 7
	add a
	ld [hld], a
	bit 3, b
	jr nz, .inc2
	ld a, [hl]
	and a
	jr z, .nextChannel
	dec [hl]
	jr .nextChannel
.inc2
	ld a, [hl]
	cp $f
	jr z, .nextChannel
	inc [hl]
.nextChannel
	inc hl
.nextChannel2
	inc hl
	dec e
	jr nz, .updateChannels
	pop hl
	ld a, [hl]
	sub 15
	ld [hl], a
	cp 15
	jp nc, .loop
	ld a, [wMutedChannels]
	ld b, a
	ld hl, wC1VolTile
	ld c, $e8
	ld a, [wC1Vol]
	add c
	ld [hl], a
	srl b
	jr nc, .no1
	ld [hl], $f9
.no1
	inc hl
	ld a, [wC2Vol]
	add c
	ld [hl], a
	srl b
	jr nc, .no2
	ld [hl], $f9
.no2
	inc hl
	ld a, [wC3Vol]
	add c
	ld [hl], a
	srl b
	jr nc, .no3
	ld [hl], $f9
.no3
	inc hl
	ld a, [wC4Vol]
	add c
	ld [hl], a
	srl b
	ret nc
	ld [hl], $f9
	ret

GetSongInfo:
	dec a
	cp NUM_MUSIC - 1
	jr nc, .noname
	ld c, a
	ld b, 0
	ld l, c
	ld h, b
	add hl, hl ; x2
	add hl, hl ; x4
	add hl, bc ; x5
	ld bc, SongInfo
	add hl, bc
	xor a
	ret
.noname
	scf
	ret

GetSongInfo2:
	ld a, [de]
	ld b, a
.loop
	inc hl
	inc hl
	ld a, [hli]
	cp -1
	jr z, .noname
	cp b
	jr nz, .loop
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
.noname
	ld de, BlankName
	ret

SongSelector:
	call UpdateDataAndDelayFrame
	ld a, [wMPFlags]
	bit 7, a
	jr nz, SongSelector ; wait until info draw is finished
	ld a, [wNoteMask]
	cp $80
	jr z, SongSelector ; don't attempt to init on note display clear
	xor a
	ld [wDrawMask], a
.traninloop
	ld a, [wDrawMask]
	ld [hSCY], a
	cp $80
	jp z, .tranindone
	ld b, a
	ld c, a
	ld a, $80
	sub b
	ld [hWY], a
	ld a, $5f
	sub b
	jr nc, .noclrint
	ld a, $10 ; vblank only
	ld [rSTAT], a
	xor a
	ld [LYOverrides + $90], a
.noclrint
	ld [rLYC], a
	ld a, c
	cp $78
	jr nc, .nonewline
	and 7
	jr nz, .nonewline
	ld a, c
	add a
	swap a
	call DrawSongSelectorItem
.nonewline
; calculate the copy address
	ld a, [wDrawMask]
	sub 8
	jr c, .nolinecopy
	cp $70
	jr nc, .nolinecopy
	and 7
	ld e, a
	ld d, 0
	ld hl, wMusicListGFX - 1
	add hl, de
	ld a, l
	ld [wLineCopySrc], a
	ld a, h
	ld [wLineCopySrc + 1], a
	sla e
	ld a, [wDrawMask]
	sub 8
	and $f8
	ld l, a
	ld h, d ; x8
	add a
	swap a
	ld c, a
	ld b, h
	add hl, bc ; x9
	add hl, hl ; x18
	add hl, hl ; x36
	add hl, hl ; x72
	add hl, hl ; x144
	add hl, hl ; x288
	add hl, de
	ld bc, VTiles1
	add hl, bc
	ld a, l
	ld [wLineCopyDest], a
	ld a, h
	ld [wLineCopyDest + 1], a
.nolinecopy
	call UpdateData
	call DelayFrame_MP2
	jp .traninloop
.tranindone
	copy SongSelectorOAM, Sprites, SongSelectorOAMEnd - SongSelectorOAM
	xor a
	ld [wListDrawState], a
	ld [hSCY], a
.traninlast
	call UpdateDataAndDelayFrame3
	ld a, [wListDrawState]
	cp 8
	jr c, .traninlast
	ld a, $ff
	ld a, [wListDrawState2]
.loop
	call UpdateDataAndDelayFrame3
	call GetJoypad
	jbutton A_BUTTON, .a
	jbutton B_BUTTON, .exit
	jbuttond D_DOWN, .down
	jbuttond D_UP, .up
	jbuttond D_LEFT, .left
	jbuttond D_RIGHT, .right
	jr .loop
.a
	fill 0, wC1Vol, wMPInitClearEnd - wC1Vol
	ld hl, wMPFlags
	set 0, [hl]
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [wSongSelection]
	ld e, a
	ld d, 0
	call PlayMusic
	jp .exit
.down
	ld a, [wSongSelection]
	inc a
	cp NUM_MUSIC
	jr c, .noOverflowD
	ld a, 1
.noOverflowD
	ld [wSongSelection], a
	call UpdateSelectorNames
	ld a, $a
	ld [wListDrawState], a
	ld b, 1
	call RedrawSelector_UpDown
	jr .loop
.up
	ld a, [wSongSelection]
	dec a
	and a
	jr nz, .noOverflowU
	ld a, NUM_MUSIC - 1
.noOverflowU
	ld [wSongSelection], a
	call UpdateSelectorNames
	ld a, $9
	ld [wListDrawState], a
	ld b, 0
	call RedrawSelector_UpDown
	jp .loop
.left
	ld a, [wSongSelection]
	dec a
	sub 14
	jr nc, .noOverflowL
	add NUM_MUSIC - 1
.noOverflowL
	inc a
	ld [wSongSelection], a
	call UpdateSelectorNames
	call RedrawSelector_Page
	jp .loop
.right
	ld a, [wSongSelection]
	add 14
	cp NUM_MUSIC
	jr c, .noOverflowR
	sub NUM_MUSIC - 1
.noOverflowR
	ld [wSongSelection], a
	call UpdateSelectorNames
	call RedrawSelector_Page
	jp .loop
.exit
	ld a, $c
	ld [wListDrawState], a
	copy NoteOAM, Sprites, NoteOAMEnd - NoteOAM
	ld hl, Sprites + 5
	ld bc, 4
	ld e, 8
	ld a, $a8
.sprloop
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .sprloop
	xor a
	ld [Sprites + $24], a
	fill " ", wMusicNameChars, wMusicInfoCharsEnd - wMusicNameChars
	fill 0, wMusicNameGFX, wMusicInfoGFXEnd - wMusicNameGFX
	ld a, [wSongSelection]
	call GetSongInfo
	jp c, .nodata

	ld a, [hli]
	ld d, [hl]
	ld e, a
	push hl
	push de
	call UpdateDataAndDelayFrame3
	ld hl, wMPFlags
	set 7, [hl]
	res 6, [hl]
	pop de
	ld hl, wMusicNameChars
	ld bc, wMusicNameGFX
	ld a, 30
	call PlaceString_MP
	call UpdateDataAndDelayFrame3
	pop de
	inc de
	push de
	ld hl, Origin - 2
	call GetSongInfo2
	ld hl, wMusicOriginChars
	ld bc, wMusicOriginGFX
	ld a, 30
	call PlaceString_MP
	call UpdateDataAndDelayFrame3
	pop de
	inc de
	push de
	ld hl, Artist - 2
	call GetSongInfo2
	ld hl, wMusicComposerChars
	ld bc, wMusicComposerGFX
	ld a, 30
	call PlaceString_MP
	call UpdateDataAndDelayFrame3
	pop de
	inc de
	ld a, [de]
	and a
	jr z, .nodata
	ld hl, Artist - 2
	call GetSongInfo2
	ld hl, wMusicAdditionalChars
	ld bc, wMusicAdditionalGFX
	ld a, 20
	call PlaceString_MP
	ld hl, wMPFlags
	set 6, [hl]
.nodata
	xor a
	ld [hSCX], a
	ld [wInfoDrawState], a
	ld [wChannelSelector], a
	copy NoteOAM, wChannelSelectorOAM, 4
.lastloop
	call UpdateDataAndDelayFrame3
	ld a, [wListDrawState]
	cp $ff
	jr nz, .lastloop
	xor a
	ld [hSCY], a
	ld a, $a0
	ld [wNoteTile], a
	ld a, $80
	ld [wNoteMask], a
	ld a, $5f
	ld [rLYC], a
	ld a, $50 ; VBlank + LYC
	ld [rSTAT], a
	ret

DrawSongSelectorItem:
; a = row num + 1
	ld d, NUM_MUSIC
	sub 7
	ld b, a
	ld a, [wSongSelection]
	jr c, .dec
	add b
	cp d
	jr c, .noovf
	sub d
	inc a
	jr .noovf
.dec
	add b
	dec a
	cp d
	jr c, .noovf2
	add d
	jr .noovf
.noovf2
	inc a
.noovf
	push af
	ld hl, [sp + 1]
	ld d, h
	ld e, l
	ld hl, wMusicListChars + 4
	ld a, "@"
	ld [hld], a
	ld a, ":"
	ld [hld], a
	ld a, " "
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ld bc, $0103
	call PrintNum
	ld hl, wMusicListChars
	ld de, wMusicListGFX
	call RenderNarrowText
	fill 0, wMusicListGFX + 16, 128
	pop af
	call GetSongInfo
	ret c
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMusicListChars + 4
	ld bc, wMusicListGFX + 16
	ld a, 32
	jp PlaceString_MP

UpdateSelectorNames:
	ld a, $80
	ld [wListDrawState2], a
	call DrawSelectorNum
UpdateDataAndDelayFrame3:
	call UpdateData
	jp DelayFrame_MP3

RedrawSelector_UpDown:
	ld a, b
	and a
	ld a, 1
	jr z, .up
	ld a, 14
.up
	push bc
	call DrawSongSelectorItem
	pop bc
	ld a, [hSCY] ; x8
	add a ; x16
	swap a ; x1
	and $f
	call Mul144
	add hl, hl ; 288
	ld de, VTiles1
	add hl, de
	ld a, b
	and a
	jr nz, .loop
	ld a, [hSCY]
	and a
	jr z, .special
	ld de, $feee
	add hl, de
	jr .loop
.special
	ld hl, VTiles1 + $eae
.loop
	push hl
	push bc
	ld a, b
	and a
	jr z, .up2
	ld a, [wListDrawState2]
	ld e, a
	ld d, 0
	ld bc, wMusicListGFX - 1
	jr .done
.up2
	ld a, [wListDrawState2]
	cpl
	ld e, a
	ld d, $ff
	inc de
	ld bc, wMusicListGFX + 6
.done
	add hl, de
	add hl, de
	ld a, l
	ld [wLineCopyDest], a
	ld a, h
	ld [wLineCopyDest + 1], a
	ld h, b
	ld l, c
	add hl, de
	ld a, l
	ld [wLineCopySrc], a
	ld a, h
	ld [wLineCopySrc + 1], a
	call UpdateDataAndDelayFrame3
	pop bc
	pop hl
	ld a, [wListDrawState2]
	cp $ff
	jr nz, .loop
	ret

RedrawSelector_Page:
	ld a, $b
	ld [wListDrawState], a
	ld a, [wListDrawState2]
	srl a
	inc a
	call nc, DrawSongSelectorItem
	ld a, [wListDrawState2]
	ld b, a
	ld a, [hSCY] ; x8
	rrca ; x4
	rrca ; x2
	and $3e
	add b
	cp 28
	jr c, .noadj
	sub 28
.noadj
	call Mul144
	ld de, VTiles1
	add hl, de
	ld a, l
	ld [wLineCopyDest], a
	ld a, h
	ld [wLineCopyDest + 1], a
	call UpdateDataAndDelayFrame3
	ld a, [wListDrawState2]
	cp $ff
	jr nz, RedrawSelector_Page
	ret

Mul144:
	ld l, a
	ld h, 0
	ld e, l
	ld d, h
	add hl, hl ; x2
	add hl, hl ; x4
	add hl, hl ; x8
	add hl, de ; x9
	add hl, hl ; x18
	add hl, hl ; x36
	add hl, hl ; x72
	add hl, hl ; x144
	ret

PlaceString_MP:
	push bc
	push hl
	inc a
	ld b, a
.loop
	ld a, [de]
	inc de
	cp "@"
	jr z, .done
	ld [hli], a
	dec b
	jr z, .toolong
	jr .loop
.toolong
	dec hl
	dec hl
	dec hl
	ld [hl], "."
	inc hl
	ld [hl], "."
	inc hl
.done
	ld [hl], "@"
	pop hl
	pop de

RenderNarrowText::
; render 1bpp graphics of a narrow text of hl to de
; only work with character $7f-$ff
	ld b, 0 ; left/right indicator
	ld a, d
	ld [hTmpd], a
	ld a, e
	ld [hTmpe], a
.getcharloop
	ld a, [hli]
	cp "@"
	jp z, .end
	cp $7f
	jr c, .getcharloop
	jr nz, .notspace
	ld a, $bf
.notspace
	sub $80
	bit 0, b
	jr nz, .right
	ld d, a
	set 0, b
	jr .getcharloop
.right
	call .process
	jr .getcharloop
.process
	res 0, b
	srl a
	ld e, a
	ld a, 1
	jr c, .rodd
	xor a
.rodd
	srl d
	rla
	push hl
	push bc
	ld h, 0
	ld l, d
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, NarrowFontGFX
	add hl, bc
	push hl
	ld h, 0
	ld l, e
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	pop bc
	push hl
	ld hl, .RenderNarrowTextTable
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hTmpd]
	ld d, a
	ld a, [hTmpe]
	ld e, a
	jp [hl]
.return
	ld a, d
	ld [hTmpd], a
	ld a, e
	ld [hTmpe], a
	pop bc
	pop hl
	ret
.end
	bit 0, b
	ret z
	ld a, $bf-$80
	jp .process

.RenderNarrowTextTable
	dw .NT_Right0Left0
	dw .NT_Right0Left1
	dw .NT_Right1Left0
	dw .NT_Right1Left1

; hl = right
; bc = left

.NT_Right0Left0
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	and $f0
	ld d, a
	ld a, [hli]
	swap a
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return

.NT_Right0Left1
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	swap a
	and $f0
	ld d, a
	ld a, [hli]
	swap a
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return

.NT_Right1Left0
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	and $f0
	ld d, a
	ld a, [hli]
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return

.NT_Right1Left1
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	swap a
	and $f0
	ld d, a
	ld a, [hli]
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return

UpdateData:
	ld a, [wMPFlags]
	bit 0, a
	call nz, RenderWaveform
	call UpdateVisualIntensity
	jp DrawNotes

UpdateDataAndDelayFrame:
	call UpdateData

DelayFrame_MP::
; music player VBlank routine
	ld a, [rLY]
	cp $90
	jr nc, .toolate
	cp $5f
	jr nc, .overline
.toolate
	halt
.overline
	halt
	ld a, [hSCX]
	ld [rSCX], a
	ld a, [wNoteTile]
	ld c, a
	ld b, 0
	sla c
	rl b
; note display clear if requested
	ld a, [wMPFlags]
	bit 2, a
	jr z, .noclear
	push bc
	ld hl, VTiles1
	add hl, bc
	ld bc, $1f0
	xor a
	call ClearRow
	call ClearRow
	ld de, $f800
	add hl, de
	ld a, 1
	ld [rVBK], a
	xor a
	call ClearRow
	ld [rVBK], a
	ld hl, wMPFlags
	res 2, [hl]
	set 3, [hl]
	pop bc
; note display draw
.noclear
; ch1
	ld a, [wChLastNotes + 1]
	cp $ff
	jr z, .drawch2
	call Getidx
	ld a, [wChLastNotes + 2]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch2
	ld a, [wChLastNotes + 4]
	cp $ff
	jr z, .drawch3
	call Getidx
	ld a, [wChLastNotes + 5]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch3
	ld a, [wChLastNotes + 7]
	cp $ff
	jr z, .drawduty
	call Getidx
	ld a, [wChLastNotes + 8]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawduty
	call DelayFrame_MPCommon
_w_ = 0
	rept 4
	ld a, [wChannelSelectorOAM + _w_]
	ld [$fe00 + _w_], a
_w_ = _w_ + 1
	endr
; wave gfx copy if requested
	ld a, [wMPFlags]
	bit 3, a
	jr nz, DelayFrame_MPPost
	bit 0, a
	jr z, .nowavecpy
	ld a, 4
	ld [Requested2bpp], a
	ld a, wWaveformTmpGFX % $100
	ld [Requested2bppSource], a
	ld a, wWaveformTmpGFX / $100
	ld [Requested2bppSource + 1], a
	ld a, $a0
	ld [Requested2bppDest], a
	ld a, $8b
	ld [Requested2bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve2bppRequest
	xor a
	ld [rVBK], a
	ld hl, wMPFlags
	res 0, [hl]
	jr DelayFrame_MPPost
.nowavecpy
; selector cursor copy
	ld a, [wMPFlags]
	bit 1, a
	jr z, .noinfocpy
	call DrawSelectorNum@VBlank
	ld hl, wMPFlags
	res 1, [hl]
	jr DelayFrame_MPPost
.noinfocpy
	ld a, [wMPFlags]
	bit 7, a
	jr z, DelayFrame_MPPost
	ld a, [wInfoDrawState]
	ld hl, DrawSongInfo@VBlank
	rst JumpTable

DelayFrame_MPPost:
; all vblank copies done
	ld hl, wMPFlags
	res 3, [hl]
	ld a, [hSCX]
	inc a
	ld [hSCX], a
	ld [LYOverrides + $90], a ; in case very long operation happened
	ld a, [wNoteMask]
	rrca
	jr nc, .noc
	ld a, [wNoteTile]
	add $8
	ld [wNoteTile], a
	set 2, [hl]
	ld a, $80
.noc
	ld [wNoteMask], a
	call Joypad
	callba _UpdateSound
	ret

DelayFrame_MPCommon:
; ch1-2 duty
	ld a, [wC1Duty]
	add $cc
	ld [VBGMap1 + $2], a
	ld a, [wC2Duty]
	add $cc
	ld [VBGMap1 + $5], a
; ch4 noise set
	ld a, [MusicNoiseSampleSet]
	add $da
	ld [VBGMap1 + $11], a
; visual intensities
	ld a, [wC1Vol]
	add $e8
	ld [VBGMap1 + $30], a
	ld a, [wC2Vol]
	add $e8
	ld [VBGMap1 + $31], a
	ld a, [wC3Vol]
	add $e8
	ld [VBGMap1 + $32], a
	ld a, [wC4Vol]
	add $e8
	ld [VBGMap1 + $33], a
	ld a, [wMutedChannels]
	ld hl, VBGMap1 + $30
	rept 4
	rrca
	jr nc, .no\@
	ld [hl], $f9
.no\@
	inc hl
	endr
	ret

DelayFrame_MP2Restart:
	call DelayFrame_MPPost
DelayFrame_MP2:
; music list transition in VBlank routine
	ld a, [rLYC]
	ld b, a
	and a
	jr z, .overline
	ld a, [rLY]
	cp $90
	jr nc, .toolate
	cp b
	jr nc, .overline
.toolate
	halt
.overline
	halt
	ld a, b
	and a
	jr z, .noscroll
	ld a, [hSCX]
.noscroll
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a
	ld a, [hWY]
	ld [rWY], a
	ld a, [wNoteTile]
	ld c, a
	ld b, 0
	sla c
	rl b
; note display clear if requested
	ld a, [wMPFlags]
	bit 2, a
	jr z, .noclear
	ld a, [wDrawMask]
	cp $60
	jr nc, .noclear
	push bc
	ld hl, VTiles1
	add hl, bc
	ld bc, $1f0
	ld a, [wDrawMask]
	and a
	jr nz, .clear1
	xor a
	call ClearRow
	call ClearRow
	ld de, $f800
	add hl, de
	ld a, 1
	ld [rVBK], a
	xor a
	call ClearRow
	jr .cleardone
.clear1
	dec a
	call PartialClear
	jr c, .clear1e
.clear1d
	ld de, $800
	add hl, de
.clear1e
	ld a, [wDrawMask]
	sub 33
	jr nc, .clear2
	xor a
	call ClearRow
	ld de, $f800
	add hl, de
	ld a, 1
	ld [rVBK], a
	xor a
	call ClearRow
	jr .cleardone
.clear2
	call PartialClear
	ld a, 1
	ld [rVBK], a
	jr nc, .clear2d
	ld de, $f800
	add hl, de
.clear2d
	ld a, [wDrawMask]
	sub 65
	jr nc, .clear3
	xor a
	call ClearRow
	jr .cleardone
.clear3
	call PartialClear
.cleardone
	ld [rVBK], a
	ld hl, wMPFlags
	res 2, [hl]
	set 3, [hl]
	pop bc
; note display draw
.noclear
; ch1
	ld a, [wDrawMask]
	ld e, a
	ld a, [wChLastNotes]
	cp e
	jr c, .drawch2
	ld a, [wChLastNotes + 1]
	cp $ff
	jr z, .drawch2
	call Getidx
	ld a, [wChLastNotes + 2]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch2
	ld a, [wDrawMask]
	ld e, a
	ld a, [wChLastNotes + 3]
	cp e
	jr c, .drawch3
	ld a, [wChLastNotes + 4]
	cp $ff
	jr z, .drawch3
	call Getidx
	jr c, .drawch3
	ld a, [wChLastNotes + 5]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch3
	ld a, [wDrawMask]
	ld e, a
	ld a, [wChLastNotes + 6]
	cp e
	jr c, .drawduty
	ld a, [wChLastNotes + 7]
	cp $ff
	jr z, .drawduty
	call Getidx
	jr c, .drawduty
	ld a, [wChLastNotes + 8]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawduty
	call DelayFrame_MPCommon
	ld a, [wDrawMask]
	ld b, a
	ld a, $68
	sub b
	jr c, .zero1
	ld [$fe04], a
	ld b, 12
	sub b
	jr c, .zero2
	ld [$fe08], a
	sub b
	jr c, .zero3
	ld [$fe0c], a
	sub b
	jr c, .zero4
	ld [$fe10], a
	sub b
	jr c, .zero5
	ld [$fe14], a
	sub b
	jr c, .zero6
	ld [$fe18], a
	sub b
	jr c, .zero7
	ld [$fe1c], a
	sub b
	jr c, .zero8
	ld [$fe20], a
	jr .doneduty
.zero1
	xor a
	ld [$fe04], a
.zero2
	ld [$fe08], a
.zero3
	ld [$fe0c], a
.zero4
	ld [$fe10], a
.zero5
	ld [$fe14], a
.zero6
	ld [$fe18], a
.zero7
	ld [$fe1c], a
.zero8
	ld [$fe20], a
.doneduty
; wave gfx copy if requested
	ld a, [wMPFlags]
	bit 3, a
	jp nz, DelayFrame_MP2Restart
	bit 0, a
	jr z, .nowavecpy
	ld a, 4
	ld [Requested2bpp], a
	ld a, wWaveformTmpGFX % $100
	ld [Requested2bppSource], a
	ld a, wWaveformTmpGFX / $100
	ld [Requested2bppSource + 1], a
	ld a, $a0
	ld [Requested2bppDest], a
	ld a, $8b
	ld [Requested2bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve2bppRequest
	xor a
	ld [rVBK], a
	ld hl, wMPFlags
	res 0, [hl]
	jp DelayFrame_MP2Restart
.nowavecpy
; music list copy
	ld a, [wDrawMask]
	and a
	jr z, .exit1
	dec a
	jr z, .exit2
	cp 8
	jp c, .no1bppcpy
	cp $78
	jp nc, .no1bppcpy
	call Serve1bppLine
.no1bppcpy
; all vblank copies done
	ld a, [wDrawMask]
	inc a
	ld [wDrawMask], a
	jp DelayFrame_MPPost
	
.exit1
	ld a, $80
	ld hl, VBGMap1 + $61
	ld de, 14
	ld c, 7

.exit1_2
	call FillInc18
	add hl, de
	dec c
	jr nz, .exit1_2
	jr .no1bppcpy

.exit2
	ld a, $fe
	ld hl, VBGMap1 + $141
	ld de, 14
	ld c, 7
	jr .exit1_2

Serve1bppLine:
	ld [hSPBuffer], sp
	ld a, [wLineCopySrc]
	ld l, a
	ld a, [wLineCopySrc + 1]
	ld h, a
	ld sp, hl
	ld a, [wLineCopyDest]
	ld l, a
	ld a, [wLineCopyDest + 1]
	ld h, a
	ld bc, 15
	rept 18
	pop af
	ld [hli], a
	ld [hl], a
	add hl, bc
	add sp, 6
	endr
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

DelayFrame_MP3:
; music list VBlank routine
	halt
	xor a
	ld [rSCY], a
	ld [LYOverrides + $90], a
.doneduty
; wave gfx copy if requested
	ld a, [wMPFlags]
	bit 0, a
	jr z, .nowavecpy
	ld a, [wListDrawState2]
	bit 7, a
	jr z, .nowavecpy
	ld a, 4
	ld [Requested2bpp], a
	ld a, wWaveformTmpGFX % $100
	ld [Requested2bppSource], a
	ld a, wWaveformTmpGFX / $100
	ld [Requested2bppSource + 1], a
	ld a, $a0
	ld [Requested2bppDest], a
	ld a, $8b
	ld [Requested2bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve2bppRequest
	xor a
	ld [rVBK], a
	ld hl, wMPFlags
	res 0, [hl]
.nowavecpy
; selector cursor copy
	ld a, [wListDrawState2]
	cp $80
	jr nz, .no1bppcpy
	call DrawSelectorNum@VBlank
	ld [wListDrawState2], a
.no1bppcpy
	ld a, [wListDrawState]
	ld hl, .states
	rst JumpTable
; all vblank copies done
	call Joypad
	ld b, 24
.wait24
	ld a, [rLY]
	cp b
	jr nz, .wait24
	ld a, [hSCY]
	ld [rSCY], a
	callba _UpdateSound
	ret

.states
	dw .init1
	dw .init2
	dw .init3
	dw .init4
	dw .init5
	dw .init6
	dw .init7
	dw .init8
	dw .blinkcursor
	dw .up
	dw .down
	dw .page
	dw .exit1
	dw .exit2
	dw .exit3
	dw .exit4
	dw .exit5
	dw .exit6
	dw .exit7
	dw .exit8
	dw .exit9
	dw .exit10
	dw .exit11
	dw .exit12

.init1
	xor a
	ld [rWY], a
	ld hl, VBGMap0 + $61
	ld c, 14
	jr .init1_2

.init2
	ld hl, VBGMap0 + $221
	ld c, 15
	jr .init1_2

.init1_2
	ld a, 1
	ld [rVBK], a
	ld de, 14
.init1_2loop
	ld a, 4
	ld [hli], a
	ld [hli], a
	xor a
	call .fill16
	add hl, de
	dec c
	jp nz, .init1_2loop
	xor a
	ld [rVBK], a
	call DelayFrame_MPCommon
	ld hl, wListDrawState
	inc [hl]
	ret

.init3
	call DelayFrame_MPCommon
	ld a, 1
	ld [rVBK], a
	ld de, VBGMap0
	ld hl, VBGMap1
	ld c, 3
	call .transscreen
	xor a
	ld [rVBK], a
	ld de, VBGMap0
	ld hl, VBGMap1
	ld c, 3
	call .transscreen
	ld hl, wListDrawState
	inc [hl]
	ret

.init4
	call DelayFrame_MPCommon
	ld hl, VBGMap0 + $61
	ld de, VBGMap0 + $221
	ld c, 5
	ld a, $80
	jp .init4loop

.init5
	call DelayFrame_MPCommon
	ld hl, VBGMap0 + $101
	ld de, VBGMap0 + $2c1
	ld c, 5
	ld a, $da
	jp .init4loop

.init6
	call DelayFrame_MPCommon
	ld hl, VBGMap0 + $1a1
	ld de, VBGMap0 + $361
	ld c, 4
	ld a, $34

.init4loop
	rept 18
	ld [hli], a
	ld [de], a
	inc de
	inc a
	endr
	push bc
	ld bc, 14
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec c
	jp nz, .init4loop
	ld hl, wListDrawState
	inc [hl]
	ret

.transscreen
	ld [hSPBuffer], sp
	ld sp, hl
	ld h, d
	ld l, e
.transscreenloop
	rept 10
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	endr
	ld de, 12
	add hl, de
	add sp, 12
	dec c
	jp nz, .transscreenloop
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

.init7
	call DelayFrame_MPCommon
	xor a
	ld hl, VTiles2 + $7f0
	call .fill16
	ld hl, VBGMap0 + $3e1
	ld a, $7f
	call .fill18
	ld a, $fc
	call .fillborder
	ld hl, wListDrawState
	inc [hl]
	ret

.init8
	call hPushOAM
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap1
	ld a, $48 ; yflip
	ld [hli], a
	ld a, $8
	call .fill18
	ld a, $68 ; xyflip
	ld [hl], a
	call .fillborder
	xor a
	ld [rVBK], a
	ld hl, VBGMap1 + $1
	ld a, $fb
	call .fill18
	ld a, $fd
	ld [VBGMap1], a
	ld [VBGMap1 + $13], a
	ld a, $88
	ld [rWY], a
	ld hl, wListDrawState
	inc [hl]
	ret

.fill20
	ld [hli], a
	ld [hli], a
.fill18
	ld [hli], a
	ld [hli], a
.fill16
	rept 16
	ld [hli], a
	endr
	ret

.fillborder
_w_ = $9860
	rept 29
	ld [_w_], a
	ld [_w_ + $13], a
_w_ = _w_ + $20
	endr
	ret

.up
	ld a, [hSCY]
	dec a
	cp $ff
	jr nz, .updown
	ld a, $6f
	jr .updown

.down
	ld a, [hSCY]
	inc a
	cp $70
	jr c, .updown
	xor a

.updown
	ld [hSCY], a
	call Serve1bppLine
	ld a, [wListDrawState2]
	inc a
	cp 8
	jr nz, .notdoneyet
	jr .done

.page
	ld a, 9
	ld [Requested1bpp], a
	ld a, [wListDrawState2]
	srl a
	jr c, .pageodd
	ld a, wMusicListGFX % $100
	ld [Requested1bppSource], a
	ld a, wMusicListGFX / $100
	ld [Requested1bppSource + 1], a
	jr .pagelddone
.pageodd
	ld a, (wMusicListGFX + $48) % $100
	ld [Requested1bppSource], a
	ld a, (wMusicListGFX + $48) / $100
	ld [Requested1bppSource + 1], a
.pagelddone
	ld a, [wLineCopyDest]
	ld [Requested1bppDest], a
	ld a, [wLineCopyDest + 1]
	ld [Requested1bppDest + 1], a
	call _Serve1bppRequest
	ld a, [wListDrawState2]
	inc a
	cp 28
	jr nz, .notdoneyet
.done
	ld a, $8
	ld [wListDrawState], a
	ld a, $ff
.notdoneyet
	ld [wListDrawState2], a
	jp .blinkcursor

.exit1
	call .mpcommon
	call hPushOAM
	ld a, [hSCY]
	ld b, a
	add a
	swap a
	add b
	add a
	add $80
	ld hl, VBGMap1 + $61
	ld de, 14
	ld c, 7

.exit1_2
	call FillInc18
	cp $7c
	jr nz, .exit1_2_
	ld a, $80
.exit1_2_
	add hl, de
	dec c
	jr nz, .exit1_2
	ld hl, wListDrawState
	inc [hl]
	ret

.exit2
	call .mpcommon
	ld a, [hSCY]
	ld b, a
	add a
	swap a
	add b
	add a
	cp $7e
	jr c, .exit2a
	add 4
.exit2a
	add $fe
	ld hl, VBGMap1 + $141
	ld de, 14
	ld c, 7
	jr .exit1_2

.exit3
	call .mpcommon
	ld a, 1
	ld [rVBK], a
	ld de, VBGMap1
	ld hl, VBGMap0
	ld c, 2
	call .transscreen
	xor a
	ld [rVBK], a
	ld de, VBGMap1
	ld hl, VBGMap0
	ld c, 2
	call .transscreen
	xor a
	ld [rWY], a
	ld [hSCY], a
	ld hl, wListDrawState
	inc [hl]
	ret

.exit4
	ld hl, VBGMap0
	ld bc, 12
	ld e, 6
	ld a, $80

.exit4_5
	call FillInc20
	add hl, bc
	add c
	dec e
	jr nz, .exit4_5
	call DelayFrame_MPCommon
	ld hl, wListDrawState
	inc [hl]
	ret

.exit5
	ld hl, VBGMap0 + $c0
	ld bc, 12
	ld e, 2
	ld a, $40
.exit5l
	call FillInc20
	add hl, bc
	add c
	dec e
	jr nz, .exit5l
	ld e, 4
	xor a
	jr .exit4_5

.exit6
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, 12
	ld e, 8
	ld a, 1

.exit6_7
	call .fill20
	add hl, bc
	dec e
	jr nz, .exit6_7
	xor a
	ld [rVBK], a
	call DelayFrame_MPCommon
	ld hl, wListDrawState
	inc [hl]
	ret

.exit7
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0 + $100
	ld bc, 12
	ld e, 4
	ld a, 9
.exit7l
	call .fill20
	add hl, bc
	dec e
	jr nz, .exit7l
	ld e, 4
	ld a, 8
	jr .exit6_7

.exit8
	ld e, 64
	ld bc, VTiles1

.exit8_9
	ld a, [rWY]
	add a
	swap a
	and $f
	ld h, a
	ld a, [rWY]
	and $7
	ld l, a
	add hl, hl
	add hl, bc
	ld bc, 14
	xor a
	rept 32
	ld [hli], a
	ld [hli], a
	add hl, bc
	endr
	xor a
	ld [rVBK], a
	call DelayFrame_MPCommon
	ld a, [rWY]
	inc a
	ld [rWY], a
	cp e
	ret c
	ld hl, wListDrawState
	inc [hl]
	ret

.exit9
	ld a, 1
	ld [rVBK], a
	ld e, 96
	ld bc, VTiles0
	jp .exit8_9

.exit10
	ld [hSPBuffer], sp
	ld sp, MPTilemap
	ld hl, VBGMap0 + $180
	ld c, 4
.exit10l
	rept 10
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	endr
	ld de, 12
	add hl, de
	dec c
	jp nz, .exit10l
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ld hl, wListDrawState
	inc [hl]
	ret

.exit11
	call DelayFrame_MPCommon
	ld a, [wInfoDrawState]
	ld hl, DrawSongInfo@VBlank
	rst JumpTable
	ld hl, rWY
	inc [hl]
	ld a, [wMPFlags]
	bit 7, a
	ret nz
	ld hl, wListDrawState
	inc [hl]
	ret

.exit12
	ld a, [rWY]
	inc a
	ld [rWY], a
	cp 120
	ret c
	cp 128
	jr nc, .exitdone
	ld a, [$fe05]
	dec a
_w_ = $fe05
	rept 8
	ld [_w_], a
_w_ = _w_ + 4
	endr
	ret

.exitdone
	ld a, $ff
	ld [wListDrawState], a
	ret

.blinkcursor
	ld b, 16
	ld a, [$fe01]
	cp 8
	ld c, 8
	ld a, $9
	jr nz, .blinkodd
	ld c, 16
	ld a, $a
.blinkodd
	ld [$fe02], a
	inc a
	ld [$fe26], a
	ld a, c
_w_ = $fe01
	rept 10
	ld [_w_], a
	add b
_w_ = _w_ + 4
	endr

.mpcommon
; ch1-2 duty
	ld a, [wC1Duty]
	add $cc
	ld [VBGMap0 + $2], a
	ld a, [wC2Duty]
	add $cc
	ld [VBGMap0 + $5], a
; ch4 noise set
	ld a, [MusicNoiseSampleSet]
	add $da
	ld [VBGMap0 + $11], a
; visual intensities
	ld a, [wC1VolTile]
	ld [VBGMap0 + $30], a
	ld a, [wC2VolTile]
	ld [VBGMap0 + $31], a
	ld a, [wC3VolTile]
	ld [VBGMap0 + $32], a
	ld a, [wC4VolTile]
	ld [VBGMap0 + $33], a
	ret
	
FillInc20:
	ld [hli], a
	inc a
	ld [hli], a
	inc a
FillInc18:
	rept 18
	ld [hli], a
	inc a
	endr
	ret

ClearRow:
	rept 4
	rept 16
	ld [hli], a
	endr
	add hl, bc
	endr
	ret

PartialClear:
	inc a
	ld d, 32
	cp d
	ret nc
	ld e, 8
.loop1
	and a
	jr z, .loop2
	inc hl
	inc hl
	dec d
	dec a
	dec e
	jr nz, .loop1
	add hl, bc
	ld e, 8
	jr .loop1
.loop2
	ld [hli], a
	ld [hli], a
	dec d
	jr z, .done
	dec e
	jr nz, .loop2
	add hl, bc
	ld e, 8
	jr .loop2
.done
	add hl, bc
	scf
	ret

Getidx:
	cp $10
	jr nc, .getidx2
	add $88
	add b
	ld h, a
	ld l, c
	ret
.getidx2
	add $80
	add b
	ld h, a
	ld l, c
	ld a, 1
	ld [rVBK], a
	ret

DrawSongInfo@VBlank:
	dw .name
	dw .name2
	dw .composer
	dw .composer2
	dw .origin
	dw .origin2
	dw .additional
	dw .additional2

.name
	ld a, 8
	ld [Requested1bpp], a
	ld a, wMusicNameGFX % $100
	ld [Requested1bppSource], a
	ld a, wMusicNameGFX / $100
	ld [Requested1bppSource + 1], a
	xor a
	ld [Requested1bppDest], a
	ld a, $89
	ld [Requested1bppDest + 1], a
	jp .done

.name2
	ld a, 7
	ld [Requested1bpp], a
	ld a, (wMusicNameGFX + 64) % $100
	ld [Requested1bppSource], a
	ld a, (wMusicNameGFX + 64) / $100
	ld [Requested1bppSource + 1], a
	ld a, $80
	ld [Requested1bppDest], a
	ld a, $89
	ld [Requested1bppDest + 1], a
	jp .done

.composer
	ld a, 8
	ld [Requested1bpp], a
	ld a, wMusicComposerGFX % $100
	ld [Requested1bppSource], a
	ld a, wMusicComposerGFX / $100
	ld [Requested1bppSource + 1], a
	xor a
	ld [Requested1bppDest], a
	ld a, $8a
	ld [Requested1bppDest + 1], a
	jp .done

.composer2
	ld a, 7
	ld [Requested1bpp], a
	ld a, (wMusicComposerGFX + 64) % $100
	ld [Requested1bppSource], a
	ld a, (wMusicComposerGFX + 64) / $100
	ld [Requested1bppSource + 1], a
	ld a, $80
	ld [Requested1bppDest], a
	ld a, $8a
	ld [Requested1bppDest + 1], a
	jp .done

.origin
	ld a, 8
	ld [Requested1bpp], a
	ld a, wMusicOriginGFX % $100
	ld [Requested1bppSource], a
	ld a, wMusicOriginGFX / $100
	ld [Requested1bppSource + 1], a
	xor a
	ld [Requested1bppDest], a
	ld a, $88
	ld [Requested1bppDest + 1], a
	jp .done

.origin2
	ld a, 7
	ld [Requested1bpp], a
	ld a, (wMusicOriginGFX + 64) % $100
	ld [Requested1bppSource], a
	ld a, (wMusicOriginGFX + 64) / $100
	ld [Requested1bppSource + 1], a
	ld a, $80
	ld [Requested1bppDest], a
	ld a, $88
	ld [Requested1bppDest + 1], a
	ld hl, wMPFlags
	bit 6, [hl]
	jr nz, .origin22
	ld hl, VBGMap0 + $1e0
	ld a, $ff
	rept 10
	ld [hli], a
	endr
	jp .done
.origin22
	ld hl, VBGMap0 + $1e0
	ld a, $d0 ; ad
	ld [hli], a
	ld a, $d1 ; di
	ld [hli], a
	ld a, $d2 ; ti
	ld [hli], a
	ld a, $d3 ; on
	ld [hli], a
	ld a, $d4 ; al
	ld [hli], a
	ld a, $d5 ;  c
	ld [hli], a
	ld a, $d6 ; re
	ld [hli], a
	ld a, $d1 ; di
	ld [hli], a
	ld a, $d7 ; ts
	ld [hli], a
	ld a, $8f ; :
	ld [hl], a
	jp .done

.additional
	ld a, 5
	ld [Requested1bpp], a
	ld a, wMusicAdditionalGFX % $100
	ld [Requested1bppSource], a
	ld a, wMusicAdditionalGFX / $100
	ld [Requested1bppSource + 1], a
	xor a
	ld [Requested1bppDest], a
	ld a, $8b
	ld [Requested1bppDest + 1], a
	jp .done

.additional2
	ld a, 5
	ld [Requested1bpp], a
	ld a, (wMusicAdditionalGFX + 40) % $100
	ld [Requested1bppSource], a
	ld a, (wMusicAdditionalGFX + 40) / $100
	ld [Requested1bppSource + 1], a
	ld a, $50
	ld [Requested1bppDest], a
	ld a, $8b
	ld [Requested1bppDest + 1], a
	ld hl, wMPFlags
	res 7, [hl]

.done
	ld a, 1
	ld [rVBK], a
	call _Serve1bppRequest
	xor a
	ld [rVBK], a
	ld a, [wInfoDrawState]
	inc a
	ld [wInfoDrawState], a
	ret

LogTable:
; ⌊log₂(1+(x/256))*256⌋
	db   0,   1,   2,   4,   5,   7,   8,   9,  11,  12,  14,  15,  16,  18,  19,  21
	db  22,  23,  25,  26,  27,  29,  30,  31,  33,  34,  35,  37,  38,  39,  40,  42
	db  43,  44,  46,  47,  48,  49,  51,  52,  53,  54,  56,  57,  58,  59,  61,  62
	db  63,  64,  65,  67,  68,  69,  70,  71,  73,  74,  75,  76,  77,  78,  80,  81
	db  82,  83,  84,  85,  87,  88,  89,  90,  91,  92,  93,  94,  96,  97,  98,  99
	db 100, 101, 102, 103, 104, 105, 106, 108, 109, 110, 111, 112, 113, 114, 115, 116
	db 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 131, 132, 133
	db 134, 135, 136, 137, 138, 139, 140, 140, 141, 142, 143, 144, 145, 146, 147, 148
	db 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 162, 163
	db 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 173, 174, 175, 176, 177, 178
	db 179, 180, 181, 181, 182, 183, 184, 185, 186, 187, 188, 188, 189, 190, 191, 192
	db 193, 194, 194, 195, 196, 197, 198, 199, 200, 200, 201, 202, 203, 204, 205, 205
	db 206, 207, 208, 209, 209, 210, 211, 212, 213, 214, 214, 215, 216, 217, 218, 218
	db 219, 220, 221, 222, 222, 223, 224, 225, 225, 226, 227, 228, 229, 229, 230, 231
	db 232, 232, 233, 234, 235, 235, 236, 237, 238, 239, 239, 240, 241, 242, 242, 243
	db 244, 245, 245, 246, 247, 247, 248, 249, 250, 250, 251, 252, 253, 253, 254, 255

LoadingText:
	db "LOADING<...>@"

; ┌─┐│└┘
MPTilemap:
	db $c4,$c5,$c6,$c7,$8f,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9a,$9b,$9c,$9d,$9e
	db $c8,$c9,$ca,$cb,$8f,$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$ab,$ac,$ad,$ae
	db $c0,$c1,$c2,$c3,$8f,$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e
	db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b0,$b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9
MPTilemapEnd

MPTilemap2:
	db $9f,$db,$ff,$9f,$dc,$ff,$9f,$dd,$ba,$bb,$bc,$bd,$ff,$9f,$de,$be,$fa,$ff,$ff,$ff
	db $e0,$e1,$e2,$e3,$e4,$cb,$e5,$dc,$e6,$e7,$af,$be,$bf,$d8,$d9,$ff,$ff,$ff,$ff,$ff
	db $fd,$fb,$fb,$fb,$fb,$fb,$fe,$e0,$e1,$e2,$d8,$d9,$fe,$fb,$fb,$fb,$fb,$fb,$fb,$fd
MPTilemap2End

MPKeymap:
	db  0,1,2,3,4,5,6,0,1,2,3,4,5,6,0,1,2,3,4,5

MPKeymapEnd

NoteOAM:
	db $a0,$88,$08,$00
	db $68,$a0,$00,$00
	db $5c,$a0,$01,$00
	db $50,$a0,$02,$00
	db $44,$a0,$03,$00
	db $38,$a0,$04,$00
	db $2c,$a0,$05,$00
	db $20,$a0,$06,$00
	db $14,$a0,$07,$00
NoteOAMEnd

SongSelectorOAM:
	db $58,$08,$09,$01
	db $58,$18,$0a,$01
	db $58,$28,$0a,$01
	db $58,$38,$0a,$01
	db $58,$48,$0a,$01
	db $58,$58,$0a,$01
	db $58,$68,$0a,$01
	db $58,$78,$0a,$01
	db $58,$88,$0a,$01
	db $58,$98,$0a,$01
SongSelectorOAMEnd

EmptyPitch: db "   @"

MusicListText:
	db $d8,$d9

info: MACRO
	dw \1
	db \2, \3, \4
ENDM

BlankName:
	db " @"
SongInfo:
	info ._01, 22, 1, 12
	info ._02, 3, 1, 0
	info ._03, 3, 1, 0
	info ._04, 3, 1, 0
	info ._05, 3, 8, 0
	info ._06, 3, 1, 0
	info ._07, 3, 1, 0
	info ._08, 3, 1, 0
	info ._09, 3, 1, 0
	info ._0a, 3, 1, 0
	info ._0b, 3, 8, 0
	info ._0c, 3, 8, 0
	info ._0d, 3, 1, 0
	info ._0e, 3, $18, 0
	info ._0f, 3, $18, 0
	info ._10, 3, 1, 0
	info ._11, 3, 1, 0
	info ._12, 3, 8, 0
	info ._13, 3, 1, 0
	info ._14, 3, 1, 0
	info ._15, 3, 1, 0
	info ._16, 3, 1, 0
	info ._17, 3, 1, 0
	info ._18, 3, 1, 0
	info ._19, 3, 1, 0
	info ._1a, 3, 1, 0
	info ._1b, 3, 1, 0
	info ._1c, 3, 1, 0
	info ._1d, 3, 1, 0
	info ._1e, 3, 1, 0
	info ._1f, 3, 1, 0
	info ._20, 3, 1, 0
	info ._21, 3, 8, 0
	info ._22, 3, 1, 0
	info ._23, 3, 8, 0
	info ._24, 3, 8, 0
	info ._25, 3, 8, 0
	info ._26, 3, 1, 0
	info ._27, 3, 8, 0
	info ._28, 3, 1, 0
	info ._29, 3, 1, 0
	info ._2a, 3, 1, 0
	info ._2b, 3, 1, 0
	info ._2c, 3, 8, 0
	info ._2d, 3, 8, 0
	info ._2e, 3, 1, 0
	info ._2f, 3, 1, 0
	info ._30, 3, 1, 0
	info ._31, 3, 1, 0
	info ._32, 3, 1, 0
	info ._33, 3, 1, 0
	info ._34, 3, 1, 0
	info ._35, 3, 1, 0
	info ._36, 3, 8, 0
	info ._37, 3, 1, 0
	info ._38, 3, 1, 0
	info ._39, 3, 8, 0
	info ._3a, 3, 8, 0
	info ._3b, 3, 8, 0
	info ._3c, 3, $18, 0
	info ._3d, 3, 1, 0
	info ._3e, 3, 1, 0
	info ._3f, 3, 1, 0
	info ._40, 3, 1, 0
	info ._41, 3, 1, 0
	info ._42, 3, 1, 0
	info ._43, 3, 1, 0
	info ._44, 3, 1, 0
	info ._45, 3, 1, 0
	info ._46, 3, 1, 0
	info ._47, 3, 1, 0
	info ._48, 3, 1, 0
	info ._49, 3, 1, 0
	info ._4a, 3, 1, 0
	info ._4b, 3, 1, 0
	info ._4c, 3, 1, 0
	info ._4d, 3, 1, 0
	info ._4e, 3, 1, 0
	info ._4f, 3, 1, 0
	info ._50, 3, 1, 0
	info ._51, 3, 1, 0
	info ._52, 22, 12, 0
	info ._53, 22, 1, 12
	info ._54, 3, 1, 0
	info ._55, 3, 1, 0
	info ._56, 3, 8, 0
	info ._57, 3, 8, 0
	info ._58, 3, 8, 0
	info ._59, 3, 1, 0
	info ._5a, 3, 1, 0
	info ._5b, 3, 1, 0
	info ._5c, 3, 8, 0
	info ._5d, 4, 9, 0
	info ._5e, 4, 9, 0
	info ._5f, 4, 9, 0
	info ._60, 4, 9, 0
	info ._61, 4, 9, 0
	info ._62, 4, 1, 0
	info ._63, 4, 9, 0
	info ._64, 4, 1, 0
	info ._65, 4, 9, 0
	info ._66, 4, 1, 0
	info ._67, 1, 1, 2
	info ._68, 7, 1, 2
	info ._69, 7, 1, 2
	info ._6a, 7, 8, 2
	info ._6b, 1, 1, 0
	info ._6c, 1, 1, 0
	info ._6d, 10, 10, 13
	info ._6e, 6, $18, 2
	info ._6f, 21, 11, 12
	info ._70, 1, 1, 0
	info ._71, 1, 1, 0
	info ._72, 1, 1, 0
	info ._73, 8, 10, 14
	info ._74, 5, 9, 14
	info ._75, 3, 1, 0
	info ._76, 1, 1, 0
	info ._77, 7, 8, 12
	info ._78, 7, 8, 12
	info ._79, 22, 12, 0

._01 db "Title Screen@"
._02 db "Route 1@"
._03 db "Route 3@"
._04 db "Route 11@"
._05 db "Magnet Train@"
._06 db "Vs. Kanto Gym Leader@"
._07 db "Vs. Kanto Trainer@"
._08 db "Vs. Kanto Wild@"
._09 db "Pokémon Center@"
._0a db "Spotted! Hiker@"
._0b db "Spotted! Girl 1@"
._0c db "Spotted! Boy 1@"
._0d db "Heal Pokémon@"
._0e db "Lavender Town@"
._0f db "Viridian Forest@"
._10 db "Kanto Cave@"
._11 db "Follow Me!@"
._12 db "Game Corner@"
._13 db "Bicycle@"
._14 db "Hall of Fame@"
._15 db "Viridian City@"
._16 db "Celadon City@"
._17 db "Victory! Trainer@"
._18 db "Victory! Wild@"
._19 db "Victory! Champion@"
._1a db "Mt. Moon@"
._1b db "Gym@"
._1c db "Pallet Town@"
._1d db "Oak's Lab@"
._1e db "Professor Oak@"
._1f db "Rival Appears@"
._20 db "Rival Departure@"
._21 db "Surfing@"
._22 db "Evolution@"
._23 db "National Park@"
._24 db "Credits@"
._25 db "Azalea Town@"
._26 db "Cherrygrove City@"
._27 db "Spotted! Kimono Girl@"
._28 db "Union Cave@"
._29 db "Vs. Johto Wild@"
._2a db "Vs. Johto Trainer@"
._2b db "Route 30@"
._2c db "Ecruteak City@"
._2d db "Violet City@"
._2e db "Vs. Johto Gym Leader@"
._2f db "Vs. Champion@"
._30 db "Vs. Rival@"
._31 db "Vs. Rocket Grunt@"
._32 db "Elm's Lab@"
._33 db "Dark Cave@"
._34 db "Route 29@"
._35 db "Route 34@"
._36 db "S.S. Aqua@"
._37 db "Spotted! Boy 2@"
._38 db "Spotted! Girl 2@"
._39 db "Spotted! Team Rocket@"
._3a db "Spotted! Suspicious@"
._3b db "Spotted! Sage@"
._3c db "New Bark Town@"
._3d db "Goldenrod City@"
._3e db "Vermilion City@"
._3f db "Pokémon Channel@"
._40 db "PokéFlute@"
._41 db "Tin Tower@"
._42 db "Sprout Tower@"
._43 db "Burned Tower@"
._44 db "Olivine Lighthouse@"
._45 db "Route 42@"
._46 db "Indigo Plateau@"
._47 db "Route 38@"
._48 db "Rocket Hideout@"
._49 db "Dragon's Den@"
._4a db "Vs. Johto Wild Night@"
._4b db "Unown Radio@"
._4c db "Captured Pokémon@"
._4d db "Route 26@"
._4e db "Mom@"
._4f db "Victory Road@"
._50 db "Pokémon Lullaby@"
._51 db "Pokémon March@"
._52 db "Opening 1@"
._53 db "Opening 2@"
._54 db "Load Game@"
._55 db "Ruins of Alph Inside@"
._56 db "Team Rocket@"
._57 db "Dancing Hall@"
._58 db "Bug Contest Ranking@"
._59 db "Bug Contest@"
._5a db "Rocket Radio@"
._5b db "GameBoy Printer@"
._5c db "Post Credits@"
._5d db "Clair@"
._5e db "Mobile Adapter Menu@"
._5f db "Mobile Adapter@"
._60 db "Buena's Password@"
._61 db "Eusine@"
._62 db "Opening@"
._63 db "Battle Tower@"
._64 db "Vs. Suicune@"
._65 db "Battle Tower Lobby@"
._66 db "Mobile Center@"
._67 db "Cerulean City@"
._68 db "Cinnabar Island@"
._69 db "Route 24@"
._6a db "Shop@"
._6b db "Team Rocket Hideout@"
._6c db "Silph Company@"
._6d db "Mewtwo Battle@"
._6e db "Game Corner@"
._6f db "Rise of the Leech King@"
._70 db "Rival's Theme@"
._71 db "Rival's Theme (Cut)@"
._72 db "Trainer Battle@"
._73 db "Pokémon WCS Final Battle@"
._74 db "Oceanic Museum@"
._75 db "Pallet Town (Slow)@"
._76 db "Champion Battle@"
._77 db "Ho-Oh Battle@"
._78 db "Lugia Battle@"
._79 db "251 (Short Version)@"

Origin:
	dbw 01, ._00
	dbw 02, ._01
	dbw 03, ._02
	dbw 04, ._03
	dbw 05, ._04
	dbw 06, ._05
	dbw 07, ._06
	dbw 08, ._07
	dbw 09, ._08
	dbw 10, ._09
	dbw 11, ._10
	dbw 12, ._11
	dbw 13, ._12
	dbw 14, ._13
	dbw 20, ._14
	dbw 21, ._15
	dbw 22, ._16
	db -1

._00 db "Pokémon Red & Blue@"
._01 db "Pokémon Yellow@"
._02 db "Pokémon Gold & Silver@"
._03 db "Pokémon Crystal@"
._04 db "Pokémon Ruby & Sapphire@"
._05 db "Pokémon Diamond & Pearl@"
._06 db "Pokémon HeartGold & SoulSilver@"
._07 db "Pokémon Black & White@"
._08 db "Pokémon Black 2 & White 2@"
._09 db "Pokémon X & Y@"
._10 db "Pokémon Prism@"
._11 db "Pokémon TCG@"
._12 db "Pokémon TCG 2@"
._13 db "Pokémon Pinball@"
._14 db "Tales of TPP Deluxe@"
._15 db "Dream Red@"
._16 db "Pokémon Anniversary Crystal@"

Artist:
	dbw $01, ._00
	dbw $02, ._01
	dbw $03, ._02
	dbw $04, ._03
	dbw $05, ._04
	dbw $06, ._05
	dbw $07, ._06
	dbw $08, ._07
	dbw $09, ._08
	dbw $0a, ._09
	dbw $0b, ._10
	dbw $0c, ._11
	dbw $0d, ._12
	dbw $0e, ._13
	dbw $18, ._14
	db -1

._00 db "Junichi Masuda@"
._01 db "FroggestSpirit@"
._02 db "LevusBevus@"
._03 db "GRonnoc@"
._04 db "Cat333Pokémon@"
._05 db "Ichiro Shimakura@"
._06 db "Danny-E 33@"
._07 db "Go Ichinose@"
._08 db "Morikazu Aoki@"
._09 db "Shota Kageyama@"
._10 db "Church of the Helix Choir@"
._11 db "Pigu@"
._12 db "GACT, Pigu@"
._13 db "Pigu, PikalaxALT@"
._14 db "Junichi Masuda, Go Ichinose@"
