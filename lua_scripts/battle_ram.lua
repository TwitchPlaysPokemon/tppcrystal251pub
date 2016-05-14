wEnemyMoveStructAnimation = 0xc608 -- 1 byte
wEnemyMoveStructEffect = 0xc609 -- 1 byte
wEnemyMoveStructPower = 0xc60a -- 1 byte
wEnemyMoveStructType = 0xc60b -- 1 byte
wEnemyMoveStructAccuracy = 0xc60c -- 1 byte
wEnemyMoveStructPP = 0xc60d -- 1 byte
wEnemyMoveStructEffectChance = 0xc60e -- 1 byte
wPlayerMoveStructAnimation = 0xc60f -- 1 byte
wPlayerMoveStructEffect = 0xc610 -- 1 byte
wPlayerMoveStructPower = 0xc611 -- 1 byte
wPlayerMoveStructType = 0xc612 -- 1 byte
wPlayerMoveStructAccuracy = 0xc613 -- 1 byte
wPlayerMoveStructPP = 0xc614 -- 1 byte
wPlayerMoveStructEffectChance = 0xc615 -- 1 byte

EnemyMonNick = 0xc616 -- 11 bytes
BattleMonNick = 0xc621 -- 11 bytes

BattleMonSpecies = 0xc62c -- 1 byte
BattleMonItem = 0xc62d -- 1 byte
BattleMonMoves = 0xc62e -- 4 bytes
BattleMonDVs = 0xc632 -- 2 bytes
BattleMonPP = 0xc634 -- 4 bytes
BattleMonHappiness = 0xc638 -- 1 byte
BattleMonLevel = 0xc639 -- 1 byte
BattleMonStatus = 0xc63a -- 2 bytes
BattleMonHP = 0xc63c -- 2 bytes
BattleMonMaxHP = 0xc63e -- 2 bytes
BattleMonAttack = 0xc640 -- 2 bytes
BattleMonDefense = 0xc642 -- 2 bytes
BattleMonSpeed = 0xc644 -- 2 bytes
BattleMonSpclAtk = 0xc646 -- 2 bytes
BattleMonSpclDef = 0xc648 -- 2 bytes
BattleMonType1 = 0xc64a -- 1 byte
BattleMonType2 = 0xc64b -- 1 byte

wWildMon = 0xc64e -- 1 byte
wEnemyTrainerItem1 = 0xc650 -- 1 byte
wEnemyTrainerItem2 = 0xc651 -- 1 byte
wEnemyTrainerBaseReward = 0xc652 -- 1 byte
wEnemyTrainerAIFlags = 0xc653 -- 3 bytes
OTClassName = 0xc656 -- 11 bytes

CurOTMon = 0xc663 -- 1 byte

wBattleParticipantsNotFainted = 0xc664 -- 1 byte
-- Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
-- Bit set if the mon appears in battle.
-- Bit cleared if the mon faints.
-- Backed up if the enemy switches.
-- All bits cleared if the enemy faints.

TypeModifier = 0xc665 -- 1 byte
-- >10: super-effective
--  10: normal
-- <10: not very effective
-- bit 7: stab

CriticalHit = 0xc666 -- 1 byte
-- 0 if not critical
-- 1 for a critical hit
-- 2 for a OHKO

AttackMissed = 0xc667 -- 1 byte
-- nonzero for a miss

PlayerSubStatus1 = 0xc668 -- 1 byte
-- bit
-- 7 attract
-- 6 rollout
-- 5 endure
-- 4 perish song
-- 3 identified
-- 2 protect
-- 1 curse
-- 0 nightmare
PlayerSubStatus2 = 0xc669 -- 1 byte
-- bit
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1
-- 0 curled
PlayerSubStatus3 = 0xc66a -- 1 byte
-- bit
-- 7 confused
-- 6 flying
-- 5 underground
-- 4 charged
-- 3 flinch
-- 2 looping
-- 1 rampaging
-- 0 bide
PlayerSubStatus4 = 0xc66b -- 1 byte
-- bit
-- 7 leech seed
-- 6 rage
-- 5 recharge
-- 4 substitute
-- 3
-- 2 focus energy
-- 1 mist
-- 0 bide: unleashed energy
PlayerSubStatus5 = 0xc66c -- 1 byte
-- bit
-- 7 cant run
-- 6 destiny bond
-- 5 lock-on
-- 4 encore
-- 3 transformed
-- 2
-- 1
-- 0 toxic

EnemySubStatus1 = 0xc66d -- 1 byte
-- see PlayerSubStatus1
EnemySubStatus2 = 0xc66e -- 1 byte
-- see PlayerSubStatus2
EnemySubStatus3 = 0xc66f -- 1 byte
-- see PlayerSubStatus3
EnemySubStatus4 = 0xc670 -- 1 byte
-- see PlayerSubStatus4
EnemySubStatus5 = 0xc671 -- 1 byte
-- see PlayerSubStatus5

PlayerRolloutCount = 0xc672 -- 1 byte
PlayerConfuseCount = 0xc673 -- 1 byte
PlayerToxicCount = 0xc674 -- 1 byte
PlayerDisableCount = 0xc675 -- 1 byte
PlayerEncoreCount = 0xc676 -- 1 byte
PlayerPerishCount = 0xc677 -- 1 byte
PlayerFuryCutterCount = 0xc678 -- 1 byte
PlayerProtectCount = 0xc679 -- 1 byte

EnemyRolloutCount = 0xc67a -- 1 byte
EnemyConfuseCount = 0xc67b -- 1 byte
EnemyToxicCount = 0xc67c -- 1 byte
EnemyDisableCount = 0xc67d -- 1 byte
EnemyEncoreCount = 0xc67e -- 1 byte
EnemyPerishCount = 0xc67f -- 1 byte
EnemyFuryCutterCount = 0xc680 -- 1 byte
EnemyProtectCount = 0xc681 -- 1 byte

PlayerDamageTaken = 0xc682 -- 2 bytes
EnemyDamageTaken = 0xc684 -- 2 bytes

wBattleReward = 0xc686 -- 3 bytes
wPresentPower = 0xc689 -- 1 byte
BattleScriptBuffer = 0xc68a -- 40 bytes

BattleScriptBufferLoc = 0xc6b2 -- 2 bytes

wTurnEnded = 0xc6b4 -- 1 byte

PlayerStats = 0xc6b6 -- 10 bytes
EnemyStats = 0xc6c1 -- 10 bytes

-- 07 neutral
PlayerAtkLevel = 0xc6cc -- 1 byte
PlayerDefLevel = 0xc6cd -- 1 byte
PlayerSpdLevel = 0xc6ce -- 1 byte
PlayerSAtkLevel = 0xc6cf -- 1 byte
PlayerSDefLevel = 0xc6d0 -- 1 byte
PlayerAccLevel = 0xc6d1 -- 1 byte
PlayerEvaLevel = 0xc6d2 -- 1 byte
-- c6d3

-- 07 neutral
EnemyAtkLevel = 0xc6d4 -- 1 byte
EnemyDefLevel = 0xc6d5 -- 1 byte
EnemySpdLevel = 0xc6d6 -- 1 byte
EnemySAtkLevel = 0xc6d7 -- 1 byte
EnemySDefLevel = 0xc6d8 -- 1 byte
EnemyAccLevel = 0xc6d9 -- 1 byte
EnemyEvaLevel = 0xc6da -- 1 byte

EnemyTurnsTaken = 0xc6dc -- 1 byte
PlayerTurnsTaken = 0xc6dd -- 1 byte

PlayerSubstituteHP = 0xc6df -- 1 byte
EnemySubstituteHP = 0xc6e0 -- 1 byte

wUnusedPlayerLockedMove = 0xc6e1 -- 1 byte
CurPlayerMove = 0xc6e3 -- 1 byte
CurEnemyMove = 0xc6e4 -- 1 byte

LinkBattleRNCount = 0xc6e5 -- 1 byte
-- how far through the prng stream

wEnemyItemState = 0xc6e6 -- 1 byte
CurEnemyMoveNum = 0xc6e9 -- 1 byte

wEnemyHPAtTimeOfPlayerSwitch = 0xc6ea -- 2 bytes
wPayDayMoney = 0xc6ec -- 3 bytes

wSafariMonAngerCount = 0xc6ef -- 1 byte
wSafariMonEating = 0xc6f0 -- 1 byte
wEnemyBackupDVs = 0xc6f2 -- 2 bytes used when enemy is transformed
AlreadyDisobeyed = 0xc6f4 -- 1 byte

DisabledMove = 0xc6f5 -- 1 byte
EnemyDisabledMove = 0xc6f6 -- 1 byte
wWhichMonFaintedFirst = 0xc6f7 -- 1 byte

-- exists so you can't counter on switch
LastEnemyCounterMove = 0xc6f8 -- 1 byte
LastPlayerCounterMove = 0xc6f9 -- 1 byte

wEnemyMinimized = 0xc6fa -- 1 byte

AlreadyFailed = 0xc6fb -- 1 byte

wBattleParticipantsIncludingFainted = 0xc6fc -- 1 byte
wDanger = 0xc6fd -- 1 byte
wPlayerMinimized = 0xc6fe -- 1 byte
PlayerScreens = 0xc6ff -- 1 byte
-- bit
-- 4 reflect
-- 3 light screen
-- 2 safeguard
-- 0 spikes

EnemyScreens = 0xc700 -- 1 byte
-- see PlayerScreens

PlayerSafeguardCount = 0xc701 -- 1 byte
PlayerLightScreenCount = 0xc702 -- 1 byte
PlayerReflectCount = 0xc703 -- 1 byte

EnemySafeguardCount = 0xc705 -- 1 byte
EnemyLightScreenCount = 0xc706 -- 1 byte
EnemyReflectCount = 0xc707 -- 1 byte
Weather = 0xc70a -- 1 byte
-- 00 normal
-- 01 rain
-- 02 sun
-- 03 sandstorm
-- 04 rain stopped
-- 05 sunliight faded
-- 06 sandstorm subsided

WeatherCount = 0xc70b -- 1 byte
-- # turns remaining

LoweredStat = 0xc70c -- 1 byte
EffectFailed = 0xc70d -- 1 byte
FailedMessage = 0xc70e -- 1 byte
wEnemyGoesFirst = 0xc70f -- 1 byte
wPlayerIsSwitching = 0xc710 -- 1 byte
wEnemyIsSwitching = 0xc711 -- 1 byte

PlayerUsedMoves = 0xc712 -- 4 bytes
-- add a move that has been used once by the player
-- added in order of use

wEnemyAISwitchScore = 0xc716 -- 1 byte
wEnemySwitchMonParam = 0xc717 -- 1 byte
wEnemySwitchMonIndex = 0xc718 -- 1 byte
wTempLevel = 0xc719 -- 1 byte
LastPlayerMon = 0xc71a -- 1 byte
LastPlayerMove = 0xc71b -- 1 byte
LastEnemyMove = 0xc71c -- 1 byte

wPlayerFutureSightCount = 0xc71d -- 1 byte
wEnemyFutureSightCount = 0xc71e -- 1 byte
wGivingExperienceToExpShareHolders = 0xc71f -- 1 byte
wBackupEnemyMonBaseStats = 0xc720 -- 5 bytes
wBackupEnemyMonCatchRate = 0xc725 -- 1 byte
wBackupEnemyMonBaseExp = 0xc726 -- 1 byte
wPlayerFutureSightDamage = 0xc727 -- 2 bytes
wEnemyFutureSightDamage = 0xc729 -- 2 bytes
wPlayerRageCounter = 0xc72b -- 1 byte
wEnemyRageCounter = 0xc72c -- 1 byte
wBeatUpHitAtLeastOnce = 0xc72d -- 1 byte
wPlayerTrappingMove = 0xc72e -- 1 byte
wEnemyTrappingMove = 0xc72f -- 1 byte
wPlayerWrapCount = 0xc730 -- 1 byte
wEnemyWrapCount = 0xc731 -- 1 byte
wPlayerCharging = 0xc732 -- 1 byte
wEnemyCharging = 0xc733 -- 1 byte
BattleEnded = 0xc734 -- 1 byte

wWildMonMoves = 0xc735 -- 4 bytes
wWildMonPP = 0xc739 -- 4 bytes
wAmuletCoin = 0xc73a -- 1 byte
wSomeoneIsRampaging = 0xc73b -- 1 byte
wPlayerJustGotFrozen = 0xc73c -- 1 byte
wEnemyJustGotFrozen = 0xc73d -- 1 byte

StringBuffer1 = 0xd073 -- 19 bytes, variable uses including temporary storage of enemy trainer's name

TempEnemyMonSpecies = 0xd204 -- 1 bytes
TempBattleMonSpecies = 0xd205 -- 1 bytes

EnemyMonSpecies = 0xd206 -- 1 byte
EnemyMonItem = 0xd207 -- 1 byte
EnemyMonMoves = 0xd208 -- 4 bytes
EnemyMonDVs = 0xd20c -- 2 bytes
EnemyMonPP = 0xd20e -- 4 bytes
EnemyMonHappiness = 0xd212 -- 1 byte
EnemyMonLevel = 0xd213 -- 1 byte
EnemyMonStatus = 0xd214 -- 2 bytes
EnemyMonHP = 0xd216 -- 2 bytes
EnemyMonMaxHP = 0xd218 -- 2 bytes
EnemyMonAttack = 0xd21a -- 2 bytes
EnemyMonDefense = 0xd21c -- 2 bytes
EnemyMonSpeed = 0xd21e -- 2 bytes
EnemyMonSpclAtk = 0xd220 -- 2 bytes
EnemyMonSpclDef = 0xd222 -- 2 bytes
EnemyMonType1 = 0xd224 -- 1 byte
EnemyMonType2 = 0xd225 -- 1 byte
EnemyMonBaseStats = 0xd226 -- 5 bytes
EnemyMonCatchRate = 0xd22b -- 1 byte
EnemyMonBaseExp = 0xd22c -- 1 byte

wBattleMode = 0xd22d -- 1 byte
-- 0: overworld
-- 1: wild battle
-- 2: trainer battle

TempWildMonSpecies = 0xd22e -- 1 byte
OtherTrainerClass = 0xd22f -- 1 byte
-- class (Youngster, Bug Catcher, etc.) of opposing trainer
-- 0 if opponent is a wild Pokémon, not a trainer

BattleType = 0xd230 -- 1 byte
-- $00 normal
-- $01 can lose
-- $02 debug
-- $03 dude/tutorial
-- $04 fishing
-- $05 roaming
-- $06 contest
-- $07 shiny
-- $08 headbutt/rock smash
-- $09 trap
-- $0a force Item1
-- $0b celebi
-- $0c suicune

OtherTrainerID = 0xd231 -- 1 byte
-- which trainer of the class that you're fighting
-- (Joey, Mikey, Albert, etc.)

wForcedSwitch = 0xd232 -- ds 1

TrainerClass = 0xd233 -- 1 byte

OTPlayerName = 0xd26b -- 11 bytes
OTPlayerID = 0xd276 -- 2 bytes
OTPartyCount = 0xd280 -- 1 byte
OTPartySpecies = 0xd281 -- 6 bytes

OTPartyMon1Species = 0xD288 -- 1 byte
OTPartyMon1Item = 0xD289 -- 1 byte
OTPartyMon1Moves = 0xD28A -- 4 bytes
OTPartyMon1ID = 0xD28E -- 2 bytes
OTPartyMon1Exp = 0xD290 -- 3 bytes
OTPartyMon1HPExp = 0xD293 -- 2 bytes
OTPartyMon1AtkExp = 0xD295 -- 2 bytes
OTPartyMon1DefExp = 0xD297 -- 2 bytes
OTPartyMon1SpdExp = 0xD299 -- 2 bytes
OTPartyMon1SpcExp = 0xD29B -- 2 bytes
OTPartyMon1DVs = 0xD29D -- 2 bytes
OTPartyMon1PP = 0xD29F -- 4 bytes
OTPartyMon1Happiness = 0xD2A3 -- 1 byte
OTPartyMon1PokerusStatus = 0xD2A4 -- 1 byte
OTPartyMon1CaughtData = 0xD2A5 -- 1 byte
OTPartyMon1CaughtLevel = 0xD2A5 -- 1 byte
OTPartyMon1CaughtTime = 0xD2A5 -- 1 byte
OTPartyMon1CaughtGender = 0xD2A6 -- 1 byte
OTPartyMon1CaughtLocation = 0xD2A6 -- 1 byte
OTPartyMon1Level = 0xD2A7 -- 1 byte
OTPartyMon1Status = 0xD2A8 -- 1 byte
OTPartyMon1Unused = 0xD2A9 -- 1 byte
OTPartyMon1HP = 0xD2AA -- 2 bytes
OTPartyMon1MaxHP = 0xD2AC -- 2 bytes
OTPartyMon1Attack = 0xD2AE -- 2 bytes
OTPartyMon1Defense = 0xD2B0 -- 2 bytes
OTPartyMon1Speed = 0xD2B2 -- 2 bytes
OTPartyMon1SpclAtk = 0xD2B4 -- 2 bytes
OTPartyMon1SpclDef = 0xD2B6 -- 2 bytes

OTPartyMon2Species = 0xD2B8 -- 1 byte
OTPartyMon2Item = 0xD2B9 -- 1 byte
OTPartyMon2Moves = 0xD2BA -- 4 bytes
OTPartyMon2ID = 0xD2BE -- 2 bytes
OTPartyMon2Exp = 0xD2C0 -- 3 bytes
OTPartyMon2HPExp = 0xD2C3 -- 2 bytes
OTPartyMon2AtkExp = 0xD2C5 -- 2 bytes
OTPartyMon2DefExp = 0xD2C7 -- 2 bytes
OTPartyMon2SpdExp = 0xD2C9 -- 2 bytes
OTPartyMon2SpcExp = 0xD2CB -- 2 bytes
OTPartyMon2DVs = 0xD2CD -- 2 bytes
OTPartyMon2PP = 0xD2CF -- 4 bytes
OTPartyMon2Happiness = 0xD2D3 -- 1 byte
OTPartyMon2PokerusStatus = 0xD2D4 -- 1 byte
OTPartyMon2CaughtData = 0xD2D5 -- 1 byte
OTPartyMon2CaughtLevel = 0xD2D5 -- 1 byte
OTPartyMon2CaughtTime = 0xD2D5 -- 1 byte
OTPartyMon2CaughtGender = 0xD2D6 -- 1 byte
OTPartyMon2CaughtLocation = 0xD2D6 -- 1 byte
OTPartyMon2Level = 0xD2D7 -- 1 byte
OTPartyMon2Status = 0xD2D8 -- 1 byte
OTPartyMon2Unused = 0xD2D9 -- 1 byte
OTPartyMon2HP = 0xD2DA -- 2 bytes
OTPartyMon2MaxHP = 0xD2DC -- 2 bytes
OTPartyMon2Attack = 0xD2DE -- 2 bytes
OTPartyMon2Defense = 0xD2E0 -- 2 bytes
OTPartyMon2Speed = 0xD2E2 -- 2 bytes
OTPartyMon2SpclAtk = 0xD2E4 -- 2 bytes
OTPartyMon2SpclDef = 0xD2E6 -- 2 bytes

OTPartyMon3Species = 0xD2E8 -- 1 byte
OTPartyMon3Item = 0xD2E9 -- 1 byte
OTPartyMon3Moves = 0xD2EA -- 4 bytes
OTPartyMon3ID = 0xD2EE -- 2 bytes
OTPartyMon3Exp = 0xD2F0 -- 3 bytes
OTPartyMon3HPExp = 0xD2F3 -- 2 bytes
OTPartyMon3AtkExp = 0xD2F5 -- 2 bytes
OTPartyMon3DefExp = 0xD2F7 -- 2 bytes
OTPartyMon3SpdExp = 0xD2F9 -- 2 bytes
OTPartyMon3SpcExp = 0xD2FB -- 2 bytes
OTPartyMon3DVs = 0xD2FD -- 2 bytes
OTPartyMon3PP = 0xD2FF -- 4 bytes
OTPartyMon3Happiness = 0xD303 -- 1 byte
OTPartyMon3PokerusStatus = 0xD304 -- 1 byte
OTPartyMon3CaughtData = 0xD305 -- 1 byte
OTPartyMon3CaughtLevel = 0xD305 -- 1 byte
OTPartyMon3CaughtTime = 0xD305 -- 1 byte
OTPartyMon3CaughtGender = 0xD306 -- 1 byte
OTPartyMon3CaughtLocation = 0xD306 -- 1 byte
OTPartyMon3Level = 0xD307 -- 1 byte
OTPartyMon3Status = 0xD308 -- 1 byte
OTPartyMon3Unused = 0xD309 -- 1 byte
OTPartyMon3HP = 0xD30A -- 2 bytes
OTPartyMon3MaxHP = 0xD30C -- 2 bytes
OTPartyMon3Attack = 0xD30E -- 2 bytes
OTPartyMon3Defense = 0xD310 -- 2 bytes
OTPartyMon3Speed = 0xD312 -- 2 bytes
OTPartyMon3SpclAtk = 0xD314 -- 2 bytes
OTPartyMon3SpclDef = 0xD316 -- 2 bytes

OTPartyMon4Species = 0xD318 -- 1 byte
OTPartyMon4Item = 0xD319 -- 1 byte
OTPartyMon4Moves = 0xD31A -- 4 bytes
OTPartyMon4ID = 0xD31E -- 2 bytes
OTPartyMon4Exp = 0xD320 -- 3 bytes
OTPartyMon4HPExp = 0xD323 -- 2 bytes
OTPartyMon4AtkExp = 0xD325 -- 2 bytes
OTPartyMon4DefExp = 0xD327 -- 2 bytes
OTPartyMon4SpdExp = 0xD329 -- 2 bytes
OTPartyMon4SpcExp = 0xD32B -- 2 bytes
OTPartyMon4DVs = 0xD32D -- 2 bytes
OTPartyMon4PP = 0xD32F -- 4 bytes
OTPartyMon4Happiness = 0xD333 -- 1 byte
OTPartyMon4PokerusStatus = 0xD334 -- 1 byte
OTPartyMon4CaughtData = 0xD335 -- 1 byte
OTPartyMon4CaughtLevel = 0xD335 -- 1 byte
OTPartyMon4CaughtTime = 0xD335 -- 1 byte
OTPartyMon4CaughtGender = 0xD336 -- 1 byte
OTPartyMon4CaughtLocation = 0xD336 -- 1 byte
OTPartyMon4Level = 0xD337 -- 1 byte
OTPartyMon4Status = 0xD338 -- 1 byte
OTPartyMon4Unused = 0xD339 -- 1 byte
OTPartyMon4HP = 0xD33A -- 2 bytes
OTPartyMon4MaxHP = 0xD33C -- 2 bytes
OTPartyMon4Attack = 0xD33E -- 2 bytes
OTPartyMon4Defense = 0xD340 -- 2 bytes
OTPartyMon4Speed = 0xD342 -- 2 bytes
OTPartyMon4SpclAtk = 0xD344 -- 2 bytes
OTPartyMon4SpclDef = 0xD346 -- 2 bytes

OTPartyMon5Species = 0xD348 -- 1 byte
OTPartyMon5Item = 0xD349 -- 1 byte
OTPartyMon5Moves = 0xD34A -- 4 bytes
OTPartyMon5ID = 0xD34E -- 2 bytes
OTPartyMon5Exp = 0xD350 -- 3 bytes
OTPartyMon5HPExp = 0xD353 -- 2 bytes
OTPartyMon5AtkExp = 0xD355 -- 2 bytes
OTPartyMon5DefExp = 0xD357 -- 2 bytes
OTPartyMon5SpdExp = 0xD359 -- 2 bytes
OTPartyMon5SpcExp = 0xD35B -- 2 bytes
OTPartyMon5DVs = 0xD35D -- 2 bytes
OTPartyMon5PP = 0xD35F -- 4 bytes
OTPartyMon5Happiness = 0xD363 -- 1 byte
OTPartyMon5PokerusStatus = 0xD364 -- 1 byte
OTPartyMon5CaughtData = 0xD365 -- 1 byte
OTPartyMon5CaughtLevel = 0xD365 -- 1 byte
OTPartyMon5CaughtTime = 0xD365 -- 1 byte
OTPartyMon5CaughtGender = 0xD366 -- 1 byte
OTPartyMon5CaughtLocation = 0xD366 -- 1 byte
OTPartyMon5Level = 0xD367 -- 1 byte
OTPartyMon5Status = 0xD368 -- 1 byte
OTPartyMon5Unused = 0xD369 -- 1 byte
OTPartyMon5HP = 0xD36A -- 2 bytes
OTPartyMon5MaxHP = 0xD36C -- 2 bytes
OTPartyMon5Attack = 0xD36E -- 2 bytes
OTPartyMon5Defense = 0xD370 -- 2 bytes
OTPartyMon5Speed = 0xD372 -- 2 bytes
OTPartyMon5SpclAtk = 0xD374 -- 2 bytes
OTPartyMon5SpclDef = 0xD376 -- 2 bytes

OTPartyMon6Species = 0xD378 -- 1 byte
OTPartyMon6Item = 0xD379 -- 1 byte
OTPartyMon6Moves = 0xD37A -- 4 bytes
OTPartyMon6ID = 0xD37E -- 2 bytes
OTPartyMon6Exp = 0xD380 -- 3 bytes
OTPartyMon6HPExp = 0xD383 -- 2 bytes
OTPartyMon6AtkExp = 0xD385 -- 2 bytes
OTPartyMon6DefExp = 0xD387 -- 2 bytes
OTPartyMon6SpdExp = 0xD389 -- 2 bytes
OTPartyMon6SpcExp = 0xD38B -- 2 bytes
OTPartyMon6DVs = 0xD38D -- 2 bytes
OTPartyMon6PP = 0xD38F -- 4 bytes
OTPartyMon6Happiness = 0xD393 -- 1 byte
OTPartyMon6PokerusStatus = 0xD394 -- 1 byte
OTPartyMon6CaughtData = 0xD395 -- 1 byte
OTPartyMon6CaughtLevel = 0xD395 -- 1 byte
OTPartyMon6CaughtTime = 0xD395 -- 1 byte
OTPartyMon6CaughtGender = 0xD396 -- 1 byte
OTPartyMon6CaughtLocation = 0xD396 -- 1 byte
OTPartyMon6Level = 0xD397 -- 1 byte
OTPartyMon6Status = 0xD398 -- 1 byte
OTPartyMon6Unused = 0xD399 -- 1 byte
OTPartyMon6HP = 0xD39A -- 2 bytes
OTPartyMon6MaxHP = 0xD39C -- 2 bytes
OTPartyMon6Attack = 0xD39E -- 2 bytes
OTPartyMon6Defense = 0xD3A0 -- 2 bytes
OTPartyMon6Speed = 0xD3A2 -- 2 bytes
OTPartyMon6SpclAtk = 0xD3A4 -- 2 bytes
OTPartyMon6SpclDef = 0xD3A6 -- 2 bytes

OTPartyMon1OT = 0xD3A8 -- 11 bytes
OTPartyMon2OT = 0xD3B3 -- 11 bytes
OTPartyMon3OT = 0xD3BE -- 11 bytes
OTPartyMon4OT = 0xD3C9 -- 11 bytes
OTPartyMon5OT = 0xD3D4 -- 11 bytes
OTPartyMon6OT = 0xD3DF -- 11 bytes
OTPartyMon1Nickname = 0xD3EA -- 11 bytes
OTPartyMon2Nickname = 0xD3F5 -- 11 bytes
OTPartyMon3Nickname = 0xD400 -- 11 bytes
OTPartyMon4Nickname = 0xD40B -- 11 bytes
OTPartyMon5Nickname = 0xD416 -- 11 bytes
OTPartyMon6Nickname = 0xD421 -- 11 bytes

TMsHMs = 0xD859 -- NUM_TMS + NUM_HMS bytes
NumItems = 0xD892 -- 1 byte
Items = 0xD893 -- MAX_ITEMS * 2 + 1 bytes
NumKeyItems = 0xD8BC -- 1 byte
KeyItems = 0xD8BD -- MAX_KEY_ITEMS + 1 bytes
NumBalls = 0xD8D7 -- 1 byte
Balls = 0xD8D8 -- MAX_BALLS * 2 + 1 bytes

PlaPartyCount = 0xDCD7 -- 1 byte
PlaPartySpecies = 0xDCD8 -- 6 bytes
PlaPartyEnd = 0xDCDE -- 1 byte

PartyMon1Species = 0xDCDF -- 1 byte
PartyMon1Item = 0xDCE0 -- 1 byte
PartyMon1Moves = 0xDCE1 -- 4 bytes
PartyMon1ID = 0xDCE5 -- 2 bytes
PartyMon1Exp = 0xDCE7 -- 3 bytes
PartyMon1HPExp = 0xDCEA -- 2 bytes
PartyMon1AtkExp = 0xDCEC -- 2 bytes
PartyMon1DefExp = 0xDCEE -- 2 bytes
PartyMon1SpdExp = 0xDCF0 -- 2 bytes
PartyMon1SpcExp = 0xDCF2 -- 2 bytes
PartyMon1DVs = 0xDCF4 -- 2 bytes
PartyMon1PP = 0xDCF6 -- 4 bytes
PartyMon1Happiness = 0xDCFA -- 1 byte
PartyMon1PokerusStatus = 0xDCFB -- 1 byte
PartyMon1CaughtData = 0xDCFC -- 1 byte
PartyMon1CaughtLevel = 0xDCFC -- 1 byte
PartyMon1CaughtTime = 0xDCFC -- 1 byte
PartyMon1CaughtGender = 0xDCFD -- 1 byte
PartyMon1CaughtLocation = 0xDCFD -- 1 byte
PartyMon1Level = 0xDCFE -- 1 byte
PartyMon1End = 0xDCFF -- 1 byte
PartyMon1Status = 0xDCFF -- 1 byte
PartyMon1Unused = 0xDD00 -- 1 byte
PartyMon1HP = 0xDD01 -- 2 bytes
PartyMon1MaxHP = 0xDD03 -- 2 bytes
PartyMon1Attack = 0xDD05 -- 2 bytes
PartyMon1Defense = 0xDD07 -- 2 bytes
PartyMon1Speed = 0xDD09 -- 2 bytes
PartyMon1SpclAtk = 0xDD0B -- 2 bytes
PartyMon1SpclDef = 0xDD0D -- 2 bytes

PartyMon2Species = 0xDD0F -- 1 byte
PartyMon2Item = 0xDD10 -- 1 byte
PartyMon2Moves = 0xDD11 -- 4 bytes
PartyMon2ID = 0xDD15 -- 2 bytes
PartyMon2Exp = 0xDD17 -- 3 bytes
PartyMon2HPExp = 0xDD1A -- 2 bytes
PartyMon2AtkExp = 0xDD1C -- 2 bytes
PartyMon2DefExp = 0xDD1E -- 2 bytes
PartyMon2SpdExp = 0xDD20 -- 2 bytes
PartyMon2SpcExp = 0xDD22 -- 2 bytes
PartyMon2DVs = 0xDD24 -- 2 bytes
PartyMon2PP = 0xDD26 -- 4 bytes
PartyMon2Happiness = 0xDD2A -- 1 byte
PartyMon2PokerusStatus = 0xDD2B -- 1 byte
PartyMon2CaughtData = 0xDD2C -- 1 byte
PartyMon2CaughtLevel = 0xDD2C -- 1 byte
PartyMon2CaughtTime = 0xDD2C -- 1 byte
PartyMon2CaughtGender = 0xDD2D -- 1 byte
PartyMon2CaughtLocation = 0xDD2D -- 1 byte
PartyMon2Level = 0xDD2E -- 1 byte
PartyMon2End = 0xDD2F -- 1 byte
PartyMon2Status = 0xDD2F -- 1 byte
PartyMon2Unused = 0xDD30 -- 1 byte
PartyMon2HP = 0xDD31 -- 2 bytes
PartyMon2MaxHP = 0xDD33 -- 2 bytes
PartyMon2Attack = 0xDD35 -- 2 bytes
PartyMon2Defense = 0xDD37 -- 2 bytes
PartyMon2Speed = 0xDD39 -- 2 bytes
PartyMon2SpclAtk = 0xDD3B -- 2 bytes
PartyMon2SpclDef = 0xDD3D -- 2 bytes

PartyMon3Species = 0xDD3F -- 1 byte
PartyMon3Item = 0xDD40 -- 1 byte
PartyMon3Moves = 0xDD41 -- 4 bytes
PartyMon3ID = 0xDD45 -- 2 bytes
PartyMon3Exp = 0xDD47 -- 3 bytes
PartyMon3HPExp = 0xDD4A -- 2 bytes
PartyMon3AtkExp = 0xDD4C -- 2 bytes
PartyMon3DefExp = 0xDD4E -- 2 bytes
PartyMon3SpdExp = 0xDD50 -- 2 bytes
PartyMon3SpcExp = 0xDD52 -- 2 bytes
PartyMon3DVs = 0xDD54 -- 2 bytes
PartyMon3PP = 0xDD56 -- 4 bytes
PartyMon3Happiness = 0xDD5A -- 1 byte
PartyMon3PokerusStatus = 0xDD5B -- 1 byte
PartyMon3CaughtData = 0xDD5C -- 1 byte
PartyMon3CaughtLevel = 0xDD5C -- 1 byte
PartyMon3CaughtTime = 0xDD5C -- 1 byte
PartyMon3CaughtGender = 0xDD5D -- 1 byte
PartyMon3CaughtLocation = 0xDD5D -- 1 byte
PartyMon3Level = 0xDD5E -- 1 byte
PartyMon3End = 0xDD5F -- 1 byte
PartyMon3Status = 0xDD5F -- 1 byte
PartyMon3Unused = 0xDD60 -- 1 byte
PartyMon3HP = 0xDD61 -- 2 bytes
PartyMon3MaxHP = 0xDD63 -- 2 bytes
PartyMon3Attack = 0xDD65 -- 2 bytes
PartyMon3Defense = 0xDD67 -- 2 bytes
PartyMon3Speed = 0xDD69 -- 2 bytes
PartyMon3SpclAtk = 0xDD6B -- 2 bytes
PartyMon3SpclDef = 0xDD6D -- 2 bytes

PartyMon4Species = 0xDD6F -- 1 byte
PartyMon4Item = 0xDD70 -- 1 byte
PartyMon4Moves = 0xDD71 -- 4 bytes
PartyMon4ID = 0xDD75 -- 2 bytes
PartyMon4Exp = 0xDD77 -- 3 bytes
PartyMon4HPExp = 0xDD7A -- 2 bytes
PartyMon4AtkExp = 0xDD7C -- 2 bytes
PartyMon4DefExp = 0xDD7E -- 2 bytes
PartyMon4SpdExp = 0xDD80 -- 2 bytes
PartyMon4SpcExp = 0xDD82 -- 2 bytes
PartyMon4DVs = 0xDD84 -- 2 bytes
PartyMon4PP = 0xDD86 -- 4 bytes
PartyMon4Happiness = 0xDD8A -- 1 byte
PartyMon4PokerusStatus = 0xDD8B -- 1 byte
PartyMon4CaughtData = 0xDD8C -- 1 byte
PartyMon4CaughtLevel = 0xDD8C -- 1 byte
PartyMon4CaughtTime = 0xDD8C -- 1 byte
PartyMon4CaughtGender = 0xDD8D -- 1 byte
PartyMon4CaughtLocation = 0xDD8D -- 1 byte
PartyMon4Level = 0xDD8E -- 1 byte
PartyMon4End = 0xDD8F -- 1 byte
PartyMon4Status = 0xDD8F -- 1 byte
PartyMon4Unused = 0xDD90 -- 1 byte
PartyMon4HP = 0xDD91 -- 2 bytes
PartyMon4MaxHP = 0xDD93 -- 2 bytes
PartyMon4Attack = 0xDD95 -- 2 bytes
PartyMon4Defense = 0xDD97 -- 2 bytes
PartyMon4Speed = 0xDD99 -- 2 bytes
PartyMon4SpclAtk = 0xDD9B -- 2 bytes
PartyMon4SpclDef = 0xDD9D -- 2 bytes

PartyMon5Species = 0xDD9F -- 1 byte
PartyMon5Item = 0xDDA0 -- 1 byte
PartyMon5Moves = 0xDDA1 -- 4 bytes
PartyMon5ID = 0xDDA5 -- 2 bytes
PartyMon5Exp = 0xDDA7 -- 3 bytes
PartyMon5HPExp = 0xDDAA -- 2 bytes
PartyMon5AtkExp = 0xDDAC -- 2 bytes
PartyMon5DefExp = 0xDDAE -- 2 bytes
PartyMon5SpdExp = 0xDDB0 -- 2 bytes
PartyMon5SpcExp = 0xDDB2 -- 2 bytes
PartyMon5DVs = 0xDDB4 -- 2 bytes
PartyMon5PP = 0xDDB6 -- 4 bytes
PartyMon5Happiness = 0xDDBA -- 1 byte
PartyMon5PokerusStatus = 0xDDBB -- 1 byte
PartyMon5CaughtData = 0xDDBC -- 1 byte
PartyMon5CaughtLevel = 0xDDBC -- 1 byte
PartyMon5CaughtTime = 0xDDBC -- 1 byte
PartyMon5CaughtGender = 0xDDBD -- 1 byte
PartyMon5CaughtLocation = 0xDDBD -- 1 byte
PartyMon5Level = 0xDDBE -- 1 byte
PartyMon5End = 0xDDBF -- 1 byte
PartyMon5Status = 0xDDBF -- 1 byte
PartyMon5Unused = 0xDDC0 -- 1 byte
PartyMon5HP = 0xDDC1 -- 2 bytes
PartyMon5MaxHP = 0xDDC3 -- 2 bytes
PartyMon5Attack = 0xDDC5 -- 2 bytes
PartyMon5Defense = 0xDDC7 -- 2 bytes
PartyMon5Speed = 0xDDC9 -- 2 bytes
PartyMon5SpclAtk = 0xDDCB -- 2 bytes
PartyMon5SpclDef = 0xDDCD -- 2 bytes

PartyMon6Species = 0xDDCF -- 1 byte
PartyMon6Item = 0xDDD0 -- 1 byte
PartyMon6Moves = 0xDDD1 -- 4 bytes
PartyMon6ID = 0xDDD5 -- 2 bytes
PartyMon6Exp = 0xDDD7 -- 3 bytes
PartyMon6HPExp = 0xDDDA -- 2 bytes
PartyMon6AtkExp = 0xDDDC -- 2 bytes
PartyMon6DefExp = 0xDDDE -- 2 bytes
PartyMon6SpdExp = 0xDDE0 -- 2 bytes
PartyMon6SpcExp = 0xDDE2 -- 2 bytes
PartyMon6DVs = 0xDDE4 -- 2 bytes
PartyMon6PP = 0xDDE6 -- 4 bytes
PartyMon6Happiness = 0xDDEA -- 1 byte
PartyMon6PokerusStatus = 0xDDEB -- 1 byte
PartyMon6CaughtData = 0xDDEC -- 1 byte
PartyMon6CaughtLevel = 0xDDEC -- 1 byte
PartyMon6CaughtTime = 0xDDEC -- 1 byte
PartyMon6CaughtGender = 0xDDED -- 1 byte
PartyMon6CaughtLocation = 0xDDED -- 1 byte
PartyMon6Level = 0xDDEE -- 1 byte
PartyMon6End = 0xDDEF -- 1 byte
PartyMon6Status = 0xDDEF -- 1 byte
PartyMon6Unused = 0xDDF0 -- 1 byte
PartyMon6HP = 0xDDF1 -- 2 bytes
PartyMon6MaxHP = 0xDDF3 -- 2 bytes
PartyMon6Attack = 0xDDF5 -- 2 bytes
PartyMon6Defense = 0xDDF7 -- 2 bytes
PartyMon6Speed = 0xDDF9 -- 2 bytes
PartyMon6SpclAtk = 0xDDFB -- 2 bytes
PartyMon6SpclDef = 0xDDFD -- 2 bytes

PartyMon1OT = 0xDDFF -- 11 bytes
PartyMon2OT = 0xDE0A -- 11 bytes
PartyMon3OT = 0xDE15 -- 11 bytes
PartyMon4OT = 0xDE20 -- 11 bytes
PartyMon5OT = 0xDE2B -- 11 bytes
PartyMon6OT = 0xDE36 -- 11 bytes
PartyMon1Nickname = 0xDE41 -- 11 bytes
PartyMon2Nickname = 0xDE4C -- 11 bytes
PartyMon3Nickname = 0xDE57 -- 11 bytes
PartyMon4Nickname = 0xDE62 -- 11 bytes
PartyMon5Nickname = 0xDE6D -- 11 bytes
PartyMon6Nickname = 0xDE78 -- 11 bytes

wMilitaryMode = 0xDFFA -- 1 byte

rSVBK = 0xFF70 -- 1 byte
rLSB = 0xFFF1 -- 1 byte
rLSC = 0xFFF2 -- 1 byte

-- Beesafree constants

BEESAFREE_LSC_TRANSFERRING  = 0xFF
BEESAFREE_LSC_COMPLETED     = 0x00

BEESAFREE_SND_RESET         = 0x00
BEESAFREE_SND_ASKMOVE       = 0x01
BEESAFREE_SND_ASKITEM       = 0x02

BEESAFREE_RES_RESET         = 0x00
