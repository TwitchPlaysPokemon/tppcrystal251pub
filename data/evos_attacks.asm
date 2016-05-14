INCLUDE "includes.asm"


SECTION "Evolutions and Attacks", ROMX, BANK[EVOS_ATTACKS]


INCLUDE "data/evos_attacks_pointers.asm"


EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL,16,IVYSAUR
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,GROWL
	db 6,LEECH_SEED
	db 9,VINE_WHIP
	db 12,POISONPOWDER
	db 15,MUD_SLAP ; tm move
	db 18,RAZOR_LEAF
	db 21,HEADBUTT ; tm move
	db 24,GROWTH
	db 27,SLUDGE ; egg move
	db 30,SLEEP_POWDER
	db 33,SEED_BOMB ; later gen move
	db 36,SUNNY_DAY ; tm move
	db 39,DOUBLE_EDGE ;gen 6 move
	db 42,SYNTHESIS
	db 45,SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL,32,VENUSAUR
	db 0 ; no more evolutions
	db 1,GROWL
	db 1,LEECH_SEED
	db 1,VINE_WHIP
	db 1,POISONPOWDER
	db 20,RAZOR_LEAF
	db 23,HEADBUTT ; tm move
	db 26,GROWTH
	db 30,SLUDGE ; egg move
	db 34,SLEEP_POWDER
	db 37,SEED_BOMB ; later gen move
	db 41,DOUBLE_EDGE ;gen 6 move
	db 45,SYNTHESIS
	db 50,SUNNY_DAY ; tm move
	db 55,SOLARBEAM
	db 60,ANCIENTPOWER ; * event move
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1,OUTRAGE
	db 1,REFLECT 
	db 1,LIGHT_SCREEN
	db 1,RAZOR_LEAF
	db 1,HEADBUTT ; tm move
	db 1,GROWTH
	db 1,SLUDGE ; egg move
	db 34,WRAP ; * later gen move
	db 37,POISONPOWDER
	db 40,SEED_BOMB ; later gen move
	db 44,DOUBLE_EDGE ;gen 6 move
	db 48,SYNTHESIS
	db 52,SUNNY_DAY ; tm move
	db 57,SOLARBEAM
	db 62,SLEEP_POWDER
	db 66,SLUDGE_BOMB ; * tm move
	db 70,LEECH_SEED
	db 75,ANCIENTPOWER ; event move
	db 80,PETAL_DANCE ; * later gen move
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL,16,CHARMELEON
	db 0 ; no more evolutions
	db 1,SCRATCH
	db 3,GROWL
	db 6,EMBER
	db 9,METAL_CLAW
	db 12,SMOKESCREEN
	db 15,FIRE_SPIN
	db 18,BITE
	db 21,SCARY_FACE
	db 24,HEADBUTT ; tm move
	db 27,FIRE_PUNCH
	db 30,DRAGON_RAGE
	db 33,SLASH
	db 36,FLAMETHROWER
	db 39,BELLY_DRUM
	db 42,CRUNCH ; later gen move
	db 45,DOUBLE_EDGE
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL,36,CHARIZARD
	db 0 ; no more evolutions
	db 1,GROWL
	db 1,METAL_CLAW
	db 1,SMOKESCREEN
	db 1,FIRE_SPIN
	db 19,BITE
	db 22,SCARY_FACE
	db 25,HEADBUTT ; tm move
	db 28,DRAGON_RAGE
	db 32,FIRE_PUNCH ; tm move
	db 35,ANCIENTPOWER ; * egg move
	db 39,SLASH
	db 44,BELLY_DRUM ; egg move
	db 48,FLAMETHROWER
	db 52,CRUNCH ; later gen move
	db 56,IRON_TAIL ; egg move
	db 60,SWORDS_DANCE ; * gen 1 move
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1,FISSURE
	db 1,SUBMISSION
	db 1,SWIFT
	db 1,WING_ATTACK ; *
	db 1,DRAGON_RAGE
	db 1,FIRE_SPIN
	db 1,BITE
	db 36, WING_ATTACK ; *
	db 39, ANCIENTPOWER ; egg move
	db 42, STEEL_WING ; *
	db 45, FIRE_PUNCH ; tm move
	db 48, SLASH
	db 51, BELLY_DRUM ; egg move
	db 56, CRUNCH ;  later gen move
	db 61, FLAMETHROWER
	db 65, OUTRAGE ; *
	db 70, ROAR ; *
	db 75, AIR_SLASH ; *
	db 80, FLARE_BLITZ ; * later gen move
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL,16,WARTORTLE
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,TAIL_WHIP
	db 6,BUBBLE
	db 8,WITHDRAW
	db 10,RAPID_SPIN
	db 13,HAZE ; egg move
	db 15,WATER_GUN
	db 18,CONFUSION
	db 21,BITE
	db 24,IRON_DEFENSE ; later gen move
	db 28,BUBBLEBEAM ; gen 1 move
	db 31,SUBMISSION ; gen 1 move
	db 35,RAIN_DANCE ; tm move
	db 38,ICE_PUNCH ; tm move
	db 42,HYDRO_PUMP
	db 45,MIRROR_COAT ; egg move
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, WITHDRAW
	db 1, RAPID_SPIN
	db 1, HAZE ; egg move
	db 1, WATER_GUN
	db 20, CONFUSION
	db 23, BITE
	db 26, IRON_DEFENSE ; later gen move
	db 30, BUBBLEBEAM ; gen 1 move
	db 34, SUBMISSION ; gen 1 move
	db 38, MIRROR_COAT ; egg move
	db 43, AQUA_JET ; * later gen move
	db 47, ICE_PUNCH ; tm move
	db 51, OUTRAGE ; * gen 1 move
	db 55, RAIN_DANCE ; tm move
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIST
	db 1, BIDE
	db 1, FLASH_CANNON ; * later gen move
	db 1, IRON_DEFENSE ; later gen move
	db 1, SUBMISSION ; gen 1 move
	db 1, BUBBLEBEAM ; gen 1 move
	db 39, IRON_TAIL ; * later gen move
	db 44, MIRROR_COAT ; egg move
	db 49, ICE_PUNCH ; tm move
	db 53, AQUA_JET ; later gen move
	db 58, ROAR ; *
	db 63, MEGA_KICK ;  gen 1 move
	db 68, COUNTER ; *
	db 74, HYDRO_PUMP
	db 80, ZAP_CANNON ; * event
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1,TACKLE
	db 1,HARDEN
	db 4,STRING_SHOT
	db 7,HARDEN
	db 15, IRON_DEFENSE
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1,REFLECT
	db 1,TACKLE
	db 1,STRING_SHOT
	db 1,HARDEN
	db 10,CONFUSION
	db 13,POISONPOWDER
	db 16,GUST
	db 18,TWISTER
	db 20,SUPERSONIC
	db 23,PSYBEAM
	db 26,STUN_SPORE
	db 29,SWIFT ; tm move
	db 32,NIGHTMARE ; later gen move
	db 32,DREAM_EATER ; tm move
	db 32,SLEEP_POWDER
	db 34,GIGA_DRAIN
	db 37,PSYCHIC_M
	db 40,MORNING_SUN ; tm move
	db 43,AIR_SLASH
	db 47,BUG_BUZZ ; gen 6 move
	db 51,WHIRLWIND ; illegal move
	db 55,SAFEGUARD
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, STRING_SHOT
	db 100, HORN_DRILL
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, HARDEN
	db 4, STRING_SHOT
	db 7, HARDEN
	db 15, IRON_DEFENSE
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1,DOUBLE_EDGE
	db 1,REFLECT
	db 1,STRING_SHOT
	db 1,HARDEN
	db 1, POISON_STING
	db 10, RAGE
	db 14, FOCUS_ENERGY
	db 18, FURY_ATTACK
	db 21, TWINEEDLE
	db 24, PURSUIT
	db 27, SPIKES ; learns Toxic Spikes later gen
	db 30, BATON_PASS ; later gen move
	db 34, AGILITY ; gen 1 move
	db 38, PIN_MISSILE ; later gen move
	db 42, TOXIC ; tm move
	db 45, HORN_DRILL ; illegal move
	db 49, SWORDS_DANCE
	db 52, FURY_CUTTER ; tm move
	db 56, POISON_JAB ; later gen move
	db 60, DOUBLE_TEAM ; tm move
	db 65, DRILL_RUN ; later gen move
	db 70, X_SCISSOR ; later gen move
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL,18,PIDGEOTTO
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,SAND_ATTACK
	db 5,QUICK_ATTACK
	db 8,GUST
	db 11,MUD_SLAP ; tm move
	db 14,TWISTER
	db 17,SWIFT
	db 20,WING_ATTACK
	db 23,AGILITY
	db 26,STEEL_WING ; tm move
	db 29,TAKE_DOWN
	db 32,AIR_SLASH
	db 35,WHIRLWIND ; gen 1 move
	db 38,HEAT_WAVE ; later gen move
	db 42,DOUBLE_EDGE
	db 45,SKY_ATTACK
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL,36,PIDGEOT
	db 0 ; no more evolutions
	db 1,TWISTER
	db 1,GUST
	db 1,MUD_SLAP
	db 1,SWIFT
	db 21,WHIRLWIND
	db 24,WING_ATTACK
	db 28,STEEL_WING 
	db 31,TAKE_DOWN
	db 35,FAINT_ATTACK 
	db 39,AIR_SLASH
	db 43,MIRROR_MOVE 
	db 47,DOUBLE_EDGE ; gen 1 move
	db 51,HEAT_WAVE ; later gen move
	db 55,REFLECT ; * gen 1 move
	db 60,SKY_ATTACK
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBMISSION
	db 1, FAINT_ATTACK
	db 1, STEEL_WING
	db 1, TAKE_DOWN
	db 1, WING_ATTACK 
	db 40, PURSUIT 
	db 44, MIRROR_MOVE 
	db 48, HYPER_BEAM 
	db 52, REFLECT
	db 56, SKY_ATTACK
	db 61, AGILITY
	db 65, RAGE 
	db 70, DOUBLE_EDGE 
	db 75, AIR_SLASH
	db 80, HEAT_WAVE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL,20,RATICATE
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,TAIL_WHIP
	db 5,PURSUIT
	db 7,MUD_SLAP ; tm move
	db 10,QUICK_ATTACK
	db 13,FLAME_WHEEL ; egg move
	db 16,BITE ; egg move
	db 19,HYPER_FANG
	db 22,SHARPEN
	db 26,DIG
	db 29,SUPER_FANG
	db 32,HEADBUTT
	db 36,SCREECH ; egg move
	db 39,CRUNCH ; later gen move
	db 42,REVERSAL ; egg move
	db 45,DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1,BUBBLEBEAM
	db 1,QUICK_ATTACK
	db 1,FLAME_WHEEL ; egg move
	db 1,BITE ; egg move
	db 1,HYPER_FANG
	db 24,SHARPEN
	db 28,DIG
	db 32,ROAR
	db 36,HEADBUTT
	db 40,SUPER_FANG
	db 44,REVERSAL ; egg move
	db 48,SCARY_FACE ;
	db 52,DOUBLE_EDGE ; tm move
	db 56,COUNTER ; later gen move
	db 61,CRUNCH ; * illegal move
	db 65,IRON_TAIL ; * later gen move
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL,20,FEAROW
	db 0 ; no more evolutions
	db 1,PECK
	db 3,GROWL
	db 6,FURY_ATTACK
	db 9,LEER
	db 12,MUD_SLAP ; later gen move
	db 15,SONICBOOM ; event move
	db 18,TAKE_DOWN ; gen 1 move
	db 21,FAINT_ATTACK ; egg move
	db 24,QUICK_ATTACK
	db 27,DRILL_PECK
	db 30,STEEL_WING ; tm move
	db 33,AGILITY
	db 36,DOUBLE_EDGE ; later gen move
	db 39,WHIRLWIND ; egg move
	db 42,DRILL_RUN ; later gen move
	db 45,SKY_ATTACK ; later gen move
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1,MIRROR_MOVE
	db 1,SCARY_FACE
	db 1,BATON_PASS
	db 1,PECK
	db 1,GROWL
	db 1,SONICBOOM ; event move
	db 1,TAKE_DOWN ; gen 1 move
	db 24,WING_ATTACK
	db 28,AGILITY ; later gen move
	db 32,FAINT_ATTACK
	db 36,TRI_ATTACK
	db 39,DRILL_PECK
	db 43,STEEL_WING ; tm move
	db 47,HEAT_WAVE
	db 52,WHIRLWIND
	db 56,SKY_ATTACK
	db 60,DOUBLE_EDGE ; * egg move
	db 65,DRILL_RUN ; * later gen move
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 3, LEER
	db 6, PURSUIT ; egg move
	db 9, POISON_STING
	db 12, GLARE
	db 15, BITE
	db 18, HAZE ; egg move
	db 20, ACID
	db 23, SLAM
	db 26, SLUDGE_BOMB
	db 28, BIDE ; egg move
	db 30, SCREECH
	db 33, POISON_JAB ; later gen move
	db 36, CRUNCH ; later gen move
	db 39, IRON_TAIL ; later gen move
	db 42, SEED_BOMB ; later gen move
	db 45, GUNK_SHOT ; later gen move
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1,DISABLE
	db 1,SPITE
	db 1,SCARY_FACE
	db 1,HEADBUTT
	db 1, GLARE
	db 1, BITE
	db 1, HAZE ; egg move
	db 1, POISON_STING
	db 26, SLAM
	db 29, SLUDGE_BOMB  ; egg move
	db 32, SCREECH
	db 35, IRON_TAIL ; later gen move
	db 39, POISON_JAB ; later gen move
	db 43, CRUNCH ; later gen move
	db 47, SEED_BOMB ; later gen move
	db 51, DOUBLE_EDGE ; * tm move
	db 55, GUNK_SHOT
	db 60, ROCK_SLIDE ; * gen 1 move
	db 65, FISSURE ; * gen 1 move
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 7,  QUICK_ATTACK
	db 11, TAIL_WHIP
	db 14, SLAM
	db 17, SPARK
	db 20, DOUBLE_TEAM
	db 22, LIGHT_SCREEN
	db 25, THUNDER_WAVE
	db 28, THUNDERPUNCH ;
	db 32, IRON_TAIL
	db 36, THUNDERBOLT
	db 39, EXTREMESPEED ; event move
	db 42, SING ; Pikachu event move
	db 46, NASTY_PLOT ; later gen move
	db 50, THUNDER ; *
	db 55, PETAL_DANCE ; *event move
	db 60, ENCORE
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 10, QUICK_ATTACK
	db 15, TAIL_WHIP
	db 20, SLAM ; later gen move
	db 30, SPARK ; later gen move
	db 40, THUNDER_WAVE
	db 50, IRON_TAIL ; Pikachu event move
	db 60, THUNDERBOLT ; later gen move
	db 70, COUNTER
	db 80, NASTY_PLOT ; later gen move
	db 90, PETAL_DANCE ; *
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 3, DEFENSE_CURL
	db 6, MUD_SLAP
	db 9, POISON_STING
	db 12, METAL_CLAW ; Fury Swipes replacement
	db 15, FLAIL
	db 18, ENDURE
	db 21, MAGNITUDE
	db 24, SLASH
	db 27, FURY_CUTTER
	db 30, SANDSTORM
	db 33, DIG
	db 36, POISON_JAB
	db 39, ROCK_SLIDE
	db 42, SUPER_FANG
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, IRON_TAIL
	db 1, SUBMISSION
	db 1, RAPID_SPIN
	db 1, ENDURE ; later gen move
	db 1, FLAIL ; Fury Swipes replacement
	db 1, METAL_CLAW ; egg move
	db 1, MAGNITUDE ; later gen move
	db 26, SLASH
	db 30, FURY_CUTTER
	db 35, SANDSTORM ; other gen move
	db 39, DIG ; tm move
	db 43, BODY_SLAM ; * later gen move
	db 47, ROCK_SLIDE ; tm move
	db 51, X_SCISSOR ; egg move
	db 55, EARTHQUAKE
	db 60, POISON_JAB ; later gen move
	db 65, SUPER_FANG ; *
	db 70, FISSURE ; * gen 1 move
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, SCRATCH ; later gen move
	db 3, GROWL
	db 6, PURSUIT ; egg move
	db 9, DOUBLE_KICK
	db 12, POISON_STING
	db 15, TAIL_WHIP
	db 18, BITE
	db 21, SLUDGE
	db 24, SWEET_KISS ; later gen move
	db 27, HEADBUTT ; event move
	db 30, POISON_JAB ; egg move
	db 33, DISABLE ; egg move
	db 36, SLUDGE_BOMB ; later gen move
	db 39, IRON_TAIL
	db 42, SUPER_FANG ; later gen move
	db 45, LOVELY_KISS ; event move
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, REFLECT
	db 1, PURSUIT ; egg move
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 1, POISON_STING
	db 19, BITE ; Fury Swipes replacement
	db 22, SLUDGE
	db 25, SWEET_KISS ; later gen move
	db 29, CHARM ; event move
	db 33, POISON_JAB ; *
	db 37, CRUNCH ; * egg move
	db 41, SUPER_FANG ; later gen move
	db 45, SLUDGE_BOMB ; later gen move
	db 50, IRON_TAIL
	db 55, LOVELY_KISS ; event move
	db 60, MOONLIGHT ; * event move
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_KICK
	db 1, FISSURE
	db 1, TAIL_WHIP
	db 1, DOUBLE_KICK ; event move
	db 1, PURSUIT ; egg move
	db 1,  POISON_STING; later gen move
	db 30, BITE
	db 40, DIG ; * tm move
	db 50, SUPER_FANG
	db 60, POISON_JAB ; later gen move
	db 70, MOONLIGHT ; event move
	db 80, DRILL_RUN ;
	db 90, OUTRAGE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, PECK ; later gen move
	db 3, LEER
	db 6, FURY_ATTACK
	db 9, DOUBLE_KICK
	db 12, POISON_STING
	db 15, CONFUSION ; egg move
	db 18, HORN_ATTACK
	db 21, DISABLE ; egg move
	db 24, SLUDGE ; later gen move
	db 27, SWEET_KISS ; event move
	db 30, POISON_JAB ; egg move
	db 33, HEADBUTT ; egg move
	db 36, SLUDGE_BOMB ; later gen move
	db 39, DRILL_RUN ; tm move
	db 42, SUPER_FANG
	db 45, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, CONFUSION
	db 1, FURY_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 19, HORN_ATTACK
	db 22, SLUDGE
	db 25, SWEET_KISS
	db 29, AMNESIA ; event move
	db 33, POISON_JAB ; later gen move
	db 36, HEADBUTT
	db 40, IRON_TAIL ; egg move
	db 44, OUTRAGE ; later gen move
	db 48, SLUDGE_BOMB ; later gen move
	db 52, DRILL_RUN ; tm move
	db 56, FOCUS_ENERGY ; *
	db 60, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBMISSION
	db 1, MEGA_KICK
	db 1, DOUBLE_KICK
	db 1, LEER
	db 1, CONFUSION
	db 1, POISON_STING
	db 30, HORN_ATTACK
	db 40, DIG ; * tm move
	db 50, THRASH ; *
	db 60, MEGAHORN ; * later gen move
	db 70, FISSURE
	db 80, DRILL_RUN ; * later gen move
	db 90, ROAR
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 4, GROWL
	db 8, ENCORE
	db 12, SING
	db 15, FAIRY_WIND ; illegal move
	db 18, METRONOME ; egg move
	db 22, SWEET_KISS
	db 25, MINIMIZE
	db 28, PLAY_ROUGH
	db 31, BELLY_DRUM
	db 35, DOUBLE_EDGE
	db 38, LIGHT_SCREEN
	db 41, MOONBLAST
	db 44, SOFTBOILED ; later gen move
	db 47, TRI_ATTACK
	db 50, PETAL_DANCE  ; *
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLESLAP ; later gen move
	db 5, GROWL ; egg move
	db 10, ENCORE
	db 15, SING
	db 20, FAIRY_WIND
	db 30, HEADBUTT ; * egg move
	db 40, BELLY_DRUM ; * event move
	db 50, DIZZY_PUNCH ; * later gen move
	db 60, IRON_TAIL ; * later gen move
	db 70, MOONLIGHT ; *
	db 80, HEAL_BELL ; later gen move
	db 90, MOONBLAST
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM,FIRE_STONE,NINETALES
	db 0 ; no more evolutions
	db 1,QUICK_ATTACK
	db 1,TAIL_WHIP
	db 5,DISABLE
	db 8,EMBER
	db 11,FAINT_ATTACK
	db 14,SAFEGUARD
	db 17,ROAR
	db 20,FIRE_SPIN
	db 23,REFLECT ; egg move
	db 27,IRON_TAIL
	db 29,WILLOWISP ; later gen move
	db 32,HEAT_WAVE ; later gen move
	db 36,HYPNOSIS ; egg move
	db 39,CONFUSE_RAY
	db 42,PSYCHIC_M ; illegal move
	db 45,FLAMETHROWER
	db 48,PAIN_SPLIT
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK ;
	db 1, TAIL_WHIP ;
	db 5, DISABLE ;
	db 10, EMBER ;
	db 15, FAINT_ATTACK
	db 20, ROAR
	db 30, FIRE_SPIN
	db 40, REFLECT
	db 50, NASTY_PLOT
	db 60, PAIN_SPLIT ; *
	db 70, FLAMETHROWER ;
	db 80, SUNNY_DAY
	db 90, SOLARBEAM
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SING
	db 3, REFLECT
	db 6, DOUBLESLAP
	db 9, FAINT_ATTACK
	db 12, HEAL_BELL
	db 15, FAIRY_WIND
	db 18, DEFENSE_CURL  ; event move
	db 22, ROLLOUT; event move
	db 23, SING
	db 25, DIZZY_PUNCH ; event move
	db 29, TRI_ATTACK ; * later gen move
	db 33, LIGHT_SCREEN
	db 36, PERISH_SONG ; *
	db 39, PLAY_ROUGH ; wigglytuff move
	db 42, DOUBLE_EDGE
	db 46, COUNTER ; *
	db 50, PETAL_DANCE ;
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SING
	db 5, REFLECT
	db 10, DOUBLESLAP
	db 15, HEAL_BELL
	db 20, DEFENSE_CURL
	db 30, ROLLOUT ; * later gen move
	db 40, DIZZY_PUNCH ; * gen 1 move
	db 50, TRI_ATTACK
	db 60, COUNTER
	db 70, PETAL_DANCE
	db 80, PLAY_ROUGH
	db 90, DOUBLE_EDGE ; *
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 3, SUPERSONIC
	db 6, QUICK_ATTACK ; egg move
	db 9, LEECH_LIFE 
	db 12, GUST ; egg move
	db 15, FAINT_ATTACK ; egg move
	db 18, CONFUSE_RAY
	db 21, BITE
	db 24, WING_ATTACK ; later gen move
	db 27, HAZE
	db 30, GIGA_DRAIN ; tm move
	db 33, WHIRLWIND ; egg move
	db 36, POISON_JAB ; illegal move
	db 39, STEEL_WING ; later gen move
	db 42, SUPER_FANG ; later gen move
	db 45, AIR_SLASH ; later gen move
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, FAINT_ATTACK
	db 1, CONFUSE_RAY
	db 1, BITE
	db 1, GUST ; egg move
	db 24, SWIFT ; * tm move
	db 28, HAZE
	db 32, GIGA_DRAIN ; tm move
	db 35, WING_ATTACK ; later gen move
	db 39, WHIRLWIND ; egg move
	db 43, STEEL_WING ; later gen move
	db 47, SUPER_FANG ; later gen move
	db 51, POISON_JAB ; illegal move
	db 55, HEAT_WAVE
	db 59, HYPNOSIS ; * later gen move
	db 59, NIGHTMARE ; * tm move
	db 64, AIR_SLASH ; later gen move
	db 68, GUNK_SHOT
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 3, POISONPOWDER
	db 6, CHARM ; egg move
	db 9, ACID
	db 12, MEGA_DRAIN
	db 15, STUN_SPORE
	db 18, ENDURE ; tm move
	db 20, FLAIL ; egg move
	db 23, POISON_JAB ; illegal move
	db 26, SLEEP_POWDER
	db 30, SUNNY_DAY
	db 33, SOLARBEAM
	db 36, TOXIC ; tm move
	db 39, MOONLIGHT
	db 42, MOONBLAST ; later gen move
	db 45, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, SAFEGUARD
	db 1, SYNTHESIS
	db 1, REFLECT
	db 1, STUN_SPORE
	db 1, MEGA_DRAIN
	db 1, ENDURE ; tm move
	db 1, FLAIL ; egg move
	db 25, POISON_JAB ; illegal move
	db 29, RAZOR_LEAF ; * egg move
	db 33, SLEEP_POWDER
	db 37, SUNNY_DAY
	db 41, SOLARBEAM
	db 45, TOXIC ; tm move
	db 50, LEECH_SEED ; * event move
	db 55, MOONBLAST ; later gen move
	db 60, PETAL_DANCE
	db 0 ; no more level-up moves


VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, STUN_SPORE
	db 1, MEGA_DRAIN
	db 1, ENDURE
	db 1, FLAIL
	db 30, POISON_JAB ; illegal move
	db 40, RAZOR_LEAF ; egg move
	db 50, SLEEP_POWDER
	db 60, SEED_BOMB
	db 70, MOONBLAST
	db 80, SLUDGE_BOMB ; * later gen move
	db 90, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 3, STUN_SPORE
	db 5, METAL_CLAW ; egg move
	db 8, LEECH_LIFE
	db 11, PSYBEAM ; egg move
	db 14, POISONPOWDER
	db 17, GROWTH
	db 20, GIGA_DRAIN
	db 23, SLASH
	db 26, LEECH_SEED ; egg move
	db 30, FURY_CUTTER ; tm move
	db 33, AGILITY
	db 36, DOUBLE_EDGE
	db 39, SWORDS_DANCE ; gen 1 move
	db 42, X_SCISSOR ; later gen move
	db 45, SPORE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, LIGHT_SCREEN
	db 1, PURSUIT
	db 1, SYNTHESIS
	db 1, PSYBEAM ; egg move
	db 1, DIG ; tm move
	db 1, GROWTH
	db 1, GIGA_DRAIN
	db 28, BODY_SLAM ; * later gen move
	db 33, LEECH_SEED ; egg move
	db 38, FURY_CUTTER ; tm move
	db 42, SLASH
	db 47, GIGA_DRAIN
	db 51, AGILITY
	db 55, X_SCISSOR ; later gen move
	db 60, SWORDS_DANCE ; gen 1 move
	db 65, SPORE
	db 70, SEED_BOMB ; * later gen move
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, FORESIGHT
	db 6, POISONPOWDER
	db 9, CONFUSION
	db 12, LEECH_LIFE
	db 15, DISABLE
	db 18, GIGA_DRAIN ; egg move
	db 21, STUN_SPORE
	db 24, SLUDGE ; illegal move
	db 27, ZEN_HEADBUTT ; later gen move
	db 30, AGILITY
	db 33, BATON_PASS; later gen move
	db 36, SLUDGE_BOMB ; later gen move
	db 39, SUPERSONIC
	db 42, SLEEP_POWDER
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, PSYWAVE
	db 1, SCREECH
	db 1, GIGA_DRAIN
	db 1, SUPERSONIC
	db 1, SLUDGE ; illegal move
	db 1, ZEN_HEADBUTT ; later gen move
	db 31, GUST ; *
	db 35, PSYBEAM ; * egg move
	db 39, SLUDGE ; illegal move
	db 43, AGILITY ; later gen move
	db 47, BATON_PASS ; egg move
	db 51, PSYCHIC_M
	db 55, SLUDGE_BOMB ; later gen move
	db 60, SLEEP_POWDER
	db 65, MORNING_SUN ; later gen move
	db 70, BUG_BUZZ ; * later gen move
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 3, GROWL
	db 6, SCRATCH
	db 9, PURSUIT ; egg move
	db 12, MAGNITUDE
	db 15, CHARM ; Fury Swipes replacement
	db 18, FAINT_ATTACK ; egg move
	db 21, ANCIENTPOWER ; egg move
	db 24, EARTH_POWER ; later gen move
	db 27, SLASH
	db 30, DOUBLE_TEAM ; tm move
	db 33, SCREECH ; egg move
	db 36, DIG
	db 38, ENDURE
	db 40, REVERSAL
	db 42, ROCK_SLIDE
	db 45, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, TAKE_DOWN
	db 1, CHARM
	db 1, SAND_ATTACK
	db 1, FAINT_ATTACK ; egg move
	db 1, ANCIENTPOWER ; egg move
	db 1, EARTH_POWER ; later gen move
	db 29, SLASH
	db 33, DOUBLE_TEAM ; tm move
	db 38, SCREECH ; egg move
	db 44, DIG
	db 48, ENDURE
	db 51, REVERSAL
	db 56, FISSURE
	db 61, ROCK_SLIDE
	db 65, DOUBLE_EDGE ; * gen 1 move
	db 70, EARTHQUAKE ; *
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 3, GROWL
	db 6, FAINT_ATTACK
	db 9, PAY_DAY
	db 12, SING
	db 15, CHARM ; egg move
	db 18, BITE
	db 21, SLASH
	db 24, MUD_SLAP
	db 27, AMNESIA
	db 30, SCREECH
	db 33, GUNK_SHOT ; later gen move
	db 36, DOUBLE_EDGE
	db 39, IRON_TAIL
	db 42, SUBSTITUTE ; gen 1 move
	db 45, SPITE ; egg move
	db 48, FLAIL ; later gen move
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, ENDURE
	db 1, SEED_BOMB
	db 1, SWIFT
	db 1, BUBBLEBEAM
	db 1, AMNESIA ; egg move move
	db 1, SLASH
	db 1, BITE
	db 1, MUD_SLAP
	db 30, ROAR ; *
	db 33, HEADBUTT
	db 36, SCREECH
	db 39, IRON_TAIL ; tm move
	db 42, GUNK_SHOT ; later gen move
	db 46, DOUBLE_EDGE
	db 50, PLAY_ROUGH ; * later gen move
	db 54, SPITE ; egg move
	db 58, PETAL_DANCE ; * event move
	db 62, TRI_ATTACK ; illegal
	db 66, DARK_PULSE ; * later gen move
	db 70, HYPNOSIS ; * egg move
	db 75, NASTY_PLOT ; * later gen move
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 3, TAIL_WHIP
	db 6, AQUA_JET
	db 9, CONFUSION
	db 12, DISABLE
	db 15, FUTURE_SIGHT ; egg move
	db 18, WATER_GUN ; later gen move
	db 21, PSYBEAM ; egg move
	db 24, AMNESIA ; egg move
	db 27, IRON_TAIL
	db 30, BUBBLEBEAM ; gen 1 move
	db 34, CROSS_CHOP ; egg move
	db 37, PSYCHIC_M
	db 40, DOUBLE_EDGE
	db 42, HYDRO_PUMP
	db 45, HYPNOSIS ; egg move
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, LIGHT_SCREEN
	db 1, PETAL_DANCE
	db 1, TRI_ATTACK
	db 1, AMNESIA ; egg move
	db 1, PSYBEAM ; egg move
	db 1, IRON_TAIL
	db 1, BUBBLEBEAM ; gen 1 move
	db 36, CROSS_CHOP ; egg move
	db 40, CONFUSE_RAY 
	db 44, HEADBUTT
	db 48, HYDRO_PUMP ; * later gen move
	db 52, NASTY_PLOT ; * later gen move
	db 56, PSYCHIC_M
	db 61, ENCORE
	db 65, WATERFALL ;
	db 70, MEDITATE ;
	db 75, MEGA_KICK ; * gen 1 move
	db 80, ZEN_HEADBUTT ; * later gen move
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, SCRATCH
	db 3, LEER
	db 6, DEFENSE_CURL ; later gen move
	db 9, PAY_DAY ; gen 1 move
	db 12, KARATE_CHOP
	db 15, ENCORE ; gen 1 move
	db 18, MEDITATE ; egg move
	db 21, ENDURE ; tm move
	db 23, REVERSAL ; egg move
	db 26, FORESIGHT ; egg move
	db 29, SEISMIC_TOSS
	db 32, THRASH
	db 36, CROSS_CHOP
	db 39, SCREECH
	db 42, ROCK_SLIDE ; egg move
	db 45, MEGA_KICK
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, IRON_TAIL
	db 1, MEDITATE
	db 1, FORESIGHT ; egg move
	db 1, ENDURE ; tm move
	db 1, REVERSAL ; egg move
	db 33, THRASH
	db 36, FORESIGHT ; egg move
	db 40, SCREECH
	db 44, CROSS_CHOP
	db 49, POISON_JAB ; * later gen move
	db 52, FOCUS_ENERGY ; *
	db 56, MEGA_KICK
	db 60, DYNAMICPUNCH ; * tm move
	db 65, SEED_BOMB ; * later gen move
	db 70, MEDITATE ; egg move
	db 75, OUTRAGE ; *
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM,FIRE_STONE,ARCANINE
	db 0 ; no more evolutions
	db 1,BITE
	db 3,ROAR
	db 6,AGILITY
	db 9,EMBER ; later gen move
	db 12,TAKE_DOWN ; tm move
	db 15,LEER
	db 18,DOUBLE_KICK ; gen 1 move
	db 21,FLAME_WHEEL
	db 24,HEADBUTT
	db 27,DRAGON_RAGE ; later gen move
	db 30,DRAGONBREATH ; tm move
	db 33,HEAT_WAVE ; later gen move
	db 36,MORNING_SUN ; later gen move
	db 39,SUNNY_DAY
	db 42,CRUNCH
	db 45,FLARE_BLITZ ; later gen move
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1,BITE
	db 5,ROAR
	db 10,AGILITY ;
	db 15,EMBER
	db 20,TAKE_DOWN
	db 30,DOUBLE_KICK
	db 40,DRAGONBREATH ; tm move
	db 50,HEAT_WAVE ; later gen move
	db 60,IRON_HEAD ; * later gen move
	db 70,EXTREMESPEED ; *
	db 80,OUTRAGE ; * later gen move
	db 90,FLARE_BLITZ ; later gen move
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 3, HYPNOSIS
	db 6, SWEET_KISS ; event move
	db 9, BUBBLE
	db 12, HEADBUTT ; tm move
	db 15, MIMIC ; later gen move
	db 18, WATER_GUN
	db 21, HAZE
	db 24, MEGA_KICK
	db 27, BUBBLEBEAM
	db 30, RAIN_DANCE
	db 33, AMNESIA
	db 36, ENCORE
	db 39, HYDRO_PUMP
	db 42, GROWTH
	db 45, LOVELY_KISS ; event move
	db 48, DOUBLE_EDGE
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_LEVEL_ITEM, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, METRONOME
	db 1, MIMIC
	db 1, WATER_GUN
	db 1, MEGA_KICK
	db 1, HAZE
	db 29, SUBMISSION
	db 33, BUBBLEBEAM
	db 37, AMNESIA ; gen 1 move
	db 41, FISSURE
	db 45, SWEET_KISS
	db 48, HYDRO_PUMP
	db 52, DOUBLE_EDGE  ; * gen 1 move
	db 56, DYNAMICPUNCH
	db 60, BELLY_DRUM ; *
	db 64, WATERFALL
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIMIC
	db 1, MEGA_KICK
	db 1, WATER_GUN
	db 1, HAZE
	db 30, SUBMISSION ; gen 1 move
	db 40, MIND_READER ; * tm move
	db 50, HYDRO_PUMP
	db 60, DYNAMICPUNCH ; *
	db 70, BELLY_DRUM
	db 80, POISON_JAB
	db 90, WATERFALL ; *
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 15, ZEN_HEADBUTT
	db 30, PSYWAVE ; gen 1 move
	db 35, LIGHT_SCREEN
	db 40, FOCUS_BLAST ; later gen move
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, 50, ALAKAZAM
	db 0 ; no more evolutions
	db 1, SAFEGUARD
	db 1, METRONOME
	db 1, COUNTER
	db 1, TELEPORT
	db 1, ZEN_HEADBUTT
	db 18, DISABLE
	db 22, BARRIER
	db 26, CONFUSION
	db 30, FUTURE_SIGHT ; later gen move
	db 34, ENCORE
	db 38, REFLECT
	db 42, PSYBEAM
	db 46, TRI_ATTACK
	db 49, DAZZLINGLEAM ; later gen move
	db 53, LIGHT_SCREEN ; egg move
	db 57, PSYCHIC_M
	db 60, RECOVER
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, REFLECT ; gen 1 move
	db 1, TRI_ATTACK ; gen 1 move
	db 1, DAZZLINGLEAM ; later gen move
	db 1, PSYBEAM
	db 55, LIGHT_SCREEN ; egg move
	db 60, HYPER_BEAM ;
	db 65, RECOVER
	db 70, PSYCHIC_M
	db 75, BARRIER
	db 80, SHADOW_BALL ; * tm move
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, RAGE
	db 3, LEER
	db 6, FOCUS_ENERGY
	db 9, KARATE_CHOP
	db 12, MUD_SLAP ; tm move
	db 15, FORESIGHT
	db 18, TAKE_DOWN
	db 21, ROLLING_KICK
	db 24, SCARY_FACE
	db 27, ROCK_SLIDE ; later gen move
	db 30, ENCORE ; egg move
	db 33, VITAL_THROW
	db 36, POISON_JAB ; later gen move
	db 39, COUNTER ; later gen move
	db 42, THRASH ; event move
	db 45, SUBMISSION
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, 50, MACHAMP
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, HEADBUTT
	db 1, MEGA_KICK
	db 1, FORESIGHT
	db 1, ROLLING_KICK ; later gen move
	db 1, SCARY_FACE
	db 1, ROCK_SLIDE
	db 32, ENCORE
	db 37, VITAL_THROW ; * tm move
	db 41, POISON_JAB ; later gen move
	db 45, MEDITATE
	db 49, SUBMISSION; egg move
	db 53, THRASH ; event move
	db 56, EARTHQUAKE ; * tm move
	db 60, SEISMIC_TOSS
	db 64, CROSS_CHOP
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, ENCORE ;
	db 1, POISON_JAB ; later gen move
	db 1, SUBMISSION
	db 1, MEDITATE ; egg move
	db 53, LIGHT_SCREEN ; *
	db 56, THRASH ; event move
	db 62, DYNAMICPUNCH ; *
	db 66, ROCK_SLIDE
	db 70, MEGA_KICK
	db 75, FISSURE ; * gen 1 move
	db 80, CROSS_CHOP ; *
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, WRAP
	db 3, LEECH_LIFE ; egg move
	db 5, VINE_WHIP
	db 8, STUN_SPORE
	db 11, SWORDS_DANCE ; egg move
	db 14, SLAM
	db 17, RAZOR_LEAF
	db 20, ACID
	db 23, SWEET_KISS ; egg move
	db 27, POISONPOWDER
	db 30, SEED_BOMB ; later gen move
	db 33, PIN_MISSILE
	db 36, POISON_JAB
	db 39, ENCORE; event move
	db 42, LOVELY_KISS
	db 45, GIGA_DRAIN ; later gen move
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, MORNING_SUN
	db 1, SWORDS_DANCE ; egg move
	db 1, SLAM
	db 1, RAZOR_LEAF
	db 1, ACID
	db 25, SWEET_KISS ; egg move
	db 29, POISONPOWDER
	db 33, SEED_BOMB ; later gen move
	db 37, PIN_MISSILE ; egg move
	db 41, ENCORE ; event move
	db 45, SYNTHESIS ; * egg move
	db 50, GIGA_DRAIN ; later gen move
	db 55, GROWTH
	db 60, SLEEP_POWDER
	db 65, POISON_JAB
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE ; egg move
	db 1, SLAM
	db 1, ACID
	db 1, RAZOR_LEAF
	db 30, POISONPOWDER
	db 40, PIN_MISSILE
	db 50, ENCORE
	db 60, SEED_BOMB ; * later gen move
	db 70, GROWTH ; *
	db 80, SLEEP_POWDER
	db 90, POISON_JAB
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, WRAP
	db 4, SAFEGUARD
	db 7, POISON_STING
	db 11, SUPERSONIC
	db 14, BUBBLE ; later gen move
	db 17, SWAGGER
	db 20, SLUDGE
	db 23, BARRIER
	db 26, BUBBLEBEAM
	db 29, AURORA_BEAM
	db 33, CONFUSE_RAY
	db 36, POISON_JAB
	db 39, HYDRO_PUMP
	db 42, MIRROR_COAT ; egg move
	db 45, HAZE
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, BIDE
	db 1, BARRIER
	db 1, AURORA_BEAM ; egg move
	db 1, SLUDGE ; later gen move
	db 1, BUBBLEBEAM
	db 34, RAPID_SPIN ; egg move
	db 38, SPIKES ; learns Toxic Spikes later gens
	db 42, CONFUSE_RAY
	db 47, POISON_JAB ; * later gen move
	db 51, HAZE
	db 55, HYDRO_PUMP
	db 60, MIRROR_COAT ; egg move
	db 65, SLUDGE_BOMB
	db 70, REFLECT
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, HARDEN
	db 6, BIDE ; * gen 1 move
	db 9, MUD_SLAP ; later gen move
	db 12, ROCK_THROW
	db 15, TAKE_DOWN ;
	db 18, SELFDESTRUCT
	db 21, MAGNITUDE
	db 24, ROLLOUT
	db 27, DEFENSE_CURL
	db 30, ROCK_POLISH ; later gen move
	db 33, FIRE_PUNCH ; tm move
	db 36, ROCK_SLIDE
	db 39, BODY_SLAM ; later gen move
	db 42, EARTHQUAKE
	db 45, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, 50, GOLEM
	db 0 ; no more evolutions
	db 1, FISSURE
	db 1, SUBMISSION
	db 1, HEADBUTT
	db 1, TAKE_DOWN ;
	db 1, SELFDESTRUCT
	db 1, ROLLOUT
	db 1, MAGNITUDE
	db 28, DEFENSE_CURL
	db 32, ROCK_POLISH
	db 35, FIRE_PUNCH
	db 38, DIG
	db 41, ROCK_SLIDE ; *
	db 44, MEGA_KICK
	db 47, IRON_DEFENSE ; * later gen move
	db 51, EARTHQUAKE
	db 55, EXPLOSION
	db 60, DOUBLE_EDGE ; *
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_HEAD
	db 1, IRON_DEFENSE
	db 1, MEGA_KICK ; later gen move
	db 1, DIG ; tm move
	db 1, ROCK_SLIDE ; egg move
	db 54, IRON_DEFENSE ; * tm move
	db 58, ROAR
	db 62, DOUBLE_EDGE ; *
	db 66, DEFENSE_CURL
	db 70, ROLLOUT
	db 75, EARTHQUAKE
	db 80, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, EMBER
	db 3, GROWL
	db 6, TAIL_WHIP
	db 9, DOUBLE_KICK ; egg move
	db 12, FIRE_SPIN
	db 15, STOMP
	db 18, CHARM
	db 21, IRON_TAIL ; later gen move
	db 24, FLAME_WHEEL ; egg move
	db 27, HEADBUTT
	db 30, AGILITY
	db 33, BATON_PASS
	db 36, HEAT_WAVE ; later gen move
	db 39, MORNING_SUN ; later gen move
	db 42, THRASH
	db 46, HYPNOSIS
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, RAGE
	db 1, BATON_PASS
	db 1, AGILITY
	db 1, MORNING_SUN ; later gen move
	db 1, HEAT_WAVE ; later gen move
	db 45, MEGA_KICK ; *
	db 50, POISON_JAB ; * later gen move
	db 55, DRILL_RUN ; * later gen move
	db 60, FLAMETHROWER ; * tm move
	db 65, MEGAHORN ; * later gen move
	db 70, WILD_CHARGE ; later gen move
	db 75, HORN_DRILL
	db 80, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL_ITEM, KINGS_ROCK, SLOWKING
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 6, SAFEGUARD
	db 9, FUTURE_SIGHT ; egg move
	db 12, WATER_GUN
	db 15, STOMP ; egg move
	db 18, CONFUSION
	db 21, BUBBLEBEAM
	db 24, CURSE
	db 27, HEADBUTT
	db 30, IRON_TAIL
	db 34, ZEN_HEADBUTT ; later gen move
	db 38, BUBBLEBEAM ; gen 1 move
	db 42, TRI_ATTACK ; gen 1 move
	db 46, RAIN_DANCE ; tm move
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBMISSION
	db 1, FISSURE
	db 1, REFLECT
	db 1, BELLY_DRUM
	db 1, LIGHT_SCREEN
	db 1, HEADBUTT ; egg move
	db 1, DISABLE
	db 1, ZEN_HEADBUTT
	db 1, BUBBLEBEAM
	db 42, IRON_TAIL ; * tm move
	db 46, AMNESIA ; *
	db 51, TRI_ATTACK ; gen 1 move
	db 55, BUBBLEBEAM ; gen 1 move
	db 60, IRON_DEFENSE
	db 65, FLAMETHROWER ; * tutor move
	db 70, PSYCHIC_M ; later gen move
	db 0 ; no more level-up moves


MagnemiteEvosAttacks:
	db EVOLVE_LEVEL,30,MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, SCREECH
	db 6, LIGHT_SCREEN
	db 8, SPARK ; later gen move
	db 10, SUPERSONIC
	db 12, ROLLOUT ; tm move
	db 15, SONICBOOM
	db 18, THUNDERSHOCK
	db 21, SWIFT
	db 25, IRON_HEAD
	db 28, AGILITY ; event move
	db 32, THUNDERBOLT ; tm move
	db 36, REFLECT
	db 39, FLASH_CANNON ; later gen move
	db 42, MIND_READER ; Lock-On replacement
	db 45, ZAP_CANNON
	db 50, EXPLOSION
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIDE
	db 1, MIMIC
	db 1, LIGHT_SCREEN
	db 1, SWIFT
	db 1, AGILITY ; event move
	db 1, IRON_HEAD
	db 1, THUNDERSHOCK
	db 31, IRON_DEFENSE  ; *
	db 34, MIRROR_COAT ; *
	db 37, REFLECT ; * later gen move
	db 41, THUNDERBOLT
	db 46, EXPLOSION
	db 51, TRI_ATTACK ; *
	db 56, THUNDER
	db 60, METAL_SOUND ; * later gen move
	db 65, FLASH_CANNON ; later gen move
	db 70, MIND_READER ; Lock-On replacement
	db 75, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 4, SAND_ATTACK
	db 7, FURY_ATTACK
	db 11, LEER
	db 14, PECK
	db 17, STEEL_WING
	db 22, AGILITY
	db 26, SLASH
	db 30, HEAT_WAVE
	db 34, POISON_JAB ; later gen move
	db 38, WHIRLWIND ; egg move
	db 41, AIR_SLASH ; later gen move
	db 44, HEADBUTT 
	db 47, FURY_CUTTER ; later gen move
	db 51, SWORDS_DANCE
	db 55, IRON_TAIL ; tm move
	db 60, DOUBLE_EDGE ; gen 1 move
	db 65, BATON_PASS
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 3, GROWL
	db 6, RAGE ; later gen move
	db 9, PURSUIT
	db 12, SUPERSONIC ; egg move
	db 15, FURY_ATTACK
	db 18, FAINT_ATTACK
	db 21, AGILITY
	db 24, HEADBUTT
	db 27, SKY_ATTACK  ; egg move
	db 30, HAZE ; egg move
	db 33, ENDURE
	db 36, FLAIL
	db 39, PROTECT ; tm move
	db 42, MIRROR_MOVE ; later gen move
	db 45, THRASH ; later gen move
	db 48, DRILL_PECK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, BATON_PASS
	db 1, MUD_SLAP
	db 1, STEEL_WING
	db 1, REFLECT
	db 1, HAZE ; egg move
	db 1, AGILITY ; egg move
	db 1, HEADBUTT
	db 1, SKY_ATTACK
	db 34, TRI_ATTACK ; * tm move
	db 37, BODY_SLAM
	db 40, WHIRLWIND ; * gen 1 move
	db 44, MIRROR_MOVE
	db 48, STEEL_WING ; tm move
	db 52, DOUBLE_EDGE
	db 56, REST ; tm move
	db 60, SLEEP_TALK ; tm move
	db 65, DRILL_PECK
	db 70, THRASH ; *
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, PECK ; egg move
	db 3, GROWL
	db 6, LICK ; egg move
	db 9, SLAM
	db 12, WATER_GUN
	db 15, ENCORE
	db 18, ICY_WIND
	db 21, IRON_TAIL ; tm move
	db 24, AQUA_JET
	db 27, HEADBUTT
	db 30, AURORA_BEAM
	db 33, SAFEGUARD
	db 36, WATERFALL
	db 39, REST ; tm move
	db 42, SLEEP_TALK ; tm move
	db 45, ICE_BEAM
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, DISABLE
	db 1, ENDURE
	db 1, FLAIL
	db 1, SAFEGUARD
	db 1, AURORA_BEAM
	db 1, TAKE_DOWN
	db 1, AQUA_JET
	db 38, DRILL_RUN ; later gen move
	db 42, ICY_WIND
	db 46, HORN_DRILL ; * egg move
	db 51, PERISH_SONG ; * later gen move
	db 56, DISABLE ; *
	db 61, ICE_BEAM
	db 65, WATERFALL
	db 70, SHEER_COLD ; * later gen move
	db 75, REST ; tm move
	db 80, BLIZZARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HARDEN
	db 4, ACID
	db 8, LICK
	db 12, MEGA_DRAIN
	db 15, DISABLE 
	db 18, SLUDGE
	db 21, MEAN_LOOK
	db 24, HEADBUTT
	db 27, SLUDGE_BOMB ; later gen move
	db 30, DIG
	db 33, SCREECH ; later gen move POISON_JAB
	db 37, MINIMIZE
	db 41, POISON_JAB
	db 45, SELFDESTRUCT
	db 50, ACID_ARMOR
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, HAZE
	db 1, SCARY_FACE
	db 1, MUD_SLAP
	db 1, BIDE
	db 1, MEGA_DRAIN
	db 1, SLUDGE
	db 1, DISABLE
	db 1, MEAN_LOOK
	db 24, HEADBUTT
	db 27, SLUDGE_BOMB ; later gen move
	db 30, DIG
	db 33, SCREECH ; later gen move POISON_JAB
	db 37, MINIMIZE
	db 43, POISON_JAB
	db 47, SELFDESTRUCT
	db 51, ACID_ARMOR
	db 55, DOUBLE_EDGE
	db 60, GUNK_SHOT  ; tutor move
	db 65, FIRE_PUNCH
	db 70, EXPLOSION ; egg move
	db 75, PAIN_SPLIT
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 3, LICK
	db 6, SUPERSONIC
	db 9, LEER
	db 12, WATER_GUN
	db 15, TAKE_DOWN ; gen 1 move
	db 18, AURORA_BEAM
	db 21, TOXIC
	db 24, CLAMP
	db 27, PROTECT
	db 30, BARRIER
	db 33, TWINEEDLE
	db 36, HYDRO_PUMP ; later gen move
	db 39, EXPLOSION ; later gen move
	db 42, ICE_BEAM
	db 45, TRI_ATTACK 
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, WITHDRAW
	db 10, SUPERSONIC
	db 15, WATER_GUN
	db 20, SPIKE_CANNON
	db 30, SPIKES
	db 40, CLAMP
	db 50, ICE_BEAM
	db 60, IRON_DEFENSE ; later gen move
	db 70, EXPLOSION ; later gen move
	db 80, HYDRO_PUMP ; later gen move
	db 90, POISON_JAB
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, LICK
	db 3, SPITE
	db 6, SELFDESTRUCT ; later gen move
	db 9, CONFUSE_RAY
	db 12, SHADOW_CLAW
	db 15, CURSE
	db 18, DESTINY_BOND
	db 21, MEAN_LOOK
	db 24, NIGHT_SHADE
	db 27, EXPLOSION ; later gen move
	db 30, DARK_PULSE ; later gen move
	db 33, SLUDGE_BOMB
	db 36, SHADOW_BALL
	db 39, HYPNOSIS ; tm move
	db 42, NIGHTMARE
	db 45, DREAM_EATER
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, 50, GENGAR
	db 0 ; no more evolutions
	db 1, HAZE
	db 1, METRONOME
	db 1, DISABLE
	db 1, SCARY_FACE
	db 1, CURSE
	db 1, DESTINY_BOND
	db 1, MEAN_LOOK
	db 1, SHADOW_CLAW
	db 29, EXPLOSION ; later gen move
	db 32, DARK_PULSE ; later gen move
	db 35, PSYWAVE
	db 38, NIGHTMARE
	db 38, HYPNOSIS
	db 42, SLUDGE_BOMB
	db 46, PAIN_SPLIT
	db 51, SHADOW_BALL
	db 55, PERISH_SONG
	db 60, PROTECT
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_KICK
	db 1, NIGHTMARE
	db 1, HYPNOSIS
	db 1, SLUDGE_BOMB
	db 1, PAIN_SPLIT
	db 55, PERISH_SONG
	db 60, DESTINY_BOND
	db 65, FOCUS_BLAST ; * later gen move
	db 70, HYPNOSIS
	db 75, NIGHTMARE
	db 80, SHADOW_BALL
	db 85, WILLOWISP ; * later gen move
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_LEVEL_ITEM, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, HARDEN
	db 5, WRAP ; Bind replacement
	db 8, RAGE
	db 10, BIDE ; gen 1 move
	db 12, ROCK_THROW
	db 15, DRAGONBREATH ; later gen move
	db 18, SLAM
	db 21, DEFENSE_CURL
	db 24, ROLLOUT
	db 27, SHARPEN ; event move
	db 30, SELFDESTRUCT ; gen 1 move
	db 33, SANDSTORM
	db 36, ROCK_SLIDE
	db 39, SCREECH ; later gen move
	db 42, ROCK_POLISH ; later gen move
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 3, SAFEGUARD
	db 6, ACID 
	db 9, MEDITATE 
	db 12, FUTURE_SIGHT
	db 15, CONFUSION  
	db 18, HEADBUTT
	db 21, NASTY_PLOT
	db 24, DISABLE 
	db 27, PSYBEAM 
	db 30, PSYWAVE
	db 33, TRI_ATTACK
	db 36, ZEN_HEADBUTT
	db 39, HYPNOSIS
	db 42, NIGHTMARE 
	db 45, DREAM_EATER
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, AMNESIA
	db 1, METRONOME
	db 1, BELLY_DRUM
	db 1, SAFEGUARD
	db 1, HEADBUTT
	db 1, NASTY_PLOT
	db 1, CONFUSION
	db 30, LIGHT_SCREEN 
	db 33, HEADBUTT
	db 37, DISABLE
	db 42, PSYBEAM
	db 46, BARRIER ; * egg move
	db 51, PSYWAVE
	db 55, HYPNOSIS
	db 60, PSYCHIC_M
	db 65, NASTY_PLOT
	db 70, DAZZLINGLEAM
	db 75, BATON_PASS ; *
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, RAGE
	db 3, LEER
	db 6, BUBBLE
	db 9, HARDEN
	db 12, SLAM
	db 15, METAL_CLAW
	db 18, WATER_GUN
	db 21, AGILITY
	db 24, STOMP
	db 27, IRON_DEFENSE ; later gen move
	db 30, BUBBLEBEAM
	db 33, X_SCISSOR
	db 36, DOUBLE_EDGE ; later gen move
	db 39, FISSURE ; gen 1 move
	db 42, CRABHAMMER
	db 45, SWORDS_DANCE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, HAZE
	db 1, FLAIL
	db 1, MUD_SLAP
	db 1, ENDURE
	db 1, STOMP ; event move
	db 1, AGILITY
	db 1, IRON_DEFENSE
	db 1, WATER_GUN ; gen 1 move
	db 32, PROTECT
	db 37, AMNESIA ; egg move
	db 42, BIDE ; * later gen move
	db 46, BUBBLEBEAM ; gen 1 move
	db 51, FISSURE ; gen 1 move
	db 55, X_SCISSOR
	db 60, DOUBLE_EDGE
	db 65, CRABHAMMER
	db 70, SWORDS_DANCE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, SCREECH
	db 6, SPARK ; later gen move
	db 9, ROLLOUT
	db 12, LIGHT_SCREEN
	db 15, SONICBOOM
	db 18, THUNDERSHOCK ; illegal move
	db 21, SELFDESTRUCT
	db 25, SWIFT
	db 28, AGILITY ; event move
	db 32, THUNDERBOLT ; tm move
	db 36, EXPLOSION
	db 39, MIRROR_COAT
	db 42, RAIN_DANCE ; tm move
	db 45, THUNDER ; tm move
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, SWIFT
	db 1, AGILITY ; event move
	db 1, SELFDESTRUCT
	db 1, THUNDERSHOCK ; illegal move
	db 33, HEADBUTT
	db 37, LIGHT_SCREEN
	db 41, EXPLOSION
	db 46, THUNDERBOLT
	db 50, REFLECT 
	db 55, MIRROR_COAT
	db 60, RAIN_DANCE
	db 65, THUNDER
	db 70, HYPER_BEAM ; * tm move
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, PSYWAVE ; gen 1 move
	db 3, STUN_SPORE
	db 6, REFLECT
	db 9, MIMIC ; gen 1 move
	db 12, POISONPOWDER ; later gen move
	db 15, MEGA_DRAIN
	db 18, SELFDESTRUCT ; gen 1 move
	db 21, CONFUSION
	db 24, SLEEP_POWDER
	db 27, LEECH_SEED
	db 30, SEED_BOMB ; later gen move
	db 33, MOONLIGHT ; egg move
	db 36, HYPNOSIS
	db 39, DREAM_EATER ; tm move
	db 42, SUNNY_DAY
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 5, STUN_SPORE
	db 10, REFLECT
	db 15, STOMP
	db 20, MEGA_DRAIN
	db 30, CONFUSION
	db 40, SLEEP_POWDER
	db 50, DREAM_EATER
	db 60, SEED_BOMB
	db 70, HYPNOSIS
	db 80, PSYCHIC_M
	db 90, MOONLIGHT
	db 0

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, TACKLE ; illegal move
	db 3, TAIL_WHIP
	db 6, GROWL
	db 9, DOUBLE_KICK ; later gen move
	db 12, MUD_SLAP ; tm move
	db 15, LEER
	db 18, HEADBUTT
	db 21, SCARY_FACE
	db 24, BONE_CLUB
	db 27, IRON_DEFENSE ; later gen move
	db 30, SUBMISSION
	db 33, IRON_TAIL
	db 36, BONEMERANG
	db 39, DOUBLE_EDGE
	db 42, PERISH_SONG ; egg move
	db 45, OUTRAGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, FISSURE
	db 1, BELLY_DRUM
	db 1, SCREECH
	db 1, LEER
	db 1, HEADBUTT
	db 1, SCARY_FACE
	db 1, BONE_CLUB
	db 32, SUBMISSION
	db 36, BODY_SLAM ; gen 1 move
	db 41, IRON_HEAD ; * later gen move
	db 46, EARTH_POWER ; later gen move
	db 51, PERISH_SONG ; egg move
	db 55, SEISMIC_TOSS ; later gen move
	db 60, THRASH
	db 65, BONEMERANG
	db 70, COUNTER ; *
	db 75, PLAY_ROUGH ; *
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, RAPID_SPIN ; egg move
	db 1, FOCUS_ENERGY ; evolution move
	db 1, PURSUIT ; later gen move
	db 15, RAGE
	db 20, DOUBLE_KICK
	db 25, MEDITATE
	db 30, FOCUS_ENERGY
	db 35, MIMIC
	db 39, ROLLING_KICK
	db 42, AGILITY
	db 45, POISON_JAB
	db 50, MIND_READER
	db 50, HI_JUMP_KICK
	db 55, MEGA_KICK
	db 60, FORESIGHT
	db 65, REVERSAL
	db 65, ENDURE
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, METRONOME
	db 1, RAPID_SPIN ; egg move
	db 1, FOCUS_ENERGY ; evolution move
	db 1, PURSUIT ; later gen move
	db 15, KARATE_CHOP ; illegal move
	db 20, AGILITY
	db 25, SEISMIC_TOSS ; later gen move
	db 30, MIMIC
	db 35, SUBMISSION
	db 40, THUNDERPUNCH
	db 43, ICE_PUNCH
	db 46, FIRE_PUNCH
	db 50, MACH_PUNCH
	db 55, CURSE ; tm move
	db 60, FORESIGHT
	db 65, COUNTER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LICK
	db 4, SUPERSONIC
	db 8, DEFENSE_CURL
	db 11, ROLLOUT ; later gen move
	db 15, STOMP
	db 18, MUD_SLAP 
	db 22, SWORDS_DANCE
	db 26, MAGNITUDE
	db 30, SLAM
	db 35, SCREECH
	db 40, FIRE_PUNCH ; tm move
	db 45, SHADOW_BALL
	db 50, BODY_SLAM
	db 55, BELLY_DRUM ; egg move
	db 60, SUBMISSION ; gen 1 move
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SMOKESCREEN
	db 8, HAZE
	db 12, PSYWAVE ; egg move
	db 15, ACID ; illegal move
	db 18, SCREECH ; egg move
	db 24, SELFDESTRUCT
	db 27, PSYBEAM ; egg move
	db 30, SLUDGE
	db 33, PAIN_SPLIT ; egg move
	db 36, FIRE_BLAST ; tm move
	db 39, EXPLOSION
	db 42, SLUDGE_BOMB
	db 45, DESTINY_BOND
	db 50, DARK_PULSE ; later gen move
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLOUT
	db 1, MUD_SLAP
	db 1, SCREECH
	db 1, SELFDESTRUCT
	db 1, FIRE_BLAST ; tm move
	db 1, PAIN_SPLIT ; egg move
	db 1, SLUDGE
	db 38, PSYBEAM ; egg move
	db 42, EXPLOSION
	db 46, DESTINY_BOND
	db 50, DARK_PULSE ; later gen move
	db 55, SLUDGE_BOMB
	db 60, FIRE_BLAST ; tm move
	db 65, PROTECT ; * tm move
	db 70, WILLOWISP ; *later gen move
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL,42,RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 3, TAIL_WHIP
	db 6, MUD_SLAP
	db 9, FURY_ATTACK
	db 12, PURSUIT
	db 15, ROLLOUT ; tm move
	db 18, EARTH_POWER ; later gen move
	db 21, STOMP
	db 24, SCARY_FACE
	db 27, ROCK_SLIDE
	db 31, BIDE ; gen 1 move
	db 35, MAGNITUDE ; egg move
	db 40, SWORDS_DANCE ; later gen move
	db 45, HORN_DRILL
	db 50, OUTRAGE
	db 55, DRILL_RUN ; later gen move
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, REVERSAL
	db 1, ENDURE
	db 1, POISON_JAB
	db 1, SWORDS_DANCE ; later gen move
	db 1, SCARY_FACE
	db 1, MAGNITUDE ; egg move
	db 1, ROCK_SLIDE
	db 42, ROAR ; * tm move
	db 46, IRON_TAIL ; *
	db 50, MAGNITUDE
	db 55, CRUNCH ; * egg move
	db 60, HORN_DRILL
	db 65, ROCK_SLIDE
	db 70, MEGAHORN
	db 75, SCARY_FACE
	db 80, DRILL_RUN ; later gen move
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 4, DOUBLESLAP
	db 7, TAIL_WHIP
	db 11, SING
	db 14, DOUBLE_EDGE
	db 17, METRONOME
	db 20, DEFENSE_CURL
	db 24, ROLLOUT
	db 29, MINIMIZE
	db 32, MEGA_KICK
	db 35, PSYWAVE ; gen 1 move
	db 38, LIGHT_SCREEN
	db 40, SOFTBOILED
	db 45, TRI_ATTACK ; later gen move
	db 50, SEISMIC_TOSS ; gen 1 move
	db 55, SAFEGUARD ; gen 1 move
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, STUN_SPORE
	db 8, ENDURE
	db 11, WRAP 
	db 15, VINE_WHIP
	db 19, POISONPOWDER
	db 23, CONFUSION ; egg move
	db 27, PAIN_SPLIT ; later gen move
	db 32, MEGA_DRAIN ; egg move
	db 37, ANCIENTPOWER ; later gen move
	db 41, AMNESIA ; egg move
	db 46, LEECH_SEED
	db 50, GIGA_DRAIN 
	db 55, SUBSTITUTE ; gen 1 move
	db 60, SLEEP_POWDER
	db 65, SYNTHESIS ; event move
	db 70, SEED_BOMB
	db 75, GROWTH
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 4, LEER
	db 8, MIMIC ; later gen move
	db 11, FAINT_ATTACK ; event move
	db 15, STOMP 
	db 18, FOCUS_ENERGY
	db 22, REVERSAL 
	db 26, BITE
	db 30, TAKE_DOWN 
	db 32, ENDURE
	db 35, REVERSAL
	db 39, DIZZY_PUNCH
	db 43, HEADBUTT 
	db 47, SUBMISSION
	db 52, COUNTER
	db 56, CRUNCH
	db 60, BODY_SLAM ; later gen move
	db 65, OUTRAGE ; later gen move
	db 70, FISSURE
	db 75, IRON_TAIL
	db 80, DOUBLE_EDGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, SMOKESCREEN
	db 3, LEER
	db 6, BUBBLE
	db 9, HEADBUTT
	db 12, AGILITY
	db 15, TWISTER
	db 18, WATER_GUN
	db 21, SWIFT
	db 24, FOCUS_ENERGY ; later gen move
	db 27, DRAGON_RAGE
	db 30, OCTAZOOKA
	db 33, DRAGONBREATH
	db 36, AURORA_BEAM ; egg move
	db 39, DISABLE ; egg move
	db 42, HYDRO_PUMP
	db 45, OUTRAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_LEVEL_ITEM, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, FLAIL
	db 1, ENDURE
	db 1, SWIFT
	db 1, FOCUS_ENERGY ; later gen move
	db 1, DRAGON_RAGE ; later gen move
	db 1, OCTAZOOKA ; egg move
	db 36, DRAGONBREATH
	db 40, AURORA_BEAM
	db 44, DISABLE
	db 48, HYDRO_PUMP
	db 52, TOXIC
	db 56, OUTRAGE
	db 60, IRON_HEAD
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 3, TAIL_WHIP
	db 6, WATER_GUN ; gen 1 move
	db 10, FURY_ATTACK
	db 13, SUPERSONIC
	db 16, HORN_DRILL
	db 20, BUBBLEBEAM ; gen 1 move
	db 23, HORN_ATTACK
	db 27, AGILITY
	db 30, PSYBEAM ; egg move
	db 34, WATERFALL
	db 38, BODY_SLAM ; later gen move
	db 42, MEGAHORN
	db 45, LOVELY_KISS ; illegal move
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, HAZE
	db 1, ENDURE
	db 1, PSYBEAM ; egg move
	db 1, POISON_JAB
	db 1, BUBBLEBEAM
	db 1, HORN_DRILL
	db 35, FLAIL
	db 38, AGILITY
	db 42, HYDRO_PUMP
	db 46, MEGAHORN
	db 51, BODY_SLAM ; later gen move
	db 55, WATERFALL
	db 60, SWORDS_DANCE ; * event move
	db 65, DRILL_RUN ; * later gen move
	db 70, HORN_DRILL
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, HARDEN
	db 6, BUBBLE
	db 9,  SUPERSONIC
	db 12, PSYWAVE ; later gen move
	db 15, TWISTER ; event move
	db 18, SWIFT
	db 21, WATER_GUN
	db 24, MINIMIZE
	db 27, PAIN_SPLIT
	db 30, BARRIER ; egg move G/S
	db 33, BUBBLEBEAM
	db 36, AURORA_BEAM
	db 39, RECOVER
	db 42, LIGHT_SCREEN
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, HARDEN
	db 10, RAPID_SPIN
	db 15, CONFUSION
	db 20, BUBBLEBEAM
	db 30, SWIFT
	db 40, REFLECT
	db 50, CONFUSE_RAY
	db 60, HYDRO_PUMP
	db 70, PSYCHIC_M
	db 80, TRI_ATTACK
	db 90, RECOVER
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 4, BARRIER
	db 8, MIMIC
	db 11, MEDITATE
	db 15, DIZZY_PUNCH ; illegal move
	db 18, DOUBLE_EDGE ; gen 1 move
	db 21, CONFUSION
	db 25, LIGHT_SCREEN
	db 25, REFLECT
	db 28, ENCORE ; new move
	db 31, PSYBEAM
	db 35, SUBSTITUTE
	db 39, DAZZLINGLEAM
	db 42, BATON_PASS
	db 46, HYPNOSIS
	db 50, NASTY_PLOT
	db 55, PSYCHIC_M
	db 60, MOONBLAST
	db 65, CONFUSE_RAY
	db 70, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_LEVEL_ITEM, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 3, LEER
	db 6, COUNTER
	db 9, FOCUS_ENERGY
	db 12, PURSUIT
	db 15, WING_ATTACK
	db 19, SONICBOOM ; event move
	db 23, AGILITY
	db 27, BATON_PASS
	db 31, BUG_BUZZ
	db 34, DOUBLE_TEAM
	db 38, SLASH
	db 41, ENDURE ; tm move
	db 44, REVERSAL ; egg move
	db 47, FURY_CUTTER ; tm move
	db 51, AIR_SLASH
	db 55, STEEL_WING ; later gen move
	db 60, SWORDS_DANCE
	db 65, X_SCISSOR ; later gen move
	db 70, WING_ATTACK
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, HEAL_BELL
	db 1, PSYWAVE
	db 1, PETAL_DANCE
	db 1, POWDER_SNOW
	db 1, DREAM_EATER
	db 1, LOVELY_KISS
	db 1, CONFUSION
	db 33, LIGHT_SCREEN
	db 37, ICY_WIND ; tm move
	db 41, SEISMIC_TOSS 
	db 46, MEAN_LOOK ; *
	db 51, PERISH_SONG
	db 55, PSYCHIC_M
	db 60, NASTY_PLOT ; * later gen move
	db 65, LOVELY_KISS  
	db 70, BLIZZARD ; *
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBMISSION
	db 1, COUNTER
	db 1, HEADBUTT
	db 1, IRON_TAIL
	db 1, MEDITATE ; egg move
	db 1, SPARK ; illegal move
	db 1, FIRE_PUNCH ; tm move
	db 1, SWIFT
	db 32, DIZZY_PUNCH ; *
	db 35, THUNDERPUNCH
	db 38, MEGA_KICK ; later gen move
	db 42, SCREECH
	db 46, CROSS_CHOP ; egg move
	db 51, THUNDERBOLT
	db 55, BARRIER ; * egg move
	db 60, PSYCHIC_M ; * tm move
	db 65, DYNAMICPUNCH ; * tm move
	db 70, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, BELLY_DRUM
	db 1, THRASH
	db 1, SUBMISSION
	db 1, CONFUSE_RAY
	db 1, FIRE_PUNCH
	db 1, FOCUS_ENERGY ; later gen move
	db 1, SUNNY_DAY
	db 32, SEISMIC_TOSS ; later gen move
	db 35, FIRE_PUNCH
	db 38, DIZZY_PUNCH ; *
	db 41, SCREECH ; egg move
	db 45, THUNDERPUNCH ; tm move
	db 50, FLAMETHROWER
	db 55, BARRIER ; * egg move
	db 60, PSYWAVE ; * gen 1 move
	db 65, CROSS_CHOP
	db 70, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 4, FOCUS_ENERGY
	db 7, WRAP ; Bind replacement
	db 10, HARDEN
	db 13, FAINT_ATTACK ; later gen move
	db 16, PIN_MISSILE ; illegal move
	db 20, VITAL_THROW ; later gen move
	db 23, SLASH ; gen 1 move
	db 26, ROCK_THROW ; event move
	db 29, FURY_CUTTER ; tm move
	db 33, SEISMIC_TOSS
	db 37, IRON_DEFENSE ; later gen move
	db 41, THRASH ; later gen move
	db 45, X_SCISSOR
	db 50, FISSURE ; gen 1 move, replacing Guillotine
	db 55, SWORDS_DANCE
	db 60, SUBMISSION
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, TAIL_WHIP
	db 6, RAGE
	db 9, PURSUIT
	db 12, HORN_ATTACK
	db 16, FLAMETHROWER ; tutor move
	db 19, REST
	db 22, SLEEP_TALK ; tm move
	db 26, STOMP ; gen 1 move
	db 29, SCARY_FACE
	db 32, IRON_TAIL
	db 35, ZEN_HEADBUTT ; later gen move
	db 38, TAKE_DOWN
	db 42, SPITE ; later gen move
	db 46, FISSURE ; gen 1 move
	db 51, SWAGGER ; tm move
	db 56, IRON_HEAD
	db 60, THRASH
	db 65, OUTRAGE ; later gen move
	db 70, HORN_DRILL ; gen 1 move
	db 75, EARTHQUAKE
	db 80, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 5, TACKLE
	db 10, BUBBLE ; event move
	db 15, FLAIL
	db 25, ENDURE ; illegal move
	db 30, REVERSAL ; event move
	db 35, DRAGON_RAGE ; event move
	db 40, HYDRO_PUMP ; event move
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, HEADBUTT
	db 1, REFLECT
	db 1, SPLASH
	db 1, TACKLE
	db 1, FLAIL
	db 1, BUBBLE
	db 20,RAGE
	db 23,TWISTER
	db 26,BITE
	db 29,BUBBLEBEAM
	db 32,DRAGON_RAGE
	db 36,DRAGONBREATH
	db 41,IRON_TAIL
	db 45,LEER
	db 49,HYPER_BEAM
	db 53,THRASH
	db 57,HYDRO_PUMP
	db 61,CRUNCH ; later gen move
	db 65,DOUBLE_EDGE
	db 70,IRON_HEAD
	db 75,WATERFALL ; hm move
	db 80,RAIN_DANCE
	db 85,OUTRAGE ; later gen move
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 4, GROWL
	db 8, BUBBLE
	db 11, MIST
	db 15, BITE
	db 19, CONFUSE_RAY
	db 23, WATER_GUN
	db 26, AURORA_BEAM
	db 29, ANCIENTPOWER
	db 32, FUTURE_SIGHT
	db 35, BUBBLEBEAM
	db 39, PERISH_SONG
	db 44, HORN_DRILL
	db 49, ICE_BEAM
	db 53, SAFEGUARD
	db 57, IRON_HEAD
	db 61, DRILL_RUN 
	db 65, HYDRO_PUMP
	db 70, BLIZZARD
	db 75, RAIN_DANCE
	db 80, SHEER_COLD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, TAIL_WHIP
	db 5, SAND_ATTACK
	db 8, FOCUS_ENERGY 
	db 11, TAKE_DOWN
	db 14, BITE
	db 17, GROWL
	db 20, ENDURE
	db 20, FLAIL
	db 24, CHARM
	db 28, SWIFT
	db 31, GROWTH
	db 35, IRON_TAIL 
	db 38, BATON_PASS
	db 41, DIG 
	db 44, DOUBLE_EDGE
	db 47, CURSE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, MIST
	db 8, SAND_ATTACK
	db 11, WATER_GUN
	db 15, BIDE
	db 19, GROWL
	db 23, ICY_WIND
	db 27, BUBBLEBEAM
	db 31, GROWTH
	db 34, AURORA_BEAM
	db 37, IRON_TAIL
	db 42, WATERFALL
	db 47, ROAR
	db 51, ACID_ARMOR
	db 55, REST
	db 60, HYDRO_PUMP
	db 65, ICE_BEAM
	db 70, HAZE
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, DOUBLE_KICK
	db 11, THUNDERSHOCK
	db 15, LIGHT_SCREEN
	db 19, AGILITY
	db 23, BATON_PASS
	db 27, ZAP_CANNON ; tm move
	db 31, GROWTH ; event move
	db 34, PIN_MISSILE
	db 37, CHARM ; egg move
	db 42, THUNDERBOLT ; tm move
	db 47, IRON_HEAD ; illegal move
	db 52, THUNDER_WAVE
	db 55, ROAR
	db 60, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, SCARY_FACE
	db 11, EMBER
	db 15, BITE
	db 19, GROWL
	db 23, TAKE_DOWN
	db 27, FIRE_SPIN
	db 31, GROWTH
	db 34, BATON_PASS
	db 37, IRON_TAIL
	db 42, FLAMETHROWER
	db 47, CURSE
	db 52, ROAR
	db 55, DOUBLE_EDGE 
	db 60, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_LEVEL_ITEM, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, TELEPORT ; gen 1 move
	db 6, MIMIC ; later gen move
	db 9, CONVERSION
	db 12, TAKE_DOWN
	db 15, SHARPEN
	db 18, IRON_TAIL
	db 21, CONVERSION2
	db 24, SWIFT
	db 27, AGILITY
	db 30, PSYBEAM
	db 33, RECOVER
	db 36, TRI_ATTACK
	db 39, ICE_BEAM ; tm move
	db 42, MIND_READER ; Lock-On replacement
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, WRAP
	db 3, WITHDRAW
	db 6, SPIKE_CANNON ; gen 1 move
	db 9, ROCK_THROW ; event move
	db 12, WATER_GUN
	db 16, LEER
	db 20, BITE
	db 24, BUBBLEBEAM
	db 28, ROLLOUT
	db 32, AURORA_BEAM
	db 37, ROCK_POLISH ; egg move
	db 41, HYDRO_PUMP
	db 45, ANCIENTPOWER
	db 50, EARTH_POWER ; later gen move
	db 55, SPIKES ; egg move
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUPERSONIC
	db 1, HAZE
	db 1, REFLECT
	db 1, AURORA_BEAM
	db 1, ROLLOUT ; tm move
	db 1, ROCK_POLISH
	db 1, BUBBLEBEAM
	db 44, BIDE ; * later gen move
	db 48, ROCK_SLIDE ; *
	db 52, IRON_DEFENSE ; * later gen move
	db 56, WATERFALL ; egg move
	db 60, SPIKES ; egg move
	db 65, ANCIENTPOWER
	db 70, HORN_DRILL
	db 75, ROCK_POLISH ; later gen move
	db 80, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL,40,KABUTOPS
	db 0 ; no more evolutions
	db 1,ABSORB
	db 3,SCRATCH
	db 6,HARDEN
	db 9,LEER
	db 12,ROCK_THROW ; event move
	db 16,MEGA_DRAIN
	db 20,AQUA_JET ; later gen move
	db 24,AURORA_BEAM ; tm move
	db 28,ROLLOUT
	db 32,GIGA_DRAIN
	db 37,HYDRO_PUMP ; egg move
	db 41,ROCK_POLISH ; later gen move
	db 45,ANCIENTPOWER ; tm move
	db 50,METAL_SOUND ; later gen move
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, REFLECT
	db 1, CONFUSE_RAY
	db 1, RAPID_SPIN
	db 1, SUBMISSION
	db 1, AURORA_BEAM
	db 1, ROLLOUT
	db 1, GIGA_DRAIN
	db 1, HYDRO_PUMP
	db 44,DIG
	db 48,ANCIENTPOWER
	db 52,IRON_DEFENSE ; * later gen move
	db 56,X_SCISSOR
	db 60,WATERFALL ; *
	db 65,ROCK_SLIDE ; * hm move
	db 70,ROCK_POLISH ; later gen move
	db 75,SWORDS_DANCE ; * later gen move
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, TWISTER
	db 5, WHIRLWIND
	db 10, GUST
	db 14, ANCIENTPOWER
	db 18, SCARY_FACE
	db 22, SUPERSONIC
	db 26, ROCK_THROW
	db 30, HYPER_BEAM
	db 34, BITE
	db 39, HEAT_WAVE
	db 44, WING_ATTACK
	db 50, STEEL_WING
	db 56, CRUNCH
	db 62, ROCK_SLIDE
	db 68, SKY_ATTACK
	db 74, AGILITY
	db 80, IRON_HEAD
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, LICK
	db 9, METRONOME
	db 13, RAGE
	db 17, PURSUIT
	db 22, DEFENSE_CURL
	db 26, ROLLOUT
	db 31, HYPER_BEAM
	db 36, CHARM
	db 41, AMNESIA
	db 46, SEED_BOMB
	db 51, HEADBUTT
	db 55, SWEET_KISS
	db 60, IRON_HEAD
	db 65, CRUNCH
	db 70, BODY_SLAM
	db 75, REST
	db 80, BELLY_DRUM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, POWDER_SNOW
	db 5, MIST
	db 10,GUST
	db 20,MUD_SLAP
	db 30,ICY_WIND
	db 40,BUBBLEBEAM
	db 50,ANCIENTPOWER
	db 60,REFLECT
	db 70,ICE_BEAM
	db 80,STEEL_WING
	db 90,AGILITY
	db 96,LIGHT_SCREEN
	db 97,AIR_SLASH
	db 98,SHEER_COLD
	db 99,MIND_READER
	db 100,BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, THUNDERSHOCK
	db 5, METAL_SOUND
	db 10,PECK
	db 20,MUD_SLAP
	db 30,SPARK
	db 40,SWIFT
	db 50,ANCIENTPOWER
	db 60,STEEL_WING
	db 70,THUNDERBOLT
	db 80,DRILL_PECK
	db 90,AGILITY
	db 96,LIGHT_SCREEN
	db 97,REFLECT
	db 98,AIR_SLASH
	db 99,RAIN_DANCE
	db 100,THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, EMBER
	db 5, SAFEGUARD
	db 10, PECK
	db 20,MUD_SLAP
	db 30,FIRE_SPIN
	db 40,SWIFT
	db 50,ANCIENTPOWER
	db 60,STEEL_WING
	db 70,HEAT_WAVE
	db 80,REFLECT
	db 90,AGILITY
	db 96,LIGHT_SCREEN
	db 97,AIR_SLASH
	db 98,SOLARBEAM
	db 99,SUNNY_DAY
	db 100,FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 4, LEER
	db 7, SLAM
	db 10, THUNDER_WAVE
	db 13, TWISTER
	db 16, SUPERSONIC
	db 20, AQUA_JET ; later gen move
	db 23, REFLECT
	db 26, DRAGONBREATH
	db 29, SAFEGUARD
	db 33, AGILITY
	db 36, DRAGON_RAGE
	db 39, DRAGON_PULSE
	db 42, FLAMETHROWER ; tutor move
	db 45, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, HAZE
	db 1, HEADBUTT
	db 1, REFLECT 
	db 1, SAFEGUARD
	db 1, ICY_WIND 
	db 1, DRAGONBREATH
	db 33, AGILITY
	db 37, DRAGON_RAGE
	db 41, FLAMETHROWER ; tutor move
	db 45, DRAGON_PULSE
	db 49, REST ; * tm move
	db 54, SLEEP_TALK ; * tm move
	db 59, HYPER_BEAM
	db 65, OUTRAGE ; *
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolution
	db 1, IRON_HEAD
	db 1, HEAL_BELL
	db 1, LIGHT_SCREEN
	db 1, HORN_DRILL
	db 1, STEEL_WING
	db 1, SAFEGUARD
	db 1, FLAMETHROWER
	db 1, AQUA_JET
	db 1, DRAGON_PULSE 
	db 55, WING_ATTACK
	db 60, HEAT_WAVE
	db 70, HYDRO_PUMP ; * event move
	db 80, OUTRAGE
	db 90, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, DISABLE
	db 5, AMNESIA
	db 10,CONFUSION
	db 20,SWIFT
	db 30,FUTURE_SIGHT
	db 40,REFLECT
	db 50,PSYBEAM
	db 60,SELFDESTRUCT
	db 70,SUBMISSION
	db 80,IRON_TAIL
	db 85,TRI_ATTACK
	db 90,LIGHT_SCREEN
	db 95,PSYCHIC_M
	db 100,RECOVER
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, METRONOME
	db 5, ROAR
	db 10,CONFUSION
	db 15,TRANSFORM
	db 20,SWIFT
	db 25,COUNTER
	db 30,FUTURE_SIGHT
	db 35,ANCIENTPOWER
	db 40,REFLECT
	db 45,IRON_HEAD
	db 50,NASTY_PLOT
	db 55,BATON_PASS
	db 60,DOUBLE_EDGE
	db 65,AMNESIA
	db 70,EXPLOSION
	db 75,SOFTBOILED
	db 80,TRI_ATTACK
	db 85,HORN_DRILL
	db 90,SUBMISSION
	db 95,PSYCHIC_M
	db 100,SKETCH
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL,16,BAYLEEF
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,GROWL
	db 6,RAZOR_LEAF
	db 9,POISONPOWDER
	db 12,REFLECT
	db 15,SAFEGUARD
	db 18,GIGA_DRAIN ; tm move
	db 21,HEADBUTT ; tm move
	db 25,LEECH_SEED
	db 28,LIGHT_SCREEN
	db 32,SEED_BOMB ; later gen move
	db 35,ANCIENTPOWER
	db 38,SYNTHESIS
	db 42,SUNNY_DAY
	db 45,SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL,32,MEGANIUM
	db 0 ; no more evolutions
	db 1,POISONPOWDER
	db 1,REFLECT
	db 1,SAFEGUARD
	db 1,RAZOR_LEAF
	db 19,COUNTER ; * egg move
	db 23,HEADBUTT ; tm move
	db 27,GIGA_DRAIN ; tm move
	db 31,LEECH_SEED
	db 34,LIGHT_SCREEN
	db 38,ANCIENTPOWER
	db 42,SEED_BOMB ; later gen move
	db 46,SUNNY_DAY
	db 50,SYNTHESIS
	db 55,IRON_TAIL ; * tm move
	db 60,SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1,FLAIL
	db 1,ENDURE
	db 1,MIMIC
	db 1,COUNTER
	db 1,HEADBUTT ; tm move
	db 1,LEECH_SEED
	db 1,GIGA_DRAIN ; tm move
	db 35,LIGHT_SCREEN
	db 39,POISONPOWDER
	db 43,SAFEGUARD
	db 47,SEED_BOMB
	db 51,ANCIENTPOWER
	db 56,SWORDS_DANCE ; later gen move
	db 61,REFLECT
	db 65,PETAL_DANCE ; * event move
	db 70,IRON_TAIL ; tm move
	db 75,OUTRAGE ; * later gen move
	db 80,LEECH_SEED
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, LEER
	db 6, DOUBLE_KICK ; later gen move
	db 10, SMOKESCREEN
	db 13, EMBER
	db 16, ENDURE
	db 19, REVERSAL
	db 22, DEFENSE_CURL ; later gen move
	db 26, ROLLOUT ; later gen move
	db 29, FLAME_WHEEL
	db 33, SWIFT
	db 36, DIG ; tm move
	db 39, THRASH ; egg move
	db 42, FLAMETHROWER
	db 45, SUBMISSION ; egg move
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, LEER
	db 1, DOUBLE_KICK ; later gen move
	db 1, SMOKESCREEN
	db 1, EMBER
	db 19, ENDURE
	db 22, REVERSAL
	db 26, DEFENSE_CURL
	db 30, FLAME_WHEEL
	db 34, ROLLOUT
	db 38, IRON_TAIL ; * tm move
	db 42, THRASH
	db 46, FLAMETHROWER
	db 50, WILD_CHARGE ; * later gen move
	db 55, SUBMISSION ; egg move
	db 60, DOUBLE_EDGE ; *
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, HEADBUTT
	db 1, REVERSAL
	db 1, FLAME_WHEEL
	db 1, DEFENSE_CURL
	db 1, ROLLOUT
	db 40, IRON_TAIL ; tm move
	db 44, HEAT_WAVE ; * later gen move
	db 48, THRASH
	db 52, ROAR
	db 56, SUBMISSION ; egg move
	db 61, FLAMETHROWER
	db 65, SHARPEN ; * illegal move
	db 70, WILD_CHARGE ; later gen move
	db 75, DOUBLE_EDGE
	db 80, FLARE_BLITZ ; * later gen move
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL,18,CROCONAW
	db 0 ; no more evolutions
	db 1,SCRATCH
	db 4,LEER
	db 7,WATER_GUN
	db 10,RAGE
	db 13,METAL_CLAW
	db 16,SCARY_FACE
	db 19,AQUA_JET
	db 22,BITE
	db 25,HEADBUTT ; tm move
	db 29,SCREECH
	db 33,WATERFALL ; hm move
	db 36,IRON_TAIL ; tm move
	db 39,THRASH ; egg move
	db 42,CRUNCH ; later gen move
	db 45,HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL,30,FERALIGATR
	db 0 ; no more evolutions
	db 1,WATER_GUN
	db 1,RAGE
	db 1,SCARY_FACE
	db 1,METAL_CLAW
	db 20,AQUA_JET 
	db 23,BITE 
	db 26,SLASH 
	db 29,SCREECH
	db 33,HYDRO_PUMP
	db 37,ICE_PUNCH
	db 41,IRON_TAIL 
	db 46,CRUNCH 
	db 50,WATERFALL
	db 55,SWORDS_DANCE ; * later gen move
	db 60,AQUA_JET
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1,ANCIENTPOWER
	db 1,COUNTER
	db 1,ROAR
	db 1,BITE
	db 1,SLASH
	db 1,SCREECH
	db 1,AQUA_JET
	db 34,THRASH
	db 39,ICE_PUNCH
	db 44,IRON_TAIL
	db 48,HYDRO_PUMP
	db 52,AGILITY ; *
	db 56,CRUNCH
	db 61,OUTRAGE
	db 65,WATERFALL
	db 70,SWORDS_DANCE
	db 75,AQUA_JET ; later gen move
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, MIMIC ; later gen move
	db 7, PURSUIT ; egg move
	db 10, MUD_SLAP ;
	db 13, QUICK_ATTACK
	db 16, DEFENSE_CURL
	db 19, ROLLOUT
	db 22, SLAM
	db 25, SUPER_FANG ; later gen move
	db 28, AMNESIA
	db 30, BATON_PASS
	db 33, SLASH ; egg move
	db 36, FIRE_PUNCH ; tm move
	db 39, THUNDERPUNCH ; tm move
	db 42, ICE_PUNCH ; tm move
	db 45, DOUBLE_EDGE ; egg move
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAKE_DOWN
	db 1, CHARM
	db 1, IRON_TAIL
	db 1, HEADBUTT
	db 1, MIMIC ; later gen move
	db 1, PURSUIT ; egg move
	db 1, MUD_SLAP ;
	db 1, QUICK_ATTACK
	db 19, DEFENSE_CURL
	db 23, SLAM
	db 26, ROLLOUT
	db 29, SUPER_FANG ; later gen move
	db 32, AMNESIA
	db 37, SLASH ; egg move
	db 42, FIRE_PUNCH ; tm move
	db 46, THUNDERPUNCH ; tm move
	db 50, ICE_PUNCH ; tm move
	db 55, REVERSAL ; * egg move
	db 60, SUBSTITUTE ; * later gen move
	db 65, BATON_PASS
	db 70, DOUBLE_EDGE ; egg move
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 6, MIMIC ; later gen move
	db 9, PECK
	db 12, HYPNOSIS
	db 15, TAKE_DOWN
	db 18, FORESIGHT
	db 21, REFLECT
	db 24, CONFUSION
	db 27, WING_ATTACK ; egg move
	db 30, NIGHT_SHADE ; egg move
	db 33, MIRROR_MOVE
	db 36, DOUBLE_EDGE ; later gen move
	db 39, HYPNOSIS
	db 42, DREAM_EATER
	db 45, AIR_SLASH ; later gen move
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1,STEEL_WING
	db 1,FAINT_ATTACK
	db 1,SUPERSONIC
	db 1,FORESIGHT
	db 1,HYPNOSIS
	db 1,PECK
	db 1,TAKE_DOWN
	db 24,CONFUSION
	db 27,WING_ATTACK ; egg move
	db 30,SWIFT ; * tm move
	db 33,MIRROR_MOVE
	db 38,NIGHT_SHADE ; later gen move
	db 42,DOUBLE_EDGE ; later gen move
	db 46,WHIRLWIND ; * egg move
	db 51,REFLECT
	db 55,AIR_SLASH
	db 60,HEAT_WAVE ; * later gen move
	db 65,HYPNOSIS
	db 70,NIGHTMARE ; * tm move
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL,18,LEDIAN
	db 0 ; no more evolutions
	db 1,TACKLE
	db 3,STRING_SHOT ; later gen move
	db 6,SUPERSONIC
	db 9,MACH_PUNCH ; later gen move
	db 12,GUST ; illegal move
	db 15,ROLLOUT ; tm move
	db 18,LIGHT_SCREEN
	db 18,REFLECT
	db 21,PSYBEAM ; egg move
	db 24,BIDE ; egg move
	db 27,WING_ATTACK ; illegal move
	db 30,SWORDS_DANCE ; later gen TM move
	db 33,DIZZY_PUNCH
	db 36,BUG_BUZZ ; later gen move
	db 39,AGILITY
	db 42,BATON_PASS
	db 45,AIR_SLASH ; later gen move
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, ENCORE
	db 1, SCREECH
	db 1, MACH_PUNCH ; later gen move
	db 1, LIGHT_SCREEN
	db 1, REFLECT
	db 1, GUST ; illegal move
	db 25, PSYBEAM ; egg move
	db 30, BIDE ; egg move
	db 34, BATON_PASS
	db 38, SWORDS_DANCE ; tm move
	db 42, WING_ATTACK ; illegal move
	db 47, DOUBLE_EDGE ; *
	db 51, AGILITY
	db 55, BUG_BUZZ ; later gen move
	db 60, AIR_SLASH ; later gen move
	db 65, HYPER_BEAM ; * tm move
	db 70, FOCUS_BLAST ; * later gen move
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, STRING_SHOT
	db 6, PURSUIT ; egg move
	db 9, LEECH_LIFE
	db 12, SCARY_FACE
	db 15, SLUDGE ; illegal move
	db 18, BATON_PASS ; egg move
	db 21, GROWTH ; event move
	db 24, TWINEEDLE ; later gen move
	db 27, GIGA_DRAIN ; tm move
	db 33, SCARY_FACE
	db 30, NIGHT_SHADE
	db 36, POISON_JAB ; later gen move
	db 39, DISABLE ; egg move
	db 42, PSYCHIC_M
	db 45, MEGAHORN ; later gen move
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 1, SCREECH
	db 1, PIN_MISSILE
	db 1, SCARY_FACE
	db 1, FURY_ATTACK ; * Fury Swipes replacement
	db 1, LEECH_LIFE
	db 1, SLUDGE
	db 26, TWINEEDLE ; egg move
	db 30, GIGA_DRAIN ; tm move
	db 35, NIGHT_SHADE
	db 39, DISABLE ; egg move
	db 43, X_SCISSOR ; * later gen move
	db 48, PSYCHIC_M
	db 52, POISON_JAB
	db 56, BATON_PASS
	db 60, AGILITY ; *
	db 65, MEAN_LOOK ; Spider Web replacement *
	db 70, MEGAHORN ; later gen move
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, FAINT_ATTACK ; egg move
	db 1, CONFUSE_RAY
	db 1, BITE
	db 1, GUST ; egg move
	db 25, SWIFT ; tm move
	db 29, HAZE  ; * later gen move
	db 33, GIGA_DRAIN
	db 37, WING_ATTACK ; later gen move
	db 41, X_SCISSOR ; tm move
	db 45, WHIRLWIND  ; later gen move
	db 49, STEEL_WING ; egg move
	db 53, POISON_JAB ; illegal move
	db 57, HEAT_WAVE ; *
	db 61, MEAN_LOOK ; *
	db 65, SUPER_FANG ; later gen move
	db 69, AIR_SLASH ; later gen move
	db 73, HYPNOSIS ; later gen move
	db 76, NASTY_PLOT ; * later gen move
	db 79, SLUDGE_BOMB ; * tm move
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, FLAIL ; egg move
	db 3, SUPERSONIC
	db 6, BUBBLE
	db 9, THUNDER_WAVE
	db 12, HEAL_BELL ; later gen move
	db 15, WATER_GUN
	db 18, CONFUSE_RAY
	db 20, TAKE_DOWN
	db 23, SCREECH ; egg move
	db 26, SPARK
	db 31, BUBBLEBEAM ; later gen move
	db 34, PSYBEAM ; later gen move
	db 38, ICY_WIND ; later gen move
	db 41, THUNDERBOLT
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, AGILITY
	db 1, AMNESIA
	db 1, MIMIC
	db 1, CONFUSE_RAY
	db 1, TAKE_DOWN
	db 1, SCREECH ; egg move
	db 1, SPARK
	db 32, BUBBLEBEAM ; later gen move
	db 36, MIST ; * later gen move
	db 41, LIGHT_SCREEN ; * event move
	db 46, THUNDERBOLT
	db 51, ICY_WIND ; later gen move
	db 55, PSYBEAM ; later gen move
	db 60, HYDRO_PUMP
	db 65, RAIN_DANCE ; * tm move
	db 70, THUNDER
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, CHARM  ; Pikachu move
	db 1, THUNDERSHOCK
	db 6, QUICK_ATTACK
	db 9, TAIL_WHIP
	db 12, DOUBLE_TEAM ; later gen move
	db 15, SPARK
	db 18, SWEET_KISS
	db 21, THUNDER_WAVE ; illegal move
	db 24, DIZZY_PUNCH ; Pikachu event move
	db 27, WILD_CHARGE ; Pikachu move
	db 30, IRON_TAIL ;
	db 33, SING
	db 36, THUNDERBOLT ; move tutor move
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 3, CHARM
	db 5, ENCORE
	db 8, SING
	db 11, FAIRY_WIND ; illegal move
	db 14, METRONOME ; egg move
	db 17, SWEET_KISS
	db 20, MINIMIZE ; clefairy move
	db 23, PLAY_ROUGH ; clefairy later gen move
	db 26, SOFTBOILED ; later gen move
	db 29, PETAL_DANCE ; event move
	db 32, TRI_ATTACK ; clefairy move
	db 35, MOONBLAST ; clefairy move
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SING
	db 3, CHARM
	db 6, DOUBLESLAP
	db 9, DISABLE
	db 12, HEAL_BELL ; illegal move
	db 15, FAIRY_WIND ; event move
	db 18, SWEET_KISS ; event move
	db 21, FAINT_ATTACK ; egg move
	db 24, DIZZY_PUNCH ; event move
	db 27, MEGA_KICK
	db 30, PERISH_SONG ; egg move
	db 32, PROTECT ; tm move
	db 35, PLAY_ROUGH ; wigglytuff move
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, PECK ; egg move
	db 3, GROWL
	db 6, DOUBLESLAP ; illegal move
	db 9, FUTURE_SIGHT ; egg move
	db 12, MIRROR_MOVE ; egg move
	db 15, METRONOME
	db 18, DIZZY_PUNCH ; illegal move
	db 21, SWEET_KISS
	db 24, ENCORE
	db 27, CHARM
	db 29, DAZZLINGLEAM ; later gen move
	db 31, SAFEGUARD
	db 33, DOUBLE_EDGE
	db 35, SOFTBOILED
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, STEEL_WING
	db 1, PECK ; egg move
	db 3, GROWL
	db 7, DOUBLESLAP ; illegal move
	db 11, FUTURE_SIGHT ; egg move
	db 15, MIRROR_MOVE ; egg move
	db 18, METRONOME
	db 22, FAIRY_WIND ; * later gen move
	db 26, SWEET_KISS
	db 30, ENCORE
	db 34, WING_ATTACK ; * illegal move
	db 38, DIZZY_PUNCH ; illegal move
	db 42, ANCIENTPOWER ; * later gen move
	db 47, SAFEGUARD
	db 51, HEAT_WAVE
	db 55, DAZZLINGLEAM
	db 60, MORNING_SUN ; * egg move
	db 65, NASTY_PLOT ; * later gen move
	db 70, AIR_SLASH ; * illegal move
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 3, LEER
	db 6, CONFUSION ; illegal move
	db 9, TWISTER ; later gen move
	db 12, TELEPORT
	db 15, FUTURE_SIGHT
	db 18, SWIFT ; later gen move
	db 21, NIGHT_SHADE
	db 24, ZEN_HEADBUTT ; later gen move
	db 27, PROTECT ; tm move
	db 30, HAZE ; egg move
	db 33, DRILL_PECK ; egg move
	db 36, STEEL_WING ; egg move
	db 39, HEAT_WAVE ; later gen move
	db 42, CONFUSE_RAY
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, RECOVER
	db 1, QUICK_ATTACK
	db 1, LIGHT_SCREEN
	db 1, SWIFT ; later gen move
	db 1, FUTURE_SIGHT
	db 1, NIGHT_SHADE
	db 1, ZEN_HEADBUTT ; later gen move
	db 30, PROTECT ; tm move
	db 34, FAINT_ATTACK
	db 38, DRILL_PECK ; egg move
	db 43, HAZE ; egg move
	db 47, STEEL_WING ; egg move
	db 51, CONFUSE_RAY
	db 55, PSYCHIC_M
	db 60, HEAT_WAVE ; later gen move
	db 65, PAIN_SPLIT ; * later gen move
	db 70, AIR_SLASH ; * later gen move
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, THUNDERSHOCK
	db 10, LIGHT_SCREEN
	db 13, THUNDER_WAVE
	db 16, HEADBUTT ; tm move
	db 19, SPARK ; illegal move
	db 22, SCREECH ; egg move
	db 24, HEAL_BELL ; later gen move
	db 27, TAKE_DOWN ; egg move
	db 30, THUNDERBOLT ; egg move
	db 34, CONFUSE_RAY ; later gen move
	db 37, IRON_TAIL ; tm move
	db 41, COTTON_SPORE
	db 45, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, LIGHT_SCREEN
	db 1, THUNDER_WAVE
	db 18, HEADBUTT ; tm move
	db 21, SPARK ; illegal move
	db 25, SCREECH ; egg move
	db 29, HEAL_BELL ; later gen move
	db 33, THUNDERPUNCH ; * later gen move
	db 37, TAKE_DOWN ; egg move
	db 40, CONFUSE_RAY ; later gen move
	db 44, THUNDERBOLT ; egg move
	db 48, IRON_TAIL ; tm move
	db 52, COTTON_SPORE
	db 56, FIRE_PUNCH ; * later gen move
	db 60, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, SAFEGUARD
	db 1, REFLECT
	db 1, OUTRAGE
	db 1, AGILITY
	db 1, HEADBUTT ; tm move
	db 1, SCREECH ; egg move
	db 1, HEAL_BELL ; later gen move
	db 1, SPARK ; illegal move
	db 33, LIGHT_SCREEN
	db 37, DRAGONBREATH ; * illegal move
	db 41, TAKE_DOWN ; egg move
	db 45, THUNDERPUNCH ; later gen move
	db 49, CONFUSE_RAY ; later gen move
	db 53, IRON_TAIL ; tm move
	db 57, COTTON_SPORE
	db 61, THUNDERBOLT ; egg move
	db 65, FIRE_PUNCH ; later gen move
	db 70, DRAGON_PULSE ; * later gen move
	db 75, RAIN_DANCE ; *
	db 80, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, STUN_SPORE
	db 1, ENDURE
	db 1, FLAIL
	db 1, MEGA_DRAIN
	db 30, REFLECT
	db 40, LEECH_SEED ; egg move
	db 50, PETAL_DANCE
	db 60, SLEEP_POWDER
	db 70, SWORDS_DANCE ; * later gen move
	db 80, DOUBLE_EDGE ; * later gen move
	db 90, SEED_BOMB ; * later gen move
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, AQUA_JET ; later gen move
	db 4, TACKLE
	db 7, TAIL_WHIP
	db 10, DOUBLESLAP ; illegal move
	db 13, WATER_GUN
	db 16, DEFENSE_CURL
	db 19, ROLLOUT
	db 22, CHARM
	db 25, BUBBLEBEAM
	db 28, FUTURE_SIGHT ; egg move
	db 31, DIZZY_PUNCH
	db 33, PERISH_SONG ; egg move
	db 36, SING ; later gen move
	db 39, RAIN_DANCE
	db 42, PLAY_ROUGH
	db 45, WATERFALL ; hm move
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, LIGHT_SCREEN
	db 1, ENCORE
	db 1, HEADBUTT
	db 1, IRON_TAIL
	db 1, TAIL_WHIP
	db 1, DOUBLESLAP ; illegal move
	db 1, WATER_GUN
	db 1, DEFENSE_CURL
	db 19, ROLLOUT
	db 23, CHARM
	db 26, BUBBLEBEAM
	db 29, FUTURE_SIGHT ; egg move
	db 33, DIZZY_PUNCH
	db 37, PERISH_SONG ; egg move
	db 42, SING ; later gen move
	db 46, RAIN_DANCE
	db 51, WATERFALL ; hm move
	db 55, PLAY_ROUGH
	db 60, BELLY_DRUM ; * egg move
	db 65, DOUBLE_EDGE ; *
	db 70, AQUA_JET ; later gen move
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAIL
	db 3, ENDURE
	db 7, MIMIC
	db 11, HARDEN ; egg move
	db 15, ROCK_THROW
	db 19, FAINT_ATTACK
	db 23, SLAM
	db 27, DEFENSE_CURL
	db 31, ROLLOUT ; tm move
	db 36, SELFDESTRUCT ; egg move
	db 40, COUNTER
	db 44, GIGA_DRAIN ; illegal move
	db 48, ROCK_SLIDE
	db 52, SEISMIC_TOSS ; later gen move
	db 56, MEGA_KICK
	db 60, EXPLOSION ; later gen move
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIMIC
	db 1, MEGA_KICK
	db 1, WATER_GUN
	db 1, HAZE
	db 30, SWEET_KISS 
	db 40, BUBBLEBEAM 
	db 50, PERISH_SONG
	db 60, LOVELY_KISS
	db 70, FOCUS_BLAST 
	db 80, HYDRO_PUMP
	db 90, GROWTH
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 4, ABSORB
	db 7, POISONPOWDER
	db 10, TACKLE
	db 13, STUN_SPORE
	db 16, MEGA_DRAIN
	db 19, PAY_DAY ; egg move
	db 22, LEECH_SEED
	db 24, REFLECT 
	db 28, SEED_BOMB 
	db 32, SLEEP_POWDER
	db 35, SWORDS_DANCE
	db 38, DOUBLE_EDGE ; later gen move
	db 42, GIGA_DRAIN ; tm move
	db 45, DAZZLINGLEAM
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 1, ENCORE
	db 1, AMNESIA
	db 1, POISONPOWDER
	db 1, TACKLE
	db 1, STUN_SPORE
	db 1, MEGA_DRAIN
	db 20, SLEEP_POWDER
	db 23, LEECH_SEED
	db 26, FAIRY_WIND ; later gen move
	db 30, SEED_BOMB
	db 34, SYNTHESIS ; later gen move
	db 38, SWORDS_DANCE ; tm move
	db 42, DOUBLE_EDGE ; later gen move
	db 46, GIGA_DRAIN ; tm move
	db 51, DAZZLINGLEAM ; * later gen move
	db 55, STUN_SPORE
	db 60, HEADBUTT ; * tm move
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, STUN_SPORE
	db 1, SLEEP_POWDER
	db 1, REFLECT
	db 31, SEED_BOMB
	db 35, SYNTHESIS ; later gen move
	db 39, SWORDS_DANCE ; tm move
	db 43, DOUBLE_EDGE ; later gen move
	db 47, MEGA_DRAIN
	db 51, DAZZLINGLEAM ; later gen move
	db 56, STUN_SPORE
	db 60, LEECH_SEED
	db 65, GIGA_DRAIN ; tm move
	db 70, SLEEP_POWDER
	db 75, COTTON_SPORE ; *
	db 80, HEADBUTT ; tm move
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 3, TAIL_WHIP
	db 7, PURSUIT
	db 11, SAND_ATTACK
	db 15, SWIFT
	db 18, AGILITY
	db 22, BATON_PASS
	db 26, NASTY_PLOT
	db 29, TRI_ATTACK
	db 33, SHADOW_BALL
	db 38, IRON_TAIL
	db 42, SPITE
	db 47, HEADBUTT
	db 51, SEED_BOMB
	db 55, GUNK_SHOT ; later gen move
	db 60, SCREECH
	db 65, DOUBLE_EDGE ; later gen move
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 3, GROWTH
	db 6, MIMIC ; later gen move
	db 9, MEGA_DRAIN
	db 12, LIGHT_SCREEN ; later gen move
	db 15, BIDE ; later gen move
	db 18, MORNING_SUN ; later gen move
	db 21, RAZOR_LEAF
	db 24, CURSE ; tm move
	db 27, POISONPOWDER ; illegal move
	db 30, DOUBLE_EDGE ; later gen move
	db 33, GIGA_DRAIN
	db 36, LEECH_SEED
	db 39, SPORE ; illegal move
	db 42, SUNNY_DAY
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, GROWTH
	db 9, MIMIC ; later gen move
	db 14, MEGA_DRAIN
	db 18, LIGHT_SCREEN ; later gen move
	db 22, MORNING_SUN ; later gen move
	db 25, RAZOR_LEAF
	db 29, CURSE ; tm move
	db 34, POISONPOWDER ; illegal move
	db 38, PETAL_DANCE
	db 42, LEECH_SEED
	db 46, DOUBLE_EDGE ; later gen move
	db 51, SWORDS_DANCE ; * later gen move
	db 56, SEED_BOMB ; later gen move
	db 60, EARTH_POWER ; * later gen move
	db 65, SUNNY_DAY
	db 70, SYNTHESIS ; *
	db 75, SOLARBEAM
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, FORESIGHT
	db 6, SUPERSONIC
	db 9, LEECH_LIFE ; egg move
	db 12, SONICBOOM
	db 16, GUST ; illegal move
	db 19, DOUBLE_TEAM
	db 23, ENDURE ; tm mvoe
	db 26, PIN_MISSILE ; illegal move
	db 29, REVERSAL ; egg move
	db 32, ANCIENTPOWER ; later gen move
	db 36, WING_ATTACK ; egg move
	db 40, SCREECH
	db 45, STEEL_WING ; event move
	db 50, HYPNOSIS ; later gen move
	db 55, AIR_SLASH ; later gen move
	db 60, BUG_BUZZ ; later gen move
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, BUBBLE ; illegal move
	db 4, TAIL_WHIP
	db 8, MUD_SLAP ; later gen move
	db 12, DOUBLE_KICK
	db 15, WATER_GUN
	db 18, SLAM
	db 21, AMNESIA
	db 24, DIG
	db 27, BUBBLEBEAM
	db 30, IRON_TAIL
	db 33, HAZE
	db 36, RECOVER
	db 39, WATERFALL
	db 42, RAIN_DANCE
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, SAFEGUARD
	db 1, SCARY_FACE
	db 1, ROLLOUT
	db 1, DEFENSE_CURL
	db 1, MUD_SLAP
	db 1, DOUBLE_KICK
	db 1, WATER_GUN
	db 1, SLAM
	db 23, AMNESIA
	db 28, DIG
	db 32, BUBBLEBEAM
	db 37, IRON_TAIL
	db 42, HAZE
	db 47, EARTH_POWER
	db 52, RECOVER
	db 57, WATERFALL
	db 61, MEGA_KICK ; * later gen move
	db 65, EARTHQUAKE
	db 70, BELLY_DRUM ; * event move
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, DREAM_EATER
	db 1, NIGHTMARE
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, SAND_ATTACK
	db 11, CONFUSION
	db 15, FUTURE_SIGHT
	db 19, SWIFT
	db 23, HEAL_BELL
	db 27, PSYBEAM
	db 31, GROWTH 
	db 35, BATON_PASS
	db 38, IRON_TAIL 
	db 42, ZEN_HEADBUTT
	db 47, DOUBLE_TEAM
	db 51, MORNING_SUN
	db 55, DAZZLINGLEAM 
	db 60, PSYCHIC_M
	db 65, LIGHT_SCREEN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, DREAM_EATER
	db 1, NIGHTMARE
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, SAND_ATTACK
	db 11, PURSUIT
	db 15, GROWL
	db 19, SCREECH
	db 23, HEAL_BELL
	db 27, FAINT_ATTACK
	db 31, TOXIC 
	db 35, MEAN_LOOK
	db 38, CONFUSE_RAY
	db 42, CRUNCH
	db 47, MOONLIGHT
	db 51, CHARM 
	db 55, DARK_PULSE 
	db 60, SPITE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 4, MEAN_LOOK
	db 7, QUICK_ATTACK ; egg move
	db 10, MUD_SLAP ; tm move
	db 13, PURSUIT
	db 17, MIMIC ; later gen move
	db 21, WING_ATTACK ; egg move
	db 25, STEEL_WING ; tm move
	db 29, NIGHT_SHADE
	db 32, FAINT_ATTACK
	db 36, CONFUSE_RAY ; egg move
	db 39, HEAT_WAVE ; later gen move
	db 42, HAZE
	db 46, DRILL_PECK 
	db 50, MEAN_LOOK
	db 55, PERISH_SONG
	db 60, DARK_PULSE ; later gen move
	db 65, AIR_SLASH
	db 70, NASTY_PLOT
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GROWL
	db 10, SAFEGUARD
	db 15, WATER_GUN
	db 20, FUTURE_SIGHT ; egg move
	db 30, AMNESIA
	db 40, IRON_DEFENSE ; gen 1 move
	db 50, ZEN_HEADBUTT
	db 60, BUBBLEBEAM ; *
	db 70, TRI_ATTACK
	db 80, NASTY_PLOT
	db 90, PSYCHIC_M ; later gen move
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; illegal move
	db 4, SPITE
	db 8, SCREECH
	db 11, LICK ; illegal move
	db 15, HEADBUTT
	db 19, CONFUSE_RAY
	db 23, PSYWAVE
	db 27, HYPNOSIS ; event move
	db 30, NIGHTMARE ; tm move
	db 34, MEAN_LOOK
	db 38, PSYBEAM
	db 41, PAIN_SPLIT
	db 45, SHADOW_BALL ; tm move
	db 50, NASTY_PLOT ; later gen move
	db 55, DAZZLINGLEAM ; later gen move
	db 60, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 50, ANCIENTPOWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, ENCORE
	db 1, MIMIC
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, CONFUSION
	db 12, DOUBLE_KICK
	db 15, AGILITY
	db 19, BATON_PASS
	db 23, STOMP
	db 27, ZEN_HEADBUTT ; later gen move
	db 31, CRUNCH
	db 35, AMNESIA ; egg move
	db 40, IRON_TAIL ; tm move
	db 45, PSYBEAM
	db 55, SHADOW_BALL ; tm move
	db 60, SWIFT ; tm move
	db 65, NASTY_PLOT ; later gen move
	db 70, PSYCHIC_M
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL,31,FORRETRESS
	db 0 ; no more evolutions
	db 1,RAPID_SPIN
	db 4,PROTECT
	db 6,TACKLE
	db 9,COUNTER ; later gen move
	db 12,ROLLOUT ; tm move
	db 15,SELFDESTRUCT
	db 19,IRON_DEFENSE ; later gen move
	db 23,SPIKES
	db 26,PIN_MISSILE ; egg move
	db 29,PAIN_SPLIT ; later gen move
	db 32,BIDE
	db 35,EXPLOSION
	db 39,FURY_CUTTER
	db 42,DRILL_RUN ; later gen move
	db 45,DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, REFLECT
	db 1, HEADBUTT
	db 1, LIGHT_SCREEN
	db 1, SELFDESTRUCT
	db 1, SPIKES
	db 1, PAIN_SPLIT ; later gen move
	db 1, PIN_MISSILE ; egg move
	db 35, RAPID_SPIN
	db 39, PAIN_SPLIT ; later gen move
	db 43, ROCK_POLISH
	db 48, IRON_HEAD ; * illegal move
	db 52, SPIKES
	db 57, IRON_DEFENSE
	db 61, EXPLOSION
	db 65, BUG_BUZZ ; * later gen move
	db 70, METAL_SOUND ; * illegal move
	db 75, DRILL_RUN ; later gen move
	db 80, FLASH_CANNON ; * later gen move
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 4, SPITE
	db 8, BIDE ; egg move
	db 11, DEFENSE_CURL
	db 15, FURY_ATTACK
	db 19, ROLLOUT
	db 22, BITE
	db 25, SCREECH
	db 28, TAKE_DOWN
	db 31, GLARE
	db 35, ANCIENTPOWER ; egg move
	db 39, DIG ; tm move
	db 43, HEADBUTT
	db 43, AGILITY ; later gen move
	db 46, ENDURE
	db 50, FLAIL ; later gen move
	db 55, DRILL_RUN ; later gen move
	db 60, HORN_DRILL ; event move
	db 65, DOUBLE_EDGE
	db 70, POISON_JAB
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, SAND_ATTACK
	db 6, HARDEN
	db 9, SWIFT
	db 12, MUD_SLAP ; illegal move
	db 16, METAL_CLAW ; egg move
	db 20, SCREECH
	db 24, SLASH
	db 29, EARTH_POWER ; later gen move
	db 34, FAINT_ATTACK
	db 38, WING_ATTACK
	db 42, X_SCISSOR
	db 46, SWORDS_DANCE ; later gen move
	db 50, DIG ; later gen move
	db 55, STEEL_WING
	db 60, FISSURE
	db 65, POISON_JAB ; later gen move
	db 70, EARTHQUAKE ; later gen move
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, SCREECH
	db 8, WRAP ; Bind replacement
	db 11, HARDEN
	db 15, ROCK_THROW
	db 18, EARTH_POWER
	db 22, METAL_SOUND
	db 26, DRAGONBREATH
	db 31, SANDSTORM
	db 35, SELFDESTRUCT ; * later gen move
	db 40, IRON_TAIL ; gen 1 move
	db 44, SHARPEN ; event move
	db 49, FISSURE ; * gen 1 move
	db 53, DIG ; *
	db 57, ROCK_SLIDE
	db 61, SCREECH
	db 65, IRON_HEAD ; * tm move
	db 70, ROCK_POLISH ; later gen move
	db 75, CRUNCH ; *
	db 80, EARTHQUAKE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, CHARM
	db 5, RAGE
	db 8, TAIL_WHIP
	db 10, LICK
	db 12, DOUBLESLAP ; illegal move
	db 15, HEADBUTT ; tm move
	db 18, SCARY_FACE
	db 21, BITE
	db 24, DIZZY_PUNCH ; illegal move
	db 27, SUPER_FANG
	db 30, REFLECT ; egg move
	db 33, FAINT_ATTACK ; egg move
	db 36, DAZZLINGLEAM ; later gen move
	db 39, MEGA_KICK ; later gen move
	db 42, ROAR
	db 45, CRUNCH ; egg move
	db 50, PLAY_ROUGH ; later gen move
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAKE_DOWN
	db 1, COUNTER
	db 1, METRONOME
	db 1, DEFENSE_CURL
	db 1, HEADBUTT ; tm move
	db 1, BITE
	db 1, SCARY_FACE
	db 1, DOUBLESLAP ; illegal move
	db 25, HEADBUTT
	db 28, METRONOME ; egg move
	db 31, REFLECT ; egg move
	db 34, DIZZY_PUNCH
	db 38, SUPER_FANG
	db 42, FAINT_ATTACK ; egg move
	db 46, OUTRAGE ; * later gen move
	db 51, DAZZLINGLEAM ; later gen move
	db 55, ROAR
	db 60, IRON_TAIL ; * later gen move
	db 65, MEGA_KICK ; later gen move
	db 70, PLAY_ROUGH
	db 75, HEAL_BELL ; * later gen move
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, DEFENSE_CURL
	db 8, BUBBLE ; later gen move
	db 11, POISON_STING
	db 15, SPIKES
	db 18, TAKE_DOWN
	db 22, WATER_GUN
	db 26, PIN_MISSILE
	db 29, HAZE
	db 33, DESTINY_BOND
	db 37, AQUA_JET
	db 41, PAIN_SPLIT
	db 45, MINIMIZE
	db 50, POISON_JAB
	db 55, HYDRO_PUMP
	db 60, DOUBLE_EDGE
	db 65, EXPLOSION
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 5, LEER
	db 9, FOCUS_ENERGY
	db 14, PURSUIT
	db 18, METAL_CLAW
	db 22, FALSE_SWIPE ; *
	db 26, SWIFT ; * later gen move
	db 31, METAL_SOUND ; * illegal move
	db 35, BUG_BUZZ ; * later gen move
	db 39, COUNTER ; later gen move
	db 44, STEEL_WING
	db 48, IRON_DEFENSE ; * later gen move
	db 52, FURY_CUTTER
	db 57, DOUBLE_TEAM
	db 61, BATON_PASS
	db 65, IRON_HEAD ; * later gen move
	db 70, AGILITY
	db 75, SWORDS_DANCE
	db 80, X_SCISSOR ; later gen move
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 5, WITHDRAW
	db 9, ROCK_THROW ; later gen move
	db 14, ENCORE
	db 18, BIDE
	db 22, ROCK_POLISH ; later gen move
	db 26, ROCK_SLIDE ; later gen move
	db 31, BODY_SLAM ; later gen move
	db 36, REST
	db 40, SLEEP_TALK
	db 45, ROLLOUT ; tm move
	db 50, DEFENSE_CURL ; tm move
	db 55, SANDSTORM ; tm move
	db 60, TOXIC ; tm move
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, LEER
	db 8, FURY_ATTACK
	db 11, HARDEN ; egg move
	db 15, PURSUIT ; later gen move
	db 18, HORN_ATTACK
	db 21, SEISMIC_TOSS ; event move
	db 25, IRON_DEFENSE ; later gen move
	db 29, PIN_MISSILE ; later gen move
	db 34, TAKE_DOWN
	db 39, FALSE_SWIPE ; later gen move
	db 44, ENDURE
	db 46, REVERSAL
	db 50, DIG ; tm move
	db 55, BIDE ; egg move
	db 60, COUNTER
	db 65, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, LEER
	db 7, POWDER_SNOW ; illegal move
	db 10, PURSUIT ; egg move
	db 14, QUICK_ATTACK
	db 17, SPITE ; egg move
	db 21, SCREECH
	db 25, FAINT_ATTACK
	db 29, SLASH
	db 33, ICE_BEAM ; tm move
	db 37, METAL_CLAW
	db 41, BITE ; egg move
	db 46, POISON_JAB
	db 50, X_SCISSOR
	db 55, ICE_PUNCH
	db 60, MOONLIGHT ; event move
	db 65, AGILITY
	db 70, CRUNCH ; illegal move
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, LICK
	db 1, SCRATCH
	db 4, LEER
	db 7, METAL_CLAW
	db 10, SCARY_FACE
	db 13, TAKE_DOWN ; tm move
	db 16, FAINT_ATTACK
	db 19, METRONOME
	db 22, FOCUS_ENERGY
	db 25, SLASH ; egg move
	db 28, SHADOW_CLAW
	db 31, PLAY_ROUGH ; later gen move
	db 34, ROAR ; egg move
	db 37, HEADBUTT
	db 40, CROSS_CHOP ; later gen move
	db 43, CRUNCH ; egg move
	db 46, REST
	db 49, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, ROLLOUT
	db 1, DEFENSE_CURL
	db 1, SEED_BOMB
	db 1, METRONOME
	db 1, FOCUS_ENERGY
	db 1, SLASH ; *
	db 1, SHADOW_CLAW
	db 32, PLAY_ROUGH
	db 37, ROAR
	db 42, HEADBUTT
	db 47, REST
	db 51, SLEEP_TALK ; * tm move
	db 55, SEISMIC_TOSS
	db 60, THRASH
	db 65, CROSS_CHOP
	db 70, CRUNCH
	db 75, BELLY_DRUM ; * egg move
	db 80, MEGA_KICK
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 3, HARDEN
	db 6, MUD_SLAP
	db 9, EMBER
	db 12, SMOKESCREEN
	db 16, LIGHT_SCREEN
	db 20, FIRE_SPIN
	db 24, ACID_ARMOR
	db 29, AMNESIA
	db 33, PAIN_SPLIT
	db 37, HEAT_WAVE
	db 41, ANCIENTPOWER
	db 45, EARTH_POWER
	db 50, RECOVER ; later gen move
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, REFLECT
	db 1, DEFENSE_CURL
	db 1, ROLLOUT
	db 1, ACID_ARMOR
	db 1, AMNESIA ; later gen move
	db 1, PAIN_SPLIT
	db 1, HEAT_WAVE
	db 40, ROCK_SLIDE
	db 44, ROCK_POLISH
	db 48, EARTH_POWER ; later gen move
	db 52, FLAMETHROWER
	db 57, IRON_DEFENSE
	db 62, EXPLOSION
	db 66, ANCIENTPOWER
	db 70, FIRE_BLAST
	db 75, RECOVER
	db 80, REFLECT
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, MIST
	db 6, ROCK_THROW ; illegal move
	db 9, MUD_SLAP ; later gen move
	db 12, POWDER_SNOW
	db 15, ENDURE
	db 18, FLAIL ; later ge move
	db 21, EARTH_POWER ; later gen move
	db 24, AMNESIA
	db 27, BITE
	db 30, ICY_WIND ; tm move
	db 34, TAKE_DOWN
	db 38, EARTHQUAKE
	db 42, ROCK_SLIDE ; egg move
	db 46, CHARM
	db 50, BLIZZARD
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, ROAR
	db 1, HEADBUTT
	db 1, ANCIENTPOWER
	db 1, PECK ; * later gen move
	db 1, ROCK_THROW
	db 1, BITE
	db 1, EARTH_POWER
	db 1, ICY_WIND ; tm move
	db 36, HORN_ATTACK
	db 40, HAZE ; * egg move
	db 44, EARTH_POWER ; later gen move
	db 48, DOUBLE_EDGE
	db 51, WHIRLWIND ; * event move
	db 56, FISSURE
	db 61, EARTHQUAKE
	db 65, THRASH ; * later gen move
	db 70, BLIZZARD
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 4, HARDEN
	db 8, SAFEGUARD ; egg move
	db 12, ROCK_THROW ; illegal move
	db 16, SCREECH ; egg move
	db 20, SPIKE_CANNON
	db 25, BUBBLEBEAM
	db 30, RECOVER
	db 34, MIRROR_COAT
	db 38, DEFENSE_CURL ; later gen move
	db 41, ROLLOUT ; tm move
	db 46, CONFUSE_RAY ; later gen move
	db 50, BIDE ; later gen move
	db 55, EXPLOSION ; later gen move
	db 60, ANCIENTPOWER
	db 65, EARTH_POWER ; later gen move
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 3, FOCUS_ENERGY
	db 6, WATER_GUN
	db 9, FLAIL ; later gen move
	db 12, ENDURE
	db 15, PSYBEAM
	db 18, BUBBLEBEAM
	db 21, SEED_BOMB
	db 24, AURORA_BEAM
	db 27, FLAMETHROWER
	db 30, OCTAZOOKA
	db 33, HAZE ; egg move
	db 36, ICE_BEAM
	db 39, GUNK_SHOT
	db 42, HYDRO_PUMP
	db 45, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUPERSONIC
	db 1, SCREECH
	db 1, MIND_READER
	db 1, SWIFT
	db 1, DEFENSE_CURL
	db 1, SEED_BOMB
	db 1, PSYBEAM
	db 1, AURORA_BEAM
	db 1, BUBBLEBEAM
	db 29, SMOKESCREEN
	db 33, WRAP
	db 37, FLAMETHROWER
	db 41, OCTAZOOKA ; egg move
	db 46, HAZE ; egg move
	db 51, ICE_BEAM
	db 55, FLASH_CANNON
	db 60, HYDRO_PUMP
	db 65, GUNK_SHOT
	db 70, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 20, AURORA_BEAM
	db 40, SEED_BOMB
	db 60, DESTINY_BOND
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 4, HAZE
	db 7, GUST ; event move
	db 11, SUPERSONIC
	db 15, SLAM ; egg move
	db 18, AMNESIA
	db 22, BUBBLEBEAM
	db 26, AGILITY
	db 29, TWISTER
	db 33, PSYBEAM ; later gen move
	db 40, WING_ATTACK
	db 46, ICE_BEAM ; tm move
	db 50, IRON_HEAD ; later gen move
	db 55, CONFUSE_RAY
	db 60, AIR_SLASH ; later gen move
	db 65, MIRROR_COAT ; later gen move
	db 70, HYDRO_PUMP ; egg move
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 4, LEER
	db 8, FURY_ATTACK
	db 11, METAL_CLAW
	db 15, SAND_ATTACK
	db 19, PURSUIT ; egg move
	db 23, MUD_SLAP
	db 26, FLASH_CANNON ; later gen move
	db 30, FURY_CUTTER ; event move
	db 34, METAL_SOUND ; later gen move
	db 38, COUNTER
	db 42, AIR_SLASH ; later gen move
	db 46, SPIKES ; later gen move
	db 49, WHIRLWIND ; egg move
	db 52, DRILL_PECK ; egg move
	db 56, X_SCISSOR ; later gen move
	db 60, STEEL_WING
	db 65, SKY_ATTACK ; later gen move
	db 70, IRON_DEFENSE ; later gen move
	db 75, AGILITY
	db 80, IRON_HEAD ; later gen move
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, RAGE
	db 3, LEER
	db 6, EMBER
	db 9, PURSUIT ; egg move
	db 12, ROAR
	db 15, SPITE
	db 18, FIRE_SPIN ;
	db 21, BITE
	db 25, HEADBUTT
	db 28, COUNTER ; egg move
	db 31, HEAT_WAVE ; tm move
	db 34, SUPER_FANG ; later gen move
	db 38, CRUNCH
	db 42, DESTINY_BOND ; later gen move
	db 45, FLAMETHROWER
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, FAINT_ATTACK
	db 1, SWIFT
	db 1, ENDURE
	db 1, REVERSAL
	db 1, ROAR
	db 1, SPITE ; egg move
	db 1, BITE ; later gen move
	db 1, FIRE_SPIN
	db 27, HEADBUTT
	db 32, COUNTER ; egg move
	db 37, FAINT_ATTACK ; later gen move
	db 41, HEAT_WAVE
	db 46, SUPER_FANG
	db 51, CRUNCH
	db 56, NASTY_PLOT ; * later gen move
	db 60, SUNNY_DAY ; tm move
	db 65, FLAMETHROWER ; * tm move
	db 70, DARK_PULSE ; * later gen move
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWIFT
	db 1, FOCUS_ENERGY ; later gen move
	db 1, DRAGON_RAGE ; later gen move
	db 1, OCTAZOOKA ; egg move
	db 37, DRAGONBREATH
	db 42, HAZE
	db 47, ICE_BEAM
	db 52, HYDRO_PUMP
	db 57, OUTRAGE
	db 62, IRON_HEAD
	db 67, TOXIC
	db 72, OCTAZOOKA
	db 77, DRAGON_PULSE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, GROWL
	db 5, WATER_GUN
	db 8, MUD_SLAP
	db 10, ENCORE
	db 12, ANCIENTPOWER
	db 15, CHARM
	db 18, MAGNITUDE
	db 21, TAKE_DOWN
	db 24, ROLLOUT
	db 27, DEFENSE_CURL
	db 30, EARTH_POWER 
	db 33, HEADBUTT
	db 36, RAPID_SPIN
	db 39, FISSURE 
	db 42, EARTHQUAKE
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, ENDURE
	db 1, FLAIL
	db 1, IRON_DEFENSE
	db 1, SEED_BOMB
	db 1, ROLLOUT ; egg move
	db 1, HORN_ATTACK ; egg move
	db 1, ANCIENTPOWER ; egg move
	db 1, MAGNITUDE ; later gen move
	db 29, ROAR ; * tm move
	db 33, HEADBUTT
	db 37, RAPID_SPIN
	db 42, EARTH_POWER ; later gen move
	db 46, FISSURE ; later gen move
	db 51, PLAY_ROUGH
	db 55, DOUBLE_EDGE
	db 60, EARTHQUAKE
	db 65, DEFENSE_CURL
	db 70, ROLLOUT
	db 75, POISON_JAB ; *
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, TELEPORT ; gen 1 move
	db 9, MIMIC ; later gen move
	db 13, CONVERSION
	db 16, TAKE_DOWN
	db 19, SHARPEN
	db 23, IRON_TAIL
	db 28, CONVERSION2
	db 33, SWIFT
	db 38, PSYBEAM
	db 42, DEFENSE_CURL
	db 46, RECOVER
	db 51, DOUBLE_EDGE
	db 55, PSYWAVE
	db 59, REFLECT
	db 63, PAIN_SPLIT
	db 67, TRI_ATTACK
	db 71, BLIZZARD ; * tm move
	db 75, MIND_READER ; Lock-On replacement
	db 79, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, LEER
	db 5, RAGE
	db 8, SAND_ATTACK
	db 10, ATTRACT ; tm move
	db 12, DOUBLE_KICK
	db 15, SWIFT
	db 18, BITE
	db 22, HYPNOSIS
	db 25, NIGHTMARE ; tm move
	db 28, STOMP
	db 32, PSYCHIC_M ; tm move
	db 36, CONFUSE_RAY
	db 39, IRON_TAIL ; * tm move
	db 43, HEADBUTT 
	db 47, SWAGGER ; later gen move
	db 51, MEGAHORN
	db 55, ZEN_HEADBUTT ; later gen move
	db 60, THRASH
	db 65, THUNDER_WAVE
	db 70, HI_JUMP_KICK
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, RAPID_SPIN ; egg move
	db 3, MACH_PUNCH ; egg move
	db 6, FOCUS_ENERGY ; evolution move
	db 9, TACKLE
	db 12, PURSUIT ; later gen move
	db 15, KARATE_CHOP ; illegal move
	db 18, COUNTER ; later gen move
	db 21, HEADBUTT ; tm move
	db 25, DIZZY_PUNCH ; egg move
	db 28, SUBMISSION ; egg move
	db 32, ROCK_SLIDE ; later gen move
	db 35, MEGA_KICK ; later gen move
	db 38, MIND_READER
	db 41, HI_JUMP_KICK
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, BIDE
	db 1, RAPID_SPIN ; egg move
	db 1, FOCUS_ENERGY ; evolution move
	db 1, PURSUIT ; later gen move
	db 15, MACH_PUNCH
	db 20, ROLLING_KICK
	db 25, ROLLOUT ; later gen move
	db 30, SEISMIC_TOSS ; later gen move
	db 35, AGILITY
	db 40, SUBMISSION
	db 45, POISON_JAB
	db 50, DRILL_RUN ; later gen move
	db 55, FORESIGHT ; egg move
	db 60, COUNTER
	db 65, HI_JUMP_KICK ; egg move
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, MEDITATE
	db 3, LICK
	db 6, SWEET_KISS
	db 9, ICE_PUNCH
	db 12, CONFUSION
	db 15, SING
	db 18, NIGHTMARE ; tm move
	db 22, POWDER_SNOW
	db 25, DREAM_EATER
	db 28, LOVELY_KISS 
	db 31, REFLECT
	db 35, ICY_WIND
	db 38, PROTECT ; tm move
	db 41, PERISH_SONG
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 3, LEER
	db 6, THUNDERSHOCK
	db 10, KARATE_CHOP ; egg move
	db 14, LIGHT_SCREEN
	db 17, MEDITATE 
	db 20, SPARK 
	db 23, ROLLING_KICK
	db 26, FIRE_PUNCH ; tm move
	db 29, SWIFT
	db 33, THUNDERPUNCH
	db 36, MEGA_KICK ; later gen move
	db 39, SCREECH
	db 42, CROSS_CHOP ; egg move
	db 45, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, RAGE
	db 3, LEER
	db 6, SMOKESCREEN
	db 9, EMBER
	db 12, FAINT_ATTACK ; later gen move
	db 15, KARATE_CHOP
	db 18, CONFUSE_RAY
	db 21, FIRE_SPIN
	db 24, FOCUS_ENERGY ; later gen move
	db 27, SUNNY_DAY
	db 31, SEISMIC_TOSS ; later gen move
	db 33, FIRE_PUNCH
	db 36, SCREECH ; egg move
	db 39, THUNDERPUNCH ; tm move
	db 42, CROSS_CHOP
	db 45, HEAT_WAVE
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 6, PRESENT
	db 9, ENDURE ; tm move
	db 12, REVERSAL ; egg move
	db 15, STOMP
	db 19, DEFENSE_CURL
	db 23, ROLLOUT
	db 28, MILK_DRINK
	db 32, BODY_SLAM
	db 36, IRON_HEAD ; later gen move
	db 41, BIDE
	db 46, HEAL_BELL
	db 50, MEGA_KICK
	db 55, COUNTER ; *
	db 60, MILK_DRINK
	db 65, SEISMIC_TOSS ; egg move
	db 70,  DOUBLE_EDGE
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, PRESENT
	db 1, MIMIC
	db 1, HEADBUTT
	db 1, GROWL
	db 4, DOUBLESLAP
	db 8, TAIL_WHIP
	db 12, SWEET_KISS
	db 16, DOUBLE_EDGE ; * later gen move
	db 20, METRONOME
	db 24, CHARM
	db 28, MUD_SLAP ; gen 1 move
	db 32, MEGA_KICK
	db 37, PSYWAVE
	db 42, REFLECT ; * later gen move
	db 47, HYPER_BEAM ; gen 1 move
	db 52, BIDE
	db 57, HEAL_BELL
	db 62, TRI_ATTACK ; gen 1 move
	db 67, SOFTBOILED
	db 72, SEISMIC_TOSS
	db 77, COUNTER
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, THUNDERSHOCK
	db 5, SWIFT
	db 11, MUD_SLAP
	db 22, LIGHT_SCREEN
	db 33, SPARK
	db 44, BITE
	db 51, LEER
	db 56, HEADBUTT
	db 61, WILD_CHARGE
	db 66, IRON_TAIL
	db 71, REFLECT
	db 76, EXTREMESPEED
	db 81, THUNDERBOLT
	db 86, CRUNCH
	db 91, IRON_HEAD
	db 96, DOUBLE_EDGE
	db 100,THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, EMBER
	db 5, SWIFT
	db 11, MUD_SLAP
	db 22, STOMP
	db 33, FIRE_SPIN
	db 44, BITE
	db 51, LEER
	db 56, HEADBUTT
	db 61, HEAT_WAVE
	db 66, IRON_TAIL
	db 71, REFLECT
	db 76, EXTREMESPEED
	db 81, FLAMETHROWER
	db 86, WILLOWISP
	db 91, IRON_HEAD
	db 96, DOUBLE_EDGE
	db 100,SACRED_FIRE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, BUBBLE
	db 5, GUST
	db 11, MUD_SLAP
	db 22, BITE
	db 33, WATER_GUN
	db 44, SWIFT
	db 51, REFLECT
	db 56, AURORA_BEAM
	db 61, BUBBLEBEAM
	db 66, MIST
	db 71, LEER
	db 76, EXTREMESPEED
	db 81, IRON_HEAD
	db 86, HYDRO_PUMP
	db 91, MIRROR_COAT
	db 96, AIR_SLASH
	db 100,SHEER_COLD
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, SCRATCH ; illegal move
	db 1, LEER
	db 3, MUD_SLAP
	db 6, SANDSTORM
	db 9, PURSUIT ; egg move
	db 12, ROCK_THROW ; illegal move
	db 15, SCREECH
	db 18, STOMP
	db 21, BITE
	db 24, ROCK_POLISH
	db 27, DIG
	db 31, CRUNCH
	db 34, IRON_TAIL
	db 37, ROCK_SLIDE ; later gen move
	db 40, IRON_DEFENSE
	db 43, THRASH
	db 46, EARTHQUAKE
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE 
	db 1, ROCK_POLISH
	db 1, ROCK_THROW
	db 1, DIG ; later gen move
	db 33, HEADBUTT ; * later gen move
	db 38, IRON_DEFENSE ; later gen move
	db 43, ANCIENTPOWER ; * egg move
	db 48, IRON_HEAD
	db 52, OUTRAGE ; * egg move
	db 56, THRASH
	db 60, ROCK_SLIDE
	db 65, EARTHQUAKE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions 
	db 1, FOCUS_ENERGY
	db 1, SPITE
	db 1, SCARY_FACE
	db 1, DRAGONBREATH
	db 1, IRON_DEFENSE
	db 1, OUTRAGE
	db 1, IRON_HEAD
	db 1, ANCIENTPOWER
	db 58, METAL_SOUND
	db 62, DARK_PULSE
	db 66, HYPER_BEAM
	db 70, EARTHQUAKE
	db 75, ROCK_SLIDE
	db 80, MEGA_KICK ; * illegal move
	db 85, ROAR
	db 90, CRUNCH ; * later gen move
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, GUST
	db 5, SAFEGUARD
	db 10, CONFUSION
	db 20, MUD_SLAP
	db 30, LIGHT_SCREEN
	db 40, FUTURE_SIGHT
	db 50, ANCIENTPOWER
	db 60, REFLECT
	db 70, AIR_SLASH
	db 80, IRON_HEAD
	db 85, HYDRO_PUMP
	db 90, RECOVER
	db 95, PSYCHIC_M
	db 100, AEROBLAST
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, GUST
	db 5, SAFEGUARD
	db 10, EMBER
	db 20, MUD_SLAP
	db 30, LIGHT_SCREEN
	db 40, FUTURE_SIGHT
	db 50, ANCIENTPOWER
	db 60, WING_ATTACK
	db 70, HEAT_WAVE
	db 80, IRON_HEAD
	db 85, REFLECT
	db 90, RECOVER
	db 95, AIR_SLASH
	db 100, SACRED_FIRE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, ABSORB
	db 5, SAFEGUARD
	db 10, CONFUSION
	db 20, LEECH_SEED
	db 30, LIGHT_SCREEN
	db 40, FUTURE_SIGHT
	db 50, ANCIENTPOWER
	db 60, PERISH_SONG
	db 70, RECOVER
	db 75, REFLECT
	db 80, BATON_PASS
	db 85, NASTY_PLOT
	db 90, HEAL_BELL
	db 95, SEED_BOMB
	db 100, PSYCHIC_M
	db 0 ; no more level-up moves
