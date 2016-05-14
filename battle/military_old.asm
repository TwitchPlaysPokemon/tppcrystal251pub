; Military::
; ; In link battle, the player chooses moves, not the AI.
	; ld a, [wLinkMode]
	; and a
	; ret nz

; ;Let's start
; MilitaryInit:
	; ld a, [wMilitaryFlags] ;Checks if in military mode
	; bit MILITARY_ON, a
	; jp z, MilitaryGetEnemyActionOnly
	; callab Function4000
	; ld a, MILITARY_IDLE + (MILITARY_IDLE << 4)
	; ld [wMilitaryAndAIBattleAction], a
; MilitaryPlayerLoop:
	; ld hl, wMilitaryFlags
	; res MILITARY_ACTION_SIDE, [hl]
; MilitaryLoop:
	; call GetMilitaryCommand
	; cp MILITARY_IDLE
	; jr z, MilitaryLoop
	; cp MILITARY_SWITCH
	; jp c, MilitaryGetMove
	; cp MILITARY_OKAY
	; jr c, MilitarySwitchOrItem
	; cp MILITARY_STRUGGLE
	; jr c, MilitaryLoop
	; jp z, MilitarySetMove
	; jr MilitaryRun

; .RunOrItem
	; cp MILITARY_RUN
	; jr z, MilitaryRun

; MilitarySwitchOrItem:
	; ld b, a
	; ld a, [wMilitaryItem]
	; and a
	; jr z, MilitarySwitch

	; call GetMilitaryActionSide
	; jr z, .player

	; ld hl, wc650
	; jr z, .got_item
	; inc hl
; .got_item
	; ; handle AI item
	; ld a, [hl]
	; and a
	; jr z, MilitaryLoop
	; call GetMilitaryCommand
	; ld [wBattleAction], a
	; ret

; .player
	; ld [CurItem], a
	; call DoItemEffect
	; ld a, [wd0ec]
	; and a
	; jr z, MilitaryLoop
	; ret

; MilitarySwitch:
	; ld a, b
	; sub 3
	; call GetMilitaryActionSide
	; jr z, .player
	; ld [wWhichEnemyMon], a
	; ld a, 1
	; ld [wEnemyIsSwitching], a
	; ret
; .player
	; ld [CurPartyMon], a
	; ld d, a
	; callba Function3e358
	; jr c, MilitaryLoop
	; ret

; MilitaryEnemyLoop:
	; ld a, [wMilitaryFlags]
	; set MILITARY_ACTION_SIDE, a
	; ld [wMilitaryFlags], a
	; jr MilitaryLoop

; MilitaryRun:
	; call GetMilitaryActionSide
	; jr z, .player
	; ld a, $f
	; ld [wBattleAction], a
	; ret
; .player
	; callba BattleMenu_Run
	; ret c
	; jp MilitaryLoop

; MilitaryGetEnemyActionOnly:
	; call MilitaryEnemyLoop
	; call Function30bf
	; callab Function3c5fe
	; ret


; ;Start at base (hl) then goes up by a
; MilitaryUnitWidthArrayOffset:
	; ld c, a
	; ld b, 0
	; add hl, bc
	; ld a, [hl]
	; ld [wMilitaryItem], a
	; ret

; MilitaryGotAddr:
	; pop af
	; ret

; MilitaryGetMoveAddr:
	; push af
	; ld hl, BattleMonMoves
	; call GetMilitaryActionSide
	; jr z, MilitaryGotAddr
	; ld hl, EnemyMonMoves
	; jr MilitaryGotAddr

; MilitaryGetPPAddr:
	; push af
	; ld hl, BattleMonPP
	; call GetMilitaryActionSide
	; jr z, MilitaryGotAddr
	; ld hl, EnemyMonPP
	; jr MilitaryGotAddr

; MilitaryGetDisabledMove:
	; push af
	; ld hl, DisabledMove
	; call GetMilitaryActionSide
	; jr z, MilitaryGotAddr
	; ld hl, EnemyDisabledMove
	; jr MilitaryGotAddr

; ;Set the move that's going to be used
; MilitarySetMove:
	; push af
	; call GetMilitaryActionSide
	; jp z, .setPlayerMove
	; pop af
	; ld [CurEnemyMove], a
	; ret
; .setPlayerMove
	; pop af
	; ld [CurPlayerMove], a
	; ret

; ;Checks if you have enough PP for this move and that it isn't disabled. If all checks out then use it.
; MilitaryGetMove:
	; call MilitaryGetPPAddr
	; call MilitaryUnitWidthArrayOffset
	; and $3f
	; jp z, MilitaryPlayerLoop ;If you're out of PP return to the loop
	; call GetMilitaryCommand

	; call MilitaryGetMoveAddr
	; call MilitaryUnitWidthArrayOffset
	; and a
	; jp z, MilitaryPlayerLoop ;return to the loop if the move index is 0

	; ld b, a
	; call MilitaryGetDisabledMove
	; ld a, [hl]
	; cp b
	; jp z, MilitaryPlayerLoop ;return to the loop if disabled
	; ld a, b


	; call MilitarySetMove
	; jp ChangeMilitaryActionSide

; ;Switches checking from player or enemy.
; ChangeMilitaryActionSide:
	; call GetMilitaryActionSide
	; jr nz, .endSegment
	; jp MilitaryEnemyLoop
; .endSegment;Let's execute these commands
	; ld hl, wMilitaryFlags
	; res MILITARY_ACTION_SIDE, [hl]
	; call Function30bf
	; callab Function3c5fe
	; ret

; GetMilitaryCommand:
	; call GetMilitaryActionSide
	; jr nz, .enemyCommand
	; ld a, [wMilitaryAndAIBattleAction]
	; and $f
	; ret
; .enemyCommand
	; ld a, [wMilitaryAndAIBattleAction]
	; and $f0
	; swap a
	; ret

; GetMilitaryActionSide:
	; push hl
	; ld hl, wMilitaryFlags
	; bit MILITARY_ACTION_SIDE, [hl]
	; pop hl
	; ret
