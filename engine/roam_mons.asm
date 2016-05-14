CheckPartyLevels:
; finds the max of the party levels and rounds up to the next 10, returning the result in a

	ld a, 0
	ld b, PARTY_LENGTH
	ld hl, PartyMon1Level
	ld de, PartyMon2 - PartyMon1
.loop
	dec b
	jr z, .done
	ld c, [hl]
	cp c
	jr nc, .next
	ld a, c
.next
	add hl, de
	jr .loop

.done
	ld c, 10
	call SimpleDivide
	ld a, b
	cp 10
	jr z, .dontinc
	inc a
.dontinc
	ld c, 10
	call SimpleMultiply
	ret

DailyRoamMonUpdate:
    call GetWeekday
	cp MONDAY
	jr z, .Entei
	cp TUESDAY
	jr z, .Suicune
	cp WEDNESDAY
	jr z, .Raikou
	cp THURSDAY
	jr z, .Entei
	cp FRIDAY
	jr z, .Suicune
	cp SATURDAY
	jr z, .Raikou
	ld a, [wRoamMon1Species]
	call PutRoamMonInRoom
	ld a, [wRoamMon2Species]
	call PutRoamMonInRoom
	ld a, [wRoamMon3Species]
	call PutRoamMonInRoom
	ret

.Raikou
	ld a, [wRoamMon1Species]
	call PutRoamMonInRoom
	ld a, [wRoamMon2Species]
	call RestartRoamMonAsRoaming
	ld a, [wRoamMon3Species]
	call RestartRoamMonAsRoaming
	ret

.Entei
	ld a, [wRoamMon1Species]
	call RestartRoamMonAsRoaming
	ld a, [wRoamMon2Species]
	call PutRoamMonInRoom
	ld a, [wRoamMon3Species]
	call RestartRoamMonAsRoaming
	ret

.Suicune
	ld a, [wRoamMon1Species]
	call RestartRoamMonAsRoaming
	ld a, [wRoamMon2Species]
	call RestartRoamMonAsRoaming
	ld a, [wRoamMon3Species]
	call PutRoamMonInRoom
	ret

PutRoamMonInRoom
	call GetStaticRoamMonPointers
	ret z ; Mon is not roaming, so do nothing to it.
	; Load the static map group/number to RAM
	ld a, b
	ld [hli], a
	ld [hl], c
	; Ensure the sprite is visible in that room
	ld b, 0
	call EventFlagAction
	ret

RestartRoamMonAsRoaming
	call GetStaticRoamMonPointers
	ret z ; Mon is not roaming, so do nothing to it.
	; Choose a random roam map and load it into RAM
	push hl
	call Function2a3cd
	pop hl
	ld a, b
	ld [hli], a
	ld [hl], c
	; Hide the sprite in the static room
	ld b, 1
	call EventFlagAction
	ret

GetStaticRoamMonPointers
	sub RAIKOU
	ld l, a
	ld e, a
	ld h, 0
	ld d, h
	; 6 * a + .pointers
	add hl, hl
	add hl, de
	ld de, .pointers
	add hl, hl
	add hl, de
	; Load static map to BC
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	; Load event flag to DE
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; Load pointer to roaming map in HL
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Check to see if roaming Pokemon is active
	ld a, [hl]
	cp $ff
	ret

.pointers
roammonstaticdata: macro
	map \1
	dw \2, \3 ; event flag, pointer to current map location in memory
endm
	roammonstaticdata RAIKOU_ROOM, EVENT_STATIC_RAIKOU, wRoamMon1MapGroup
	roammonstaticdata ENTEI_ROOM, EVENT_STATIC_ENTEI, wRoamMon2MapGroup
	roammonstaticdata SUICUNE_ROOM, EVENT_STATIC_SUICUNE, wRoamMon3MapGroup


InitRoamMons:
; initialize wRoamMon struct with ID given in [ScriptVar]. 1: Raikou | 2: Entei | 4: Suicune

	ld a, [ScriptVar]
	and a, 7
	ret z
	bit 0, a
	jr z, .entei
	ld a, RAIKOU
	ld [wRoamMon1Species], a
	call CheckPartyLevels
	cp 65
	jr nc, .loadraikoulevel
	ld a, 65
.loadraikoulevel
	ld [wRoamMon1Level], a
	ld a, [wMapHeaderPermission]
	call CheckOutdoorMap
	jr z, .raikou_room
	ld a, GROUP_ROUTE_42
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [wRoamMon1MapNumber], a
	jr .finish_raikou

.raikou_room
	ld a, [wRoamMon1Species]
	call PutRoamMonInRoom
.finish_raikou
	xor a
	ld [wRoamMon1HP], a
	ld a, [ScriptVar]
.entei
	bit 1, a
	jr z, .suicune
	ld a, ENTEI
	ld [wRoamMon2Species], a
	call CheckPartyLevels
	cp 65
	jr nc, .loadenteilevel
	ld a, 65
.loadenteilevel
	ld [wRoamMon2Level], a
	ld a, [wMapHeaderPermission]
	call CheckOutdoorMap
	jr z, .entei_room
	ld a, GROUP_ROUTE_37
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [wRoamMon2MapNumber], a
	jr .finish_entei

.entei_room
	ld a, [wRoamMon2Species]
	call PutRoamMonInRoom
.finish_entei
	xor a
	ld [wRoamMon2HP], a
	ld a, [ScriptVar]
.suicune
	bit 2, a
	ret z
	ld a, SUICUNE
	ld [wRoamMon3Species], a
	call CheckPartyLevels
	cp 65
	jr nc, .loadsuicunelevel
	ld a, 65
.loadsuicunelevel
	ld [wRoamMon3Level], a
	ld a, [wMapHeaderPermission]
	call CheckOutdoorMap
	jr z, .suicune_room
	ld a, GROUP_ROUTE_38
	ld [wRoamMon3MapGroup], a
	ld a, MAP_ROUTE_38
	ld [wRoamMon3MapNumber], a
	jr .finish_suicune

.suicune_room
	ld a, [wRoamMon3Species]
	call PutRoamMonInRoom
.finish_suicune
	xor a
	ld [wRoamMon3HP], a
	ret
; 2a30d

Function2a30d: ; 2a30d
	ld a, [wRoamMon1MapGroup]
	cp $ff
	jr z, .asm_2a324
	cp GROUP_RAIKOU_ROOM
	jr z, .asm_2a324
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call Function2a355
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a
.asm_2a324
	ld a, [wRoamMon2MapGroup]
	cp $ff
	jr z, .asm_2a33b
	cp GROUP_ENTEI_ROOM
	jr z, .asm_2a33b
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call Function2a355
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a
.asm_2a33b
	ld a, [wRoamMon3MapGroup]
	cp $ff
	jr z, .asm_2a352
	cp GROUP_SUICUNE_ROOM
	jr z, .asm_2a352
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call Function2a355
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a
.asm_2a352
	jp Function2a3f6
; 2a355

Function2a355: ; 2a355
	ld hl, RoamMaps
.asm_2a358
	ld a, [hl]
	cp $ff
	ret z
	ld a, b
	cp [hl]
	jr nz, .asm_2a365
	inc hl
	ld a, c
	cp [hl]
	jr z, .asm_2a36b
.asm_2a365
	ld a, [hli]
	and a
	jr nz, .asm_2a365
	jr .asm_2a358

.asm_2a36b
	inc hl
	ld d, h
	ld e, l
.asm_2a36e
	ld h, d
	ld l, e
	call Random
	and $1f
	jr z, Function2a3cd
	and 3
	cp [hl]
	jr nc, .asm_2a36e
	inc hl
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wdfe7]
	cp [hl]
	jr nz, .asm_2a390
	inc hl
	ld a, [wdfe6]
	cp [hl]
	jr z, .asm_2a36e
	dec hl
.asm_2a390
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

Function2a394: ; 2a394
	ld a, [wRoamMon1MapGroup]
	cp $ff
	jr z, .asm_2a3a6
	call Function2a3cd
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a
.asm_2a3a6
	ld a, [wRoamMon2MapGroup]
	cp $ff
	jr z, .asm_2a3b8
	call Function2a3cd
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a
.asm_2a3b8
	ld a, [wRoamMon3MapGroup]
	cp $ff
	jr z, .asm_2a3ca
	call Function2a3cd
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a
.asm_2a3ca
	jp Function2a3f6

Function2a3cd: ; 2a3cd
.RejectRoamMap
	ld hl, RoamMaps
	call Random
	and $f
	inc a
	ld b, a
.CountRoamMaps
	dec b
	jr z, .TryRoamMap
.SkipRoamMap
	ld a, [hli]
	and a
	jr nz, .SkipRoamMap
	jr .CountRoamMaps

.TryRoamMap
	ld a, [MapGroup]
	cp [hl]
	jr nz, .AcceptRoamMap
	inc hl
	ld a, [MapNumber]
	cp [hl]
	jr z, .RejectRoamMap
	dec hl
.AcceptRoamMap
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret
; 2a3f6

Function2a3f6: ; 2a3f6
	ld a, [wdfe4]
	ld [wdfe6], a
	ld a, [wdfe5]
	ld [wdfe7], a
	ld a, [MapNumber]
	ld [wdfe4], a
	ld a, [MapGroup]
	ld [wdfe5], a
	ret
; 2a40f

RoamMaps: ; 2a40f
; Maps that roaming monsters can be on,
; and possible maps they can jump to.
; Notably missing are Route 40 and
; Route 41, which are water routes.

	roam_map ROUTE_29, 2, ROUTE_30, ROUTE_46
	roam_map ROUTE_30, 2, ROUTE_29, ROUTE_31
	roam_map ROUTE_31, 3, ROUTE_30, ROUTE_32, ROUTE_36
	roam_map ROUTE_32, 3, ROUTE_36, ROUTE_31, ROUTE_33
	roam_map ROUTE_33, 2, ROUTE_32, ROUTE_34
	roam_map ROUTE_34, 2, ROUTE_33, ROUTE_35
	roam_map ROUTE_35, 2, ROUTE_34, ROUTE_36
	roam_map ROUTE_36, 4, ROUTE_35, ROUTE_31, ROUTE_32, ROUTE_37
	roam_map ROUTE_37, 3, ROUTE_36, ROUTE_38, ROUTE_42
	roam_map ROUTE_38, 3, ROUTE_37, ROUTE_39, ROUTE_42
	roam_map ROUTE_39, 1, ROUTE_38
	roam_map ROUTE_42, 4, ROUTE_43, ROUTE_44, ROUTE_37, ROUTE_38
	roam_map ROUTE_43, 2, ROUTE_42, ROUTE_44
	roam_map ROUTE_44, 3, ROUTE_42, ROUTE_43, ROUTE_45
	roam_map ROUTE_45, 2, ROUTE_44, ROUTE_46
	roam_map ROUTE_46, 2, ROUTE_45, ROUTE_29
	db $ff
; 2a4a0
; 2a4ab
; 0x2a51f
; 2a567