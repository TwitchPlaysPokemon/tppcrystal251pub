Function1b1e:: ; 1b1e
	ld [wd003], a
	xor a
	ld [wd002], a
	ld a, $0
	ld [wd004], a
	ld a, MovementBuffer % $100
	ld [wd005], a
	ld a, MovementBuffer / $100
	ld [wd006], a
	ret
; 1b35

Function1b35:: ; 1b35
	ld a, [wd002]
	and a
	ret z
	dec a
	ld [wd002], a
	ret
; 1b3f

Function1b3f:: ; 1b3f load a into movementbuffer + default flypoint+1
	push hl
	push de
	ld hl, wd002
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, MovementBuffer
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret
; 1b50

Function1b50:: ; 1b50
	push af
	ld a, c
	and a
	jr nz, .asm_1b57
	pop af
	ret

.asm_1b57
	pop af
.asm_1b58
	call Function1b3f
	dec c
	jr nz, .asm_1b58
	ret
; 1b5f

Function1b5f:: ; 1b5f
	push af
	ld a, b
	sub d
	ld h, $2
	jr nc, .asm_1b6a
	dec a
	cpl
	ld h, $3

.asm_1b6a
	ld d, a
	ld a, c
	sub e
	ld l, $1
	jr nc, .asm_1b75
	dec a
	cpl
	ld l, $0

.asm_1b75
	ld e, a
	cp d
	jr nc, .asm_1b7f
	ld a, h
	ld h, l
	ld l, a
	ld a, d
	ld d, e
	ld e, a

.asm_1b7f
	pop af
	ld b, a
	ld a, h
	call Function1b92
	ld c, d
	call Function1b50
	ld a, l
	call Function1b92
	ld c, e
	call Function1b50
	ret
; 1b92

Function1b92:: ; 1b92
	push de
	push hl
	ld l, b
	ld h, 0
	add hl, hl
	add hl, hl
	ld e, a
	ld d, 0
	add hl, de
	ld de, .data_1ba5
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	ret
; 1ba5

.data_1ba5
	db 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
; 1bb1

Function1bb1:: ; 1bb1 load some menu data from de into current and reset cursor data
	push hl
	push bc
	ld hl, wcfa1 ;start of x coord +1
	ld b, $8
.asm_1bb8
	ld a, [de]
	inc de
	ld [hli], a ;load de data into start coords, max cursor positions, ???, ???, space between options and acceptable buttons
	dec b
	jr nz, .asm_1bb8 ;loop 8 times
	ld a, $1 ;load 1 into each cursor position, then 0 into cursor data
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	pop bc
	pop hl
	ret
; 1bc9

Function1bc9:: ; 1bc9
	callab Function241a8 ;place and update cursor, loop until allowed input is pressed
	call Function1bdd ;update joylast
	ret
; 1bd3

Function1bd3:: ; 1bd3
	callab Function241ab
	call Function1bdd
	ret
; 1bdd

Function1bdd:: ; 1bdd a = back nyble of JoyLast and front nyble of joy pressed
	push bc
	push af
	ld a, [$ffa9]
	and $f0 ;use back nyble of JoyLast
	ld b, a
	ld a, [hJoyPressed]
	and $f ;and front nyble of joy pressed
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ret
; 1bee

Function1bee:: ; 1bee load white cursor into cursor location
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], $ec
	ret
; 1bf7

Function1bf7:: ; 1bf7
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], $7f
	ret
; 1c00

Function1c00:: ; 1c00
	callab Function24374 ;load current tile backup onto backup stack
	ret
; 1c07

Function1c07:: ; 0x1c07
	push af
	callab Function243e8  ;unload top menu on the stack, replacing the menu with what's behind it
	pop af
	ret

Function1c10:: ; 0x1c10
	callab Function2446d ;fill rest of menu data?
	ret

Function1c17:: ; 0x1c17
	push af
	call Function1c07 ;unload top menu on menu stack
	call Function321c ;something to do with backgrounds
	call Function1ad2
	pop af
	ret

Function1c23:: ; 0x1c23 fill tilemap and attrimap with menu data from de using loaded menu data's coords
	call Function1cfd ;hl = curmenu start location in tilemap
	call Function1c30 ;fill attrimap with (de in reverse order) equal to the size of menu coords
	call Function1d19 ;hl = menu start location in attrimap
	call Function1c30 ;fill attrimap with (de in reverse order, continueing from end of previous) equal to the size of menu coords
	ret
; 0x1c30

