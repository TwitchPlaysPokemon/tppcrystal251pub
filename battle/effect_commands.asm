DoPlayerTurn:
	call SetPlayerTurn

	ld a, [wd0ec]
	and a
	ret nz

	jr DoTurn

DoEnemyTurn:
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp $e
	jr z, DoTurn
	cp NUM_MOVES
	ret nc

DoTurn:
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wc6b4], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wc6b4]
	and a
	ret nz

	call UpdateMoveData

DoMove:
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
	ld a, BANK(MoveEffectsPointers)
	call GetFarHalfword

	ld de, BattleScriptBuffer

.GetMoveEffect
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp $ff
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, BattleScriptBuffer
	ld a, l
	ld [BattleScriptBufferLoc], a
	ld a, h
	ld [BattleScriptBufferLoc + 1], a

.ReadMoveEffectCommand

; ld a, [BattleScriptBufferLoc++]
	ld a, [BattleScriptBufferLoc]
	ld l, a
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [BattleScriptBufferLoc], a
	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	pop af

; $fe is used to terminate branches without ending the read cycle.
	cp $fe
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarHalfword

	call .DoMoveEffectCommand

	jr .ReadMoveEffectCommand

.DoMoveEffectCommand
	jp [hl]

CheckTurn:
BattleCommand01:
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, Function34385

	xor a
	ld [AttackMissed], a
	ld [EffectFailed], a
	ld [wc689], a
	ld [AlreadyDisobeyed], a
	ld [AlreadyFailed], a
	ld [wc73e], a

	ld a, 10 ; 1.0
	ld [TypeModifier], a

	ld a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn

CheckPlayerTurn: ;checks if player can act

	ld hl, PlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.no_recharge

	ld hl, BattleMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [BattleMonStatus], a
	and SLP
	jr z, .woke_up

	xor a
	ld [wcfca], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld hl, PlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextBox

	; Snore and Sleep Talk bypass sleep.
	ld a, [CurPlayerMove]
	;cp SNORE
	;jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep

	call CantMove
	jp Function34385

.not_asleep

	ld hl, BattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel, flare blitz and Sacred Fire thaw the user.
	ld a, [CurPlayerMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen
	cp FLARE_BLITZ
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_frozen

	ld hl, PlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_flinched

	ld hl, PlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [DisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextBox

.not_disabled

	ld a, [PlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, PlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, PlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp $80
	jr nc, .not_confused

	; clear confussion-dependent substatus
	ld hl, PlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp Function34385

.not_confused

	ld a, [PlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp $80
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [DisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, CurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp Function34385

.no_disabled_move

	ld hl, BattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp $3f
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove
	jp Function34385

CantMove:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and $ff ^ (1<<SUBSTATUS_BIDE + 1<<SUBSTATUS_RAMPAGE + 1<<SUBSTATUS_CHARGED)
	ld [hl], a

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .asm_3420f

	cp DIG
	ret nz

.asm_3420f
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	jp Function37ece

Function34216:
	call SwitchTurn
	call CantMove
	jp SwitchTurn

CheckEnemyTurn:

	ld hl, EnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.no_recharge

	ld hl, EnemyMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [EnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld hl, EnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [CurEnemyMove]
	;cp SNORE
	;jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep
	call CantMove
	jp Function34385

.not_asleep

	ld hl, EnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen
	ld a, [CurEnemyMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen
	cp FLARE_BLITZ
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_frozen

	ld hl, EnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_flinched

	ld hl, EnemyDisableCount
	ld a, [hl]
	and a ;if disable turns = 0, not disabled
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f ;dec it, if disabled turn is not 0, still disabled
	jr nz, .not_disabled

	ld [hl], a ;else set disabled move to 0
	ld [EnemyDisabledMove], a

	ld hl, DisabledNoMoreText ;disabled no more
	call StdBattleTextBox

.not_disabled

	ld a, [EnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, EnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, EnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextBox

	xor a
	ld [wcfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp $80
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, EnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextBox
	call Function355dd
	call BattleCommand62
	call BattleCommand0a
	xor a
	ld [wcfca], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld c, $1
	call Function35d1c
	call BattleCommand0c
	call CantMove
	jp Function34385

.not_confused

	ld a, [EnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp $80
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [EnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, CurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp Function34385

.no_disabled_move

	ld hl, EnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp $3f
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove

Function34385:
	ld a, $1
	ld [wc6b4], a
	jp ResetDamage

MoveDisabled:

	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wd265], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextBox

HitConfusion:

	ld hl, HurtItselfText
	call StdBattleTextBox

	xor a
	ld [CriticalHit], a

	call Function355dd
	call BattleCommand62
	call BattleCommand0a

	xor a
	ld [wcfca], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld c, $1
	call Function35d7e
	jp BattleCommand0c

BattleCommand02:
; checkobedience

	; Enemy can't disobey
	ld a, [hBattleTurn]
	and a
	ret nz

	call Function34548
	ret nz

	; If we've already checked this turn
	ld a, [AlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [AlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	and a
	ret nz

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, PartyMon1ID - PartyMon1
	call BattlePartyAttr

	ld a, [PlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	ret z

.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, JohtoBadges
	ld b, 2 ; 8 Johto Badges + first 2 Kanto Badges
	call CountSetBits
	cp 8
	jr nc, .max_level
	inc a
	inc a
	add a
	ld c, a
	add a
	add a
	add c
	jr .got_level

.max_level
	ld a, MAX_LEVEL + 1
.got_level
	; ld c, 8
	; call AddBadgeLevels ;for every set bit in b up to bit (c-1), add 10 to a
	; ld hl, KantoBadges ;include the first 2 badges in kanto only as player will have maxed obedience by late game
	; ld c, 2
	; call AddBadgeLevels ;for every set bit in b up to bit (c-1), add 10 to a
		; risingbadge redundent code
		;bit 7, [hl]
		;ld a, MAX_LEVEL + 1
		;jr nz, .getlevel

		; stormbadge
		;bit 5, [hl]
		;ld a, 70
		;jr nz, .getlevel

		; fogbadge
		;bit 3, [hl]
		;ld a, 50
		;jr nz, .getlevel

		; hivebadge
		;bit 1, [hl]
		;ld a, 30
		;jr nz, .getlevel

		; no badges
		;ld a, 10

.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [BattleMonLevel]
	ld d, a

	add b
	ld b, a

; No overflow (this should never happen)
	jr nc, .checklevel
	ld b, $ff

.checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc

; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	call IgnoreSleepOnly
	ret c

; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead

; No hope of using a move now.

; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextBox
	call HitConfusion
	jp .asm_3450c

.Nap
	call BattleRandom
	add a
	swap a
	and SLP
	jr z, .Nap

	ld [BattleMonStatus], a

	ld hl, BeganToNapText
	jr .Print

.DoNothing
	call BattleRandom
	and 3

	ld hl, LoafingAroundText
	and a
	jr z, .Print

	ld hl, WontObeyText
	dec a
	jr z, .Print

	ld hl, TurnedAwayText
	dec a
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print
	call StdBattleTextBox
	jp .asm_3450c

.UseInstead

; Can't use another move if the monster only has one!
	ld a, [BattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [DisabledMove]
	and a
	jr nz, .DoNothing

	ld hl, BattleMonPP
	ld de, BattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP
	ld a, [hli]
	and $3f ; exclude pp up
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP

.CheckMovePP
	ld hl, BattleMonPP
	ld a, [CurMoveNum]
	ld e, a
	ld d, 0
	add hl, de

; Can't use another move if only one move has PP.
	ld a, [hl]
	and $3f
	cp b
	jr z, .DoNothing

; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [AlreadyDisobeyed], a

	ld a, [wcfa3]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [CurMoveNum]
	ld c, a
	push af

.RandomMove
	call BattleRandom
	and 3 ; TODO NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [CurMoveNum], a
	ld hl, BattleMonPP
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and $3f
	jr z, .RandomMove

; Use it.
	ld a, [CurMoveNum]
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove

; Restore original move choice.
	pop af
	ld [CurMoveNum], a

.asm_3450c
	xor a
	ld [LastPlayerMove], a
	ld [LastEnemyCounterMove], a

	; Break Encore too.
	ld hl, PlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [PlayerEncoreCount], a

	jp EndMoveEffect

; AddBadgeLevels: ;for every set bit in b up to bit (c-1), add 10 to a
	; srl b
	; jr nc, .nobadge
	; add a, 10
; .nobadge
	; dec c
	; jr nz, AddBadgeLevels
	; ret

IgnoreSleepOnly:

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	;cp SNORE
	;jr z, .CheckSleep
	cp SLEEP_TALK
	jr z, .CheckSleep
	and a
	ret

.CheckSleep
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders<...>sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextBox

	call EndMoveEffect

	scf
	ret

BattleCommand03:
; usedmovetext
	callba DisplayUsedMoveText
	ret

Function34548:

	ld a, [hBattleTurn]
	and a
	ld a, [wc732] ; player
	jr z, .end
	ld a, [wc733] ; enemy
.end
	and a
	ret

BattleCommand04:
	call Function34548
	ret nz

	ld hl, BattleMonPP
	ld de, PlayerSubStatus3
	ld bc, PlayerTurnsTaken

	ld a, [hBattleTurn]
	and a
	jr z, .asm_34570

	ld hl, EnemyMonPP
	ld de, EnemySubStatus3
	ld bc, EnemyTurnsTaken

.asm_34570

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	ret nz

	call .asm_345ad
	ld a, b
	and a
	jp nz, EndMoveEffect

	; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	ld a, [hBattleTurn]
	and a

	ld hl, PartyMon1PP
	ld a, [CurBattleMon]
	jr z, .asm_345a4

; skip this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jr z, .asm_345c5

	ld hl, OTPartyMon1PP
	ld a, [CurOTMon]

.asm_345a4
	call GetPartyLocation
	push hl
	call Function3460b
	pop hl
	ret c

.asm_345ad
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .asm_345b8
	ld a, [CurEnemyMoveNum]

.asm_345b8
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .asm_345e3
	dec [hl]
	ld b, 0
	ret

.asm_345c5
	ld hl, EnemyMonMoves
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr z, .asm_345dc
	ld hl, wc735
	add hl, bc
	ld a, [hl]
	cp MIMIC
	ret z

.asm_345dc
	ld hl, wc739
	call .asm_345ad
	ret

.asm_345e3
	call BattleCommandaa
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextBox
	ld b, 1
	ret

.continuousmoves
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_BIDE
	db EFFECT_RAMPAGE
	db $ff

Function3460b:
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .asm_34616
	ld a, [CurEnemyMoveNum]

.asm_34616
	ld c, a
	ld a, 2
	call UserPartyAttr

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp MIMIC
	jr z, .asm_3462f

	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr nz, .asm_3462f

	scf
	ret

.asm_3462f
	and a
	ret

BattleCommand05:
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [CriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonItem
	ld a, [EnemyMonSpecies]
	jr nz, .Item
	ld hl, BattleMonItem
	ld a, [BattleMonSpecies]

.Item
	ld c, 0

	cp CHANSEY
	jr nz, .Farfetchd
	ld a, [hl]
	cp LUCKY_PUNCH
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .FocusEnergy ;.Tally fixed a non-stacking bug

.Farfetchd
	cp FARFETCH_D
	jr nz, .FocusEnergy
	ld a, [hl]
	cp STICK
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .FocusEnergy ;.Tally fixed a non-stacking bug

.FocusEnergy
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +2 critical level
	inc c
	inc c

.CheckCritical
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	ld hl, .Criticals
	push bc
	call IsInArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens
	push bc
	call GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Tally

; +1 critical level
	inc c

.Tally
	ld hl, .Chances
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .crit
	call BattleRandom
	cp [hl]
	ret nc
.crit
	ld a, 1
	ld [CriticalHit], a
	ret

.Criticals
	db KARATE_CHOP, RAZOR_LEAF, CRABHAMMER, SLASH, AEROBLAST, CROSS_CHOP, SKY_ATTACK, SHADOW_CLAW, DRILL_RUN, $ff ;crit+ moves
.Chances
	; 6.25% 12.5%  50%  100%
	db $11,  $1f,  $80,  $ff,  $ff,  $ff,  $ff
	;   0     1     2     3     4     5     6

BattleCommand4e:
; triplekick

	ld a, [wc689]
	ld b, a
	inc b
	ld hl, CurDamage + 1
	ld a, [hld]
	ld e, a
	ld a, [hli]
	ld d, a
.asm_346be
	dec b
	ret z
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a

; No overflow.
	jr nc, .asm_346be
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret

BattleCommand4f:
; kickcounter

	ld hl, wc689
	inc [hl]
	ret

BattleCommand07:
; stab
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld hl, BattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	ld a, [hBattleTurn]
	and a
	jr z, .go

	ld hl, EnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, BattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

.go
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and $1f
	ld [wd265], a

	push hl
	push de
	push bc
	callba DoWeatherModifiers
	pop bc
	pop de
	pop hl

	push de
	push bc
	callba DoBadgeTypeBoosts
	pop bc
	pop de

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar ; preserves registers
	cp FUTURE_SIGHT
	jr nz, .not_future_sight
	ld hl, BattleMonLevel
	ld a, [hBattleTurn]
	and a
	jr z, .got_level
	ld hl, EnemyMonLevel
.got_level
	bit 7, [hl]
	jr z, .asm_3473a
	jr .stab

.not_future_sight
	ld a, [wd265]
	cp b
	jr z, .stab
	cp c
	jr nz, .asm_3473a

.stab
	ld hl, CurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc

	ld a, h
	ld [CurDamage], a
	ld a, l
	ld [CurDamage + 1], a

	ld hl, TypeModifier
	set 7, [hl]

.asm_3473a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and $1f
	ld b, a
	ld hl, TypeMatchup

.asm_34743
	ld a, [hli]

	cp $ff
	jr z, .end

	; foresight
	cp $fe
	jr nz, .asm_34757
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .asm_34743

.asm_34757
	cp b
	jr nz, .asm_347b3
	ld a, [hl]
	cp d
	jr z, .asm_34763
	cp e
	jr z, .asm_34763
	jr .asm_347b3

.asm_34763
	push hl
	push bc
	inc hl
	ld a, [TypeModifier]
	and %10000000
	ld b, a
	ld a, [hl]
	and a
	jr nz, .asm_34775
	inc a
	ld [AttackMissed], a
	xor a
.asm_34775
	ld [$ffb7], a
	add b
	ld [TypeModifier], a

	xor a
	ld [$ffb4], a

	ld hl, CurDamage
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hld]
	ld [$ffb6], a

	call Multiply

	ld a, [$ffb4]
	ld b, a
	ld a, [$ffb5]
	or b
	ld b, a
	ld a, [$ffb6]
	or b
	jr z, .asm_347ab

	ld a, $a
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb5]
	ld b, a
	ld a, [$ffb6]
	or b
	jr nz, .asm_347ab

	ld a, $1
	ld [$ffb6], a

.asm_347ab
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	pop bc
	pop hl

.asm_347b3
	inc hl
	inc hl
	jr .asm_34743

.end
	call Function347c8
	ld a, [wd265]
	ld b, a
	ld a, [TypeModifier]
	and $80
	or b
	ld [TypeModifier], a
	ret

Function347c8:
	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, Function347d3
	ld hl, BattleMonType1

Function347d3: ; 347d3 ;put type matchup in wd265
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and $1f
	ld d, a ;d = move type
	ld b, [hl]
	inc hl
	ld c, [hl] ;load foe type into bc
	ld a, 10 ; 1.0
	ld [wd265], a ;load 10 into type matchup
	ld hl, TypeMatchup
.asm_347e7
	ld a, [hli]
	cp $ff
	jr z, .asm_3482f ;if end of table, done, if fe, skip and if foe id'd, continue till ff
	cp $fe
	jr nz, .asm_347fb
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .asm_3482f ;if id'd done, else check ghost matchups
	jr .asm_347e7 ;loop
.asm_347fb
	cp d
	jr nz, .asm_34807 ;if match-up matches, multiply
	ld a, [hli]
	cp b
	jr z, .asm_3480b
	cp c
	jr z, .asm_3480b
	jr .asm_34808
.asm_34807
	inc hl
.asm_34808
	inc hl
	jr .asm_347e7
.asm_3480b
	xor a
	ld [$ffb3], a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, [hli]
	ld [$ffb6], a
	ld a, [wd265]
	ld [hMultiplier], a
	call Multiply
	ld a, 10
	ld [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ld a, [$ffb6]
	ld [wd265], a
	jr .asm_347e7 ;loop until end of table

.asm_3482f
	pop bc
	pop de
	pop hl
	ret

BattleCommanda3:
	call Function347c8 ;put type matchup in wd265
	ld a, [wd265]
	and a
	ld a, 10 ; 1.0
	jr nz, .asm_3484a ;if not immune, set damage to neutral
	call ResetDamage
	xor a
	ld [TypeModifier], a
	inc a
	ld [AttackMissed], a
	ret
.asm_3484a
	ld [wd265], a
	ret

Function3484e:
	push hl
	push de
	push bc
	ld a, 10
	ld [wc716], a
	ld hl, PlayerUsedMoves
	ld a, [hl]
	and a
	jr z, .unknown_moves

	ld d, NUM_MOVES
	ld e, 0
.loop
	ld a, [hli]
	and a
	jr z, .exit
	push hl
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .next

	inc hl
	call GetMoveByte
	ld hl, EnemyMonType
	call Function347d3
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	and a
	jr z, .next
	cp 10 ; 1.0
	jr nc, .neutral

.not_very_effective
	ld a, e
	cp 1 ; 0.1
	jr nc, .next
	ld e, 1
	jr .next

.neutral
	ld e, 2
	jr .next

.super_effective
	call Function34931
	pop hl
	jr .done

.next
	pop hl
	dec d
	jr nz, .loop

.exit
	ld a, e
	cp 2
	jr z, .done
	call Function34939
	ld a, e
	and a
	jr nz, .done
	call Function34939
	jr .done

.unknown_moves
	ld a, [BattleMonType1]
	ld b, a
	ld hl, EnemyMonType1
	call Function347d3
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .ok
	call Function34931
.ok
	ld a, [BattleMonType2]
	cp b
	jr z, .ok2
	call Function347d3
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .ok2
	call Function34931
.ok2

.done
	call Function348de
	pop bc
	pop de
	pop hl
	ret

Function348de:
	ld de, EnemyMonMoves
	ld b, NUM_MOVES + 1
	ld c, 0

	ld a, [wd265]
	push af
.loop
	dec b
	jr z, .exit

	ld a, [de]
	and a
	jr z, .exit

	inc de
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .loop

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call Function347d3

	ld a, [wd265]
	; immune
	and a
	jr z, .loop

	; not very effective
	inc c
	cp 10
	jr c, .loop

	; neutral
	inc c
	inc c
	inc c
	inc c
	inc c
	cp 10
	jr z, .loop

	; super effective
	ld c, 100
	jr .loop

.exit
	pop af
	ld [wd265], a

	ld a, c
	and a
	jr z, .doubledown ; double down
	cp 5
	jr c, Function34931 ; down
	cp 100
	ret c
	jr Function34939 ; up

.doubledown
	call Function34931


Function34931:
	ld a, [wc716]
	dec a
	ld [wc716], a
	ret

Function34939:
	ld a, [wc716]
	inc a
	ld [wc716], a
	ret

Function34941:
	xor a
	ld [wc717], a
	call CountEnemyAliveMons
	ret c

	ld a, [EnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_perish

	ld a, [EnemyPerishCount]
	cp 1
	jr nz, .no_perish

	; Perish count is 1

	call CountEnemyAliveMons
	call Function34b77
	call Function34b20
	call Function34a85

	ld a, e
	cp 2
	jr nz, .asm_34971

	ld a, [wc716]
	add $30
	ld [wc717], a
	ret

.asm_34971
	call CountEnemyAliveMons
	sla c
	sla c
	ld b, $ff

.asm_3497a
	inc b
	sla c
	jr nc, .asm_3497a

	ld a, b
	add $30
	ld [wc717], a
	ret

.no_perish

	call Function3484e
	ld a, [wc716]
	cp 11
	ret nc

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_349d2

	call Function34a2a
	ld a, [wc716]
	and a
	jr z, .asm_349d2

	ld c, a
	call Function34aa7
	ld a, [wc716]
	cp $ff
	ret z

	ld b, a
	ld a, e
	cp 2
	jr z, .asm_349be

	call Function3484e
	ld a, [wc716]
	cp 10
	ret nc

	ld a, b
	add $10
	ld [wc717], a
	ret

.asm_349be
	ld c, $10
	call Function3484e
	ld a, [wc716]
	cp 10
	jr nc, .asm_349cc
	ld c, $20

.asm_349cc
	ld a, b
	add c
	ld [wc717], a
	ret

.asm_349d2
	call Function3484e
	ld a, [wc716]
	cp 10
	ret nc

	call CountEnemyAliveMons
	call Function34b77
	call Function34b20
	call Function34a85

	ld a, e
	cp $2
	ret nz

	ld a, [wc716]
	add $10
	ld [wc717], a
	ret

CountEnemyAliveMons:
	ld a, [OTPartyCount]
	cp 2
	jr c, .only_one

	ld d, a
	ld e, 0
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
	ld hl, OTPartyMon1HP

.loop
	ld a, [CurOTMon]
	cp e
	jr z, .next

	push bc
	ld b, [hl]
	inc hl
	ld a, [hld]
	or b
	pop bc
	jr z, .next

	ld a, c
	or b
	ld c, a

.next
	srl b
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	inc e
	dec d
	jr nz, .loop

	ld a, c
	and a
	jr nz, .more_than_one

.only_one
	scf
	ret

.more_than_one
	and a
	ret

Function34a2a:
	ld hl, OTPartyMon1
	ld a, [OTPartyCount]
	ld b, a
	ld c, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	xor a
	ld [wc716], a

.asm_34a39
	ld a, [CurOTMon]
	cp d
	push hl
	jr z, .asm_34a77

	push hl
	push bc
	ld bc, PartyMon1HP - PartyMon1
	add hl, bc
	pop bc
	ld a, [hli]
	or [hl]
	pop hl
	jr z, .asm_34a77

	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34a77

	inc hl
	call GetMoveByte
	ld hl, BaseType
	call Function347d3
	ld a, [wd265]
	and a
	jr nz, .asm_34a77

	ld a, [wc716]
	or c
	ld [wc716], a
.asm_34a77
	pop hl
	dec b
	ret z

	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc

	inc d
	srl c
	jr .asm_34a39

Function34a85:
	push bc
	ld a, [OTPartyCount]
	ld e, a
	ld hl, OTPartyMon1HP
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
.asm_34a91
	ld a, [hli]
	or [hl]
	jr z, .asm_34a98

	ld a, b
	or c
	ld c, a

.asm_34a98
	srl b
	push bc
	ld bc, PartyMon2HP - (PartyMon1HP + 1)
	add hl, bc
	pop bc
	dec e
	jr nz, .asm_34a91

	ld a, c
	pop bc

	and c
	ld c, a

Function34aa7:

	ld a, $ff
	ld [wc716], a
	ld hl, OTPartyMon1Moves
	ld b, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	ld e, 0
.asm_34ab5
	ld a, b
	and c
	jr z, .asm_34b00

	push hl
	push bc
	ld b, NUM_MOVES
	ld c, 0
.asm_34abf
	ld a, [hli]
	and a
	push hl
	jr z, .asm_34aef

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34ae9

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call Function347d3
	ld a, [wd265]
	cp 10
	jr c, .asm_34ae9

	ld e, 1
	cp 11
	jr c, .asm_34ae9

	ld e, 2
	jr .asm_34aef

.asm_34ae9
	pop hl
	dec b
	jr nz, .asm_34abf

	jr .asm_34af0

.asm_34aef
	pop hl
.asm_34af0
	ld a, e
	pop bc
	pop hl
	cp $2
	jr z, .asm_34b0e

	cp $1
	jr nz, .asm_34b00

	ld a, d
	or b
	ld d, a
	jr .asm_34b00

.asm_34b00
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	srl b
	jr nc, .asm_34ab5

	ld a, d
	ld b, a
	and a
	ret z

.asm_34b0e
	push bc
	sla b
	sla b
	ld c, $ff
.asm_34b15
	inc c
	sla b
	jr nc, .asm_34b15

	ld a, c
	ld [wc716], a
	pop bc
	ret

Function34b20:
	push bc
	ld hl, OTPartySpecies
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0

.asm_34b28
	ld a, [hli]
	cp $ff
	jr z, .asm_34b72

	push hl
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_34b4a

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34b4a

	inc hl
	call GetMoveByte
	jr .asm_34b5d

.asm_34b4a
	ld a, [BattleMonType1]
	ld hl, BaseType
	call Function347d3
	ld a, [wd265]
	cp $b
	jr nc, .asm_34b6d
	ld a, [BattleMonType2]

.asm_34b5d
	ld hl, BaseType
	call Function347d3
	ld a, [wd265]
	cp $b
	jr nc, .asm_34b6d

	ld a, b
	or c
	ld c, a

.asm_34b6d
	srl b
	pop hl
	jr .asm_34b28

.asm_34b72
	ld a, c
	pop bc
	and c
	ld c, a
	ret

Function34b77:
	push bc
	ld de, OTPartySpecies
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
	ld hl, OTPartyMon1HP

.loop
	ld a, [de]
	inc de
	cp $ff
	jr z, .done

	push hl
	push bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	inc hl
	srl c
	rl b
	srl c
	rl b
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	jr nc, .next

	ld a, b
	or c
	ld c, a

.next
	srl b
	pop hl
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	jr .loop

.done
	ld a, c
	pop bc
	and c
	ld c, a
	ret

TypeMatchup:
INCLUDE "battle/type_matchup.asm"

BattleCommand08:
; damagevariation

; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.

; No point in reducing 1 or 0 damage.
	ld hl, CurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ld [$ffb4], a
	dec hl
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hl]
	ld [$ffb6], a

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp $d9 ; 85%
	jr c, .loop

	ld [$ffb7], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ld [$ffb7], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ld a, [$ffb5]
	ld hl, CurDamage
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	ret

BattleCommand09:
; checkhit

	call .DreamEater
	jp z, .Miss

	call .Protect
	jp nz, .Miss

	;call .DrainSub
	;jp z, .Miss

	call .LockOn
	ret nz

	call .FlyDigMoves
	jp nz, .Miss

	call .ThunderRain
	ret z

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ALWAYS_HIT
	ret z
	cp EFFECT_FORESIGHT
	ret z
	cp EFFECT_WHIRLWIND
	ret z
	cp EFFECT_BIDE
	ret z

	cp EFFECT_BODY_SLAM
	jr z, .MinimiseCheck
	cp EFFECT_STOMP
	jr nz, .NotStomp

.MinimiseCheck
	ld hl, wc6fa
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wc6fe
.ok
	ld a, [hl]
	and a
	ret nz
.NotStomp

	cp EFFECT_TOXIC
	jr nz, .NotToxic
	ld a, BATTLE_VARS_TYPE_1 ;poison always hits toxic
	call GetBattleVarAddr
	cp POISON
	ret z
	ld a, BATTLE_VARS_TYPE_2
	call GetBattleVarAddr
	cp POISON
	ret z

.NotToxic



	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ld a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.BrightPowder
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	ld a, c ; % miss
	pop bc
	jr nz, .asm_34d81

	ld c, a
	ld a, b
	sub c
	ld b, a
	jr nc, .asm_34d81
	ld b, 0

.asm_34d81
	ld a, b
	cp $ff
	jr z, .Hit

	call BattleRandom
	cp b
	ret c
.Miss
	call ResetDamage
	ld a, 1
	ld [AttackMissed], a
.Hit
	ret

.DreamEater
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret

.Protect
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextBox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret

.LockOn
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	jr z, .LockedOn

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret z

.LockedOn
	ld a, 1
	and a
	ret

;.DrainSub
; Return z if using an HP drain move on a substitute.
;	call CheckSubstituteOpp
;	jr z, .asm_34e00
;
;	ld a, BATTLE_VARS_MOVE_EFFECT
;	call GetBattleVar

;	cp EFFECT_LEECH_HIT
;	ret z
;	cp EFFECT_DREAM_EATER
;	ret z

;.asm_34e00
;	ld a, 1
;	and a
;	ret

.FlyDigMoves
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	jr z, .DigMoves

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp GUST
	ret z
	cp WHIRLWIND
	ret z
	cp THUNDER
	ret z
	cp TWISTER
	ret

.DigMoves
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret

.ThunderRain
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	ret nz

	ld a, [Weather]
	cp WEATHER_RAIN
	ret

.StatModifiers

	ld a, [hBattleTurn]
	and a

	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [PlayerAccLevel]
	ld b, a
	ld a, [EnemyEvaLevel]
	ld c, a

	jr z, .asm_34e60

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [EnemyAccLevel]
	ld b, a
	ld a, [PlayerEvaLevel]
	ld c, a

.asm_34e60 ;hl holds move acc (in %), b holds uses accuracy level and a and c holds opposing evade level
	cp b
	jr c, .asm_34e6b ;if evade higher then accuracy, check for ID'D status

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.asm_34e6b
	ld a, 14 ;check evade - acc, cap in either direction if needed
	sub c
	add b
	sub 8
	jr c, .bottom_out
	cp 13
	jr c, .valid
	ld a, 12
	jr .valid
.bottom_out
	xor a
.valid
	sla a ;multiply level by 2
	ld c, a ;store in c
	ld b, 0
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, [hl] ;place base accuracy
	ld [$ffb6], a
	push hl
	ld hl, .AccProb
	add hl, bc
	ld a, [hli]
	ld [$ffb7], a
	call Multiply
	ld a, [hl]
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb6]
	ld b, a
	ld a, [$ffb5]
	or b
	jr nz, .asm_34ea2
	ld [$ffb5], a
	ld a, $1
	ld [$ffb6], a

.asm_34ea2

	ld a, [$ffb5]
	and a
	ld a, [$ffb6]
	jr z, .asm_34eaf
	ld a, $ff

.asm_34eaf
	pop hl
	ld [hl], a
	ret

.AccProb
	db 1, 3 ;  33.33% -6
	db 3, 8 ;  37.50% -5
	db 3, 7 ;  42.86% -4
	db 1, 2 ;  50%    -3
	db 3, 5 ;  60%    -2
	db 3, 4 ;  75%    -1
	db 1, 1 ; 100%     0
	db 4, 3 ; 133.33% +1
	db 5, 3 ; 166.67% +2
	db 2, 1 ; 200%    +3
	db 7, 3 ; 233.33% +4
	db 8, 3 ; 266.67% +5
	db 3, 1 ; 300%    +6

BattleCommand90:
; effectchance

	xor a
	ld [EffectFailed], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp BUG_BUZZ
	jr z, .IgnoreSub
	call CheckSubstituteOpp
	jr nz, .failed
.IgnoreSub
	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ld a, [hBattleTurn]
	and a
	jr z, .asm_34ee1
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.asm_34ee1

	call BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [EffectFailed], a
	and a
	ret

BattleCommand0a:
; lowersub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .asm_34f18

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .asm_34f21
	cp EFFECT_SKY_ATTACK
	jr z, .asm_34f21
	cp EFFECT_SKULL_BASH
	jr z, .asm_34f21
	cp EFFECT_SOLARBEAM
	jr z, .asm_34f21
	cp EFFECT_FLY
	jr z, .asm_34f21

.asm_34f18
	call .Rampage
	jr z, .asm_34f21

	call Function34548
	ret nz

.asm_34f21
	call Function37ed5
	jr c, .asm_34f36

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [wc689], a
	ld a, SUBSTITUTE
	jp Function37e44

.asm_34f36
	call BattleCommanda7
	jp BattleCommandaa

.Rampage
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .asm_34f4d
	cp EFFECT_RAMPAGE
	jr z, .asm_34f4d

	ld a, 1
	and a
	ret

.asm_34f4d
	ld a, [wc73e]
	and a
	ld a, 0
	ld [wc73e], a
	ret

BattleCommandab:
; hittarget
	call BattleCommand0a
	call BattleCommand0b
	jp BattleCommand0c

BattleCommand0b:
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa ;if missed

	ld a, [hBattleTurn]
	and a
	ld de, PlayerRolloutCount ;holds number of hits
	ld a, 1
	jr z, .asm_34f76
	ld de, EnemyRolloutCount
	ld a, 4

.asm_34f76
	ld [wcfca], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .asm_34fb0
	cp EFFECT_CONVERSION
	jr z, .asm_34fb0
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_34fb0
	cp EFFECT_TWINEEDLE
	jr z, .asm_34fb0
	cp EFFECT_TRIPLE_KICK
	jr z, .asm_34f96
	xor a
	ld [wc689], a

.asm_34f96

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	call PlayFXAnimID

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .asm_34fad
	cp DIG
	ret nz

.asm_34fad
; clear sprite
	jp Function37ec7
.asm_34fb0 ;if normal multi-hit
	ld a, [wc689]
	and 1
	xor 1
	ld [wc689], a ;load in opposite of first bit
	ld a, [de]
	cp $1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	pop af
	jp z, PlayFXAnimID
	xor a
	ld [wcfca], a
	jp PlayFXAnimID

BattleCommand92:
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa

	xor a
	jr BattleCommand91_92

BattleCommand91:
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa

	ld a, [hBattleTurn]
	and a
	ld a, 2
	jr z, BattleCommand91_92
	ld a, 5

BattleCommand91_92:
	ld [wcfca], a
	xor a
	ld [wc689], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	jp PlayFXAnimID

SwitchTurn:
BattleCommand93:
; switchturn

	ld a, [hBattleTurn]
	xor 1
	ld [hBattleTurn], a
	ret

BattleCommand0c:
; raisesub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call Function37ed5
	jp c, BattleCommanda6

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [wc689], a
	ld a, SUBSTITUTE
	jp Function37e44

BattleCommand0d:
; resulttext
	ld a, [AttackMissed]
	and a
	ret z

	call Function350e4
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	cp FLY
	jr z, .asm_3504f
	cp DIG
	jr z, .asm_3504f

; Move effect:
	inc hl
	ld a, [hl]

	cp EFFECT_MULTI_HIT
	jr z, .asm_35049
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_35049
	cp EFFECT_TWINEEDLE
	jr z, .asm_35049
	jp EndMoveEffect

.asm_35049
	call BattleCommand0c
	jp EndMoveEffect

.asm_3504f
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call Function37ece
	jp EndMoveEffect

BattleCommand0e:
; checkfaint

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .asm_35072
	call BattleCommand4b
	ld b, $0
	jr nc, .asm_3508b
	ld b, $1
	jr .asm_3508b

.asm_35072
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, $0
	jr nz, .asm_3508b
	call BattleRandom
	cp c
	jr nc, .asm_3508b
	call BattleCommand4b
	ld b, $0
	jr nc, .asm_3508b
	ld b, $2
.asm_3508b
	push bc
	call .asm_50bb ;if no sub, add to hit curdamage
	ld c, $0
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3509b
	call Function35d1c
	jr .asm_3509e

.asm_3509b
	call Function35d7e

.asm_3509e
	pop bc
	ld a, b
	and a
	ret z
	dec a
	jr nz, .asm_350ab
	ld hl, EnduredText
	jp StdBattleTextBox

.asm_350ab
	call GetOpponentItem
	ld a, [hl]
	ld [wd265], a
	call GetItemName

	ld hl, HungOnText
	jp StdBattleTextBox

.asm_50bb
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp BUG_BUZZ
	jr .ignoresub

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz ;if sub up, ret

.ignoresub
	ld de, PlayerDamageTaken + 1
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_350ce
	ld de, EnemyDamageTaken + 1

.asm_350ce
	ld a, [CurDamage + 1] ;add curdamage to damage taken
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [CurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret

Function350e4:
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_35110
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .asm_35110
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [CriticalHit]
	cp $ff
	jr nz, .asm_35110
	ld hl, UnaffectedText
.asm_35110
	call Function35157
	xor a
	ld [CriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz

	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, EnemyMonMaxHP
		;ld a, [TypeModifier]
		;and $7f
		;ret z ;if no effect, return?
		;ld hl, CurDamage
.start
	ld a, [hli]
	ld b, [hl] ;load damage
		;rept 3
	srl a ;divide max HP by 2 to deal self damage
	rr b
		;endr
	ld hl, CurDamage+1
	ld [hl], b ;put result in damage
	dec hl
	ld [hli], a
		;or b
		;jr nz, .asm_3513e ;if result is 0, set to 1
		;inc a
		;ld [hl], a
.asm_3513e
	ld hl, CrashedText
	call StdBattleTextBox
	ld a, $1
	ld [wc689], a
	call Function37e36
	ld c, $1
	ld a, [hBattleTurn]
	and a
	jp nz, Function35d1c
	jp Function35d7e

Function35157:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .asm_35162
	ld h, d
	ld l, e
.asm_35162
	jp StdBattleTextBox

BattleCommanda5:
	ld a, [AttackMissed]
	and a
	ret z

	ld a, [TypeModifier]
	and $7f
	jp z, PrintDoesntAffect
	jp PrintButItFailed

BattleCommand0f:
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [CriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextBox

	xor a
	ld [CriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText

BattleCommandae:
; startloop

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret

BattleCommandad:
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

BattleCommand10:
; supereffectivetext

	ld a, [TypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextBox

BattleCommand11:
; checkdestinybond

; Faint the user if it fainted an opponent using Destiny Bond.

	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_351cb
	ld hl, BattleMonHP

.asm_351cb
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .asm_35231

	ld hl, TookDownWithItText
	call StdBattleTextBox

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonMaxHP + 1
	bccoord 2, 2 ; hp bar
	ld a, 0
	jr nz, .asm_351f2
	ld hl, BattleMonMaxHP + 1
	bccoord 10, 9 ; hp bar
	ld a, 1

.asm_351f2
	ld [wWhichHPBar], a
	ld a, [hld]
	ld [Buffer1], a
	ld a, [hld]
	ld [Buffer2], a
	ld a, [hl]
	ld [wd1ec], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [wd1ed], a
	xor a
	ld [hl], a
	ld [wd1ee], a
	ld [wd1ef], a
	ld h, b
	ld l, c
	predef Predef_HPBarAnim
	call RefreshBattleHuds

	call SwitchTurn
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [wc689], a
	ld a, $c2
	call Function37e44
	call SwitchTurn

	jr .asm_3524d

.asm_35231
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .asm_3524a
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_3524a
	cp EFFECT_TWINEEDLE
	jr z, .asm_3524a
	cp EFFECT_TRIPLE_KICK
	jr z, .asm_3524a
	cp EFFECT_BEAT_UP
	jr nz, .asm_3524d

.asm_3524a
	call BattleCommand0c

.asm_3524d
	jp EndMoveEffect

BattleCommand12:
; buildopponentrage

	jp .start
.start
	ld a, [AttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	;ld de, wc72c
	;ld a, [hBattleTurn]
	;and a
	;jr z, .asm_3526b
	;ld de, wc72b
.asm_3526b
	;ld a, [de]
	;inc a
	;ret z
	;ld [de], a

	call SwitchTurn
	call BattleCommand70
	ld hl, RageBuildingText
	call StdBattleTextBox
	jp SwitchTurn

BattleCommanda2:
; ragedamage
	ret

	; ld a, [CurDamage]
	; ld h, a
	; ld b, a
	; ld a, [CurDamage + 1]
	; ld l, a
	; ld c, a
	; ld a, [hBattleTurn]
	; and a
	; ld a, [wc72b]
	; jr z, .asm_35290
	; ld a, [wc72c]
; .asm_35290
	; and a
	; jr z, .asm_3529a
	; dec a
	; add hl, bc
	; jr nc, .asm_35290
	; ld hl, $ffff
; .asm_3529a
	; ld a, h
	; ld [CurDamage], a
	; ld a, l
	; ld [CurDamage + 1], a
	; ret
;

EndMoveEffect:
	ld a, [BattleScriptBufferLoc]
	ld l, a
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

DittoMetalPowder:
	ld a, PartyMon1Species - PartyMon1
	call BattlePartyAttr
	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .Ditto
	ld a, [TempEnemyMonSpecies]

.Ditto
	cp DITTO
	ret nz

	push bc
	call GetOpponentItem
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .asm_352d8
	inc b
.asm_352d8
	scf
	rr c
	ret

BattleCommand06:
; damagestats

	ld a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

PlayerAttackDamage:
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	bit 6, a
	jr nz, .special

.physical
	ld hl, EnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [EnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, BattleMonAttack
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, EnemyStats + 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, PlayerStats
	jr .thickclub

.special
	ld hl, EnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormDefenceBoost ;and sandstorm boost

	ld a, [EnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, BattleMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball

	ld hl, EnemyStats + SP_DEFENSE * 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, PlayerStats + SP_ATTACK * 2

.lightball
; Note: Returns player special attack at hl in hl.
	call LightBallBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call Function3534d

	ld a, [BattleMonLevel]
	and $7f
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret

Function3534d:
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc
.loop
	ld a, h
	or b
	jr z, .done

	srl b
	rr c
	srl h
	rr l

	ld a, c
	or b
	jr nz, .check_hl
	inc c
.check_hl
	ld a, l
	or h
	jr nz, .loop
	inc l
	jr .loop

.done
	ld b, l
	ret

SandstormDefenceBoost: ;apply special defence boost to rock types in sandstorm
	ld a, [Weather]
	cp WEATHER_SANDSTORM
	ret nz
		;ld a, BATTLE_VARS_MOVE_TYPE
		;call GetBattleVar
		;and $70 ;only attack type bit
		;and a
		;ret z ;if phys, don't apply. redundent unless placed elsewhere
	ld a, BATTLE_VARS_TYPE_1OPP
	call GetBattleVar
	cp ROCK
	jr z, .IsRock
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVar
	cp ROCK
	ret nz
.IsRock
	push hl ;bc*1.5
	ld h, b
	ld l, c
	srl h
	rr l
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret

GetDamageStatsCritical:
; Return carry if non-critical.

	ld a, [CriticalHit]
	and a
	scf
	ret z

GetDamageStats:
; Return the attacker's offensive stat and the defender's defensive
; stat based on whether the attacking type is physical or special.

	push hl
	push bc
	ld a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	bit 6, a
; special
	ld a, [PlayerSAtkLevel]
	ld b, a
	ld a, [EnemySDefLevel]
	jr nz, .end
; physical
	ld a, [PlayerAtkLevel]
	ld b, a
	ld a, [EnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	bit 6, a
; special
	ld a, [EnemySAtkLevel]
	ld b, a
	ld a, [PlayerSDefLevel]
	jr nz, .end
; physical
	ld a, [EnemyAtkLevel]
	ld b, a
	ld a, [PlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

ThickClubBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld de, ThickClubBoostTable
	call SpeciesItemBoost
	pop de
	pop bc
	ret

LightBallBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld de, LightBallBoostTable
	call SpeciesItemBoost
	pop de
	pop bc
	ret

SpeciesItemBoost:
; Return in hl the stat value at hl.

; Check the species value in the array starting at de.
; Then check the item value.

	ld a, [hli]
	ld l, [hl]
	ld h, a

.loop
	ld a, [de]
	cp $ff
	ret z

	inc de
	ld b, a
	push hl
	ld a, PartyMon1Species - PartyMon1
	call BattlePartyAttr

	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr z, .CompareSpecies
	ld a, [TempEnemyMonSpecies]
.CompareSpecies
	pop hl

	cp b
	jr nz, .next

.GetItem
	push hl
	call GetUserItem
	ld a, [de]
	cp [hl]
	pop hl
	jr z, .done
.next
	inc de
	jr .loop

; Double the stat
.done
	sla l
	rl h
	ret

ThickClubBoostTable:
	db CUBONE, THICK_CLUB
	db MAROWAK, THICK_CLUB
LightBallBoostTable:
	db PIKACHU, LIGHT_BALL
	db $ff

EnemyAttackDamage:
	call ResetDamage

; No damage dealt with 0 power.
	ld hl, wEnemyMoveStructPower
	ld a, [hli] ; hl = wEnemyMoveStructType
	ld d, a
	and a
	ret z

	ld a, [hl]
	bit 6, a
	jr nz, .Special

.physical
	ld hl, BattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [PlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, EnemyMonAttack
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, PlayerStats + 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyStats
	jr .thickclub

.Special
	ld hl, BattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [PlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, EnemyMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball
	ld hl, PlayerStats + 8
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyStats + 6

.lightball
	call LightBallBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call Function3534d

	ld a, [EnemyMonLevel]
	and $7f
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret

BattleCommanda1:
; beatup
	ret

;	call ResetDamage
;	ld a, [hBattleTurn]
;	and a
;	jp nz, .asm_354ef
;	ld a, [PlayerSubStatus3]
;	bit SUBSTATUS_IN_LOOP, a
;	jr nz, .asm_35482
;	ld c, 20
;	call DelayFrames
;	xor a
;	ld [PlayerRolloutCount], a
;	ld [DefaultFlypoint], a
;	ld [wc72d], a
;	jr .asm_3548d
; .asm_35482
;	ld a, [PlayerRolloutCount]
;	ld b, a
;	ld a, [PartyCount]
;	sub b
;	ld [DefaultFlypoint], a
; .asm_3548d
;	ld a, [DefaultFlypoint]
;	ld hl, PartyMonNicknames
;	call GetNick
;	ld a, $22
;	call Function355bd
;	ld a, [hli]
;	or [hl]
;	jp z, Function355b0
;	ld a, [DefaultFlypoint]
;	ld c, a
;	ld a, [CurBattleMon]
;	cp [hl]
;	ld hl, BattleMonStatus
;	jr z, .asm_354b2
;	ld a, $20
;	call Function355bd
; .asm_354b2
;	ld a, [hl]
;	and a
;	jp nz, Function355b0
;	ld a, $1
;	ld [wc72d], a
;	ld hl, BeatUpAttackText
;	call StdBattleTextBox
;	ld a, [EnemyMonSpecies]
;	ld [CurSpecies], a
;	call GetBaseData
;	ld a, [BaseDefense]
;	ld c, a
;	push bc
;	ld a, $0
;	call Function355bd
;	ld a, [hl]
;	ld [CurSpecies], a
;	call GetBaseData
;	ld a, [BaseAttack]
;	pop bc
;	ld b, a
;	push bc
;	ld a, $1f
;	call Function355bd
;	ld a, [hl]
;	ld e, a
;	pop bc
;	ld a, [wPlayerMoveStructPower]
;	ld d, a
;	ret

; .asm_354ef
;	ld a, [EnemySubStatus3]
;	bit SUBSTATUS_IN_LOOP, a
;	jr nz, .asm_35502

;	xor a
;	ld [EnemyRolloutCount], a
;	ld [DefaultFlypoint], a
;	ld [wc72d], a
;	jr .asm_3550d

; .asm_35502
;	ld a, [EnemyRolloutCount]
;	ld b, a
;	ld a, [OTPartyCount]
;	sub b
;	ld [DefaultFlypoint], a
; .asm_3550d
;	ld a, [IsInBattle]
;	dec a
;	jr z, .asm_3556b

;	ld a, [wLinkMode]
;	and a
;	jr nz, .asm_35532

;	ld a, [InBattleTowerBattle]
;	and a
;	jr nz, .asm_35532

;	ld a, [DefaultFlypoint]
;	ld c, a
;	ld b, 0
;	ld hl, OTPartySpecies
;	add hl, bc
;	ld a, [hl]
;	ld [wd265], a
;	call GetPokemonName
;	jr .asm_35544

; .asm_35532
;	ld a, [DefaultFlypoint]
;	ld hl, OTPartyMonNicknames
;	ld bc, NAME_LENGTH
;	call AddNTimes
;	ld de, StringBuffer1
;	call CopyBytes
; .asm_35544
;	ld a, $22
;	call Function355bd
;	ld a, [hli]
;	or [hl]
;	jp z, Function355b0
;	ld a, [DefaultFlypoint]
	;ld b, a
;	ld a, [CurOTMon]
;	cp b
;	ld hl, EnemyMonStatus
;	jr z, .asm_35560

;	ld a, $20
;	call Function355bd
; .asm_35560
;	ld a, [hl]
;	and a
;	jr nz, Function355b0

;	ld a, $1
;	ld [wc72d], a
;	jr .asm_3557d

; .asm_3556b
;	ld a, [EnemyMonSpecies]
;	ld [wd265], a
;	call GetPokemonName
;	ld hl, BeatUpAttackText
;	call StdBattleTextBox
;	jp EnemyAttackDamage
; .asm_3557d
;	ld hl, BeatUpAttackText
;	call StdBattleTextBox
;	ld a, [BattleMonSpecies]
;	ld [CurSpecies], a
;	call GetBaseData
;	ld a, [BaseDefense]
;	ld c, a
;	push bc
;	ld a, $0
;	call Function355bd
;	ld a, [hl]
;	ld [CurSpecies], a
;	call GetBaseData
;	ld a, [BaseAttack]
;	pop bc
;	ld b, a
;	push bc
;	ld a, $1f
;	call Function355bd
;	ld a, [hl]
;	ld e, a
;	pop bc
;	ld a, [wEnemyMoveStructPower]
;	ld d, a
;	ret

Function355b0:
	ld b, $12 ; buildopponentrage
	jp SkipToBattleCommand

BattleCommanda8:
	ld a, [wc72d]
	and a
	ret nz
	jp PrintButItFailed

Function355bd:
	push bc
	ld c, a
	ld b, 0
	ld a, [hBattleTurn]
	and a
	ld hl, PartyMon1Species
	jr z, .asm_355cc
	ld hl, OTPartyMon1Species

.asm_355cc
	ld a, [DefaultFlypoint]
	add hl, bc
	call GetPartyLocation
	pop bc
	ret

BattleCommanda9:
; clearmissdamage
	ld a, [AttackMissed]
	and a
	ret z
	jp ResetDamage

Function355dd:
	call ResetDamage
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonDefense
	ld de, PlayerScreens
	ld a, [BattleMonLevel]
	jr z, .asm_355f7

	ld hl, EnemyMonDefense
	ld de, EnemyScreens
	ld a, [EnemyMonLevel]
.asm_355f7
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .asm_35604

	sla c
	rl b
.asm_35604
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call Function3534d
	ld d, 40
	pop af
	ld e, a
	ret

BattleCommand62:
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

; Selfdestruct and Explosion halve defense.
	cp EFFECT_EXPLOSION
	jr nz, .skip_kapow

	srl c
	jr nz, .skip_kapow
	inc c

.skip_kapow

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .skip_zero_power_check

	cp EFFECT_CONVERSION
	jr z, .skip_zero_power_check

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.skip_zero_power_check
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .okay_zero_defense_check
	ld c, 1
.okay_zero_defense_check

	xor a
	ld hl, hDividend ;$ffb3
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .asm_3563e
	ld [hl], $1 ;if carry, add 1 to $ffb5
.asm_3563e
	inc hl
	ld [hli], a ;add result to $ffb6

; / 5
	ld a, 5
	ld [hld], a ;5 into $ffb7
	push bc
	ld b, $4
	call Divide ;result in $ffb4
	pop bc

; + 2
	inc [hl] ;$ffb6
	inc [hl]

; * bp
	inc hl
	ld [hl], d ;$ffb7
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, $4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

; Item boosts
	call GetUserItem

	ld a, b
	and a
	jr z, .DoneItem

	ld hl, TypeBoostItems

.NextItem
	ld a, [hli]
	cp $ff
	jr z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and $1f
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ld [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ld [hDivisor], a
	ld b, 4
	call Divide
.DoneItem

; Critical hits
	call .CriticalMultiplier

; Update CurDamage (capped at 997).
	ld hl, CurDamage
	ld b, [hl]
	ld a, [$ffb6]
	add b
	ld [$ffb6], a
	jr nc, .asm_356a5

	ld a, [$ffb5]
	inc a
	ld [$ffb5], a
	and a
	jr z, .Cap

.asm_356a5
	ld a, [$ffb3]
	ld b, a
	ld a, [$ffb4]
	or a
	jr nz, .Cap

	ld a, [$ffb5]
	cp 998 / $100
	jr c, .asm_356bd

	cp 998 / $100 + 1
	jr nc, .Cap

	ld a, [$ffb6]
	cp 998 % $100
	jr nc, .Cap

.asm_356bd
	inc hl

	ld a, [$ffb6]
	ld b, [hl]
	add b
	ld [hld], a

	ld a, [$ffb5]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp 998 / $100
	jr c, .asm_356df

	cp 998 / $100 + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp 998 % $100
	jr c, .asm_356df

.Cap
	ld a, 997 / $100
	ld [hli], a
	ld a, 997 % $100
	ld [hld], a

.asm_356df
; Minimum neutral damage is 2 (bringing the cap to 999).
	inc hl
	ld a, [hl]
	add 2
	ld [hld], a
	jr nc, .asm_356e7
	inc [hl]
.asm_356e7

	ld a, 1
	and a
	ret

.CriticalMultiplier
	ld a, [CriticalHit]
	and a
	ret z
	push hl
	push de
; x1.5

	ld a, [$ffb5]
	ld h, a
	srl a
	ld d, a

	ld a, [$ffb6]
	ld l, a
	rr a
	ld e, a

	add hl, de
	ld a, l
	ld [$ffb6], a
	ld a, h
	ld [$ffb5], a
	pop de
	pop hl

; Cap at $ffff.
	ret nc

	ld a, $ff
	ld [$ffb5], a
	ld [$ffb6], a

	ret

TypeBoostItems:
	db HELD_NORMAL_BOOST,   NORMAL   ; Polkadot Bow
	db HELD_FIGHTING_BOOST, FIGHTING ; Blackbelt
	db HELD_FLYING_BOOST,   FLYING   ; Sharp Beak
	db HELD_POISON_BOOST,   POISON   ; Poison Barb
	db HELD_GROUND_BOOST,   GROUND   ; Soft Sand
	db HELD_ROCK_BOOST,     ROCK     ; Hard Stone
	db HELD_BUG_BOOST,      BUG      ; Silverpowder
	db HELD_GHOST_BOOST,    GHOST    ; Spell Tag
	db HELD_FIRE_BOOST,     FIRE     ; Charcoal
	db HELD_WATER_BOOST,    WATER    ; Mystic Water
	db HELD_GRASS_BOOST,    GRASS    ; Miracle Seed
	db HELD_ELECTRIC_BOOST, ELECTRIC ; Magnet
	db HELD_PSYCHIC_BOOST,  PSYCHIC  ; Twistedspoon
	db HELD_ICE_BOOST,      ICE      ; Nevermeltice
	db HELD_DRAGON_BOOST,   DRAGON   ; Dragon fang
	db HELD_DARK_BOOST,     DARK     ; Blackglasses
	db HELD_STEEL_BOOST,    STEEL    ; Metal Coat
	db HELD_FAIRY_BOOST,	FAIRY_T  ; Pink Bow
	db $ff

BattleCommand3f:
; constantdamage

	ld hl, BattleMonLevel
	ld a, [hBattleTurn]
	and a
	jr z, .got_level
	ld hl, EnemyMonLevel

.got_level
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .load_damage

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_REVERSAL
	jr z, .reversal

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, 0
	jr .load_damage

.psywave
	; ld a, b
	; srl a
	; add b
	; ld b, a

; If the Pokemon is at level 1, always do 1 HP damage.
; This prevents a softlock here.
	ld a, b
	cp 2
	jr nc, .sample_psywave
	ld b, 1
	ld a, 0
	jr .load_damage
; Get a random number between 0 and the level
.sample_psywave
	call BattleRandom
	and a
	jr z, .sample_psywave
	cp b
	jr nc, .sample_psywave
; Add 0.5 * level to get a number between (0.5 * level) and (1.5 * level)
	srl b
	add b
	ld b, a
	ld a, 0
	jr .load_damage

.super_fang
	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, BattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .load_damage
	or b
	ld a, 0
	jr nz, .load_damage
	ld b, 1
	; jr .load_damage ; Redundant
.load_damage
	ld hl, CurDamage
	ld [hli], a
	ld [hl], b
	ret

.reversal
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp2
	ld hl, EnemyMonHP
.got_hp2
	xor a
	ld [$ffb3], a
	ld [$ffb4], a
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hli]
	ld [$ffb6], a
	ld a, $30
	ld [$ffb7], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [$ffb7], a
	ld a, b
	and a
	jr z, .asm_357d6

	ld a, [$ffb7]
	srl b
	rr a
	srl b
	rr a
	ld [$ffb7], a
	ld a, [$ffb5]
	ld b, a
	srl b
	ld a, [$ffb6]
	rr a
	srl b
	rr a
	ld [$ffb6], a
	ld a, b
	ld [$ffb5], a

.asm_357d6
	ld b, $4
	call Divide
	ld a, [$ffb6]
	ld b, a
	ld hl, .FlailPower

.asm_357e1
	ld a, [hli]
	cp b
	jr nc, .asm_357e8
	inc hl
	jr .asm_357e1

.asm_357e8
	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .asm_357f8

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .asm_35800

.asm_357f8
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.asm_35800
	call BattleCommand62
	pop hl
	ld [hl], 1
	ret

.FlailPower
	;  px,  bp
	db  1, 200
	db  4, 150
	db  9, 100
	db 16,  80
	db 32,  40
	db 48,  20

BattleCommand40:
; counter

	ld a, 1
	ld [AttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callab GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z

	call BattleCommanda3
	ld a, [wd265]
	and a
	ret z

	call Function36abf
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, StringBuffer1
	call GetMoveData

	ld a, [StringBuffer1 + 2]
	and a
	ret z

	ld a, [StringBuffer1 + 3]
	bit 6, a
	jr nz, .special

	ld hl, CurDamage
	ld a, [hli]
	or [hl]
	ret z

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [AttackMissed], a
	ret

.special
	scf
	ret

BattleCommand41:
; encore

	ld hl, EnemyMonMoves
	ld de, EnemyEncoreCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonMoves
	ld de, PlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, .failed
	cp STRUGGLE
	jp z, .failed
	cp ENCORE
	jp z, .failed
	cp MIRROR_MOVE
	jp z, .failed
	ld b, a

.asm_3588e
	ld a, [hli]
	cp b
	jr nz, .asm_3588e

	ld bc, $0005
	add hl, bc
	ld a, [hl]
	and $3f
	jp z, .failed
	ld a, [AttackMissed]
	and a
	jp nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jp nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	add 4
	ld [de], a
	call Function36abf
	jr nz, .asm_3591a
	ld a, [hBattleTurn]
	and a
	jr z, .asm_358ef

	push hl
	ld a, [LastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, BattleMonMoves
.asm_358cc
	ld a, [hli]
	cp b
	jr z, .asm_358dd
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_358cc
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.asm_358dd
	pop hl

	ld a, c
	ld [CurMoveNum], a
	ld a, b
	ld [CurPlayerMove], a
	dec a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .asm_3591a

.asm_358ef
	push hl
	ld a, [LastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, EnemyMonMoves
.asm_358f9
	ld a, [hli]
	cp b
	jr z, .asm_3590a
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_358f9
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed
.asm_3590a
	pop hl

	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b
	ld [CurEnemyMove], a
	dec a
	ld de, wEnemyMoveStruct
	call GetMoveData

.asm_3591a
	call AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextBox

.failed
	jp PrintDidntAffect2

BattleCommand42:
; painsplit

	ld a, [AttackMissed]
	and a
	jp nz, Function359cd
	call CheckSubstituteOpp
	jp nz, Function359cd
	call AnimateCurrentMove
	ld hl, BattleMonMaxHP + 1
	ld de, EnemyMonMaxHP + 1
	call .asm_3597d
	ld a, $1
	ld [wWhichHPBar], a
	hlcoord 10, 9
	predef Predef_HPBarAnim
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wd1ed], a
	ld a, [hli]
	ld [wd1ec], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	call Function359ac
	xor a
	ld [wWhichHPBar], a
	call ResetDamage
	hlcoord 2, 2
	predef Predef_HPBarAnim
	callba Function178000

	ld hl, SharedPainText
	jp StdBattleTextBox

.asm_3597d
	ld a, [hld]
	ld [Buffer1], a
	ld a, [hld]
	ld [Buffer2], a
	ld a, [hld]
	ld b, a
	ld [wd1ec], a
	ld a, [hl]
	ld [wd1ed], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [CurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [CurDamage], a
	ld a, [CurDamage + 1]
	rr a
	ld [CurDamage + 1], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

Function359ac:
	ld c, [hl]
	dec hl
	ld a, [CurDamage + 1]
	sub c
	ld b, [hl]
	dec hl
	ld a, [CurDamage]
	sbc b
	jr nc, .asm_359c2

	ld a, [CurDamage]
	ld b, a
	ld a, [CurDamage + 1]
	ld c, a
.asm_359c2
	ld a, c
	ld [hld], a
	ld [wd1ee], a
	ld a, b
	ld [hli], a
	ld [wd1ef], a
	ret

Function359cd:
	jp PrintDidntAffect2

BattleCommand43:
; snore
	ret
	; ld a, BATTLE_VARS_STATUS
	; call GetBattleVar
	; and SLP
	; ret nz
	; call ResetDamage
	; ld a, $1
	; ld [AttackMissed], a
	; call Function37354
	; jp EndMoveEffect

BattleCommand44:
; conversion2

	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a50
	ld hl, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_359f7
	ld hl, EnemyMonType1
.asm_359f7
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_35a50
	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	and $1f
	ld d, a
	pop hl
	cp CURSE_T
	jr z, .asm_35a50
	call AnimateCurrentMove
	call SwitchTurn

.asm_35a13
	call BattleRandom
	and $1f
	cp UNUSED_TYPES
	jr c, .asm_35a24
	cp UNUSED_TYPES_END
	jr c, .asm_35a13
	cp TYPES_END
	jr nc, .asm_35a13
.asm_35a24
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and $1f
	push af
	push hl
	ld a, d
	ld [hl], a
	call Function347c8
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wd265]
	cp $a
	jr nc, .asm_35a13
	call SwitchTurn

	ld a, [hl]
	ld [wd265], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jp StdBattleTextBox

.asm_35a50
	jp Function37354

BattleCommand45:
; lockon

	call CheckSubstituteOpp
	jr nz, .asm_35a6e

	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a6e

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_LOCK_ON, [hl]
	call AnimateCurrentMove

	ld hl, TookAimText
	jp StdBattleTextBox

.asm_35a6e
	call AnimateFailedMove
	jp PrintDidntAffect

BattleCommand46:
; sketch

	call Function372d8

	ld a, [wLinkMode]
	and a
	jr z, .asm_35a83
	call AnimateFailedMove
	jp PrintNothingHappened
.asm_35a83

	call CheckSubstituteOpp
	jp nz, .asm_35b10

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .asm_35b10

	ld a, PartyMon1Moves - PartyMon1
	call UserPartyAttr
	ld d, h
	ld e, l
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35aa5
	ld hl, EnemyMonMoves
.asm_35aa5
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wd265], a
	ld b, a
	and a
	jr z, .asm_35b10
	cp STRUGGLE
	jr z, .asm_35b10
	ld c, NUM_MOVES
.asm_35ab7
	ld a, [hli]
	cp b
	jr z, .asm_35b10
	dec c
	jr nz, .asm_35ab7
	dec hl
	ld c, NUM_MOVES
.asm_35ac1
	dec c
	ld a, [hld]
	cp SKETCH
	jr nz, .asm_35ac1
	inc hl
	ld a, b
	ld [hl], a
	push bc
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	call GetMoveAttr
	pop hl
	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35af6
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_35af6
	ld a, [hl]
	push bc
	ld hl, wc739
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wc735
	add hl, bc
	pop bc
	ld [hl], b
	jr .asm_35b04
.asm_35af6
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, $0015
	add hl, de
	ld [hl], a
.asm_35b04
	call GetMoveName
	call AnimateCurrentMove

	ld hl, SketchedText
	jp StdBattleTextBox

.asm_35b10
	call AnimateFailedMove
	jp PrintDidntAffect

BattleCommand47:
; defrostopponent
; Thaw the opponent if frozen, and
; raise the user's Attack one stage.

	call AnimateCurrentMove

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	call Defrost

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	push hl
	push af

	ld a, EFFECT_ATTACK_UP
	ld [hl], a
	call BattleCommand1c

	pop af
	pop hl
	ld [hl], a
	ret

BattleCommand48:
; sleeptalk

	call Function372d8
	ld a, [AttackMissed]
	and a
	jr nz, .asm_35ba3
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonMoves + 1
	ld a, [DisabledMove]
	ld d, a
	jr z, .asm_35b4f
	ld hl, EnemyMonMoves + 1
	ld a, [EnemyDisabledMove]
	ld d, a
.asm_35b4f
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .asm_35ba3
	ld a, [hl]
	and a
	jr z, .asm_35ba3
	call .asm_35ba9
	jr c, .asm_35ba3
	dec hl
.asm_35b62
	push hl
	call BattleRandom
	and 3 ; TODO factor in NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_35b62
	ld e, a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp e
	jr z, .asm_35b62
	ld a, e
	cp d
	jr z, .asm_35b62
	call .asm_35bdf
	jr z, .asm_35b62
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, e
	ld [hl], a
	call Function34548
	jr nz, .asm_35b9a
	ld a, [wc689]
	push af
	call BattleCommand0a
	pop af
	ld [wc689], a
.asm_35b9a
	call Function37e36
	call UpdateMoveData
	jp ResetTurn
.asm_35ba3
	call AnimateFailedMove
	jp TryPrintButItFailed

.asm_35ba9
	push hl
	push de
	push bc
	call .asm_35bb3
	pop bc
	pop de
	pop hl
	ret

.asm_35bb3
	ld a, [hBattleTurn]
	and a
	ld a, [DisabledMove]
	jr z, .asm_35bbe

	ld a, [EnemyDisabledMove]
.asm_35bbe
	ld b, a
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld c, a
	dec hl
	ld d, NUM_MOVES
.asm_35bc8
	ld a, [hl]
	and a
	jr z, .asm_35bdb

	cp c
	jr z, .asm_35bd7
	cp b
	jr z, .asm_35bd7

	call .asm_35bdf
	jr nz, .asm_35bdd

.asm_35bd7
	inc hl
	dec d
	jr nz, .asm_35bc8

.asm_35bdb
	scf
	ret

.asm_35bdd
	and a
	ret

.asm_35bdf
	push hl
	push de
	push bc

	ld b, a
	callab GetMoveEffect
	ld a, b

	pop bc
	pop de
	pop hl

	cp EFFECT_SKULL_BASH
	ret z
	cp EFFECT_RAZOR_WIND
	ret z
	cp EFFECT_SKY_ATTACK
	ret z
	cp EFFECT_SOLARBEAM
	ret z
	cp EFFECT_FLY
	ret z
	cp EFFECT_BIDE
	ret

BattleCommand49:
; destinybond

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_DESTINY_BOND, [hl]
	call AnimateCurrentMove
	ld hl, DestinyBondEffectText
	jp StdBattleTextBox

BattleCommand4a:
; spite

	ld a, [AttackMissed]
	and a
	jp nz, .asm_35c91
	ld bc, PartyMon2 - PartyMon1 ; ????
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c24
	ld hl, BattleMonMoves
.asm_35c24
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_35c91
	cp STRUGGLE
	jr z, .asm_35c91
	ld b, a
	ld c, -1
.asm_35c33
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_35c33
	ld [wd265], a
	dec hl
	ld b, 0
	push bc
	ld c, BattleMonPP - BattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and $3f
	jr z, .asm_35c91
	push bc
	call GetMoveName
		;call BattleRandom
		;and 3 ;0-3
		;inc a
		;inc a ;2-5
	ld a, 4 ;made spite non-random
	ld b, a
	ld a, [hl]
	and $3f
	cp b
	jr nc, .asm_35c5b
	ld b, a
.asm_35c5b
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, PartyMon1PP - PartyMon1
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .asm_35c82
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_35c81
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_35c81
	ld hl, wc739
	add hl, bc
.asm_35c81
	ld [hl], e
.asm_35c82
	push de
	call AnimateCurrentMove
	pop de
	ld a, d
	ld [wd265], a
	ld hl, SpiteEffectText
	jp StdBattleTextBox
.asm_35c91
	jp PrintDidntAffect2

BattleCommand4b:
; falseswipe

	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c9f
	ld hl, BattleMonHP
.asm_35c9f
	ld de, CurDamage
	ld c, $2
	push hl
	push de
	call StringCmp
	pop de
	pop hl
	jr c, .asm_35cc7
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	dec a
	ld [de], a
	inc a
	jr nz, .asm_35cba
	dec de
	ld a, [de]
	dec a
	ld [de], a
.asm_35cba
	ld a, [CriticalHit]
	cp $2
	jr nz, .asm_35cc5
	xor a
	ld [CriticalHit], a
.asm_35cc5
	scf
	ret
.asm_35cc7
	and a
	ret

BattleCommand4c:
; healbell

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	ld de, PartyMon1Status
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35cdb
	ld de, OTPartyMon1Status
.asm_35cdb
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld h, d
	ld l, e
	ld bc, PartyMon2 - PartyMon1
	ld d, PartyEnd - PartySpecies
.asm_35ce9
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .asm_35ce9
	call AnimateCurrentMove

	ld hl, BellChimedText
	call StdBattleTextBox

	ld a, [hBattleTurn]
	and a
	jp z, Function365d7
	jp Function365fd

FarPlayBattleAnimation:
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz

PlayFXAnimID:
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a

	ld c, 3
	call DelayFrames

	callab PlayBattleAnim

	ret

Function35d1c:
	ld hl, CurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .asm_35d7b ;if damage is 0, do nothing

	ld a, c
	and a
	jr nz, .asm_35d31 ;if c is 0, check for sub

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp BUG_BUZZ
	jr z, .asm_35d31

	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, Function35de0 ;if sub up, apply damage to sub
.asm_35d31
	ld a, [hld]
	ld b, a
	ld a, [EnemyMonHP + 1]
	ld [wd1ec], a
	sub b
	ld [EnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [EnemyMonHP]
	ld [wd1ec + 1], a
	sbc b
	ld [EnemyMonHP], a
	jr nc, .asm_35d59

	ld a, [wd1ed]
	ld [hli], a
	ld a, [wd1ec]
	ld [hl], a

	xor a
	ld hl, EnemyMonHP
	ld [hli], a
	ld [hl], a

.asm_35d59
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wd1ef], a
	ld a, [hl]
	ld [wd1ee], a
	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	predef Predef_HPBarAnim
.asm_35d7b
	jp RefreshBattleHuds

Function35d7e:
	ld hl, CurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .asm_35ddd

	ld a, c
	and a
	jr nz, .asm_35d93

	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, Function35de0
.asm_35d93
	ld a, [hld]
	ld b, a
	ld a, [BattleMonHP + 1]
	ld [wd1ec], a
	sub b
	ld [BattleMonHP + 1], a
	ld [wd1ee], a
	ld b, [hl]
	ld a, [BattleMonHP]
	ld [wd1ec + 1], a
	sbc b
	ld [BattleMonHP], a
	ld [wd1ee + 1], a
	jr nc, .asm_35dc5

	ld a, [wd1ec + 1]
	ld [hli], a
	ld a, [wd1ec]
	ld [hl], a
	xor a

	ld hl, BattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wd1ee
	ld [hli], a
	ld [hl], a

.asm_35dc5
	ld hl, BattleMonMaxHP
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	hlcoord 10, 9
	ld a, $1
	ld [wWhichHPBar], a
	predef Predef_HPBarAnim
.asm_35ddd
	jp RefreshBattleHuds

Function35de0:

	ld hl, SubTookDamageText
	call StdBattleTextBox

	ld de, EnemySubstituteHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, PlayerSubstituteHP
.got_hp

	ld hl, CurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextBox

	call SwitchTurn
	call BattleCommanda7
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, Function37ec7
	call SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT ;clear effects other then multi-hit
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_TWINEEDLE
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	cp EFFECT_BEAT_UP
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage

UpdateMoveData:

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [CurSpecies], a ; not CurSpecies
	ld [wd265], a

	dec a
	call GetMoveData
	call GetMoveName
	jp CopyName1

BattleCommand14:
; sleeptarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .asm_35e70

	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld hl, ProtectedByText
	jr .asm_35ec6

.asm_35e70
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	ld hl, AlreadyAsleepText
	jr nz, .asm_35ec6

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp SLEEP_POWDER
	call z, CheckForGrassType ;ret z if target is a grass type
	jp z, PrintDidntAffect2
	cp SPORE
	call z, CheckForGrassType ;ret z if target is a grass type
	jp z, PrintDidntAffect2

	ld a, [AttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	;call Function35ece skip AI miss chance
	;jr c, .asm_35ec6

	ld a, [de]
	and a
	jr nz, .asm_35ec6

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp SING
	jr z, .IgnoreSub
	call CheckSubstituteOpp
	jr nz, .asm_35ec6
.IgnoreSub

	call AnimateCurrentMove
	;ld b, $7
	;ld a, [InBattleTowerBattle]
	;and a
	;jr z, .asm_35ea4
	ld b, $3

.asm_35ea4
	call BattleRandom
	and b
	jr z, .asm_35ea4
	; cp 3 ; sleep turns 1-3
	; jr z, .asm_35ea4
	 inc a ; "2-4" turns
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextBox

	callba Function3dde9

	jp z, Function34216
	ret

.asm_35ec6
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox

Function35ece:
	; Enemy turn
	;ld a, [hBattleTurn]
	;and a
	;jr z, .asm_35eec

	; Not in link battle
	;ld a, [wLinkMode]
	;and a
	;jr nz, .asm_35eec

	;ld a, [InBattleTowerBattle]
	;and a
	;jr nz, .asm_35eec

	; Not locked-on by the enemy
	;ld a, [PlayerSubStatus5]
	;bit SUBSTATUS_LOCK_ON, a
	;jr nz, .asm_35eec

	;call BattleRandom
	;cp $40
	;ret c

.asm_35eec
	;xor a
	ret

BattleCommand13:
; poisontarget

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	call Function35fe1
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function37962
	ret nz
	call Function35ff5
	ld de, ANIM_PSN
	call Function37e54
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call StdBattleTextBox

	callba Function3dde9
	ret

BattleCommand2f:
; poison

	ld hl, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jp z, .failed

	call Function35fe1
	jp z, .failed

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp POISONPOWDER
	call z, CheckForGrassType ;ret z if target is a grass type
	ld hl, DoesntAffectText
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, .not_poison_guard
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.not_poison_guard
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed
	;ld a, [hBattleTurn]
	;and a
	;jr z, .asm_35f89
	;ld a, [wLinkMode]
	;and a
	;jr nz, .asm_35f89
	;ld a, [InBattleTowerBattle]
	;and a
	;jr nz, .asm_35f89
	;ld a, [PlayerSubStatus5]
	;bit SUBSTATUS_LOCK_ON, a
	;jr nz, .asm_35f89
	;call BattleRandom
	;cp $40
	;jr c, .failed

; .asm_35f89
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [AttackMissed]
	and a
	jr nz, .failed
	call GetToxicCount
	jr z, .toxic

	call .Animate
	ld hl, WasPoisonedText
	call StdBattleTextBox
	jr .okay

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .Animate

	ld hl, BadlyPoisonedText
	call StdBattleTextBox

.okay
	callba Function3dde9 ; heal poison
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox

.Animate:
	call AnimateCurrentMove
	call Function35ff5
	jp RefreshBattleHuds

GetToxicCount:
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ld a, [hBattleTurn]
	and a
	ld de, EnemyToxicCount
	jr z, .ok
	ld de, PlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret

Function35fe1:
	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, BattleMonType1
.ok
	ld a, [de]
	inc de
	cp POISON
	ret z
	ld a, [de]
	cp POISON
	ret

Function35ff5:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	jp nz, UpdateOpponentInParty
	inc hl
	set 0, [hl]
	jp UpdateOpponentInParty

BattleCommand_Burn:
; burn

	ld hl, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jp z, .failed

	call .CheckTargetIsFireType
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyBurnedText
	and 1 << BRN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	jr nz, .do_burn
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.do_burn
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	;ld a, [hBattleTurn]
	;and a
	;jr z, .mimic_random

	;ld a, [wLinkMode]
	;and a
	;jr nz, .mimic_random

	;ld a, [InBattleTowerBattle]
	;and a
	;jr nz, .mimic_random

	;ld a, [PlayerSubStatus5]
	;bit SUBSTATUS_LOCK_ON, a
	;jr nz, .mimic_random

	;call BattleRandom
	;cp $40 ; 25% chance AI fails
	;jr c, .failed

.mimic_random
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [AttackMissed]
	and a
	jr nz, .failed
	call .apply_burn
	ld hl, WasBurnedText
	call StdBattleTextBox
	jr .finished

.finished
	callba Function3dde9
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox

.apply_burn:
	call AnimateCurrentMove
	call .BurnOpponent
	jp RefreshBattleHuds

.CheckTargetIsFireType:
	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok_fire
	ld de, BattleMonType1
.ok_fire
	ld a, [de]
	inc de
	cp FIRE
	ret z
	ld a, [de]
	cp FIRE
	ret

.BurnOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, Function3ec76
	jp CallBattleCore

BattleCommand15:
; draintarget
	call Function36011
	ld hl, SuckedHealthText
	jp StdBattleTextBox

BattleCommand16:
; eatdream
	call Function36011
	ld hl, DreamEatenText
	jp StdBattleTextBox

Function36011:
	ld hl, CurDamage
	ld a, [hli]
	srl a
	ld [$ffb3], a
	ld b, a
	ld a, [hl]
	rr a
	ld [$ffb4], a
	or b
	jr nz, .asm_36026 ; 0x36020 $4
	ld a, $1
	ld [$ffb4], a
.asm_36026
	ld hl, BattleMonHP
	ld de, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36037 ; 0x3602f $6
	ld hl, EnemyMonHP
	ld de, EnemyMonMaxHP
.asm_36037
	ld bc, wd1ed
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
	ld a, [$ffb4]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wd1ee], a
	ld a, [$ffb3]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wd1ef], a
	jr c, .asm_36064 ; 0x36056 $c
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .asm_36070 ; 0x36062 $c
.asm_36064
	ld a, [de]
	ld [hld], a
	ld [wd1ee], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wd1ef], a
	inc de
.asm_36070
	ld a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .asm_3607e ; 0x36078 $4
	hlcoord 2, 2
	xor a
.asm_3607e
	ld [wWhichHPBar], a
	predef Predef_HPBarAnim
	call RefreshBattleHuds
	jp UpdateBattleMonInParty

BattleCommand17:
; burntarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
		;ld a, [TypeModifier] redundent
		;and $7f
		;ret z
		;call Function36e5b
		;ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z

	ld a, BATTLE_VARS_TYPE_1OPP ;fire immunity to burn
	call GetBattleVarAddr
	cp FIRE
	ret z
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVarAddr
	cp FIRE
	ret z

	ld a, [EffectFailed]
	and a
	ret nz
	call Function37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, Function3ec76
	call CallBattleCore
	ld de, ANIM_BRN
	call Function37e54
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call StdBattleTextBox

	callba Function3dde9
	ret

Defrost:
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ld a, [hBattleTurn]
	and a
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	jr z, .ok
	ld hl, PartyMon1Status
	ld a, [CurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextBox

BattleCommand18:
; freezetarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [Weather]
	cp WEATHER_SUN
	ret z
		;call Function36e5b
		;ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z

	ld a, BATTLE_VARS_TYPE_1OPP ;fire immunity to burn
	call GetBattleVarAddr
	cp ICE
	ret z
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVarAddr
	cp ICE
	ret z

	ld a, [EffectFailed]
	and a
	ret nz
	call Function37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call Function37e54
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextBox

	callba Function3dde9
	ret nz
	call Function34216
	call EndRechargeOpp
	ld hl, wc740
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36162
	ld hl, wc73f
.asm_36162
	ld [hl], $1
	ret

BattleCommand19:
; paralyzetarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z

	ld a, BATTLE_VARS_TYPE_1OPP ;electric immunity to prz
	call GetBattleVarAddr
	cp ELECTRIC
	ret z
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVarAddr
	cp ELECTRIC
	ret z

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, Function3ec39
	call CallBattleCore
	ld de, ANIM_PAR
	call Function37e54
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, Function3dde9
	jp CallBattleCore

BattleCommand70:
; attackup
	ld b, $0
	jr BattleCommand1c
BattleCommand71:
; defenseup
	ld b, $1
	jr BattleCommand1c
BattleCommand72:
; speedup
	ld b, $2
	jr BattleCommand1c
BattleCommand73:
; specialattackup
	ld b, $3
	jr BattleCommand1c
BattleCommand74:
; specialdefenseup
	ld b, $4
	jr BattleCommand1c
BattleCommand75:
; accuracyup
	ld b, $5
	jr BattleCommand1c
BattleCommand76:
; evasionup
	ld b, $6
	jr BattleCommand1c
BattleCommand77:
; attackup2
	ld b, $10
	jr BattleCommand1c
BattleCommand78:
; defenseup2
	ld b, $11
	jr BattleCommand1c
BattleCommand79:
; speedup2
	ld b, $12
	jr BattleCommand1c
BattleCommand7a:
; specialattackup2
	ld b, $13
	jr BattleCommand1c
BattleCommand7b:
; specialdefenseup2
	ld b, $14
	jr BattleCommand1c
BattleCommand7c:
; accuracyup2
	ld b, $15
	jr BattleCommand1c
BattleCommand7d:
; evasionup2
	ld b, $16
	;jr BattleCommand1c
BattleCommand1c:
; statup
	call Function361ef
	ld a, [FailedMessage]
	and a
	ret nz
	jp Function36281

Function361ef:
	ld a, b
	ld [LoweredStat], a
	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_361fe ; 0x361f9 $3
	ld hl, EnemyStatLevels
.asm_361fe
	ld a, [AttackMissed]
	and a
	jp nz, Function3627b
	ld a, [EffectFailed]
	and a
	jp nz, Function3627b
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, Function36270
	ld a, [LoweredStat]
	and $f0
	jr z, .asm_3622b ; 0x36222 $7
	inc b
	ld a, $d
	cp b
	jr nc, .asm_3622b ; 0x36228 $1
	ld b, a
.asm_3622b
	ld [hl], b
	push hl
	ld a, c
	cp $5
	jr nc, .asm_36268 ; 0x36230 $36
	ld hl, BattleMonStats + 1
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36243 ; 0x3623b $6
	ld hl, EnemyMonStats + 1
	ld de, EnemyStats
.asm_36243
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .asm_3624f ; 0x3624c $1
	inc d
.asm_3624f
	pop bc
	ld a, [hld]
	sub 999 % $100
	jr nz, .asm_3625b ; 0x36253 $6
	ld a, [hl]
	sbc 999 / $100
	jp z, Function3626e
.asm_3625b
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36265 ; 0x3625e $5
	call Function365fd
	jr .asm_36268 ; 0x36263 $3
.asm_36265
	call Function365d7
.asm_36268
	pop hl
	xor a
	ld [FailedMessage], a
	ret

Function3626e:
	pop hl
	dec [hl]

Function36270:
	ld a, $2
	ld [FailedMessage], a
	ld a, $1
	ld [AttackMissed], a
	ret

Function3627b:
	ld a, $1
	ld [FailedMessage], a
	ret

Function36281:
	ld bc, wc6fe
	ld hl, Function3f447
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36292 ; 0x3628a $6
	ld bc, wc6fa
	ld hl, Function3f486
.asm_36292
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp MINIMIZE
	ret nz
	ld a, $1
	ld [bc], a
	call Function37ed5
	ret nc
	xor a
	ld [$ffd4], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommandaa

BattleCommand7e:
; attackdown
	ld a, ATTACK
	jr BattleCommand1d
BattleCommand7f:
; defensedown
	ld a, DEFENSE
	jr BattleCommand1d
BattleCommand80:
; speeddown
	ld a, SPEED
	jr BattleCommand1d
BattleCommand81:
; specialattackdown
	ld a, SP_ATTACK
	jr BattleCommand1d
BattleCommand82:
; specialdefensedown
	ld a, SP_DEFENSE
	jr BattleCommand1d
BattleCommand83:
; accuracydown
	ld a, ACCURACY
	jr BattleCommand1d
BattleCommand84:
; evasiondown
	ld a, EVASION
	jr BattleCommand1d
BattleCommand85:
; attackdown2
	ld a, $10 | ATTACK
	jr BattleCommand1d
BattleCommand86:
; defensedown2
	ld a, $10 | DEFENSE
	jr BattleCommand1d
BattleCommand87:
; speeddown2
	ld a, $10 | SPEED
	jr BattleCommand1d
BattleCommand88:
; specialattackdown2
	ld a, $10 | SP_ATTACK
	jr BattleCommand1d
BattleCommand89:
; specialdefensedown2
	ld a, $10 | SP_DEFENSE
	jr BattleCommand1d
BattleCommand8a:
; accuracydown2
	ld a, $10 | ACCURACY
	jr BattleCommand1d
BattleCommand8b:
; evasiondown2
	ld a, $10 | EVASION

BattleCommand1d:
; statdown

	ld [LoweredStat], a

	call Function36391
	jp nz, .Mist

	ld hl, EnemyStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .GetStatLevel
	ld hl, PlayerStatLevels

.GetStatLevel
; Attempt to lower the stat.
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jp z, .CantLower

; Sharply lower the stat if applicable.
	ld a, [LoweredStat]
	and $f0
	jr z, .ComputerMiss
	dec b
	jr nz, .ComputerMiss
	inc b

.ComputerMiss
; Computer opponents have a 1/4 chance of failing. removed
	;ld a, [hBattleTurn]
	;and a
	;jr z, .DidntMiss
	;ld a, [wLinkMode]
	;and a
	;jr nz, .DidntMiss

	;ld a, [InBattleTowerBattle]
	;and a
	;jr nz, .DidntMiss

; Lock-On still always works.
	;ld a, [PlayerSubStatus5]
	;bit SUBSTATUS_LOCK_ON, a
	;jr nz, .DidntMiss

; Attacking moves that also lower accuracy are unaffected.
	;ld a, BATTLE_VARS_MOVE_EFFECT
	;call GetBattleVar
	;cp EFFECT_ACCURACY_DOWN_HIT
	;jr z, .DidntMiss

	;call BattleRandom
	;cp $40
	;jr c, .Failed

.DidntMiss

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp COTTON_SPORE
	call z, CheckForGrassType ;ret z if target is a grass type
	jp z, .Failed

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp GROWL
	jr z, .IgnoreSub
	cp SCREECH
	jr z, .IgnoreSub
	cp METAL_SOUND
	jr z, .IgnoreSub
	call CheckSubstituteOpp
	jr nz, .Failed
.IgnoreSub

	ld a, [AttackMissed]
	and a
	jr nz, .Failed

	ld a, [EffectFailed]
	and a
	jr nz, .Failed

	call CheckHiddenOpponent
	jr nz, .Failed

; Accuracy/Evasion reduction don't involve stats.
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .Hit

	push hl
	ld hl, EnemyMonAttack + 1
	ld de, EnemyStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36366
	ld hl, BattleMonAttack + 1
	ld de, PlayerStats
.asm_36366
	call Function3641a
	pop hl
	jr z, .CouldntLower

.Hit
	xor a
	ld [FailedMessage], a
	ret

.CouldntLower
	inc [hl]
.CantLower
	ld a, 3
	ld [FailedMessage], a
	ld a, 1
	ld [AttackMissed], a
	ret

.Failed
	ld a, 1
	ld [FailedMessage], a
	ld [AttackMissed], a
	ret

.Mist
	ld a, 2
	ld [FailedMessage], a
	ld a, 1
	ld [AttackMissed], a
	ret

Function36391:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN + 1
	jr c, .asm_363b0
	cp EFFECT_ATTACK_DOWN_2
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .asm_363b0
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN_HIT + 1
	jr c, .asm_363b0
.asm_363ae
	xor a
	ret
.asm_363b0
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ret

BattleCommand8c:
	ld a, [FailedMessage]
	and a
	ret nz
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	TX_FAR UnknownText_0x1c0cc6
	start_asm

	ld hl, .up
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .wayup
	ret

.wayup
	TX_FAR UnknownText_0x1c0cd0
	db "@"

.up
	TX_FAR UnknownText_0x1c0ce0
	db "@"

BattleCommand8d:
	ld a, [FailedMessage]
	and a
	ret nz
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	TX_FAR UnknownText_0x1c0ceb
	start_asm

	ld hl, .fell
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .sharplyfell
	ret

.sharplyfell
	TX_FAR UnknownText_0x1c0cf5
	db "@"
.fell
	TX_FAR UnknownText_0x1c0d06
	db "@"

Function3641a:
; Lower stat c from stat struct hl (buffer de).

	push bc
	sla c
	ld b, 0
	add hl, bc
	; add de, c
	ld a, c
	add e
	ld e, a
	jr nc, .asm_36426
	inc d
.asm_36426
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .asm_3642f
	ld a, [hl]
	and a
	ret z

.asm_3642f
	ld a, [hBattleTurn]
	and a
	jr z, .Player

	call SwitchTurn
	call Function365d7
	call SwitchTurn
	jr .end

.Player
	call SwitchTurn
	call Function365fd
	call SwitchTurn
.end
	ld a, 1
	and a
	ret

BattleCommand8e:
; statupfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommandaa
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox

BattleCommand8f:
; statdownfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommandaa
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, StdBattleTextBox
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp StdBattleTextBox

GetStatName:
	ld hl, .names
	ld c, "@"
.CheckName
	dec b
	jr z, .Copy
.GetName
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName
.Copy
	ld de, StringBuffer2
	ld bc, StringBuffer3 - StringBuffer2
	jp CopyBytes

.names
	db "ATTACK@"
	db "DEFENSE@"
	db "SPEED@"
	db "SPCL.ATK@"
	db "SPCL.DEF@"
	db "ACCURACY@"
	db "EVASION@"
	db "ABILITY@"

Table0x364e6:
	db 25, 100
	db 28, 100
	db 33, 100
	db 40, 100
	db 50, 100
	db 66, 100

StatLevelMulipliers:
	db  1,  1 ; 1.0x
	db 15, 10 ; 1.5x
	db  2,  1 ; 2.0x
	db 25, 10 ; 2.5x
	db  3,  1 ; 3.0x
	db 35, 10 ; 3.5x
	db  4,  1 ; 4.0x

BattleCommanda4:
; allstatsup

; Attack
	call ResetMiss
	call BattleCommand70
	call BattleCommand8c

; Defense
	call ResetMiss
	call BattleCommand71
	call BattleCommand8c

; Speed
	call ResetMiss
	call BattleCommand72
	call BattleCommand8c

; Special Attack
	call ResetMiss
	call BattleCommand73
	call BattleCommand8c

; Special Defense
	call ResetMiss
	call BattleCommand74
	jp   BattleCommand8c

ResetMiss:
	xor a
	ld [AttackMissed], a
	ret

Function36532:
	ld [LoweredStat], a

	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36540
	ld hl, EnemyStatLevels

.asm_36540
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .asm_36589

	ld a, [LoweredStat]
	and $f0
	jr z, .asm_36558
	dec b
	jr nz, .asm_36558
	inc b

.asm_36558
	ld [hl], b
	ld a, c
	cp 5
	jr nc, .asm_36576

	push hl
	ld hl, BattleMonStats + 1
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36570
	ld hl, EnemyMonStats + 1
	ld de, EnemyStats

.asm_36570
	call Function3641a
	pop hl
	jr z, .asm_36588

.asm_36576
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36580

	call Function365fd

	jr .asm_36583

.asm_36580
	call Function365d7

.asm_36583
	xor a
	ld [FailedMessage], a
	ret

.asm_36588
	inc [hl]

.asm_36589
	ld a, 2
	ld [FailedMessage], a
	ret

BattleCommandac:
; tristatuschance

	call BattleCommand90

; 1/3 chance of each status
.loop
	call BattleRandom
	swap a
	and 3
	jr z, .loop
; jump
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret
.ptrs
	dw BattleCommand19 ; paralyze
	dw BattleCommand18 ; freeze
	dw BattleCommand17 ; burn

BattleCommandaf:
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret

BattleCommanda6:
	ld hl, Function3f43d
	ld a, [hBattleTurn]
	and a
	jr z, .asm_365ba
	ld hl, Function3f47c
.asm_365ba
	xor a
	ld [$ffd4], a
	call CallBattleCore
	jp WaitBGMap

BattleCommanda7:
	ld hl, Function3f447
	ld a, [hBattleTurn]
	and a
	jr z, .asm_365ce
	ld hl, Function3f486
.asm_365ce
	xor a
	ld [$ffd4], a
	call CallBattleCore
	jp WaitBGMap

Function365d7:
	ld hl, PlayerAtkLevel
	ld de, PlayerStats
	ld bc, BattleMonAttack

	ld a, $5
	call Function3661d

	ld hl, BadgeStatBoosts
	call CallBattleCore

	call SwitchTurn

	ld hl, Function3ec39
	call CallBattleCore

	ld hl, Function3ec76
	call CallBattleCore

	jp SwitchTurn

Function365fd:
	ld hl, EnemyAtkLevel
	ld de, EnemyStats
	ld bc, EnemyMonAttack

	ld a, $5
	call Function3661d

	call SwitchTurn

	ld hl, Function3ec39
	call CallBattleCore

	ld hl, Function3ec76
	call CallBattleCore

	jp SwitchTurn

Function3661d:
.asm_3661d
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, Table0x364e6
	add hl, bc
	add hl, bc

	xor a
	ld [hMultiplicand], a
	ld a, [de]
	ld [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ld [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ld [hMultiplier], a
	call Multiply

	ld a, [hl]
	ld [hDivisor], a
	ld b, 4
	call Divide

	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	or b
	jr nz, .asm_36651

	ld a, 1
	ld [hQuotient + 2], a
	jr .asm_36662

.asm_36651
	ld a, [hQuotient + 2]
	cp 999 % $100
	ld a, b
	sbc 999 / $100
	jr c, .asm_36662

	ld a, 999 % $100
	ld [$ffb6], a
	ld a, 999 / $100
	ld [$ffb5], a

.asm_36662
	pop bc
	ld a, [$ffb5]
	ld [bc], a
	inc bc
	ld a, [$ffb6]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .asm_3661d

	ret

BattleCommand21:
; storeenergy

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_BIDE, a
	ret z

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36684
	ld hl, EnemyRolloutCount
.asm_36684
	dec [hl]
	jr nz, .asm_366dc

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_BIDE, [hl]

	ld hl, UnleashedEnergyText
	call StdBattleTextBox

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld a, 1
	ld [hl], a
	ld hl, PlayerDamageTaken + 1
	ld de, wc732
	ld a, [hBattleTurn]
	and a
	jr z, .asm_366ad
	ld hl, EnemyDamageTaken + 1
	ld de, wc733
.asm_366ad
	ld a, [hld]
	add a
	ld b, a
	ld [CurDamage + 1], a
	ld a, [hl]
	rl a
	ld [CurDamage], a
	jr nc, .asm_366c3
	ld a, $ff
	ld [CurDamage], a
	ld [CurDamage + 1], a
.asm_366c3
	or b
	jr nz, .asm_366cb
	ld a, 1
	ld [AttackMissed], a
.asm_366cb
	xor a
	ld [hli], a
	ld [hl], a
	ld [de], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, BIDE
	ld [hl], a

	ld b, $22 ; unleashenergy
	jp SkipToBattleCommand

.asm_366dc
	ld hl, StoringEnergyText
	call StdBattleTextBox
	jp EndMoveEffect

BattleCommand22:
; unleashenergy

	ld de, PlayerDamageTaken
	ld bc, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_366f6
	ld de, EnemyDamageTaken
	ld bc, EnemyRolloutCount
.asm_366f6
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_BIDE, [hl]
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [wPlayerMoveStructEffect], a
	ld [wEnemyMoveStructEffect], a
	;call BattleRandom
	;and 1
	;inc a
	;inc a
	ld a, 2
	ld [bc], a
	ld a, 1
	ld [wc689], a
	call AnimateCurrentMove
	jp EndMoveEffect

BattleCommand3e:
; checkrampage

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36725
	ld de, EnemyRolloutCount
.asm_36725
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	; Check remaining turns
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .already_rampaging
	; We're done rampaging
	res SUBSTATUS_RAMPAGE, [hl]
.already_rampaging
	ld b, $3d ; rampage
	jp SkipToBattleCommand

BattleCommand3d:
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
	call BattleRandom
	and 1
	inc a
	ld [de], a
	ld a, 1
	ld [wc73e], a
	ret

BattleCommanda0:
; teleport

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_SUICUNE
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr z, .NotTrapped
	ld a, BATTLE_VARS_TYPE_1
	call GetBattleVar
	cp GHOST
	jr z, .NotTrapped
	ld a, BATTLE_VARS_TYPE_2
	call GetBattleVar
	cp GHOST
	jr nz, .failed
.NotTrapped
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_367bf
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .asm_367df
	add b
	ld c, a
	inc c
.asm_367ac
	call BattleRandom
	cp c
	jr nc, .asm_367ac
	srl b
	srl b
	cp b
	jr nc, .asm_367df

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.asm_367bf
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jr nc, .asm_367df
	add b
	ld c, a
	inc c
.asm_367d2
	call BattleRandom
	cp c
	jr nc, .asm_367d2
	srl b
	srl b
	cp b
	jr nc, .asm_367df
.asm_367df
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	ld [wc689], a
	call Function36804
	call BattleCommand0a
	call Function37e36
	ld c, 20
	call DelayFrames
	call Function36804

	ld hl, FledFromBattleText
	jp StdBattleTextBox

Function36804:
	ld a, [wd0ee]
	and $c0
	or $2
	ld [wd0ee], a
	ret

BattleCommand23:
; forceswitch

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jp z, .asm_36969
	cp $9
	jp z, .asm_36969
	cp BATTLETYPE_CELEBI
	jp z, .asm_36969
	cp BATTLETYPE_SUICUNE
	jp z, .asm_36969
	ld a, [hBattleTurn]
	and a
	jp nz, .asm_368cd
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36852
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_36869
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .asm_36855
	add b
	ld c, a
	inc c
.asm_36845
	call BattleRandom
	cp c
	jr nc, .asm_36845
	srl b
	srl b
	cp b
	jr nc, .asm_36855
.asm_36852
	jp .asm_36969
.asm_36855
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	call Function36804
	ld a, [wPlayerMoveStructAnimation]
	jp .asm_36975
.asm_36869
	call CountEnemyAliveMons
	jr c, .asm_368ca
	ld a, [wc70f]
	and a
	jr z, .asm_368ca
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wc689], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	ld bc, $040a
	call ClearBox
	ld c, $14
	call DelayFrames
	ld a, [OTPartyCount]
	ld b, a
	ld a, [CurOTMon]
	ld c, a
.asm_3689a
	call BattleRandom
	and $7
	cp b
	jr nc, .asm_3689a
	cp c
	jr z, .asm_3689a
	push af
	push bc
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .asm_3689a
	ld a, d
	inc a
	ld [wWhichEnemyMon], a
	callab Function3d4c3

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.asm_368ca
	jp .asm_36969

.asm_368cd
	ld a, [AttackMissed]
	and a
	jr nz, .asm_368f3

	ld a, [wBattleMode]
	dec a
	jr nz, .asm_36908

	ld a, [BattleMonLevel]
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jr nc, .asm_368f5

	add b
	ld c, a
	inc c
.asm_368e6
	call BattleRandom
	cp c
	jr nc, .asm_368e6

	srl b
	srl b
	cp b
	jr nc, .asm_368f5

.asm_368f3
	jr .asm_36969

.asm_368f5
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	call Function36804
	ld a, [wEnemyMoveStructAnimation]
	jr .asm_36975

.asm_36908
	call Function36994
	jr c, .asm_36969

	ld a, [wc70f]
	cp $1
	jr z, .asm_368ca

	call UpdateBattleMonInParty
	ld a, $1
	ld [wc689], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 9, 7
	ld bc, $050b
	call ClearBox
	ld c, $14
	call DelayFrames
	ld a, [PartyCount]
	ld b, a
	ld a, [CurBattleMon]
	ld c, a
.asm_3693a
	call BattleRandom
	and $7
	cp b
	jr nc, .asm_3693a

	cp c
	jr z, .asm_3693a

	push af
	push bc
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .asm_3693a

	ld a, d
	ld [CurPartyMon], a
	ld hl, Function3db32
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.asm_36969
	call BattleCommand0a
	call BattleCommandaa
	call BattleCommand0c
	jp PrintButItFailed

.asm_36975
	push af
	call Function36804
	ld a, $1
	ld [wc689], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	pop af

	ld hl, FledInFearText
	cp $2e
	jr z, .asm_36991
	ld hl, BlownAwayText
.asm_36991
	jp StdBattleTextBox

Function36994:
	ld a, [PartyCount]
	ld d, a
	ld e, 0
	ld bc, PartyMon2 - PartyMon1
.asm_3699d
	ld a, [CurBattleMon]
	cp e
	jr z, .asm_369ae

	ld a, e
	ld hl, PartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .asm_369b4

.asm_369ae
	inc e
	dec d
	jr nz, .asm_3699d

	scf
	ret

.asm_369b4
	and a
	ret

BattleCommand24:
; endloop

; Loop back to the command before 'critical'.

	ld de, PlayerRolloutCount
	ld bc, PlayerDamageTaken
	ld a, [hBattleTurn]
	and a
	jr z, .asm_369c7
	ld de, EnemyRolloutCount
	ld bc, EnemyDamageTaken
.asm_369c7

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .asm_36a43 ;if in loop, dec loop counter
	set SUBSTATUS_IN_LOOP, [hl] ;set in-loop
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl] ;redundent?
	cp EFFECT_TWINEEDLE
	jr z, .asm_36a3f ;if TWINEEDLE, load 1 more hit
	cp EFFECT_DOUBLE_HIT
	ld a, $1 ;if double hit, load 1 more hit and jump somewhere different
	jr z, .asm_36a3a
	ld a, [hl]
	cp EFFECT_BEAT_UP
	jr z, .asm_369fb ;if beat up, branch
	cp EFFECT_TRIPLE_KICK
	jr nz, .asm_36a2b
.asm_369ec ;if triple kick
	call BattleRandom
	and $3 ;random from 0-3
	jr z, .asm_369ec ; 1-3
	dec a ; 0-2
	jr nz, .asm_36a3a ;if 1 or 2, branch
	ld a, $1
	ld [bc], a ;else load 1 into damage dealt
	jr .asm_36a48 ;jump

.asm_369fb ;beat up
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_36a0b
	ld a, [PartyCount]
	cp $1
	jp z, .asm_36a1e
	dec a
	jr .asm_36a3a
.asm_36a0b
	ld a, [wBattleMode]
	cp $1
	jp z, .asm_36a1e
	ld a, [OTPartyCount]
	cp $1
	jp z, .asm_36a1e
	dec a
	jr .asm_36a3a
.asm_36a1e
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
	call BattleCommanda8
	jp EndMoveEffect

.asm_36a2b ;normal multi-hit
	call BattleRandom
	and $3 ;rand from 0-3
	cp $2
	jr c, .asm_36a39 ;if 2 or 3, reroll
	call BattleRandom
	and $3
.asm_36a39
	inc a ;+1 (1-4)

.asm_36a3a ;a = 1 if double kick, 1-2 if triple kick, 1-4 if random hits
	ld [de], a ;load into de and it+1 into bc
	inc a
	ld [bc], a
	jr .asm_36a6b
.asm_36a3f ;if TWINEEDLE
	ld a, $1
	jr .asm_36a3a

.asm_36a43 ;if in loop
	ld a, [de]
	dec a
	ld [de], a ;dec de
	jr nz, .asm_36a6b ;if not zero, loop
.asm_36a48
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl] ;reset in-loop

	ld hl, PlayerHitTimesText ;load hit number text
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36a5a
	ld hl, EnemyHitTimesText
.asm_36a5a

	push bc
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_BEAT_UP
	jr z, .asm_36a67
	call StdBattleTextBox
.asm_36a67

	pop bc
	xor a
	ld [bc], a
	ret

; Loop back to the command before 'critical'.
.asm_36a6b
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, [BattleScriptBufferLoc]
	ld l, a
.asm_36a73
	ld a, [hld]
	cp $5 ; critical
	jr nz, .asm_36a73
	inc hl
	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	ld a, l
	ld [BattleScriptBufferLoc], a
	ret

BattleCommand94:
	ld a, [AttackMissed]
	and a
	ret nz

	call CheckSubstituteOpp
	jr nz, .asm_36a9a

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	jr nz, .asm_36a9a

	call Function36abf
	jr z, Function36ab5

.asm_36a9a
	ld a, 1
	ld [AttackMissed], a
	ret

BattleCommand25:
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	ret nz

	call Function36abf
	ret nz

	ld a, [EffectFailed]
	and a
	ret nz

Function36ab5:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp

Function36abf:
	push bc
	ld a, [wc70f]
	ld b, a
	ld a, [hBattleTurn]
	xor b
	pop bc
	ret

BattleCommand4d:
; kingsrock

	ld a, [AttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp HELD_TRADE_EVOLVE ; Only King's Rock has this effect
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret

BattleCommand26:
; ohko

	call ResetDamage
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36b2f
	ld hl, EnemyMonLevel
	ld de, BattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36b12
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.asm_36b12
	ld a, [de]
	sub [hl]
	jr c, .asm_36b2f
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .asm_36b1e
	ld a, $ff
.asm_36b1e
	ld [bc], a
	call BattleCommand09
	ld hl, CurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [CriticalHit], a
	ret
.asm_36b2f
	ld a, $ff
	ld [CriticalHit], a
	ld a, $1
	ld [AttackMissed], a
	ret

BattleCommand3a:
; checkcharge

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	ld b, $39 ; charge
	jp SkipToBattleCommand

BattleCommand39:
; charge

	call BattleCommand38
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .asm_36b65

	call BattleCommandaa
	call BattleCommand0c
	call PrintButItFailed
	jp EndMoveEffect

.asm_36b65
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [AlreadyDisobeyed]
	and a
	call nz, StdBattleTextBox

	call BattleCommand0a
	xor a
	ld [wcfca], a
	inc a
	ld [wc689], a
	call Function37e36
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .asm_36b96
	cp DIG
	jr z, .asm_36b96
	call BattleCommand0c
	jr .asm_36b99
.asm_36b96
	call Function37ec0
.asm_36b99
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	cp FLY
	jr z, .asm_36bb0
	cp DIG
	jr nz, .asm_36bb2
	set SUBSTATUS_UNDERGROUND, [hl]
	jr .asm_36bb2

.asm_36bb0
	set SUBSTATUS_FLYING, [hl]

.asm_36bb2
	call Function34548
	jr nz, .asm_36bc3
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.asm_36bc3
	call ResetDamage

	ld hl, .UsedText
	call BattleTextBox

	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonItem
	jr z, .got_item
	ld hl, EnemyMonItem
.got_item
	ld a, [hl]
	cp POWER_HERB
	jp nz, EndMoveEffect
	callba ConsumeUsersItem
	ld hl, .PowerHerbText
	jp BattleTextBox

.UsedText
	TX_FAR UnknownText_0x1c0d0e ; "[USER]"
	start_asm

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	;cp RAZOR_WIND
	;ld hl, .RazorWind
	;jr z, .done

	cp SOLARBEAM
	ld hl, .Solarbeam
	jr z, .done

	;cp SKULL_BASH
	;ld hl, .SkullBash
	;jr z, .done

	cp SKY_ATTACK
	ld hl, .SkyAttack
	jr z, .done

	cp FLY
	ld hl, .Fly
	jr z, .done

	cp DIG
	ld hl, .Dig

.done
	ret

.RazorWind
; 'made a whirlwind!'
	TX_FAR UnknownText_0x1c0d12
	db "@"

.Solarbeam
; 'took in sunlight!'
	TX_FAR UnknownText_0x1c0d26
	db "@"

.SkullBash
; 'lowered its head!'
	TX_FAR UnknownText_0x1c0d3a
	db "@"

.SkyAttack
; 'is glowing!'
	TX_FAR UnknownText_0x1c0d4e
	db "@"

.Fly
; 'flew up high!'
	TX_FAR UnknownText_0x1c0d5c
	db "@"

.Dig
; 'dug a hole!'
	TX_FAR UnknownText_0x1c0d6c
	db "@"

.PowerHerbText
	TX_FAR _PowerHerbText
	db "@"

BattleCommand3c:
; unused
	ret

BattleCommand3b:
; traptarget

	ld a, [AttackMissed]
	and a
	ret nz
	ld hl, wc731
	ld de, wc72f
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36c43
	ld hl, wc730
	ld de, wc72e

.asm_36c43
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	and 1 ;changed from 2-5 turns to 4-5 turns
	add 4
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	ld b, a
	ld hl, .Traps

.asm_36c61
	ld a, [hli]
	cp b
	jr z, .asm_36c69
	inc hl
	inc hl
	jr .asm_36c61

.asm_36c69
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.Traps
	;dbw BIND,      UsedBindText      ; 'used BIND on'
	dbw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dbw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dbw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dbw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'

BattleCommand28:
; mist

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_MIST, [hl]
	jr nz, .asm_36c92
	set SUBSTATUS_MIST, [hl]
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextBox
.asm_36c92
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand29:
; focusenergy

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr nz, .asm_36cac
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	call AnimateCurrentMove
	ld hl, GettingPumpedText
	jp StdBattleTextBox
.asm_36cac
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand27:
; recoil

	ld hl, BattleMonMaxHP ;load correct side
	ld a, [hBattleTurn]
	and a
	ld a, [LastPlayerMove]
	jr z, .asm_36cbd
	ld hl, EnemyMonMaxHP
	ld a, [LastEnemyMove]
.asm_36cbd
	cp STRUGGLE ;handle struggle seperatly
	jp z, .Struggle
	cp DOUBLE_EDGE
	jr z, .ThirdRecoil
	cp FLARE_BLITZ
	jr z, .ThirdRecoil
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
	ld a, [CurDamage]
	ld b, a
	ld a, [CurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .asm_36cd8
	inc c
.asm_36cd8
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a ;put enemy mon max HP in buffer
	dec hl
	dec hl
	ld a, [hl]
	ld [wd1ec], a
	sub c
	ld [hld], a
	ld [wd1ee], a
	ld a, [hl]
	ld [wd1ed], a
	sbc b
	ld [hl], a
	ld [wd1ef], a
	jr nc, .asm_36cfe
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wd1ee
	ld [hli], a
	ld [hl], a
.asm_36cfe
	hlcoord 10, 9
	ld a, [hBattleTurn]
	and a
	ld a, $1
	jr z, .asm_36d0c
	hlcoord 2, 2
	xor a
.asm_36d0c
	ld [wWhichHPBar], a
	predef Predef_HPBarAnim
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextBox

.ThirdRecoil ;1/3 of HP instead of 1/4
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
	ld a, [CurDamage]
	ld [hDividend], a
	ld a, [CurDamage + 1]
	ld [hDividend + 1], a
	ld a, 3
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 2]
	ld c, a
	ld a, [hQuotient + 1]
	ld b, a
	or c
	jr z, .asm_36cd8
	inc c
	jr .asm_36cd8

.Struggle:
	ld hl, GetQuarterMaxHP
	call CallBattleCore
	ld hl, Function3cc3f
	call CallBattleCore
	call UpdateUserInParty
	ld hl, RecoilText
	jp StdBattleTextBox

BattleCommand2b:
; confusetarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function37962
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr Function36d70

BattleCommand2a:
; confuse

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, .asm_36d53
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.asm_36d53
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .asm_36d65
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextBox

.asm_36d65
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp SUPERSONIC
	jr z, .IgnoreSub
	call CheckSubstituteOpp
	jr nz, Function36db6
.IgnoreSub
	ld a, [AttackMissed]
	and a
	jr nz, Function36db6

Function36d70:
	ld bc, EnemyConfuseCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36d7b
	ld bc, PlayerConfuseCount

.asm_36d7b
	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and 3
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .asm_36d99
	cp EFFECT_SNORE
	jr z, .asm_36d99
	cp EFFECT_SWAGGER
	jr z, .asm_36d99
	call AnimateCurrentMove

.asm_36d99
	ld de, ANIM_CONFUSED
	call Function37e54

	ld hl, BecameConfusedText
	call StdBattleTextBox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .asm_36db0
	cp HELD_HEAL_CONFUSION
	ret nz
.asm_36db0
	ld hl, Function3de51
	jp CallBattleCore

Function36db6:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2

CheckForGrassType: ;ret z if opposing mon is a grass type
	ld a, BATTLE_VARS_TYPE_1OPP
	call GetBattleVarAddr
	cp GRASS
	ret z
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVarAddr
	cp GRASS
	ret

BattleCommand30:
; paralyze

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PAR, a
	jr nz, .asm_36e49
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36e55

	ld a, BATTLE_VARS_TYPE_1OPP ;electric immunity to prz
	call GetBattleVarAddr
	cp ELECTRIC
	jr z, .asm_36e55
	ld a, BATTLE_VARS_TYPE_2OPP
	call GetBattleVarAddr
	cp ELECTRIC
	jr z, .asm_36e55

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp STUN_SPORE
	call z, CheckForGrassType ;ret z if target is a grass type
	jr z, .asm_36e55

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .asm_36def
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.asm_36def
	;ld a, [hBattleTurn] Removed chance of miss for ai
	;and a
	;jr z, .asm_36e0e
	;ld a, [wLinkMode]
	;and a
	;jr nz, .asm_36e0e
	;ld a, [InBattleTowerBattle]
	;and a
	;jr nz, .asm_36e0e
	;ld a, [PlayerSubStatus5]
	;bit SUBSTATUS_LOCK_ON, a
	;jr nz, .asm_36e0e
	;call BattleRandom
	;cp $40
	;jr c, .asm_36e52
.asm_36e0e
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .asm_36e52
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36e52
	call CheckSubstituteOpp
	jr nz, .asm_36e52
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ld [$ffd4], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, Function3ec39
	call CallBattleCore
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, Function3dde9
	jp CallBattleCore
.asm_36e49
	call AnimateFailedMove
	ld hl, AlreadyParalyzedText
	jp StdBattleTextBox
.asm_36e52
	jp PrintDidntAffect2
.asm_36e55
	call AnimateFailedMove
	jp PrintDoesntAffect

Function36e5b:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).

	push hl

	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonType1
.ok

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and $1f
	cp NORMAL
	jr z, .normal

	cp [hl]
	jr z, .return

	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret

BattleCommand31:
; substitute

	call BattleCommandaa
	ld hl, BattleMonMaxHP
	ld de, PlayerSubstituteHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, EnemyMonMaxHP
	ld de, EnemySubstituteHP
.got_hp

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .asm_36ef4

	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	dec hl
	dec hl
	ld a, b
	ld [de], a
	ld a, [hld]
	sub b
	ld e, a
	ld a, [hl]
	sbc 0
	ld d, a
	jr c, .asm_36eff
	ld a, d
	or e
	jr z, .asm_36eff
	ld [hl], d
	inc hl
	ld [hl], e

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, wc730
	ld de, wc72e
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36ecf
	ld hl, wc731
	ld de, wc72f
.asm_36ecf

	xor a
	ld [hl], a
	ld [de], a
	call Function37ed5
	jr c, .asm_36ee8

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld [wc689], a
	ld a, SUBSTITUTE
	call Function37e44
	jr .asm_36eeb

.asm_36ee8
	call BattleCommanda6
.asm_36eeb
	ld hl, MadeSubstituteText
	call StdBattleTextBox
	jp RefreshBattleHuds

.asm_36ef4
	call Function34548
	call nz, BattleCommand0c
	ld hl, HasSubstituteText
	jr .asm_36f08

.asm_36eff
	call Function34548
	call nz, BattleCommand0c
	ld hl, TooWeakSubText
.asm_36f08
	jp StdBattleTextBox

BattleCommand32:
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret

EndRechargeOpp:
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret

BattleCommand97:
; rage
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RAGE, [hl]
	ret

BattleCommand98:
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage

BattleCommand99:
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

DoubleDamage:
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .quit

	ld a, $ff
	ld [hli], a
	ld [hl], a
.quit
	ret

BattleCommand33:
; mimic

	call Function372d8
	call BattleCommandaa
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36f9a ;if missed, fail
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36f5d
	ld hl, EnemyMonMoves ;load correct moves in
.asm_36f5d
	call CheckHiddenOpponent
	jr nz, .asm_36f9a ;if hidden, fail
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_36f9a
	cp STRUGGLE
	jr z, .asm_36f9a ;if no last move or is struggle, fail
	ld b, a ;store in b
	ld c, NUM_MOVES
.asm_36f71
	ld a, [hli]
	cp b
	jr z, .asm_36f9a ;if already known, fail
	dec c
	jr nz, .asm_36f71 ;loop 4 times
	dec hl
.asm_36f79
	ld a, [hld]
	cp MIMIC
	jr nz, .asm_36f79 ;loop back to find mimic's slot
	inc hl

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wd265], a
	push af
	push hl
	dec a
	ld hl, Moves + MOVE_PP ;(move pp)
	ld bc, MOVE_LENGTH
	call AddNTimes ;go down to move in database, over PP
	ld a, BANK(Moves)
	call GetFarByte ;get total PP
	ld b, a
	pop hl
	pop af
	push bc

	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc

	pop bc

	ld [hl], b ;load in pp
	call GetMoveName
	call AnimateCurrentMove
	ld hl, LearnedMoveText
	jp StdBattleTextBox
.asm_36f9a
	jp Function37357

BattleCommand35:
; leechseed
	ld a, [AttackMissed]
	and a
	jr nz, .evaded
	call CheckSubstituteOpp
	jr nz, .evaded

	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, BattleMonType1
.ok

	ld a, [de]
	cp GRASS
	jr z, .grass
	inc de
	ld a, [de]
	cp GRASS
	jr z, .grass

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .evaded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
	jp StdBattleTextBox

.grass
	call AnimateFailedMove
	jp PrintDoesntAffect

.evaded
	call AnimateFailedMove
	ld hl, EvadedText
	jp StdBattleTextBox

BattleCommand36:
	call AnimateCurrentMove
	callba Function1060e5
	jp PrintNothingHappened

BattleCommand37:
; disable

	ld a, [AttackMissed]
	and a
	jr nz, .asm_37059

	ld de, EnemyDisableCount
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37004
	ld de, PlayerDisableCount
	ld hl, BattleMonMoves
.asm_37004

	ld a, [de]
	and a
	jr nz, .asm_37059 ;fail if already disabled

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_37059 ;skip if no move or struggle was last move used
	cp STRUGGLE
	jr z, .asm_37059

	ld b, a ;load move into b
	ld c, $ff
.asm_37017
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_37017 ;c = slot of move disabled

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonPP
	jr z, .asm_37027
	ld hl, BattleMonPP
.asm_37027
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_37059 ;if diabled move is out of pp, fail
.asm_3702e
	;call BattleRandom
	;and 7
	;jr z, .asm_3702e ;1-7
	;inc a ;2-8
	ld a, 5
	inc c
	swap c
	add c ;add movedisabled to back nyble
	ld [de], a ;load into disabled turns
	call AnimateCurrentMove
	ld hl, DisabledMove
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37047
	inc hl
.asm_37047
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wd265], a
	call GetMoveName
	ld hl, WasDisabledText
	jp StdBattleTextBox
.asm_37059
	jp Function37354

BattleCommand1e:
; payday

	xor a
	ld hl, StringBuffer1
	ld [hli], a

	ld a, [hBattleTurn]
	and a
	ld a, [BattleMonLevel]
	jr z, .ok
	ld a, [EnemyMonLevel]
.ok

	ld c, a
	ld b, 0
	ld hl, 0
	add hl, bc
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	ld hl, wPayDayMoney + 2
	ld a, c
	add [hl]
	ld [hld], a
	ld a, b
	adc [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
.done
	ld hl, CoinsScatteredText
	jp StdBattleTextBox

BattleCommand1f:
; conversion

	ld hl, BattleMonMoves
	ld de, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37090
	ld hl, EnemyMonMoves
	ld de, EnemyMonType1
.asm_37090
	push de
	ld c, 0
	ld de, StringBuffer1
.asm_37096
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_370b2
	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	and $1f
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_37096
.asm_370b2
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, StringBuffer1
.asm_370bd
	ld a, [hl]
	cp $ff
	jr z, .asm_370d3
	cp CURSE_T
	jr z, .asm_370d0
	ld a, [de]
	cp [hl]
	jr z, .asm_370d0
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .asm_370d9_a
.asm_370d0
	inc hl
	jr .asm_370bd
.asm_370d3
	call AnimateFailedMove
	jp PrintButItFailed
.asm_370d9_a
.asm_370d9_b
	call BattleRandom
	and 3 ; TODO factor in NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, StringBuffer1
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_370d9_b
	cp CURSE_T
	jr z, .asm_370d9_b
	ld a, [de]
	cp [hl]
	jr z, .asm_370d9_b
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .asm_370d9_b
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wd265], a
	callba GetTypeName
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextBox

BattleCommand20:
; resetstats

	ld a, 7 ; neutral
	ld hl, PlayerStatLevels
	call .Fill
	ld hl, EnemyStatLevels
	call .Fill

	ld a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call Function365d7
	call SetEnemyTurn
	call Function365fd

	pop af
	ld [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextBox

.Fill
	ld b, PlayerStatLevelsEnd - PlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret

BattleCommand2c:
; heal

	ld de, BattleMonHP
	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3714f
	ld de, EnemyMonHP
	ld hl, EnemyMonMaxHP
.asm_3714f
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call StringCmp
	pop bc
	pop de
	pop hl
	jp z, .asm_371c4
	ld a, b
	cp REST
	jr nz, .asm_37199
	push hl
	push bc
	ld bc, EnemyMonStatus - EnemyMonMaxHP
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	and $7
	jr nz, .already_asleep
	xor a
	push hl
	push de
	push af
	call BattleCommandaa
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_TURNS + 1
	ld hl, WentToSleepText
	jr z, .asm_37186
	ld hl, RestedText
.asm_37186
	call StdBattleTextBox
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37193
	call Function365d7
	jr .asm_37196
.asm_37193
	call Function365fd
.asm_37196
	pop af
	pop de
	pop hl
.asm_37199
	jr z, .asm_371a3
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .asm_371a9
.asm_371a3
	ld hl, GetMaxHP
	call CallBattleCore
.asm_371a9
	call AnimateCurrentMove
	call SwitchTurn
	ld hl, Function3ccef
	call CallBattleCore
	call SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.asm_371c4
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextBox

.already_asleep
	call AnimateFailedMove
	ld hl, UserAlreadyAsleepText
	jp StdBattleTextBox

BattleCommand2d:
; transform

	call Function372d8
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, Function372d2
	call CheckHiddenOpponent
	jp nz, Function372d2
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $1
	ld [wc689], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	jr z, .asm_37200
	call Function34548
	jr nz, .asm_37200
	ld a, SUBSTITUTE
	call Function37e44
.asm_37200
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	ld hl, BattleMonSpecies
	ld de, EnemyMonSpecies
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3721f
	ld hl, EnemyMonSpecies
	ld de, BattleMonSpecies
	xor a
	ld [CurMoveNum], a
.asm_3721f
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3723a
	ld a, [de]
	ld [wc6f2], a
	inc de
	ld a, [de]
	ld [wc6f2 + 1], a
	dec de
.asm_3723a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld bc, $000c
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, $000c
	call CopyBytes
	ld bc, $ffe2
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, $ffe8
	add hl, bc
	ld b, NUM_MOVES
.asm_3725f
	ld a, [de]
	inc de
	and a
	jr z, .asm_3726c
	cp SKETCH
	ld a, 1
	jr z, .asm_3726c
	ld a, 5
.asm_3726c
	ld [hli], a
	dec b
	jr nz, .asm_3725f
	pop hl
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, EnemyStats
	ld de, PlayerStats
	ld bc, $000a
	call BattleSideCopy
	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld bc, $0008
	call BattleSideCopy
	call Function37ed5
	jr c, .asm_372a8
	ld a, [hBattleTurn]
	and a
	ld a, [wc6fe]
	jr z, .asm_372a0
	ld a, [wc6fa]
.asm_372a0
	and a
	jr nz, .asm_372a8
	call Function37e36
	jr .asm_372ae
.asm_372a8
	call BattleCommandaa
	call BattleCommanda6
.asm_372ae
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [wc689], a
	pop af
	ld a, SUBSTITUTE
	call nz, Function37e44
	ld hl, TransformedText
	jp StdBattleTextBox

BattleSideCopy:
; Copy bc bytes from hl to de if it's the player's turn.
; Copy bc bytes from de to hl if it's the enemy's turn.
	ld a, [hBattleTurn]
	and a
	jr z, .copy

; Swap hl and de
	push hl
	ld h, d
	ld l, e
	pop de
.copy
	jp CopyBytes

Function372d2:
	call AnimateFailedMove
	jp PrintButItFailed

Function372d8:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret

ResetActorDisable:
	ld a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [EnemyDisableCount], a
	ld [EnemyDisabledMove], a
	ret

.player
	xor a
	ld [PlayerDisableCount], a
	ld [DisabledMove], a
	ret

BattleCommand2e:
; screen

	ld hl, PlayerScreens
	ld bc, PlayerLightScreenCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3730d
	ld hl, EnemyScreens
	ld bc, EnemyLightScreenCount

.asm_3730d
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, 5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .asm_37331

.Reflect
	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]

	; LightScreenCount -> ReflectCount
	inc bc

	ld a, 5
	ld [bc], a
	ld hl, ReflectEffectText

.asm_37331
	call AnimateCurrentMove
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

PrintDoesntAffect:
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp StdBattleTextBox

PrintNothingHappened:
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp StdBattleTextBox

TryPrintButItFailed:
	ld a, [AlreadyFailed]
	and a
	ret nz

PrintButItFailed:
; 'but it failed!'
	ld hl, ButItFailedText
	jp StdBattleTextBox

Function37354:
	call AnimateFailedMove

Function37357:
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp Function35157

PrintDidntAffect:
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp StdBattleTextBox

PrintDidntAffect2:
	call AnimateFailedMove
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp Function35157

PrintParalyze:
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextBox

CheckSubstituteOpp:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret

BattleCommand1a:
; selfdestruct
	callba Function10610d
	ld a, $4
	ld [wcfca], a
	ld c, $3
	call DelayFrames
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hli], a
	inc hl
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [wc689], a
	call BattleCommand0a
	call Function37e36
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_LEECH_SEED, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	call Function37ed5
	ret nc
	callba DrawPlayerHUD
	callba DrawEnemyHUD
	call WaitBGMap
	jp RefreshBattleHuds

INCLUDE "battle/effects/mirror_move.asm"

INCLUDE "battle/effects/metronome.asm"

CheckUserMove:
; Return z if the user has move a.
	ld b, a
	ld de, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret

ResetTurn:
	ld hl, wc732
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37486
	ld hl, wc733

.asm_37486
	ld [hl], 1
	xor a
	ld [AlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect

INCLUDE "battle/effects/thief.asm"

BattleCommand51:
; arenatrap

; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

INCLUDE "battle/effects/nightmare.asm"

BattleCommand53:
; defrost

; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ld a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, PartyMon1Status - PartyMon1
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextBox

INCLUDE "battle/effects/curse.asm"

INCLUDE "battle/effects/protect.asm"

INCLUDE "battle/effects/endure.asm"

INCLUDE "battle/effects/spikes.asm"

INCLUDE "battle/effects/foresight.asm"

INCLUDE "battle/effects/perish_song.asm"

INCLUDE "battle/effects/sandstorm.asm"

INCLUDE "battle/effects/rollout.asm"

BattleCommand5d:
; unused
	ret

BattleCommand5e:
; furycutter

	ld hl, PlayerFuryCutterCount
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, EnemyFuryCutterCount

.go
	ld a, [AttackMissed]
	and a
	jp nz, ResetFuryCutterCount

	inc [hl]

; Damage capped at 3 turns' worth (4x).
	ld a, [hl]
	ld b, a
	cp 4
	jr c, .checkdouble
	ld b, 3

.checkdouble
	dec b
	ret z

; Double the damage
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .checkdouble

; No overflow
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

ResetFuryCutterCount:

	push hl

	ld hl, PlayerFuryCutterCount
	ld a, [hBattleTurn]
	and a
	jr z, .reset
	ld hl, EnemyFuryCutterCount

.reset
	xor a
	ld [hl], a

	pop hl
	ret

BattleCommand5f:
; attract
	ld a, [AttackMissed]
	and a
	jr nz, .failed
	call Function377f5
	jr c, .failed
	call CheckHiddenOpponent
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jr nz, .failed

	set SUBSTATUS_IN_LOVE, [hl]
	call AnimateCurrentMove

; 'fell in love!'
	ld hl, FellInLoveText
	jp StdBattleTextBox

.failed
	jp Function37354

Function377f5:
	ld a, PartyMon1Species - PartyMon1
	call BattlePartyAttr
	ld a, [hl]
	ld [CurPartySpecies], a

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	xor a
	ld [MonType], a

	callba GetGender
	jr c, .asm_37849

	ld b, 1
	jr nz, .asm_37815
	dec b

.asm_37815
	push bc
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld hl, EnemyMonDVs
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .asm_37829
	ld hl, wc6f2
.asm_37829
	ld a, [hli]
	ld [TempMonDVs], a
	ld a, [hl]
	ld [TempMonDVs + 1], a
	ld a, 3
	ld [MonType], a
	callba GetGender
	pop bc
	jr c, .asm_37849

	ld a, 1
	jr nz, .asm_37844
	dec a

.asm_37844
	xor b
	jr z, .asm_37849

	and a
	ret

.asm_37849
	scf
	ret

BattleCommand60:
; happinesspower
	push bc
	ld hl, BattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHappiness
.ok
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a
	ld a, 10
	ld [hMultiplier], a
	call Multiply
	ld a, 25
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld d, a
	pop bc
	ret

BattleCommand61:
; present

	ld a, [wLinkMode]
	cp $3
	jr z, .asm_3787d
	push bc
	push de
.asm_3787d

	call BattleCommand07

	ld a, [wLinkMode]
	cp $3
	jr z, .asm_37889
	pop de
	pop bc
.asm_37889

	ld a, [wd265]
	and a
	jp z, AnimateFailedMove
	ld a, [AttackMissed]
	and a
	jp nz, AnimateFailedMove

	push bc
	call BattleRandom
	ld b, a
	ld hl, .table_37907
	ld c, 0
.asm_378a1
	ld a, [hli]
	cp $ff
	jr z, .asm_378b7
	cp b
	jr nc, .asm_378ad
	inc c
	inc hl
	jr .asm_378a1

.asm_378ad
	ld a, c
	ld [wc689], a
	call Function37de9
	ld d, [hl]
	pop bc
	ret

.asm_378b7
	pop bc
	ld a, $3
	ld [wc689], a
	call AnimateCurrentMove
	call SwitchTurn
	ld hl, AICheckPlayerMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_378ce
	ld hl, AICheckEnemyMaxHP
.asm_378ce
	ld a, BANK(AICheckPlayerMaxHP)
	rst FarCall
	jr c, .asm_378f3

	ld hl, GetQuarterMaxHP
	call CallBattleCore
	call SwitchTurn
	ld hl, Function3ccef
	call CallBattleCore
	call SwitchTurn
	ld hl, RegainedHealthText
	call StdBattleTextBox
	call SwitchTurn
	call UpdateOpponentInParty
	jr .asm_37904

.asm_378f3
	call SwitchTurn
	call Function37ed5
	jr nc, .asm_37904
	call AnimateFailedMove
	ld hl, RefusedGiftText
	call StdBattleTextBox
.asm_37904
	jp EndMoveEffect

.table_37907
	db 40 percent,     40
	db 70 percent + 1, 80
	db 80 percent,    120
	db $ff

BattleCommand63:
; frustrationpower

	push bc
	ld hl, BattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3791a
	ld hl, EnemyMonHappiness
.asm_3791a
	ld a, $ff
	sub [hl]
	ld [$ffb6], a
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, 10
	ld [$ffb7], a
	call Multiply
	ld a, 25
	ld [$ffb7], a
	ld b, 4
	call Divide
	ld a, [$ffb6]
	ld d, a
	pop bc
	ret

BattleCommand64:
; safeguard

	ld hl, PlayerScreens
	ld de, PlayerSafeguardCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyScreens
	ld de, EnemySafeguardCount
.ok
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .failed
	set SCREENS_SAFEGUARD, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jp StdBattleTextBox
.failed
	call AnimateFailedMove
	jp PrintButItFailed

Function37962:
	push hl
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3796e
	ld hl, PlayerScreens

.asm_3796e
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret

BattleCommand65:
; checksafeguard
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3797d
	ld hl, PlayerScreens
.asm_3797d
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [AttackMissed], a
	call BattleCommandaa
	ld hl, SafeguardProtectText
	call StdBattleTextBox
	jp EndMoveEffect

BattleCommand66:
; getmagnitude

	push bc
	call BattleRandom
	ld b, a
	ld hl, .Magnitudes
.loop
	ld a, [hli]
	cp b
	jr nc, .ok
	inc hl
	inc hl
	jr .loop
.ok
	ld d, [hl]
	push de
	inc hl
	ld a, [hl]
	ld [wd265], a
	call BattleCommandaa
	ld hl, MagnitudeText
	call StdBattleTextBox
	pop de
	pop bc
	ret

.Magnitudes
	;  /255, BP, magnitude
	db  13,  10,  4
	db  38,  30,  5
	db  89,  50,  6
	db 166,  70,  7
	db 217,  90,  8
	db 242, 110,  9
	db 255, 150, 10

BattleCommand67:
; batonpass

	ld a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedBatonPass

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call Function1d6e
	callba Function3d2f7

	callba ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	callba Function3ed9f
	call Function1c17
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, 1
	call GetSGBLayout
	call Function32f9
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	callba MobileBattleErrorCheck
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetBatonPassStatus
	ret

.Enemy

; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jp z, FailedBatonPass

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	callba MobileBattleErrorCheck
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wWhichEnemyMon], a
	ld hl, Function3d517
	call CallBattleCore
	ld hl, Function3d57a
	call CallBattleCore
	ld a, 1
	ld [wd265], a
	ld hl, Function3ecab
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	jr ResetBatonPassStatus

BatonPass_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, 1
	ld [wd0ec], a

	call Function1d6e
	ld hl, Function3e8e4
	call CallBattleCore
	call Function1c17

	xor a
	ld [wd0ec], a
	ret

BatonPass_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call Function1d6e
	ld hl, Function3e8e4
	call CallBattleCore

	ld a, [OTPartyCount]
	add NUM_MOVES
	ld b, a
	ld a, [wBattleAction]
	cp NUM_MOVES
	jr c, .asm_37aa0
	cp b
	jr c, .asm_37aa8

.asm_37aa0
	ld a, [CurOTMon]
	add NUM_MOVES
	ld [wBattleAction], a
.asm_37aa8
	jp Function1c17

FailedBatonPass:
	call AnimateFailedMove
	jp PrintButItFailed

ResetBatonPassStatus:
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, EnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, PlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wc730], a
	ld [wc731], a
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, PartyMon1HP
	ld a, [PartyCount]
	ld d, a
	ld a, [CurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, OTPartyMon1HP
	ld a, [OTPartyCount]
	ld d, a
	ld a, [CurOTMon]
	ld e, a

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret

BattleCommand68:
; pursuit
; Double damage if the opponent is switching.

	ld hl, wEnemyIsSwitching
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerIsSwitching
.ok
	ld a, [hl]
	and a
	ret z

	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc

	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

BattleCommand69:
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .asm_37b4a
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextBox
.asm_37b4a

	ld hl, PlayerScreens
	ld de, wc730
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37b5b
	ld hl, EnemyScreens
	ld de, wc731
.asm_37b5b
	ld a, [hl]
	and $03
	jr z, .asm_37b69
	res SCREENS_SPIKES, [hl]
	res SCREENS_SPIKES2, [hl]
	ld hl, BlewSpikesText
	push de
	call StdBattleTextBox
	pop de
.asm_37b69

	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp StdBattleTextBox

BattleCommand6a:
; healmorn
	ld b, MORN
	jr BattleCommand6a6c

BattleCommand6b:
; healday
	ld b, DAY
	jr BattleCommand6a6c

BattleCommand6c:
; healnite
	ld b, NITE

BattleCommand6a6c:
; Time- and weather-sensitive heal.

	ld hl, BattleMonMaxHP
	ld de, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, EnemyMonMaxHP
	ld de, EnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 2

; Don't bother healing if HP is already full.
	push bc
	call StringCmp
	pop bc
	jr z, .Full

; Don't factor in time of day in link battles.
	ld a, [wLinkMode]
	and a
	jr nz, .Weather

	ld a, [TimeOfDay]
	cp b
	jr z, .Weather
	dec c

.Weather
	ld a, [Weather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
	dec c
	dec c

.Heal
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call SwitchTurn

	callab Function3ccef

	call SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.Full
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextBox

.Multipliers
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP

BattleCommand6d:
; hiddenpower

	ld a, [AttackMissed]
	and a
	ret nz
	callba HiddenPowerDamage
	ret

BattleCommand6e:
; startrain
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, FailedWeather
	ld a, WEATHER_RAIN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextBox

BattleCommand6f:
; startsun
	ld a, [Weather]
	cp WEATHER_SUN
	jr z, FailedWeather
	ld a, WEATHER_SUN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextBox

FailedWeather:
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand95:
; bellydrum
	ld a, [AttackMissed]
	and a
	jr nz, .asm_37c4f

	callab GetHalfMaxHP

	callab Function3ccde
	jr nc, .asm_37c4f

	push bc
	call AnimateCurrentMove
	pop bc
	callab Function3cc3f
	call UpdateUserInParty
	ld a, 6 ; fixes Belly Drum effect error

.asm_37c41
	push af
	call BattleCommand77
	pop af
	dec a
	jr nz, .asm_37c41

	ld hl, BellyDrumText
	jp StdBattleTextBox
.asm_37c4f
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand96:
; psychup

	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37c64
	push hl
	ld h, d
	ld l, e
	pop de
.asm_37c64
	push hl
	ld b, $8
.asm_37c67
	ld a, [hli]
	cp $7
	jr nz, .asm_37c76
	dec b
	jr nz, .asm_37c67
	pop hl
	call AnimateFailedMove
	jp PrintButItFailed
.asm_37c76
	pop hl
	ld b, $8
.asm_37c79
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_37c79
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37c89
	call Function365d7
	jr .asm_37c8c
.asm_37c89
	call Function365fd
.asm_37c8c
	call AnimateCurrentMove
	ld hl, CopiedStatsText
	jp StdBattleTextBox

BattleCommand9a:
; mirrorcoat

	ld a, 1
	ld [AttackMissed], a ;set attack missed in case of early ret

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z ;return if no move used

	ld b, a
	callab GetMoveEffect
	ld a, b
	cp EFFECT_MIRROR_COAT ;if that move is mirror coat, exit
	ret z

	call BattleCommanda3
	ld a, [wd265]
	and a
	ret z ;if immune, ret

	call Function36abf ;ret if user goes first
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, StringBuffer1
	call GetMoveData ;put move data into stringbuffer

	ld a, [StringBuffer1 + 2] ;if 0 power, ret
	and a
	ret z

	ld a, [StringBuffer1 + 3] ;if physical, scf and ret
	bit 6, a
	jr z, .physical

	ld hl, CurDamage ;ret if 0 damage taken
	ld a, [hli]
	or [hl]
	ret z

	ld a, [hl]
	add a  ;load double damage into hl
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [AttackMissed], a ;don't miss
	ret

.physical
	scf
	ret

BattleCommand9d:
; doubleminimizedamage

	ld hl, wc6fa
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wc6fe
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

BattleCommand9e:
; skipsuncharge
	ld a, [Weather]
	cp WEATHER_SUN
	ret nz
	ld b, $39 ; charge
	jp SkipToBattleCommand

BattleCommand9b:
; checkfuturesight
	ld hl, BattleMonLevel
	push hl
	ld hl, PlayerStats + 8
	ld de, wc72b
	push de
	push hl
	ld hl, wc71d ; count
	ld de, wc727 ; damage
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	pop hl
	pop de
	pop hl
	ld hl, EnemyMonLevel
	push hl
	ld hl, EnemyStats + 8
	ld de, wc72c
	push de
	push hl
	ld hl, wc71e ; count
	ld de, wc729 ; damage
.ok

	ld a, [hl]
	; and a
	; ret z
	cp 1
	jr nz, .done

	ld [hl], 0
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	pop de
	pop hl
	ld a, [hl]
	ld [wc719], a
	ld a, [de]
	ld [hl], a
	ld b, $9c ; futuresight
	jp SkipToBattleCommand

.done
	pop hl
	pop de
	pop hl
	ret

BattleCommand_CleanUpFutureSight:
	ld de, BattleMonLevel
	ld hl, Function365d7
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyMonLevel
	ld hl, Function365fd
.ok
	ld a, [wc719]
	ld [de], a
	jp [hl]

BattleCommand9c:
; futuresight

	call Function34548
	jr nz, .asm_37d4b ; 37d37 $12 ;check if charging, if so skip loading anim into last move
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
.asm_37d4b ;hl = future sight variable
	ld hl, wc71d
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d56
	ld hl, wc71e
.asm_37d56
	ld a, [hl]
	and a
	jr nz, .asm_37d87 ; 37d58 $2d ;if already has a value, fail
	ld a, $4
	ld [hl], a ;load 4 into count
	call BattleCommand0a ;lower sub
	call BattleCommandaa ;delay
	ld hl, ForesawAttackText
	call StdBattleTextBox
	call BattleCommand0c ;raise sub
	ld de, wc72b
	ld hl, BattleMonLevel
	push de
	push hl
	ld de, wc727 ; damage
	ld hl, PlayerStats + 8
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d77
	pop hl
	pop de
	ld hl, EnemyMonLevel
	ld de, wc72c
	push de
	push hl
	ld hl, EnemyStats + 8
	ld de, wc729
.asm_37d77
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	ld b, [hl]
	ld de, BattleMonType1 - BattleMonLevel
	add hl, de
	ld a, [hli]
	cp PSYCHIC
	jr z, .set_stab_flag
	ld a, [hl]
	cp PSYCHIC
	jr z, .set_stab_flag
	xor a
	jr .done_stab
.set_stab_flag
	ld a, $80
.done_stab
	or b
	pop de
	ld [de], a
	jp EndMoveEffect
.asm_37d87
	pop bc
	call ResetDamage
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect

BattleCommand9f:
; thunderaccuracy

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	inc hl
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, .rain
	cp WEATHER_SUN
	ret nz
	ld [hl], 50 percent + 1
	ret
.rain
	ld [hl], 100 percent
	ret

BattleCommand_Growth:

	ld bc, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, EnemyStatLevels
.go
;attack
	ld a, [bc]
	cp 13 ; max
	jr c, .raise

; sp.attack
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp 13 ; max
	jr nc, .cantraise

.raise
	ld a, [Weather]
	cp WEATHER_SUN
	jr z, .SunBoost
	call BattleCommand0a
	call BattleCommand92
	call BattleCommand0c
	call BattleCommand70
	call BattleCommand8c
	ld a, 0
	ld [FailedMessage], a
	call BattleCommand73
	call BattleCommand8c
	ld a, 0
	ld [FailedMessage], a
	ret
.SunBoost
	call BattleCommand0a
	call BattleCommand92
	call BattleCommand0c
	call BattleCommand77
	call BattleCommand8c
	ld a, 0
	ld [FailedMessage], a
	call BattleCommand7a
	call BattleCommand8c
	ld a, 0
	ld [FailedMessage], a
	ret

.cantraise
	ld b, $8 ; ABILITY
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox

CheckHiddenOpponent:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret

GetUserItem:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, BattleMonItem
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, EnemyMonItem
.go
	ld b, [hl]
	jp GetItem

GetOpponentItem:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, EnemyMonItem
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, BattleMonItem
.go
	ld b, [hl]
GetItem:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + 2
	dec a
	ld c, a
	ld b, 0
	ld a, Item2Attributes - Item1Attributes
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret

Function37de9:
	push hl
	push de
	push bc
	ld a, [wc689]
	push af
	call BattleCommand0a
	pop af
	ld [wc689], a
	call Function37e19
	call BattleCommand0c
	pop bc
	pop de
	pop hl
	ret

AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wc689]
	push af
	call BattleCommand0a
	pop af
	ld [wc689], a
	call Function37e36
	call BattleCommand0c
	pop bc
	pop de
	pop hl
	ret

Function37e19:
	xor a
	ld [FXAnimIDHi], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	ld [FXAnimIDLo], a

	ld a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .asm_37e30
	ld a, 4

.asm_37e30
	ld [wcfca], a

	jp Function37e47

Function37e36:
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

Function37e44:
	ld [FXAnimIDLo], a
Function37e47:
	push hl
	push de
	push bc
	callab PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

Function37e54:
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [wcfca], a

	push hl
	push de
	push bc
	call SwitchTurn

	callab PlayBattleAnim

	call SwitchTurn
	pop bc
	pop de
	pop hl
	ret

CallBattleCore:
	ld a, BANK(BattleCore)
	rst FarCall
	ret

AnimateFailedMove:
	call BattleCommand0a
	call BattleCommandaa
	jp BattleCommand0c

BattleCommandaa:
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

BattleCommand38:
; cleartext

; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextBox
.text
	db "@"

SkipToBattleCommand:
; Skip over commands until passing command b.
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, [BattleScriptBufferLoc]
	ld l, a
.asm_37e94
	ld a, [hli]
	cp b
	jr nz, .asm_37e94

	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	ld a, l
	ld [BattleScriptBufferLoc], a
	ret

GetMoveAttr:
; Assuming hl = Moves + x, return attribute x of move a.
	push bc
	ld bc, MOVE_LENGTH
	call AddNTimes
	call GetMoveByte
	pop bc
	ret

GetMoveData:
; Copy move struct a to de.
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, Bank(Moves)
	jp FarCopyBytes

GetMoveByte:
	ld a, BANK(Moves)
	jp GetFarByte

Function37ec0:
	callba Functionfbd54
	ret

Function37ec7:
	callba Functionfbd71
	ret

Function37ece:
	callba Functionfbd69
	ret

Function37ed5:
; Related to mobile link battles.
	push hl
	push de
	push bc
	callba CheckBattleScene
	pop bc
	pop de
	pop hl
	ret

BattleCmd_RampageMiss:
	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .okay
	ld de, EnemyRolloutCount
.okay
	ld a, [de]
	and a
	jr z, .CheckConfusion
	ld a, [AttackMissed]
	and a
	ret z
	xor a
	ld [de], a
.CheckConfusion
	ld hl, RampageConfusion
	jp CallBattleCore
