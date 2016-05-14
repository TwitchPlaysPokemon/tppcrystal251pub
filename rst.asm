; rst vectors

SECTION "rst0",ROM0[0]
	di
	jp BetBoy

SECTION "rst8",ROM0[FarCall]
	jp FarCall_hl

SECTION "rst10",ROM0[Bankswitch]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
IF DEF(BEESAFREE)
SECTION "luaserial",ROM0[LUASerial]
	jp _LUASerial
ELSE
SECTION "rst18",ROM0[$18]
	di
	jp BetBoy
ENDC

SECTION "rst20",ROM0[$20]
	di
	jp BetBoy

SECTION "rst28",ROM0[JumpTable]
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp [hl]

; SECTION "rst30",ROM0[$30]
; rst30 is midst rst28

SECTION "rst38",ROM0[$38]
	di
	jp BetBoy

