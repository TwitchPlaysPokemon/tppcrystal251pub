FossilMenu:
	call CompileOwnedFossils
	call SortFossils
	jr z, .no_fossils
	push bc
	ld hl, .WhatllItBe
	call PrintText
	ld hl, .MenuDataHeader_OneFossil
	pop af
	dec a
	ld bc, .MenuDataHeader_TwoFossil - .MenuDataHeader_OneFossil
	call AddNTimes
	call LoadMenuDataHeader
	xor a
	ld [wcf76], a
	inc a
	ld [wcf88], a
	call Function1e5d
	ld a, [MenuSelection]
	jr c, .refused
	inc a
	cp 4
	jr nz, .okay
.refused
	ld a, 0
.okay
	ld [ScriptVar], a
	call Function1c07
	ret

.no_fossils
	ld a, 0
	ld [ScriptVar], a
	ret

.WhatllItBe
	text "Oh? You have a"
	line "FOSSIL? Great!"

	para "Leave it with me,"
	line "and I'll revive it"

	para "from the genetic"
	line "material within!"
	done

.MenuDataHeader_OneFossil
	db $40
	db 00, 00
	db 09, 15
	dw .MenuData2
	db 1

.MenuDataHeader_TwoFossil
	db $40
	db 00, 00
	db 09, 17
	dw .MenuData2
	db 1

.MenuDataHeader_ThreeFossil
	db $40
	db 00, 00
	db 09, 19
	dw .MenuData2
	db 1

.MenuData2
	db $80
	db 0
	dw EngineBuffer1
	dw Function1f79
	dw .strings
.strings
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

IsAFossil:
	; Checks to see whether item (a) is a fossil.  Sets carry and returns the index in the fossil list in b: 0 = Helix, 1 = Dome, 2 = Amber.  If not found, clears carry.
	ld de, 1
	ld hl, .Fossils
	call IsInArray
	ret

.Fossils
	db HELIX_FOSSIL, DOME_FOSSIL, OLD_AMBER, $ff

CompileOwnedFossils:
	ld de, wd000
	push de
	ld a, $ff
	ld b, 4
.loop0
	ld [de], a
	inc de
	dec b
	jr nz, .loop0
	pop de
	ld hl, KeyItems
.loop1
	ld a, [hli]
	cp $ff
	ret z
	push hl
	push de
	call IsAFossil
	pop de
	pop hl
	jr nc, .loop1
	ld a, b
	ld [de], a
	inc de
	jr .loop1

SortFossils:
	ld hl, wd000
	ld de, wd03f
	ld b, 1
	xor a
	call .check_fossil
	inc a
	call .check_fossil
	inc a
	call .check_fossil
	inc a
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	ld hl, EngineBuffer1
	ld [hl], b
	dec b
	ret

.check_fossil
	push af
	push hl
	push de
	push bc
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nope
	pop af
	ld [de], a
	inc de
	inc b
	ret
.nope
	pop af
	ret
