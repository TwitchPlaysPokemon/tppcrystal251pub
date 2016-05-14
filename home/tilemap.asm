Function1c30:: ; 0x1c30
	call Function1c53 ;put size of loaded menu in bc
	inc b
	inc c
.asm_1c35
	push bc
	push hl
.asm_1c37
	ld a, [de] ;load de into hl in reverse order, up to the y dimension of the loaded menu
	ld [hli], a
	dec de
	dec c
	jr nz, .asm_1c37 ; 0x1c3b $fa
	pop hl ;move down 20 for each menu x axis
	ld bc, $0014
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1c35 ; 0x1c44 $ef
	ret

Function1c47:: ; 0x1c47 put 16 bytes in and before(and including) hl into cur menu in reverse order
	ld b, $10
	ld de, wcf81
.asm_1c4c
	ld a, [hld]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_1c4c ; 0x1c50 $fa
	ret

Function1c53:: ; 0x1c53  get size of loaded menu, put in bc
	ld a, [wcf82]
	ld b, a
	ld a, [wcf84]
	sub b
	ld b, a
	ld a, [wcf83]
	ld c, a
	ld a, [wcf85]
	sub c
	ld c, a
	ret
; 0x1c66

Function1c66:: ; 1c66 ;copy auxillery data from vtiles to curmenu
	push hl
	push de
	push bc
	push af
	ld hl, wcf86 ;hl = vtiles location for curmenu
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcf91 ;copy auxillery data from vtiles to curmenu
	ld bc, $0010
	call CopyBytes
	pop af
	pop bc
	pop de
	pop hl
	ret
; 1c7e

Function1c7e:: ; 1c7e
	ld hl, wcf71
	ld a, [hli] ;load contents of ((the contents of wcf71) +1) into hl
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 1c89

Function1c89:: ; 1c89
	call Function1c66 ;copy auxillery data from vtiles to curmenu
	ld hl, wcf86
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function1cc6
	call GetTileCoord
	inc de
	ld a, [de]
	inc de
	ld b, a
.asm_1c9c
	push bc
	call PlaceString
	inc de
	ld bc, $0028
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1c9c
	ld a, [wcf91]
	bit 4, a
	ret z
	call Function1cfd
	ld a, [de]
	ld c, a
	inc de
	ld b, $0
	add hl, bc
	jp PlaceString
; 1cbb

Function1cbb:: ; 1cbb ;put a textbox in curmenu area
	call Function1cfd ;hl = curmenu's start location in tilemap
	call Function1c53 ;get size of loaded menu, put in bc
	dec b
	dec c
	jp TextBox ;make a text box of that size
; 1cc6

Function1cc6:: ; 1cc6
	ld a, [wcf82]
	ld b, a
	inc b
	ld a, [wcf83]
	ld c, a
	inc c
	ld a, [wcf91]
	bit 6, a
	jr nz, .asm_1cd8
	inc b

.asm_1cd8
	ld a, [wcf91]
	bit 7, a
	jr z, .asm_1ce0
	inc c

.asm_1ce0
	ret
; 1ce1

Function1ce1:: ; 1ce1
	call Function1cfd
	ld bc, $0015
	add hl, bc
	call Function1c53
	dec b
	dec c
	call ClearBox
	ret
; 1cf1

Function1cf1:: ; 1cf1
	call Function1cfd
	call Function1c53
	inc c
	inc b
	call ClearBox
	ret
; 1cfd


Function1cfd:: ; 1cfd ;hl = menu's start location in tilemap
	ld a, [wcf83]
	ld c, a
	ld a, [wcf82]
	ld b, a
; 1d05


GetTileCoord:: ; 1d05
; Return the address of TileMap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l ;go to right row (b * screenwidth(20))
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl
	ld c, a
	xor a
	ld b, a
	add hl, bc ; add original c to get right colomn
	ld bc, TileMap
	add hl, bc ;add on tilemap's base location
	ret
; 1d19

Function1d19:: ; 1d19 ;Return the address of AttrMap(loaded menu start location) in hl.
	ld a, [wcf83]
	ld c, a
	ld a, [wcf82]
	ld b, a

GetAttrCoord:: ; 1d21
; Return the address of AttrMap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h ;b and h = 0, c and l = b, a = c. (hl and bc = 0b)
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl ;(hl = 0b * 20(screen width in tiles)
	ld c, a
	xor a
	ld b, a
	add hl, bc ;add original c
	ld bc, AttrMap
	add hl, bc ;go to that slot in attrimap
	ret
; 1d35

