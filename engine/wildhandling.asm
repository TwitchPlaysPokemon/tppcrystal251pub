Function29ff8: ; 29ff8
	call Function2a205 ;a = current mapnumber, hl = top of encounter area and carry is set if it has a land encounter, otherwise a is 0 and carry flag is not set
	jr c, .asm_2a006
	ld hl, wd25a ;fill wd25a with 0 if it is not an encounter map
	xor a
		;ld [hli], a ;now only 1 slot
		;ld [hli], a
	ld [hl], a
	jr .asm_2a011

.asm_2a006 ; if you have the encounter map, copy ecounter rates into wd25a
	inc hl
	inc hl
	ld de, wd25a
	ld a, [hl]
	ld [de], a
		;ld bc, $1 ;only first needs carryng over now
		;call CopyBytes
.asm_2a011
	call Function2a21d ;a = current mapnumber, hl = top of encounter area and carry is set if it has a water encounter, otherwise a is 0 and carry flag is not set
	ld a, $0
	jr nc, .asm_2a01b
	inc hl
	inc hl
	ld a, [hl]
.asm_2a01b
	ld [wd25d], a ; load zero if no water encounters, otherwise load water encounter chance
	ret

GetKantoWildMonsPointer:
	ld hl, StatusFlags
	bit 5, [hl]
	ld hl, WildMons3
	ret nz
	ld hl, WildMonsEGK
	ret

Function2a4ab: ; 2a4ab seems to be a function to get a local mon to use in call text
	callba Function90439
	ld d, b
	ld e, c
	ld hl, WildMons1
		;ld bc, $002f ; 47
	ld bc, $35 ; 53
	call Function2a288 ;load current maps place in land wild tables into hl
	jr c, .asm_2a4c6 ; if succsessful, jump. otherwise try kanto
	call GetKantoWildMonsPointer
	call Function2a288
	jr nc, .asm_2a514 ; if succsessful, fall through, otherwise ret scriptvar = 1
.asm_2a4c6
	push hl
	ld bc, $0011 ; 17
	add hl, bc ;increment wild position by 17, putting it on slot 13
	ld a, [TimeOfDay]
	ld bc, $0010
	call AddNTimes ;HL + (bc *a), moves down 16 lines per ToD, moving onto right time
.asm_2a4d4
	call Random
	and $3 ; reduce random number to 0-3
	ld c, a ; load into c
	ld b, $0
	add hl, bc ;increment hl either 0,1,2 or 3 these + the 17 added earlier point to the last 4 slots on the wild table
	ld c, [hl] ; loads the mon in that slot
	pop hl
	ld de, $0005
	add hl, de ; is first slot mon?
	ld b, $6
.asm_2a4eb
	ld a, [hli] ;hl = slot level
	cp c
	jr z, .asm_2a514 ;if the selected mon is the same as the one in the chosen slot, jump out of the loop, otherwise fall through
		;inc hl ; slot mon
	dec b ; loop counter
	jr nz, .asm_2a4eb ; loop until b = 0 (6 times) then fall through
	push bc ; b is loop counter, c is slot 1 mon
	dec c
	ld a, c ; a = mon before selected mon
	call CheckSeenMon ;set zero flag to whether mon is seen
	pop bc
	jr nz, .asm_2a514 ;if seen, jump
	ld de, StringBuffer1
	call CopyName1
	ld a, c
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0x2a51a
	call PrintText
	xor a
	ld [ScriptVar], a
	ret

.asm_2a514
	ld a, $1
	ld [ScriptVar], a
	ret
; 2a51a

UnknownText_0x2a51a: ; 0x2a51a
	; I just saw some rare @  in @ . I'll call you if I see another rare #MON, OK?
	text_jump UnknownText_0x1bd34b
	db "@"
Function2a51f: ; 2a51f
	callba Function90439 ;same as the one above (2a4ab) but calls a common mon
	ld d, b
	ld e, c
	ld hl, WildMons1
		; ld bc, $002f ;47
		ld bc, $35
	call Function2a288
	jr c, .asm_2a538
	call GetKantoWildMonsPointer
	call Function2a288
.asm_2a538
	ld bc, $0005 ;only goes up 5 instead of 13
	add hl, bc ; current loc is slot 1 level
	ld a, [TimeOfDay]
	inc a
	ld bc, $0010 ;16
.asm_2a543
	dec a
	jr z, .asm_2a549 ; find right table for time of day
	add hl, bc
	jr .asm_2a543

.asm_2a549
	call Random
	and $3 ;random from 0 to 3
	ld c, a ;put random number in c
	ld b, $0
	add hl, bc
		;add hl, bc ; Add it to the wild encounter list twice, taking it from slot 1 level to slot 1,2,3 or 4 level, then add 1 more to get to mon
		;inc hl
	ld a, [hl]
	ld [wd265], a ; load mon into a and then a variable
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, StringBuffer4
	ld bc, $000b
	jp CopyBytes

Function2a01f: ; 2a01f ;fill tilemap with tiles from the locations of mon wd625
	hlcoord 0, 0 ;hl = tilemap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill ;fill screen with 0
	ld a, e
	and a
	jr nz, .skip ;if e = 0, kanto, else johto
	ld de, TileMap
	ld hl, WildMons1
	call Function2a052 ;fill tilemap with the tiles from the locations of mon [wd625] in this table
	ld hl, WildMons2
	call Function2a052
	call Check_IsRoamMon1 ; add tiles for roaming mons if applicible
	call Check_IsRoamMon2
	call Check_IsRoamMon3
	ret

.skip
	ld de, TileMap
	call GetKantoWildMonsPointer
	call Function2a052
	ld hl, WildMons4
	call Function2a052
	call Check_IsStaticRoamMon1
	call Check_IsStaticRoamMon2
	call Check_IsStaticRoamMon3
	ret

Function2a052: ; 2a052 fill de with the tiles from the locations of mon [wd625] in this area
.loop
	ld a, [hl] ; ld map group
	cp $ff
	ret z
	push hl ;push map group loc
	ld a, [hli] ;redundent? inc hl would probably do the same thing as a is loaded in a few lines up
	ld b, a
	ld a, [hli]
	ld c, a ;load map group into b, number into c
	inc hl
	inc hl
	inc hl; skip to slot 1
	ld a, $30 ; check all 48 slots
	call Function2a088 ;if mon d265 is in location hl within a slots, ret nc with that locations tile in a and place in tilemap hl
	jr nc, .next ;if found, skip, else
	ld [de], a ;load the current location's tile into de
	inc de
.next
	pop hl
		;ld bc, $002f
	ld bc, $0035 ;to next table
	add hl, bc
	jr .loop

Function2a088: ; 2a088  ;if mon d265 is in mon table hl, ret nc with that locations tile in a and place in tilemap hl
		;inc hl ;over first slot mon unneded due to removal of level
.next
	push af ;store loop counter
	ld a, [wd265] ;load the stored mon
	cp [hl] ;if it's the same as mon in table, get that tile
	jr z, .done
		;inc hl unneded due to change to tables
	inc hl ;move to next slot
	pop af
	dec a
	jr nz, .next ; loop counter
	and a
	ret ;if not found, return
.done
	pop af ; a = loop number
	jp Check_IsInRoamMonNest ;redundent
; 2a09c

Check_IsInRoamMonNest: ; 2a09c if tile from place map bc exists in tilemap, ret nc
	push de
	call GetWorldMapLocation ; given a map group/id in bc, return its location on the Pok�gear map.
	ld c, a ;put it in c
	hlcoord 0, 0 ;hl = top of tilemap
	ld de, SCREEN_HEIGHT * SCREEN_WIDTH ;for each tile
.loop
	ld a, [hli] ; load coords location
	cp c ; If coords = contents of tile
	jr z, .done
	dec de
	ld a, e
	or d
	jr nz, .loop ;loop until 0
	ld a, c ;if not found, ret c
	pop de
	scf
	ret

.done
	pop de
	and a ; a holds the location found, de hieght*width
	ret

Check_IsRoamMon1: ; 2a0b7
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz ;if not is not roammonspecies, quit
	ld a, [wRoamMon1MapGroup]
	cp GROUP_RAIKOU_ROOM
	ret z
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0cf

Check_IsRoamMon2: ; 2a0cf
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	cp GROUP_ENTEI_ROOM
	ret z
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0e7

Check_IsRoamMon3: ; 2a0cf
	ld a, [wRoamMon3Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz
	ld a, [wRoamMon3MapGroup]
	cp GROUP_SUICUNE_ROOM
	ret z
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret

Check_IsStaticRoamMon1: ; 2a0b7
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz ;if not is not roammonspecies, quit
	ld a, [wRoamMon1MapGroup]
	cp GROUP_RAIKOU_ROOM
	ret nz
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0cf

Check_IsStaticRoamMon2: ; 2a0cf
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	cp GROUP_ENTEI_ROOM
	ret nz
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0e7

Check_IsStaticRoamMon3: ; 2a0cf
	ld a, [wRoamMon3Species]
	ld b, a
	ld a, [wd265]
	cp b
	ret nz
	ld a, [wRoamMon3MapGroup]
	cp GROUP_SUICUNE_ROOM
	ret nz
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call Check_IsInRoamMonNest
	ret nc
	ld [de], a
	inc de
	ret

Function2a0e7:: ; 2a0e7
; Try to trigger a wild encounter.

	call Function2a103 ;check if encounter, return c if there is not and encounter rate in b
	jr nc, .asm_2a0f8
	call Function2a14f ;find what encounter to run
	jr nz, .asm_2a0f8
	call Function2a1df ;if repel is off then carry, jump if it is on
	jr nc, .asm_2a0f8
	xor a
	ret

.asm_2a0f8 ;no battle
	xor a ; BATTLETYPE_NORMAL
	ld [wd22e], a
	ld [BattleType], a
	ld a, 1
	and a
	ret

Function2a103: ; 2a103
	call Function2a111 ; b = encounter chance
	call Function2a124 ;adjust for music
	call Function2a138 ;halve again if clense tag
	call Random ;call random in a then cp b to check for encounters
	cp b
	ret

Function2a111: ; 2a111
	ld hl, wd25a ;The land encounter chance
	call Function1852
	ld a, 1
	jr z, .asm_2a11e ;if water jump and line up with water encounter chance, otherwise add 0
	ld a, 0
.asm_2a11e
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl] ;put encounter rate in b
	ret

Function2a124:: ; 2a124
; Pokemon March and Ruins of Alph signal double encounter rate.
; Pokemon Lullaby halves encounter rate.

	ld a, [wMapMusic]
	cp MUSIC_POKEMON_MARCH
	jr z, .asm_2a135
	cp MUSIC_RUINS_OF_ALPH_RADIO
	jr z, .asm_2a135
	cp MUSIC_POKEMON_LULLABY
	ret nz
	srl b
	ret

.asm_2a135
	sla b
	ret
; 2a138

Function2a138:: ; 2a138
; Cleanse Tag halves encounter rate.

	ld hl, PartyMon1Item
	ld de, PartyMon2 - PartyMon1
	ld a, [PartyCount]
	ld c, a
.next
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .asm_2a14c
	add hl, de
	dec c
	jr nz, .next
	ret

.asm_2a14c
	srl b
	ret
; 2a14f

Function2a14f: ; 2a14f choose an encounter
	call Function2a200 ; put adress of wild mons tables in hl, bc holds skip numbers
	jp nc, .no_encounter ; jump if checking fails
	call Function2a2ce; check if roaming encounter
	jp c, .encounter; if roamer found(?) jump, otherwise fall through
	inc hl
	inc hl
	inc hl ;place it over tables bit to store the loc (is add 4 faster?)
	inc hl
	ld d, h
	ld e, l ;put table bit into de to get it back once first mon bit is on the stack
	inc hl ; move onto first mon bit
	ld a, [TimeOfDay]
	ld bc, $10
	call AddNTimes ;moves down 16 lines per ToD, moving onto first mon of right time
	push hl ; place first mon location on stack (cur stack: first mon byte)
	ld a, [de]
	and $f ;use first nyble
	push de  ;(cur stack: table byte, first mon byte)
	ld hl, PctTables ;load first table location into hl
	ld c, a ;put the table number in bc
	ld b, 0
	ld a, $10 ;put the size of a table(16) into a
	call AddNTimes ; HL + (bc *a), find the start of the correct table
	ld d, h
	ld e, l;put it in de

.asm_2a175
	call Random
	cp 200
	jr nc, .asm_2a175
	inc a
	ld b, a ; b = rand 1-200
	ld h, d ; hl = encounter% table
	ld l, e
	ld e, 0 ;e holds loops needed and amount of slots to go down
.asm_2a180
	ld a, [hli] ;load encouner slot chance into a and increment hl, making a contain the encounter chance and hl point to next mon
	cp b ; set flags for the random number - the encounter chance
	jr nc, .asm_2a187 ; If this the correct encounter jump out, otherwise fall through
		;inc hl ; go down another line, putting hl onto the next encounter slot
	inc e
	jr .asm_2a180 ; loop until encounter found
.asm_2a187
		;ld c, [hl] ; e already holds correct decrement thanks to the rebuilds
	ld d, 0
	pop hl ;=tables byte
	push hl ;(cur stack: table byte, first mon byte)
	ld a, [TimeOfDay]
	ld c, a ;store ToD for level pointer
	ld a, [hl]
	swap a
	and $f ; only use second nyble
	jr z, .SkipLevel ;skip if "table" 0 and thus no bonus. convienantly a is also 0 so 0 will be added

	ld b, 0
	dec a ;go 1 down as no table 0 exists for lvl pointers
	ld hl, LvlPointers
	add hl, bc ;go to correct ToD
	ld c, 3
	call AddNTimes ;go to correct pointer
	ld a, [hl] ;load table
	and a
	jr z, .SkipLevel ;skip if 0

	dec a
	ld hl, LvlTables
	ld c, $10
	call AddNTimes ;do to correct level table
	add hl, de ; find slot
	ld a, [hl] ;put the level bonus in a

.SkipLevel
	pop hl ;get table byte (cur stack: first mon byte)
	dec hl ;move onto base level byte
	add a, [hl] ;add base level onto level bonus
	pop hl ; get first mon byte (stack empty)
	add hl, de ;move to correct mon
	ld b, a
	call AddVariance ;add level variance and ensure it is between 2 and 100. accepts number to increase into a and returns the new number in a
	ld a, b
	ld [CurPartyLevel], a ;load level into a variable
	ld b, [hl]
	ld a, b ; load mon species into a
	call Function2a4a0 ; check mon is valid, jump if not (RIP missingno)
	jr c, .no_encounter
	ld a, b
	cp UNOWN
	jr nz, .done ;if unkown do special case for unlocked unowns, otherwise jump down
	ld a, [UnlockedUnowns] ;if no unown unlocked, no encounter
	and a
	jr nz, .done
.no_encounter
	ld a, 1
	and a
	ret

.done
	ld a, b
	ld [wd22e], a
.encounter
	xor a
	ret

PctTables: ;0 = big 30
	db 60
	db 80
	db 100
	db 120
	db 130
	db 140
	db 150
	db 160
	db 168
	db 176
	db 182
	db 188
	db 192
	db 196
	db 198
	db 200
; 1 = 2020

	db 40
	db 80
	db 100
	db 120
	db 130
	db 140
	db 150
	db 160
	db 168
	db 176
	db 182
	db 188
	db 192
	db 196
	db 198
	db 200
;2 = 2015
	db 40 ;20
	db 70 ;15
	db 90 ;10
	db 110 ;10
	db 130 ;10
	db 142 ;6
	db 152 ;5
	db 162 ;5
	db 172 ;5
	db 180 ;4
	db 186 ;3
	db 190 ;2
	db 194 ;2
	db 196 ;1
	db 198 ;1
	db 200 ;1
;3 = 1510
	db 30
	db 50
	db 70
	db 90
	db 110
	db 120
	db 130
	db 140
	db 150
	db 160
	db 170
	db 180
	db 188
	db 194
	db 198
	db 200

LvlPointers: ;0 skips, 1 and onwards uses these to select the table used for each ToD. feel free to change examples
;1 = EGK Diglett's Cave
	db 1, 1, 1 ;Lvl table to use in specific Tod, first slot is morning, second is day and third is night
;2 = Route 29
	db 3, 4, 5
;3 = Route 46
	db 6, 7, 8
;4 = Route 30
	db 9, 10, 11
;5 = Route 31
	db 12, 13, 14
;6 = Dark Cave Violet Entrance
	db 15, 16, 17
;7 = Sprout Tower
	db 18, 19, 20
;8 = Route 36
	db 21, 22, 23
;9 = Route 32
	db 24, 25, 26
;10 = Route 33
	db 27, 28, 29
;11 = Route 37
	db 30, 31, 32
;12 = Route 42
	db 33, 34, 35
;13 = Route 38
	db 36, 37, 38
;14 = Dark Cave Blackthorn Entrance
	db 39, 40, 41
;15 = Viridian Forest
	db 2, 2, 2

LvlTables: ;0 = no adjustment feel free to change examples
; 1 = EGK Diglett Cave
	db 0
	db -3
	db -3
	db -3
	db 14
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

; 2 = EGK Viridian Forest
	db 0
	db 0
	db 4
	db 4
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 4
	db 4
	db 0
	db 0

; 3 = Route 29 Morning
	db 0 ;0
	db 0
	db -2
	db 0
	db 0 ;4
	db 0
	db -2
	db -2
	db 0 ;8
	db 0
	db 3
	db 1
	db 3
	db 1
	db 0
	db 0

; 4 = Route 29 Day
	db 0
	db 0
	db 0
	db -2
	db 0
	db 0
	db -2
	db -2
	db 0
	db 3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3

; 5 = Route 29 Night
	db 0
	db 0
	db 0
	db -2
	db 0
	db 0
	db -2
	db -2
	db 0
	db 0
	db 0
	db 5
	db 7
	db 0
	db 0
	db 0

; 6 = Route 46 Morning
	db 0
	db 0
	db -1
	db -1
	db 0
	db -1
	db -1
	db -1
	db 1
	db 0
	db 1
	db 0
	db 1
	db 2
	db 0
	db 0

; 7 = Route 46 Day
	db 0
	db 0
	db -1
	db 1
	db 0
	db 0
	db -1
	db -1
	db -1
	db 0
	db 0
	db 0
	db 2
	db 0
	db -2
	db 0

; 8 = Route 46 Night
	db 0
	db 0
	db -1
	db 1
	db 0
	db -1
	db -1
	db 0
	db 0
	db 0
	db 0
	db 3
	db 5
	db 0
	db 1
	db 1

; 9 = Route 30 Morning
	db -1
	db 0
	db 0
	db -1
	db 0
	db 0
	db -1
	db -1
	db 0
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 6

; 10 = Route 30 Day
	db 0
	db 0
	db -1
	db -1
	db 0
	db -1
	db -1
	db 0
	db 2
	db 2
	db 0
	db 0
	db 2
	db 0
	db 2
	db 2

; 11 = Route 30 Night
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db -1
	db 0
	db 0
	db 4
	db 4
	db 6
	db -1
	db 0

; 12 = Route 31 Morning
	db 0
	db 0
	db -1
	db -1
	db 0
	db -1
	db 1
	db -1
	db 0
	db 0
	db 0
	db 0
	db 3
	db 0
	db 0
	db 1

; 13 = Route 31 Day
	db 0
	db -1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 3
	db 0
	db 0
	db 0
	db 0

; 14 = Route 31 Night
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3
	db 3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3
	db 3
	db 0

; 15 = Dark Cave Morning
	db -2
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 2

; 16 = Dark Cave Day
	db 0
	db 0
	db 0
	db -2
	db 0
	db 0
	db 0
	db 1
	db 1
	db 0
	db 0
	db 2
	db 0
	db 0
	db 1
	db 0

; 17 = Dark Cave Night
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 3
	db 0
	db 3
	db 0
	db 1
	db 0
	db 1
	db 0
	db 2
	db 0

; 18 = Sprout Tower Morning
	db 0
	db 0
	db 1
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 5
	db 5
	db 6
	db 0
	db 0
	db 1

; 19 = Sprout Tower Day
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 1
	db 5
	db 6
	db 5
	db 0
	db 0
	db 1
	db 1

; 20 = Sprout Tower Night
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 5
	db 0
	db 5
	db 1
	db 0
	db 6
	db 1

; 21 = Route 36 Morning
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 6
	db 0
	db 0
	db 0
	db 0
	db 0
	db 6

; 22 = Route 36 Day
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 6
	db 0
	db 0
	db 0
	db 0
	db 0

; 23 = Route 36 Night
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 3
	db 0
	db 3
	db 0
	db 0
	db 0

; 24 = Route 32 Morning
	db 0
	db -4
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 1
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0

; 25 = Route 32 Day
	db 0
	db 0
	db -1
	db 0
	db 0
	db 0
	db 1
	db -1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 2

; 26 = Route 32 Night
	db 0
	db 0
	db 0
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 2
	db 0
	db 0
	db 0
	db 0
	db 2
	db 0

; 27 = Route 33 Morning
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 5
	db 0
	db 1
	db 0
	db 1
	db 0
	db 1

; 28 = Route 33 Day
	db 0
	db 0
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 5
	db 5
	db 0
	db 0
	db 4
	db 0
	db 4
	db 1

; 29 = Route 33 Night
	db 0
	db 0
	db 1
	db 0
	db 0
	db 1
	db 0
	db 4
	db 1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 4
	db 1

; 30 = Route 37 Morning
	db -2
	db 0
	db 0
	db 0
	db 0
	db 1
	db 3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 9
	db 3

; 31 = Route 37 Day
	db 1
	db 0
	db 3
	db 0
	db 0
	db 0
	db 3
	db 0
	db 0
	db -2
	db 0
	db 0
	db 0
	db 9
	db 0
	db 0

; 32 = Route 37 Night
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3
	db 0
	db 0
	db 2
	db 0
	db 0
	db 2

; 33 = Route 42 Morning
	db -3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3
	db 0
	db 0
	db 2
	db 0
	db 2
	db 3
	db 0
	db 0

; 34 = Route 42 Day
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 3
	db 0
	db 2
	db 7
	db 3
	db 7

; 35 = Route 42 Night
	db 0
	db 0
	db 0
	db 2
	db 0
	db 0
	db 2
	db 0
	db 0
	db 0
	db 6
	db 0
	db 0
	db 0
	db 0
	db 7

; 36 = Route 38 Morning
	db 0
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 2
	db 4
	db 0
	db 2
	db 2
	db 2
	db 2
	db 2

; 37 = Route 38 Day
	db 0
	db 0
	db 0
	db 0
	db 1
	db 2
	db 0
	db 0
	db 0
	db 2
	db 2
	db 0
	db 2
	db 0
	db 2
	db 4

; 38 = Route 38 Night
	db 0
	db 0
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 2
	db 0
	db 0
	db 2
	db 2
	db 1
	db 2
	db 1

; 39 = Dark Cave Blackthorn Morning
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 6
	db 0
	db 3
	db 0
	db 2
	db 3
	db 3
	db 2

; 40 = Dark Cave Blackthorn Day
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 2
	db 0
	db 3
	db 0
	db 6
	db 2
	db 0
	db 3
	db 6

; 41 = Dark Cave Blackthorn Night
	db 0
	db 2
	db 0
	db 0
	db 0
	db 3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

Function2a200: ; 2a200 from 2a14f
	call Function1852
	jr z, Function2a21d ; If water, jump otherwise fall through
Function2a205: ; 2a205
	ld hl, WildMons5 ; address of the grass swarms table
		;ld bc, $002f ;47,
	ld bc, $0035 ; 53, set for size of areas when skipping, changed to new size
	call asm_2a23d ; check for swarms
	ret c ;return if a swarm
	call GetKantoWildMonsPointer
	ld d, h
	ld e, l
	ld hl, WildMons1
	call asm_2a235 ;if johto keep same, if kanto load de into hl
		;ld bc, $002f
	ld bc, $0035 ; 53
	jr asm_2a27a

Function2a21d: ; 2a21d ; jump here if water
	ld hl, WildMons6
		;ld bc, $0009 ; 9  set for size of areas when skipping, change to new size
	ld bc, $0035 ; 53
	;call asm_2a23d
	;ret c
	ld hl, WildMons2
	ld de, WildMons4
	call asm_2a235 ;if johto keep same, if kanto load de into hl
		;ld bc, $0009
	ld bc, $0035 ; 53
	jr asm_2a27a

asm_2a235
	call IsInJohto ;a is 0 if johto, 1 if kanto
	and a
	ret z ;if johto keep same, if kanto load de into hl
	ld h, d
	ld l, e
	ret

asm_2a23d ;from 2a205
	call Function2a27f ;load current location into de
	push hl
	ld hl, DailyFlags + 2
	bit 2, [hl] ;nz if dunsparce swarm, otherwise 1
	pop hl
	jr z, .asm_2a25c ;if not swarm, jump
	ld a, [wdfcc] ;????
	cp d
	jr nz, .asm_2a25c
	ld a, [wdfcd] ;????
	cp e
	jr nz, .asm_2a25c
	call Function2a288
	jr nc, asm_2a278 ;if finding map sucseeds, fall through, otherwise jump, clear flags and return
	scf
	ret

.asm_2a25c
	push hl
	ld hl, DailyFlags + 2;same as above but for yanma swarm
	bit 3, [hl]
	pop hl
	jr z, asm_2a278
	ld a, [wdc5a]
	cp d
	jr nz, asm_2a278
	ld a, [wdc5b]
	cp e
	jr nz, asm_2a278
	call Function2a288
	jr nc, asm_2a278
	scf
	ret

asm_2a278
	and a ; clear flags
	ret

asm_2a27a ;from 2a205
	call Function2a27f ; load current location into de
	jr Function2a288
; 2a27f

Function2a27f: ; 2a27f from 2a23d
	ld a, [MapGroup]; load current location into de
	ld d, a
	ld a, [MapNumber]
	ld e, a
	ret
; 2a288

Function2a288: ; 2a288 from 2a205 load map de's place in wild tables, bc = table size
	push hl ;loc of wild tables
	ld a, [hl]
	inc a
	jr z, .asm_2a29a ; If map location is max jump, pop, clear flags and ret
	ld a, d
	cp [hl] ; If mapgroup doesn't match, move down to next group and try again
	jr nz, .asm_2a296 ; increment hl by the size of the wild table if it doesnt match the location
	inc hl ; If map number doesn't match, fall through and move down an area, otherwise jump out.
	ld a, e
	cp [hl]
	jr z, .asm_2a29d
.asm_2a296
	pop hl
	add hl, bc
	jr Function2a288

.asm_2a29a
	pop hl
	and a
	ret

.asm_2a29d
	pop hl
	scf ; set carry flag
	ret

Function2a2ce: ; 2a2ce
	push hl
	call Function1852
	jr z, .asm_2a30a ;if water jump and ret, otherwise fall through
	call Function2a27f ;load current location into de
	call Random
	cp 200
	jr nc, .asm_2a30a
	and 7 ; cap at 7
	jr z, .asm_2a30a ; if not 0 or a multiple of 8 continue otherwise jump
	cp ROAM_SUICUNE
	jr nz, .notsuicune; here on seems to be roaming stuff
	dec a
.notsuicune
	dec a
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, 7
	call AddNTimes
	ld a, d
	cp [hl]
	jr nz, .asm_2a30a
	inc hl
	ld a, e
	cp [hl]
	jr nz, .asm_2a30a
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	and a
	jr z, .asm_2a30a
	ld [wd22e], a
	ld a, [hl]
	ld [CurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [BattleType], a
	pop hl
	scf
	ret

.asm_2a30a
	pop hl
	and a; if not roaming, clear flags
	ret

AddVariance: ;add level variance and ensure it is between 2 and 100. accepts number to increase into b and returns the new number in b

	;push bc
	;ld b, a ;store level in b
	call Random ; level vairance approx 35% listed level, 30% +1, 20% +2, 10% +3, 5% +4
	cp 89
	jr c, .asm_2a1aa
	inc b
	cp 165
	jr c, .asm_2a1aa
	inc b
	cp 216
	jr c, .asm_2a1aa
	inc b
	cp 242
	jr c, .asm_2a1aa
	inc b
.asm_2a1aa
	ld a, b ; load level back into a
	cp 1 ;If level is less then 1, set it to 1
	jr nc, .Pass
	ld b, 1
	;pop bc
	ret

.Pass
	cp 101 ;If over level 100, set to 100
	;pop bc ;return b
	ret c
	ld b, 100
	ret

Function2a4a0: ; 2a4a0 from 2a1aa
; Check if the Pokemon ID is valid.

	and a
	jr z, .asm_2a4a9
	cp NUM_POKEMON + 1
	jr nc, .asm_2a4a9
	and a
	ret

.asm_2a4a9
	scf
	ret

Function2a1df:: ; 2a1df
	ld a, [wRepelStepCounter] ;if repel steps is not 0
	and a
	jr z, .asm_2a1fe
	ld hl, PartyMon1HP ;load HP location into hl
	ld bc, PartyMon2 - PartyMon1 - 1 ; find the size of the struct -1?
.asm_2a1eb
	ld a, [hli]
	or [hl]
	jr nz, .asm_2a1f2 ;jump if hp is not 0
	add hl, bc ; if current mon is FNT, move down to next mon and try again
	jr .asm_2a1eb

.asm_2a1f2
; to PartyMonLevel

	dec hl
	dec hl
	dec hl
	dec hl
	ld a, [CurPartyLevel]
	cp [hl] ;if encounter mon level < front mon level then jump
	jr nc, .asm_2a1fe
	and a
	ret

.asm_2a1fe
	scf
	ret

WildMons1: ; 0x2a5e9
INCLUDE "data/wild/johto_grass.asm"

WildMons2: ; 0x2b11d
INCLUDE "data/wild/johto_water.asm"

WildMons3: ; 0x2b274
INCLUDE "data/wild/kanto_grass.asm"

WildMons4: ; 0x2b7f7
INCLUDE "data/wild/kanto_water.asm"

WildMons5: ; 0x2b8d0
INCLUDE "data/wild/swarm_grass.asm"

WildMons6: ; 0x2b92f
INCLUDE "data/wild/swarm_water.asm"

WildMonsEGK:
INCLUDE "data/wild/egk_grass.asm"
