GetTrainerDVs: ; 270c4
; Return the DVs of OtherTrainerClass in bc

	push hl
	ld a, [OtherTrainerClass]
	cp RED
	jr nz, .okay
	ld a, [OtherTrainerID]
	dec a
	ld hl, .RedDVs
	jr z, .LoadHostDVs
	dec a
	ld hl, .AbeDVs
	jr z, .LoadHostDVs
	ld a, [OtherTrainerClass]
.okay
	cp CAL
	jr nz, .okay2
	ld a, [OtherTrainerID]
	cp 4
	ld hl, .AJDVs
	jr z, .LoadHostDVs
	ld a, [OtherTrainerClass]
.okay2
	cp BABA
	ld hl, .BabaDVs
	jr z, .LoadHostDVs
	cp PSYCHIC_T
	jr nz, .okay3
	ld a, [OtherTrainerID]
	cp 1
	jr z, .PsychicNathan
	cp 11
	jr z, .PsychicJared
	ld a, [OtherTrainerClass]
.okay3
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret
; 270d6

.LoadHostDVs
	ld a, [CurPartyMon]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	ret

.PsychicNathan
	ld a, [hRandomAdd]
	ld b, a
	ld a, [hRandomSub]
	ld c, a
	pop hl
	ret

.PsychicJared
	ld a, [CurPartyMon]
	add a
	ld c, a
	ld b, 0
	ld hl, .JaredDVs
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ret

.JaredDVs
	db $78, $9f ; T
	db $f2, $6e ; W
	db $ab, $23 ; I
	db $f9, $b2 ; T
	db $1a, $38 ; C
	db $21, $d2 ; H

.RedDVs
	db $0E, $7A ; AA-j
	db $CA, $7D ; AAAAAAAAAA
	db $D0, $E4 ; OMASTAR
	db $90, $A6 ; AATTVVV
	db $03, $71 ; AIIIIIIRRR
	db $AA, $64 ; aaabaaajss

.AJDVs
	db $89, $CF ; AAJRR  RRR
	db $23, $80 ; KT
	db $8A, $E4 ; AAAS RJ-1
	db $F7, $6E ; AAAAAtttta
	db $F8, $A0 ; BBBBBD

.AbeDVs
	db $52, $7C ; AAbbABCabb
	db $EC, $E5 ;  RRRRIIIIH
	db $82, $EE ; IIII--??(U
	db $0C, $9F ; AAA--××<MN><MN><MN>
	db $2D, $F3 ; (ssjj <MN>..,
	db $D8, $D5 ; RRQPO:<PK><PK><PK><PK>

.BabaDVs
	db $94, $1D ; BEST
	db $EF, $B0 ; DONG
	db $46, $E8 ; EVER
	db $EA, $AA ; DADA
	db $4E, $2B ; ORGY
	db $E8, $E5 ; DEKU

TrainerClassDVs: ; 270d6
	;  Atk  Spd
	;  Def  Spc I tried to balance gyms to effective 69 total
	db $FA, $F7 ; falkner
	db $CC, $BA ; bugsy
	db $7F, $DA ; whitney
	db $CA, $FF ; morty
	db $9E, $8F ; pryce
	db $BF, $7A ; jasmine
	db $FF, $97 ; chuck
	db $D5, $CD ; clair
	db $DD, $DD ; rival1
	db $DD, $DD ; pokemon prof
	db $DC, $DD ; will
	db $DC, $DD ; cal
	db $DD, $DC ; bruno
	db $7F, $DF ; karen
	db $BD, $DD ; koga
	db $DD, $DD ; champion
	db $AF, $8F ; brock
	db $F8, $CD ; misty
	db $AC, $FF ; lt surge
	db $98, $88 ; scientist
	db $7D, $9F ; erika
	db $98, $88 ; youngster
	db $98, $88 ; schoolboy
	db $98, $88 ; bird keeper
	db $58, $88 ; lass
	db $CA, $FF ; janine
	db $D8, $C8 ; cooltrainerm
	db $7C, $C8 ; cooltrainerf
	db $69, $C8 ; beauty
	db $98, $88 ; pokemaniac
	db $D8, $A8 ; gruntm
	db $98, $88 ; gentleman
	db $98, $88 ; skier
	db $68, $88 ; teacher
	db $78, $FF ; sabrina
	db $98, $88 ; bug catcher
	db $98, $88 ; fisher
	db $98, $88 ; swimmerm
	db $78, $88 ; swimmerf
	db $98, $88 ; sailor
	db $98, $88 ; super nerd
	db $98, $88 ; rival2
	db $98, $88 ; guitarist
	db $A8, $88 ; hiker
	db $98, $88 ; biker
	db $F8, $8F ; blaine
	db $98, $88 ; burglar
	db $98, $88 ; firebreather
	db $98, $88 ; juggler
	db $98, $88 ; blackbelt
	db $D8, $A8 ; executivem
	db $98, $88 ; psychic
	db $6A, $A8 ; picnicker
	db $98, $88 ; camper
	db $7E, $A8 ; executivef
	db $98, $88 ; sage
	db $78, $88 ; medium
	db $98, $88 ; boarder
	db $98, $88 ; pokefanm
	db $68, $8A ; kimono girl
	db $68, $A8 ; twins
	db $6D, $88 ; pokefanf
	db $FD, $DE ; red
	db $DD, $DD ; blue
	db $98, $88 ; officer
	db $7E, $A8 ; gruntf
	db $aa, $aa ; mysticalman
	db $88, $98 ; bill
	db $DD, $DD ; elm
	db $DD, $DD ; tppPc
	db $D8, $C8 ; Giovanni
	db $D8, $C8 ; coolsibs
	db $DD, $DD ; rivalrb
	db $DD, $DD ; rivalrb
	db $98, $88 ; brockrb
	db $78, $88 ; mistyrb
	db $BA, $BA; baba
	db $DD, $DD ; executiveegk
	
; 2715c

