Predef:: ; 2d83
; Call predefined function a.
; Preserves bc, de, hl and f.

	ld [PredefID], a ;load predef bank into var
	ld a, [hROMBank]
	push af ;save current bank on the stack

	ld a, BANK(GetPredefPointer)
	rst Bankswitch
	call GetPredefPointer ; a is the bank of predefId and PredefAddress is the location. current hl is in predeftemp

; Switch to the new function's bank
	rst Bankswitch

; Instead of directly calling stuff,
; push it to the stack in reverse.

	ld hl, .Return ;push return onto the stack
	push hl

; Call the Predef function
	ld a, [PredefAddress]
	ld h, a
	ld a, [PredefAddress + 1]
	ld l, a
	push hl

; Get hl back
	ld a, [PredefTemp]
	ld h, a
	ld a, [PredefTemp + 1]
	ld l, a
	ret ;call predef address, with return as the return point

.Return
; Clean up after the Predef call

	ld a, h
	ld [PredefTemp], a
	ld a, l
	ld [PredefTemp + 1], a

	pop hl
	ld a, h
	rst Bankswitch

	ld a, [PredefTemp]
	ld h, a
	ld a, [PredefTemp + 1]
	ld l, a
	ret
; 2dba

