; More overworld event handling.


Function97c28:: ; 97c28
	ld hl, StatusFlags2
	res 1, [hl]
	res 2, [hl]
	ret
; 97c30

Function97c30:: ; 97c30
	ld a, [wd45c]
	and a
	ret z
	ld hl, wd45c + 2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd45c + 1]
	call CallScript
	scf
	push af
	xor a
	ld hl, wd45c
	ld bc, 8
	call ByteFill
	pop af
	ret
; 97c4f

Function97c4f:: ; 97c4f
	ld hl, wd45c
	ld a, [hl]
	and a
	ret nz
	ld [hl], 1
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret
; 97c5f

Function97c5f:: ; 97c5f
	call GetFacingTileCoord
	ld [EngineBuffer1], a
	ld c, a
	callba Function1365b
	jr c, .asm_97cb9

	call CheckCutTreeTile
	jr nz, .whirlpool
	callba TryCutOW
	jr .asm_97cb9

.whirlpool
	ld a, [EngineBuffer1]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	callba TryWhirlpoolOW
	jr .asm_97cb9

.waterfall
	ld a, [EngineBuffer1]
	call CheckWaterfallTile
	jr nz, .headbutt
	callba TryWaterfallOW
	jr .asm_97cb9

.headbutt
	ld a, [EngineBuffer1]
	call CheckHeadbuttTreeTile
	jr nz, .surf
	callba TryHeadbuttOW
	jr c, .asm_97cb9
	jr .asm_97cb7

.surf
	callba TrySurfOW
	jr nc, .asm_97cb7
	jr .asm_97cb9

.asm_97cb7
	xor a
	ret

.asm_97cb9
	call PlayClickSFX
	ld a, $ff
	scf
	ret
; 97cc0


Function97cc0:: ; 97cc0
; handles alot of encounters

	call Function968c7 ;if wd452 = 1 or 0, ret
	jr c, .asm_97ce2
	call Function97cfd ; if encounters are on(?) , is on encounter enabled tile (or wMapHeaderPermission is 4 or 7) and is not on ice tile: continue, else jump out
	jr nc, .asm_97ce2
	ld hl, StatusFlags2
	bit 2, [hl] ;if bug catching contest is on(?) branch out
	jr nz, .asm_97cdb
	callba Function2a0e7 ;check for standard encounter, if not jump out
	jr nz, .asm_97ce2
	jr .asm_97ce6

.asm_97cdb
	call Function97d23 ; if encounter then carry, otherwise nc
	jr nc, .asm_97ce2 ;if no encounter,a = 1 and return
	jr .asm_97ced

.asm_97ce2
	ld a, 1
	and a
	ret

.asm_97ce6
	ld a, BANK(RockSmashBattleScript)
	ld hl, RockSmashBattleScript
	jr .asm_97cf4

.asm_97ced
	ld a, BANK(UnknownScript_0x135eb)
	ld hl, UnknownScript_0x135eb
	jr .asm_97cf4

.asm_97cf4
	call CallScript
	scf
	ret
; 97cf9

RockSmashBattleScript: ; 97cf9
	battlecheck
	startbattle
	returnafterbattle
	end
; 97cfd

Function97cfd:: ; 97cfd if encounters are on(?) , is on encounter enabled tile (or wMapHeaderPermission is 4 or 7) and is not on ice tile: scf. else and a
	ld a, [wMapHeaderPermission] ;load ???
	cp CAVE
	jr z, .asm_97d17
	cp DUNGEON
	jr z, .asm_97d17 ;if 4 or 7 skip ahead
	callba Function149dd ;if tile is in encounter enabaled tile(?) keep going, else jump out
	jr nc, .asm_97d21

.asm_97d17
	ld a, [StandingTile]
	call CheckIceTile ;if not $23 or $2b, scf
	jr z, .asm_97d21
	scf
	ret

.asm_97d21
	and a
	ret
; 97d23

Function97d23: ; 97d23 ;choose bug catching mons
	call Function97d64 ;return with a = 1 if no encounter, otherwise set encounter set e to 0 if super tall grass
	ret nc
	call Function97d31 ; choose mon and level to spawn
	callba Function2a1df ;if repel if off then set carry
	ret
; 97d31

Function97d31:: ; 97d31
; Pick a random mon out of ContestMons.

.asm_97d31
	call Random
	cp 200 ;
	jr nc, .asm_97d31 ;loop until < 200
	srl a ; divide by 2
	ld d, a
	ld a, e ;0 if super tall grass
	cp $14
	ld hl, ContestMonsTall
	jr z, .supertall
	ld hl, ContestMons
.supertall
	ld a, d
	ld de, 4 ;size of mons
.CheckMon
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon
	inc hl

; Species
	ld a, [hli]
	ld [wd22e], a  ;load species into a var, max variance into a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel ;if variance is not zero, choose level at random, otherwise just put it in curparty level

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ld a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel
	ld [CurPartyLevel], a

	xor a
	ret
; 97d64

Function97d64: ; 97d64
	ld a, [StandingTile]
	call CheckSuperTallGrassTile ;if standing tile is $14 then ret zero, otherwise cp $1c
	ld e, a
	push de
	ld b, $66
	jr z, .asm_97d70 ;if exactly $14 or $1c then b = $66, otherwise b = $33. b = encounter rate out of 255
	ld b, $33

.asm_97d70
	callba Function2a124 ;adjust for music and clense tag
	callba Function2a138
	pop de ;de = if tile is super tall grass
	call Random
	ld a, [hRandomAdd] ;why add instead of default sub?
	cp b
	ret c ;return random if encounter > random
	ld a, 1
	and a ;otherwise return 1
	ret
; 97d87


ContestMons: ; 97d87
	;   %, species,   min, max
	db 15, LEDYBA,      23, 27
	db 11, CATERPIE,    23, 27
	db 11, WEEDLE,      23, 27
	db 10, SCYTHER,    25, 29
	db 10, HERACROSS,   25, 29
	db 9, LEDIAN,    25, 29
	db 8, YANMA,      24, 28
	db 6, BEEDRILL,      25, 29
	db 6, BUTTERFREE, 25, 29
	db 5, VENOMOTH,   25, 29
	db 3, SCIZOR,    26, 30
	db 3, METAPOD,     24, 28
	db 3, KAKUNA,      24, 28
	db -1, VENOMOTH,   90, 100

ContestMonsTall: ; 97d87
	;   %, species,   min, max
	db 15, CATERPIE,    23, 27
	db 15, WEEDLE,      23, 27
	db 10, SPINARAK,	 23, 27
	db 10, PINSIR,		25, 29
	db 10, HERACROSS,    25, 29
	db 7, METAPOD,     24, 28
	db 7, KAKUNA,      24, 28
	db 8, VENONAT,    23, 27
	db 8, PARAS,      23, 27
	db 5, PARASECT,    25, 29
	db 5, ARIADOS,   25, 29
	db -1, VENOMOTH,   90, 100
; 97db3

Function97db3:: ; 97db3
	nop
	nop
	; fallthrough
; 97db5

Function97db5: ; 97db5
	ld hl, StatusFlags2
	bit 4, [hl]
	jr z, .asm_97df7
	ld a, [PlayerState]
	cp $1
	jr nz, .asm_97df7
	call Function2d05
	and a
	jr nz, .asm_97df7
	ld hl, wRepelStepCounter + 1
	ld a, [hli]
	ld d, a
	ld e, [hl]
	cp $ff
	jr nz, .asm_97dd8
	ld a, e
	cp $ff
	jr z, .asm_97ddc

.asm_97dd8
	inc de
	ld [hl], e
	dec hl
	ld [hl], d

.asm_97ddc
	ld a, d
	cp $4
	jr c, .asm_97df7
	ld a, [wdc31]
	and a
	jr nz, .asm_97df7
	ld a, $6
	ld [wdc31], a
	xor a
	ld [wdc31 + 1], a
	ld hl, StatusFlags2
	res 4, [hl]
	scf
	ret

.asm_97df7
	xor a
	ret
; 97df9

Function97df9:: ; 97df9 clear top 4 of command queue
	ld hl, wd6de
	ld de, $0006
	ld c, $4
	xor a
.asm_97e02
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_97e02
	ret
; 97e08

Function97e08:: ; 97e08 ;run pitfall check or set wd173 or do stuff with SCY based on bc based on command queue
	ld hl, wd6de
	xor a
.asm_97e0c
	ld [hConnectionStripLength], a ;load loop counter
	ld a, [hl] ;if command queue = 0, skip
	and a
	jr z, .asm_97e19
	push hl
	ld b, h
	ld c, l
	call Function97e79 ;run pitfall check or set wd173 or do stuff with SCY based on bc
	pop hl

.asm_97e19
	ld de, $0006 ;go to next command
	add hl, de
	ld a, [hConnectionStripLength]
	inc a
	cp $4 ;loop 4 times
	jr nz, .asm_97e0c
	ret
; 97e25

Function97e25: ; 97e25
	ld hl, wd6de
	ld bc, 6
	call AddNTimes
	ld b, h
	ld c, l
	ret
; 97e31

Function97e31:: ; 97e31
	push bc
	push de
	call Function97e45
	ld d, h
	ld e, l
	pop hl
	pop bc
	ret c
	ld a, b
	ld bc, $0005
	call FarCopyBytes
	xor a
	ld [hl], a
	ret
; 97e45

Function97e45: ; 97e45
	ld hl, wd6de
	ld de, $0006
	ld c, $4
.asm_97e4d
	ld a, [hl]
	and a
	jr z, .asm_97e57
	add hl, de
	dec c
	jr nz, .asm_97e4d
	scf
	ret

.asm_97e57
	ld a, $4
	sub c
	and a
	ret
; 97e5c

Function97e5c:: ; 97e5c
	ld hl, wd6de
	ld de, $0006
	ld c, $4
.asm_97e64
	ld a, [hl]
	cp b
	jr z, .asm_97e6e
	add hl, de
	dec c
	jr nz, .asm_97e64
	and a
	ret

.asm_97e6e
	xor a
	ld [hl], a
	scf
	ret
; 97e72

Function97e72: ; 97e72
	ld hl, $0000
	add hl, bc
	ld [hl], 0
	ret
; 97e79

Function97e79: ; 97e79 run pitfall check or set wd173 or do stuff with SCY based on bc
	ld hl, $0000
	add hl, bc ;bc = wd6de
	ld a, [hl] ;load byte bc
	cp 5
	jr c, .asm_97e83 ;if >= 5, a = 0
	xor a

.asm_97e83
	ld e, a
	ld d, 0
	ld hl, Table97e94 ;go down to function and call it
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	ret
; 97e94

Table97e94: ; 97e94
	dbw BANK(Function97eb7), Function97eb7 ;ret
	dbw BANK(Function97eb8), Function97eb8 ;ret
	dbw BANK(Function97f42), Function97f42 ;check if any object_struct is on a pitfall, and if they are run script?
	dbw BANK(Function97ef9), Function97ef9 ;set wd173 based on spitedirection and bc+5
	dbw BANK(Function97ebc), Function97ebc ;if bc+5 = 1, load scy into bc+4, inc bc+5 and set SCY depending on [bc+1]-1 and [bc+2], and dec [bc+1],else just set SCY depending on [bc+1]-1 and [bc+2]
; 97ea3

Function97ea3: ; 97ea3 ;run a function [bc+5] lines below this one
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret
; 97eab

Function97eab: ; 97eab
	ld hl, $0005
	add hl, bc
	inc [hl]
	ret
; 97eb1

Function97eb1: ; 97eb1 ;dec bc+5
	ld hl, $0005
	add hl, bc
	dec [hl]
	ret
; 97eb7

Function97eb7: ; 97eb7
	ret
; 97eb8

Function97eb8: ; 97eb8
	call Function2f3e ;ret
	ret
; 97ebc

Function97ebc: ; 97ebc
	call Function97ea3 ;run a function [bc+5] lines below this one
	dw Function97ec3 ;load scy into bc+4, inc bc+5 and run Function97ecd
	dw Function97ecd ;set SCY depending on [bc+1]-1 and [bc+2], and dec [bc+1]
; 97ec3

Function97ec3: ; 97ec3
	ld a, [hSCY] ;load scy into bc+4
	ld hl, $0004
	add hl, bc
	ld [hl], a
	call Function97eab ;inc bc+5
; 97ecd

Function97ecd: ; 97ecd set SCY depending on [bc+1]-1 and [bc+2], and dec [bc+1]
	ld hl, $0001
	add hl, bc
	ld a, [hl] ;dec bc+1
	dec a
	ld [hl], a
	jr z, .asm_97eee ;if now 0, ;load bc+4 into SCY and bc = 0
	and $1
	jr z, .asm_97ee4 ; if bit 1 set, continue, else SCY += [bc+3]
	ld hl, $0002
	add hl, bc ; SCY -= [bc+2]
	ld a, [hSCY]
	sub [hl]
	ld [hSCY], a
	ret

.asm_97ee4
	ld hl, $0002
	add hl, bc
	ld a, [hSCY] ;SCY += [bc+2]
	add [hl]
	ld [hSCY], a
	ret

.asm_97eee
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	ld [hSCY], a
	call Function97e72 ;bc = 0
	ret
; 97ef9

Function97ef9: ; 97ef9 set wd173 based on spitedirection and bc+5
	call Function97ea3 ;run a function [bc+5] lines below this one
	dw Function97f02 ;if spritedirection is 0 load 127 into wd173 and 0 into bc+5 else, inc bc+5 and run Function97f0a
	dw Function97f0a ;if spritedirection is 0 load 127 into wd173 and 0 into bc+5 else, inc bc+5 and load bc+2 into wd173
	dw Function97f1b ;if spritedirection is 0 load 127 into wd173 and 0 into bc+5 else, dec bc+5 and wd173 = bc +3
; 97f02

Function97f02: ; 97f02
	call Function97f38 ;a = spritedirection
	jr z, Function97f2c ;if 0, load 127 into wd173 and 0 into bc+5
	call Function97eab  ;else, inc bc+5
; 97f0a fall through

Function97f0a: ; 97f0a
	call Function97f38 ;a = spritedirection
	jr z, Function97f2c ;if 0, load 127 into wd173 and 0 into bc+5
	call Function97eab ;else, inc bc+5

	ld hl, $0002
	add hl, bc
	ld a, [hl]
	ld [wd173], a ;load bc +2 into ??
	ret
; 97f1b

Function97f1b: ; 97f1b
	call Function97f38 ;a = spritedirection
	jr z, Function97f2c ;if 0, load 127 into wd173 and 0 into bc+5
	call Function97eb1 ;else dec bc+5 and wd173 = bc +3

	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld [wd173], a
	ret
; 97f2c

Function97f2c: ; 97f2c
	ld a, $7f
	ld [wd173], a ;load 127 into ??
	ld hl, $0005 ;load 0 into a flag
	add hl, bc
	ld [hl], 0
	ret
; 97f38

Function97f38: ; 97f38 ;a = spritedirection
	push bc
	ld bc, PlayerStruct
	call GetSpriteDirection
	and a
	pop bc
	ret
; 97f42

Function97f42: ; 97f42 check if any object_struct is on a pitfall, and if they are run script?
	ld de, PlayerStruct
	ld a, $d ;loop 13 times
.asm_97f47
	push af

	ld hl, $0000
	add hl, de
	ld a, [hl] ;if = 0, skip
	and a
	jr z, .asm_97f71

	ld hl, $0003
	add hl, de
	ld a, [hl] ;if movement type != 25, skip
	cp $19
	jr nz, .asm_97f71

	ld hl, $000e
	add hl, de
	ld a, [hl] ;if current tile is not $60 or $67, skip
	call CheckPitTile
	jr nz, .asm_97f71

	ld hl, $0007
	add hl, de
	ld a, [hl] ;if walking = ff, skip
	cp $ff
	jr nz, .asm_97f71
	call Function3567 ;if a matching warp is found, run that warps script from command queue?
	jr c, .asm_97f7c ;if sucsess, ret

.asm_97f71
	ld hl, $0028 ;if faild, try next struct
	add hl, de
	ld d, h
	ld e, l

	pop af
	dec a
	jr nz, .asm_97f47
	ret

.asm_97f7c
	pop af
	ret
; 97f7e

