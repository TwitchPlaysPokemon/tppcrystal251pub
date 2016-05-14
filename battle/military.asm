ParseExternalAI:
; In link battle, the player chooses moves, not the AI.
	ld a, [wLinkMode]
	and a
	ret nz
; Clear the array, just in case
	ld hl, wMilitaryAndAIBattleAction
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	callba Function3e8d1 ; Check to see if the AI can even make a move
	ld a, BEESAFREE_SND_ASKENEMY
	jr z, .loop_back
	xor a
.loop_back
	ld hl, wMilitaryFlags
	bit MILITARY_ON, [hl]
	jr z, .okay
	ld hl, PlayerSubStatus3
	bit SUBSTATUS_BIDE, [hl]
	jr nz, .okay
	push af
	callba Function3c410
	pop bc
	ld a, b
	jr c, .okay
	or BEESAFREE_SND_ASKMILITARY
.okay
	and a
	ret z
	push af
	rst LUASerial
	pop af
	and BEESAFREE_SND_ASKENEMY
	ret z
	ld a, [wMilitaryAndAIBattleAction]
	and $f0
	swap a
	cp $4
	jr c, .UseMove
	cp $a
	jr c, .Switch
	cp $f
	jp z, .Flee
	cp $d
	jr nc, .UseItem
	jp .Invalid

.UseMove
	push af
	call AI_CheckPP
	pop bc
	ret z
	ld a, [EnemyDisableCount]
	and a
	jr z, .skip_disable
	swap a
	and $f
	dec a
	cp b
	jr z, .Invalid
.skip_disable
	ld a, b
	ld [CurEnemyMoveNum], a
	ld c, a
	ld b, 0
	ld hl, EnemyMonMoves
	add hl, bc
	ld a, [hl]
	and a
	jr z, .Invalid
	ld [CurEnemyMove], a
	ld bc, EnemyMonPP - EnemyMonMoves
	add hl, bc
	ld a, [hl]
	and $3f
	ret z
	jr z, .Invalid
	ret

.Switch
	sub 4
	ld b, a
	ld a, [wBattleMode]
	dec a
	jr z, .Invalid
	ld a, [OTPartyCount]
	cp b
	jr c, .Invalid
	ld a, [CurOTMon]
	cp b
	jr z, .Invalid

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ld hl, EnemyMonType
	call nz, Mil_AI_checkghost
	jr nz, .Invalid

	ld a, [wc731]
	and a
	jr nz, .Invalid
	ld a, b
	ld bc, $30
	ld hl, OTPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr z, .Invalid
	ld a, $1
	ld [wEnemyIsSwitching], a
	ret

.UseItem
	sub $d
	ld hl, wc650
	jr z, .got_ai_item
	inc hl
.got_ai_item
	ld a, [hl]
	and a
	jr z, .Invalid
	ret

.Flee
	ld a, [wBattleMode]
	dec a
	jr nz, .Invalid

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .Invalid

	ld a, [wc731]
	and a
	ret z
.Invalid
	ld a, BEESAFREE_SND_ASKENEMY | BEESAFREE_SND_INVALID
	jp .loop_back


Military:
; This actually works.
	ld a, [wMilitaryItem]
	and a
	jp nz, .Item
	ld a, [wMilitaryAndAIBattleAction]
	and $f
	cp 4
	jr c, .UseMove
	cp 10
	jr c, .Switch
	cp 15
	jp z, .Flee
	jp .Invalid

.UseMove
	push af
	callba Function3e786
	pop bc
	jr z, .Struggle
	ld a, b
	ld [CurMoveNum], a
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	jp z, .Invalid
	ld [CurPlayerMove], a
	and a
	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc
	ld a, [hl]
	and $3f
	jp z, .Invalid
	ld a, [CurPlayerMove]
	ld b, a
	ld a, [DisabledMove]
	cp b
	jp z, .Invalid
.Struggle
	xor a
	ld [wd0ec], a
	and a
	ret

.Switch
	sub 4
	ld b, a
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jp z, .Invalid
	ld a, [PartyCount]
	cp b
	jp c, .Invalid
	jp z, .Invalid
	ld a, b
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld a, [CurPartyMon]
	ld hl, PartyMon1HP
	ld bc, $30
	call AddNTimes
	ld a, [hli]
	or [hl]
	jp z, .Invalid
	ld a, [CurPartyMon]
	ld b, a
	ld a, [CurBattleMon]
	cp b
	jp z, .Invalid
	ld a, [wc730]
	and a
	jp nz, .Invalid
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ld hl, BattleMonType
	call nz, Mil_AI_checkghost
	jp nz, .Invalid
	ld a, [CurBattleMon]
	ld [LastBattleMon], a
	ld a, $2
	ld [wd0ec], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	callba Function3e3ad
	ret

.Item
	ld [CurItem], a

	ld a, [wLinkMode]
	and a
	jp nz, .Invalid

	ld a, [InBattleTowerBattle]
	and a
	jp nz, .Invalid

	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jr z, .UseParkBall

	ld hl, NumItems
	call CheckItem
	jr nc, .Invalid
	call MilItemCheck
	jr c, .Invalid
	jr .continue

.UseParkBall
	ld a, PARK_BALL
	ld [CurItem], a
.continue
	call Function1d6e
	callba Function10629
	ld a, [wd0ec]
	and a
	jr z, .InvalidItem
	ld a, 1
	ld [wd0ec], a
	callba Function3e234
	ret

.Flee
	callba Military_TryToFlee
	ld a, $0
	ld [wd266], a
	ret c
	ld a, [wd0ec]
	and a
	ret nz
	jr .Invalid

.InvalidItem
	call WhiteBGMap
	xor a
	ld [hBGMapMode], a
	callba Function3ed9f
	call ClearSprites
	callba Function3f43d
	callba Function3f47c
	ld a, $1
	ld [wcfa9], a
	call Function1c07
	callba ReloadBattleHUDs
	call WaitBGMap
	call Function309d
	call Function1fbf
	callba Function3ee27
	callba MilitaryWaiting
.Invalid
	ld a, [wMilitaryAndAIBattleAction]
	and $f0
	ld b, a
	ld a, BEESAFREE_SND_ASKMILITARY | BEESAFREE_SND_INVALID
	rst LUASerial
	ld a, [wMilitaryAndAIBattleAction]
	and $f
	or b
	ld [wMilitaryAndAIBattleAction], a
	jp Military

Mil_AI_checkghost
	ld a, [hli]
	cp GHOST
	ret z
	ld a, [hl]
	cp GHOST
	ret

AI_CheckPP:
	ld a, STRUGGLE
	ld [CurEnemyMove], a
	ld a, [EnemyDisableCount]
	and a
	ld hl, EnemyMonPP
	jr nz, .check_disabled

	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	xor a
	ret

.check_disabled
	swap a
	and $f
	ld b, a
	ld d, $5
	xor a
.disable_loop
	dec d
	jr z, .done
	ld c, [hl]
	inc hl
	dec b
	jr z, .disable_loop
	or c
	jr .disable_loop

.done
	and $3f
	ret nz
	xor a
	ret
; 3e7c1

Military_SelectPokemon:
	ld a, [Options]
	push af
	set 4, a
	ld [Options], a
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBox
	ld hl, .Waiting
	bccoord 1, 16
	call Function13e5
	pop af
	ld [Options], a

	ld a, BEESAFREE_SND_ASKMILITARY
.loop
	call LUASerial_AnimateSprites
	ld a, [wMilitaryAndAIBattleAction]
	and $f
	cp 15
	jr z, .cancel
	cp 10
	jr nc, .Invalid
	sub 4
	jr c, .Invalid
	ld b, a
	ld a, [wMilitaryItem]
	and a
	jr nz, .Invalid
	ld a, [PartyCount]
	cp b
	jr c, .Invalid
	ld a, b
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	and a
	ret

.cancel
	scf
	ret

.Invalid
	ld a, BEESAFREE_SND_ASKMILITARY | BEESAFREE_SND_INVALID
	jr .loop

.Waiting
	text "Waiting!"
	done

MilItemCheck:
	ld a, [CurItem]
	ld hl, MilItemsRequiringMonAndMove
	ld de, 1
	call IsInArray
	jr c, .CheckMonAndMove
	ld a, [CurItem]
	ld hl, MilItemsRequiringMonOnly
	ld de, 1
	call IsInArray
	jr c, .CheckMon
	ld a, [CurItem]
	ld hl, MilItemsWithNoSpecificTarget
	ld de, 1
	call IsInArray
	jr c, .Valid
.Invalid
	scf
	ret
.CheckMon
	ld a, [wMilitaryAndAIBattleAction]
	and $f
	sub 4
	jr c, .Invalid
	ld b, a
	ld a, [PartyCount]
	cp b
	jr c, .Invalid
	jr .Valid

.CheckMonAndMove
	call .CheckMon
	ret c
	ld a, b
	ld bc, $30
	ld hl, PartyMon1Moves
	call AddNTimes
	ld a, [wMilitaryPPRestoreMoveTarget]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .Invalid
.Valid
	xor a
	ret


MilItemsRequiringMonAndMove:
	db ETHER ; Select Pokemon and move
	db MAX_ETHER ; Select Pokemon and move
	db MYSTERYBERRY ; Select Pokemon and move
	db -1

MilItemsRequiringMonOnly:
	db ANTIDOTE ; Select Pokemon
	db AWAKENING ; Select Pokemon
	db BERRY ; Select Pokemon
	db BERRY_JUICE ; Select Pokemon
	db BITTER_BERRY ; Select Pokemon
	db BURN_HEAL ; Select Pokemon
	db BURNT_BERRY ; Select Pokemon
	db ELIXER ; Select Pokemon
	db ENERGY_ROOT ; Select Pokemon
	db ENERGYPOWDER ; Select Pokemon
	db FRESH_WATER ; Select Pokemon
	db FULL_HEAL ; Select Pokemon
	db FULL_RESTORE ; Select Pokemon
	db GOLD_BERRY ; Select Pokemon
	db HEAL_POWDER ; Select Pokemon
	db HYPER_POTION ; Select Pokemon
	db ICE_BERRY ; Select Pokemon
	db ICE_HEAL ; Select Pokemon
	db LEMONADE ; Select Pokemon
	db MAX_ELIXER ; Select Pokemon
	db MAX_POTION ; Select Pokemon
	db MAX_REVIVE ; Select Pokemon
	db MINT_BERRY ; Select Pokemon
	db MIRACLEBERRY ; Select Pokemon
	db MOOMOO_MILK ; Select Pokemon
	db PARLYZ_HEAL ; Select Pokemon
	db POTION ; Select Pokemon
	db PRZCUREBERRY ; Select Pokemon
	db PSNCUREBERRY ; Select Pokemon
	db RAGECANDYBAR ; Select Pokemon
	db REVIVAL_HERB ; Select Pokemon
	db REVIVE ; Select Pokemon
	db SODA_POP ; Select Pokemon
	db SUPER_POTION ; Select Pokemon
	db -1

MilItemsWithNoSpecificTarget:
	db DIRE_HIT ; Use
	db FAST_BALL ; Use
	db FRIEND_BALL ; Use
	db GREAT_BALL ; Use
	db GUARD_SPEC ; Use
	db HEAVY_BALL ; Use
	db LEVEL_BALL ; Use
	db LOVE_BALL ; Use
	db LURE_BALL ; Use
	db MASTER_BALL ; Use
	db MOON_BALL ; Use
	db PARK_BALL ; Use
	db POKE_BALL ; Use
	db POKE_DOLL ; Use
	db PREMIER_BALL ; Use
	db ULTRA_BALL ; Use
	db X_ACCURACY ; Use
	db X_ATTACK ; Use
	db X_DEFEND ; Use
	db X_SPECIAL ; Use
	db X_SPEED ; Use
	db -1

LUASerial_AnimateSprites:
	ld [hLSB], a
	ld a, BEESAFREE_LSC_TRANSFERRING
	ld [hLSC], a
.loop
	callba Function8cf62
	ld a, [hLSC]
	and a ; BEESAFREE_LSC_COMPLETED
	jr nz, .loop
	ld a, [hLSB]
	ret
