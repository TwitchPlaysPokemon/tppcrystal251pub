TrainerNotes_:
	call TN_PrintToD
	call TN_PrintLocation
	call TN_PrintLV
	jp TN_PrintCharacteristics

TN_PrintToD
	ld de, .caughtat
	hlcoord 1, 9
	call PlaceString
	ld a, [TempMonCaughtTime]
	and $c0
	ld de, .unknown
	jr z, .print
	rlca
	rlca
	cp 2
	ld de, .morn
	jr c, .print
	ld de, .day
	jr z, .print
	ld de, .nite
.print
	hlcoord 5, 9
	jp PlaceString

.caughtat
	db "Met@"

.morn
	db "in the morning@"

.day
	db "during the day@"

.nite
	db "at night@"

.unknown
	db "at unkwn time@"

TN_PrintLocation:
	ld de, .unknown
	ld a, [TempMonCaughtLocation]
	and $7f
	jr z, .print
	cp $7e
	jr z, .print
	ld de, .event
	cp $7f
	jr z, .print
	ld e, a
	callba GetLandmarkName
	ld de, StringBuffer1
.print
	hlcoord 1, 11
	jp PlaceString

.unknown
	db "Unknown Location@"

.event
	db "Event #MON@"

TN_PrintLV:
	ld a, [TempMonCaughtLevel]
	and $3f
	hlcoord 1, 13
	jr z, .unknown
	cp 1
	jr z, .hatched
	cp 63
	jr z, .max
	ld [Buffer2], a
	ld de, .metat
	call PlaceString
	ld de, Buffer2
	ld bc, $0103
	hlcoord 8, 13
	jp PrintNum
.hatched
	ld de, .egg
	jp PlaceString
.unknown
	ld de, .str_unknown
	jp PlaceString
.max
	ld de, .str_max
	call PlaceString
	hlcoord 11, 13
	ld [hl], $35
	ret

.metat
	db "Met at ", $6e, "@"

.egg
	db "Hatched from EGG@"

.str_unknown
	db "Given in a trade@"

.str_max
	db "Met at ", $6e, "63@"

TN_PrintCharacteristics:
	ld hl, TempMonDVs
	ld d, 0 ; hp
	ld a, [hl]
	and $f
	ld c, a ; def
	ld a, [hli]
	swap a
	and $f ; atk
	cp c
	ld e, 2
	ld b, c
	jr c, .atk
	ld e, 1
	ld b, a
.atk
	srl a
	rl d
	srl c
	rl d
	ld a, [hl]
	and $f
	ld c, a ; spe
	ld a, [hl]
	swap a
	and $f ; spx
	cp c
	ld l, 5
	ld h, c
	jr c, .spx
	ld l, 3
	ld h, a
.spx
	srl a
	rl d
	srl c
	rl d
	ld a, b
	cp h
	jr nc, .skip
	ld e, l
	ld b, h
.skip
	ld a, b
	cp d
	jr nc, .skiphp
	ld e, 0
	ld b, d
.skiphp
	ld a, 3
	cp e
	jr nz, .skipspx
	; since DVs don't have SpA/SpD split so we have to determine it by OT ID
	ld a, [TempMonID + 1]
	bit 0, a
	jr z, .skipspx
	inc e
.skipspx
	ld a, b
	ld c, 5
	call SimpleDivide
	ld b, a
	ld a, e
	call SimpleMultiply
	add b
	ld l, a
	ld h, 0
	ld bc, Characteristics
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	decoord 1, 15
	push de
.loop
	ld a, [hli]
	cp "@"
	jr z, .done
	cp $4e
	jr z, .line
	ld [de], a
	inc de
	jr .loop

.line
	pop de
	push hl
	ld hl, $0014
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	jr .loop

.done
	pop de
	ret


Characteristics:
	dw Chara_HP0, Chara_HP1, Chara_HP2, Chara_HP3, Chara_HP4
	dw Chara_ATK0, Chara_ATK1, Chara_ATK2, Chara_ATK3, Chara_ATK4
	dw Chara_DEF0, Chara_DEF1, Chara_DEF2, Chara_DEF3, Chara_DEF4
	dw Chara_SPA0, Chara_SPA1, Chara_SPA2, Chara_SPA3, Chara_SPA4
	dw Chara_SPD0, Chara_SPD1, Chara_SPD2, Chara_SPD3, Chara_SPD4
	dw Chara_SPE0, Chara_SPE1, Chara_SPE2, Chara_SPE3, Chara_SPE4

Chara_HP0:  db "Loves to eat@"
Chara_HP1:  db "Takes plenty of"
	next "siestas@"
Chara_HP2:  db "Nods off a lot@"
Chara_HP3:  db "Scatters things"
	next "often@"
Chara_HP4:  db "Likes to relax@"

Chara_ATK0: db "Proud of its"
	next "power@"
Chara_ATK1: db "Likes to thrash"
	next "about@"
Chara_ATK2: db "A little quick"
	next "tempered@"
Chara_ATK3: db "Likes to fight@"
Chara_ATK4: db "Quick tempered@"

Chara_DEF0: db "Sturdy body@"
Chara_DEF1: db "Capable of taking"
	next "hits@"
Chara_DEF2: db "Highly persistent@"
Chara_DEF3: db "Good endurance@"
Chara_DEF4: db "Good perseverance@"

Chara_SPA0: db "Highly curious@"
Chara_SPA1: db "Mischievous@"
Chara_SPA2: db "Thoroughly"
	next "cunning@"
Chara_SPA3: db "Often lost in"
	next "thought@"
Chara_SPA4: db "Very finicky@"

Chara_SPD0: db "Strong willed@"
Chara_SPD1: db "Somewhat vain@"
Chara_SPD2: db "Strongly defiant@"
Chara_SPD3: db "Hates to lose@"
Chara_SPD4: db "Somewhat stubborn@"

Chara_SPE0: db "Likes to run@"
Chara_SPE1: db "Alert to sounds@"
Chara_SPE2: db "Impetuous and"
	next "silly@"
Chara_SPE3: db "Somewhat of a"
	next "clown@"
Chara_SPE4: db "Quick to flee@"
