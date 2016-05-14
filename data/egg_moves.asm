INCLUDE "includes.asm"


SECTION "Egg Moves", ROMX, BANK[EGG_MOVES]

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.


INCLUDE "data/egg_move_pointers.asm"


EggMoves::

BulbasaurEggMoves:
	db CHARM
	db SAFEGUARD
	db AMNESIA
	db TAKE_DOWN
	db ROAR
	db MIMIC
	db $ff

CharmanderEggMoves:
	db RAGE
	db MUD_SLAP
	db COUNTER
	db DRAGONBREATH
	db REFLECT
	db MEGA_KICK
	db HEAT_WAVE
	db $ff

SquirtleEggMoves:
	db FORESIGHT
	db FLAIL
	db ROLLOUT
	db DEFENSE_CURL
	db ENDURE
	db DOUBLE_EDGE
	db MIMIC
	db MUD_SLAP
	db $ff

PidgeyEggMoves:
	db FORESIGHT
	db PECK
	db BIDE
	db $ff

RattataEggMoves:
	db TAKE_DOWN
	db DEFENSE_CURL
	db SWIFT
	db FOCUS_ENERGY
	db MIMIC
	db $ff

SpearowEggMoves:
	db SWIFT
	db MIMIC
	db BIDE
	db RAGE
	db $ff

EkansEggMoves:
	db RAGE
	db BIDE
	db MIMIC
	db $ff

SandshrewEggMoves:
	db DOUBLE_EDGE
	db SAFEGUARD
	db COUNTER
	db SAND_ATTACK
	db BIDE
	db MIMIC
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db FOCUS_ENERGY
	db TAKE_DOWN
	db COUNTER
	db DRILL_RUN
	db ROAR
	db BIDE
	db MIMIC
	db MUD_SLAP
	db HORN_DRILL
	db DEFENSE_CURL
	db SUBMISSION
	db DOUBLE_EDGE
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db COUNTER
	db ROAR
	db BIDE
	db MIMIC
	db MUD_SLAP
	db FISSURE
	db DEFENSE_CURL
	db DOUBLE_EDGE
	db $ff

VulpixEggMoves:
	db SWIFT
	db ENDURE
	db RAGE
	db FLAIL
	db SPITE
	db $ff

ZubatEggMoves:
	db PURSUIT
	db FLAIL
	db ENDURE
	db SCREECH
	db DOUBLE_EDGE
	db RAGE
	db MIMIC
	db BIDE
	db $ff

OddishEggMoves:
	db MIMIC
	db SEED_BOMB
	db DOUBLE_EDGE
	db BIDE
	db $ff

ParasEggMoves:
	db SCREECH
	db COUNTER
	db FLAIL
	db ENDURE
	db $ff

VenonatEggMoves:
	db MIMIC
	db SWIFT
	db DOUBLE_EDGE
	db BIDE
	db $ff

DiglettEggMoves:
	db BIDE
	db RAGE
	db MIMIC
	db $ff

MeowthEggMoves:
	db DREAM_EATER
	db NIGHTMARE
	db DEFENSE_CURL
	db MIMIC
	db BIDE
	db RAGE
	db $ff

PsyduckEggMoves:
	db FORESIGHT
	db SWIFT
	db CHARM
	db COUNTER
	db SCREECH
	db MIMIC
	db BIDE
	db RAGE
	db MUD_SLAP
	db $ff

MankeyEggMoves:
	db COUNTER
	db SPITE
	db DOUBLE_EDGE
	db MUD_SLAP
	db MIMIC
	db $ff

GrowlitheEggMoves:
	db THRASH
	db IRON_TAIL
	db SAFEGUARD
	db MUD_SLAP
	db DOUBLE_EDGE
	db CHARM
	db REVERSAL
	db ENDURE
	db BIDE
	db MIMIC
	db RAGE
	db REFLECT
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db ENDURE
	db COUNTER
	db DEFENSE_CURL
	db MUD_SLAP
	db $ff

AbraEggMoves:
	db ENDURE
	db FORESIGHT
	db DREAM_EATER
	db HEADBUTT
	db NIGHTMARE
	db BIDE
	db MIMIC
	db MEGA_KICK
	db DOUBLE_EDGE
	db RAGE
	db IRON_TAIL
	db $ff

MachopEggMoves:
	db RAGE
	db MIMIC
	db $ff

BellsproutEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db SYNTHESIS
	db $ff

TentacoolEggMoves:
	db WATER_GUN
	db ACID
	db DOUBLE_EDGE
	db MIMIC
	db RAGE
	db $ff

GeodudeEggMoves:
	db COUNTER
	db FLAIL
	db ENDURE
	db MIMIC
	db RAGE
	db ANCIENTPOWER
	db METRONOME
	db $ff

PonytaEggMoves:
	db HORN_DRILL
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db RAGE
	db $ff

SlowpokeEggMoves:
	db BELLY_DRUM
	db MEGA_KICK
	db SWIFT
	db DREAM_EATER
	db MUD_SLAP
	db LIGHT_SCREEN
	db NIGHTMARE
	db BIDE
	db MIMIC
	db DOUBLE_EDGE
	db FISSURE
	db RAGE
	db REFLECT
	db PSYWAVE
	db COUNTER
	db DISABLE
	db $ff

FarfetchDEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db FLAIL
	db REFLECT
	db FORESIGHT
	db ENDURE
	db MIMIC
	db BIDE
	db MUD_SLAP
	db $ff

DoduoEggMoves:
	db SWIFT
	db BIDE
	db MIMIC
	db $ff

SeelEggMoves:
	db MIMIC
	db DOUBLE_EDGE
	db BIDE
	db $ff

GrimerEggMoves:
	db MIMIC
	db RAGE
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db RAPID_SPIN
	db SCREECH
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db RAGE
	db REFLECT
	db $ff

GastlyEggMoves:
	db COUNTER
	db BIDE
	db HEADBUTT
	db DOUBLE_EDGE
	db MIMIC
	db $ff

OnixEggMoves:
	db FLAIL
	db EXPLOSION
	db ROAR
	db FISSURE
	db IRON_TAIL
	db TWISTER
	db DOUBLE_EDGE
	db MUD_SLAP
	db MIMIC
	db RAGE
	db ENDURE
	db $ff

DrowzeeEggMoves:
	db COUNTER
	db DOUBLE_EDGE
	db BIDE
	db MEGA_KICK
	db MIMIC
	db RAGE
	db SUBMISSION
	db $ff

KrabbyEggMoves:
	db ANCIENTPOWER
	db MIMIC
	db $ff

ExeggcuteEggMoves:
	db EXPLOSION
	db NIGHTMARE
	db ROLLOUT
	db LIGHT_SCREEN
	db RAGE
	db ANCIENTPOWER
	db DOUBLE_EDGE
	db HEADBUTT
	db SYNTHESIS
	db BIDE
	db $ff

CuboneEggMoves:
	db ANCIENTPOWER
	db SING
	db RAGE
	db BIDE
	db MIMIC
	db MEGA_KICK
	db $ff

LickitungEggMoves:
	db IRON_TAIL
	db MEGA_KICK
	db AMNESIA
	db COUNTER
	db DISABLE
	db DOUBLE_EDGE
	db DREAM_EATER
	db HEADBUTT
	db HEAL_BELL
	db MIMIC
	db BIDE
	db RAGE
	db EXPLOSION
	db FISSURE
	db $ff

KoffingEggMoves:
	db BIDE
	db MIMIC
	db RAGE
	db $ff

RhyhornEggMoves:
	db THRASH
	db COUNTER
	db SPITE
	db TAKE_DOWN
	db ANCIENTPOWER
	db DOUBLE_EDGE
	db MEGA_KICK
	db MIMIC
	db SUBMISSION
	db $ff

ChanseyEggMoves:
	db PRESENT
	db DREAM_EATER
	db IRON_TAIL
	db MUD_SLAP
	db MIMIC
	db RAGE
	db SUBMISSION
	db BUBBLEBEAM
	db $ff

TangelaEggMoves:
	db REFLECT
	db RAZOR_LEAF
	db SLAM
	db BIDE
	db DOUBLE_EDGE
	db MIMIC
	db RAGE
	db FLAIL
	db DOUBLE_KICK
	db HEADBUTT
	db MORNING_SUN
	db MUD_SLAP
	db POISON_JAB
	db $ff

KangaskhanEggMoves:
	db SAFEGUARD
	db DISABLE
	db MEGA_KICK
	db MUD_SLAP
	db ROAR
	db ENDURE
	db SING
	db FORESIGHT
	db BUBBLEBEAM
	db SPITE
	db $ff

HorseaEggMoves:
	db SPLASH
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db $ff

GoldeenEggMoves:
	db FLAIL
	db BIDE
	db MIMIC
	db RAGE
	db DOUBLE_EDGE
	db $ff

MrMimeEggMoves:
	db FUTURE_SIGHT
	db MIND_READER
	db METRONOME
	db BIDE
	db COUNTER
	db MEGA_KICK
	db HEADBUTT
	db RAGE
	db SUBMISSION
	db DREAM_EATER
	db NIGHTMARE
	db METRONOME
	db MUD_SLAP
	db CHARM
	db IRON_DEFENSE
	db $ff

ScytherEggMoves:
	db SAFEGUARD
	db LIGHT_SCREEN
	db HEADBUTT
	db DOUBLE_EDGE
	db IRON_HEAD
	db HEADBUTT
	db MIMIC
	db MORNING_SUN
	db SAFEGUARD
	db BIDE
	db RAGE
	db $ff

PinsirEggMoves:
	db FALSE_SWIPE
	db QUICK_ATTACK
	db FLAIL
	db ENDURE
	db DOUBLE_EDGE
	db HEADBUTT
	db MIMIC
	db BIDE
	db RAGE
	db $ff

LaprasEggMoves:
	db SING
	db FORESIGHT
	db DREAM_EATER
	db HEAL_BELL
	db DOUBLE_EDGE
	db HEADBUTT
	db IRON_TAIL
	db MIMIC
	db MIST
	db NIGHTMARE
	db OUTRAGE
	db ROAR
	db BIDE
	db DRAGON_RAGE
	db PSYWAVE
	db REFLECT
	db FISSURE
	db $ff

EeveeEggMoves:
	db HEAL_BELL
	db QUICK_ATTACK
	db SING
	db MUD_SLAP
	db HEADBUTT
	db BIDE
	db MIMIC
	db RAGE
	db REFLECT
	db $ff

OmanyteEggMoves:
	db SLAM
	db DOUBLE_EDGE
	db HEADBUTT
	db MIMIC
	db MUD_SLAP
	db SUBMISSION
	db RAGE
	db BIDE
	db $ff

KabutoEggMoves:
	db ENDURE
	db FLAIL
	db MUD_SLAP
	db BIDE
	db MIMIC
	db RAGE
	db MUD_SLAP
	db $ff

AerodactylEggMoves:
	db TAKE_DOWN
	db PURSUIT
	db FORESIGHT
	db ROAR
	db ROCK_POLISH
	db DOUBLE_EDGE
	db DRAGONBREATH
	db HEADBUTT
	db IRON_TAIL
	db MIMIC
	db BIDE
	db DRAGON_RAGE
	db RAGE
	db REFLECT
	db $ff

SnorlaxEggMoves:
	db SELFDESTRUCT
	db OUTRAGE
	db DOUBLE_EDGE
	db HARDEN
	db BIDE
	db PAY_DAY
	db PSYWAVE
	db REFLECT
	db SUBMISSION
	db FISSURE
	db MUD_SLAP
	db COUNTER
	db MEGA_KICK
	db MIMIC
	db BUBBLEBEAM
	db $ff

DratiniEggMoves:
	db MIST
	db DOUBLE_EDGE
	db EXTREMESPEED
	db MIMIC
	db MUD_SLAP
	db ROAR
	db BIDE
	db RAGE
	db BUBBLEBEAM
	db BARRIER
	db $ff

ChikoritaEggMoves:
	db VINE_WHIP
	db MUD_SLAP
	db DOUBLE_EDGE
	db $ff

CyndaquilEggMoves:
	db FORESIGHT
	db MEGA_KICK
	db COUNTER
	db MIMIC
	db MUD_SLAP
	db $ff

TotodileEggMoves:
	db DOUBLE_EDGE
	db ENDURE
	db FLAIL
	db MEGA_KICK
	db MUD_SLAP
	db SPITE
	db $ff

SentretEggMoves:
	db FOCUS_ENERGY
	db $ff

HoothootEggMoves:
	db NIGHTMARE
	db AGILITY
	db MUD_SLAP
	db $ff

LedybaEggMoves:
	db MIMIC
	db SWIFT
	db MUD_SLAP
	db $ff

SpinarakEggMoves:
	db SONICBOOM
	db DOUBLE_EDGE
	db MIMIC
	db $ff

ChinchouEggMoves:
	db ENDURE
	db DOUBLE_EDGE
	db $ff

PichuEggMoves:
	db SCARY_FACE
	db BIDE
	db PRESENT
	db DOUBLESLAP
	db ROLLOUT
	db FLAIL
	db REVERSAL
	db ENDURE
	db AGILITY
	db DEFENSE_CURL
	db HEADBUTT
	db RAGE
	db MIMIC
	db REFLECT
	db SUBMISSION
	db MEGA_KICK
	db MUD_SLAP
	db DOUBLE_EDGE
	db $ff

CleffaEggMoves:
	db PRESENT
	db SPLASH
	db MIMIC
	db IRON_TAIL
	db COUNTER
	db REFLECT
	db ROLLOUT
	db SCARY_FACE
	db BIDE
	db SUBMISSION
	db MEGA_KICK
	db MUD_SLAP
	db DEFENSE_CURL
	db SAFEGUARD
	db AMNESIA
	db DREAM_EATER
	db NIGHTMARE
	db PSYWAVE
	db $ff

IgglybuffEggMoves:
	db PRESENT
	db NIGHTMARE
	db SUBMISSION
	db MIMIC
	db PSYWAVE
	db DISABLE
	db BIDE
	db BUBBLEBEAM
	db HEADBUTT
	db SCARY_FACE
	db DREAM_EATER
	db MUD_SLAP
	db SAFEGUARD
	db $ff

TogepiEggMoves:
	db PRESENT
	db FORESIGHT
	db COUNTER
	db HEAL_BELL
	db ROLLOUT
	db BATON_PASS
	db DREAM_EATER
	db EXTREMESPEED
	db HEADBUTT
	db MEGA_KICK
	db LIGHT_SCREEN
	db MIMIC
	db MUD_SLAP
	db REFLECT
	db TRI_ATTACK
	db DEFENSE_CURL
	db $ff

NatuEggMoves:
	db DREAM_EATER
	db NIGHTMARE
	db BATON_PASS
	db DOUBLE_EDGE
	db $ff

MareepEggMoves:
	db DEFENSE_CURL
	db COUNTER
	db DOUBLE_EDGE
	db MEGA_KICK
	db MIMIC
	db SAND_ATTACK
	db SWIFT
	db $ff

MarillEggMoves:
	db PRESENT
	db AMNESIA
	db SUPERSONIC
	db FORESIGHT
	db MEGA_KICK
	db MIMIC
	db MUD_SLAP
	db $ff

SudowoodoEggMoves:
	db HEADBUTT
	db DOUBLE_EDGE
	db MUD_SLAP
	db $ff

HoppipEggMoves:
	db CONFUSION
	db SPLASH
	db MIMIC
	db $ff

AipomEggMoves:
	db COUNTER
	db DEFENSE_CURL
	db DREAM_EATER
	db MUD_SLAP
	db NIGHTMARE
	db MEGA_KICK
	db $ff

SunkernEggMoves:
	db ENCORE
	db MORNING_SUN
	db $ff

YanmaEggMoves:
	db WHIRLWIND
	db DOUBLE_EDGE
	db FAINT_ATTACK
	db HEADBUTT
	db DREAM_EATER
	db MIMIC
	db MUD_SLAP
	db $ff

WooperEggMoves:
	db COUNTER
	db MIST
	db DOUBLE_EDGE
	db HEADBUTT
	db MIMIC
	db $ff

MurkrowEggMoves:
	db WHIRLWIND
	db MIRROR_MOVE
	db SCREECH
	db SPITE
	db DREAM_EATER
	db NIGHTMARE
	db SWIFT
	db DOUBLE_EDGE
	db $ff

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db DREAM_EATER
	db DEFENSE_CURL
	db DREAM_EATER
	db SWIFT
	db DOUBLE_EDGE
	db HEAL_BELL
	db MIMIC
	db $ff

GirafarigEggMoves:
	db MEAN_LOOK
	db FORESIGHT
	db FUTURE_SIGHT
	db TAKE_DOWN
	db SWIFT
	db DOUBLE_EDGE
	db MUD_SLAP
	db DREAM_EATER
	db HEADBUTT
	db LIGHT_SCREEN
	db MIMIC
	db MIRROR_COAT
	db NIGHTMARE
	db REFLECT
	db $ff

PinecoEggMoves:
	db FLAIL
	db SWIFT
	db ENDURE
	db MIMIC
	db $ff

DunsparceEggMoves:
	db IRON_TAIL
	db PURSUIT
	db COUNTER
	db DREAM_EATER
	db MIMIC
	db MUD_SLAP
	db NIGHTMARE
	db PAIN_SPLIT
	db $ff

GligarEggMoves:
	db COUNTER
	db BATON_PASS
	db AGILITY
	db IRON_TAIL
	db DOUBLE_EDGE
	db QUICK_ATTACK
	db DREAM_EATER
	db HEADBUTT
	db MIMIC
	db $ff

SnubbullEggMoves:
	db PRESENT
	db DOUBLE_EDGE
	db MIMIC
	db MUD_SLAP
	db $ff

QwilfishEggMoves:
	db FLAIL
	db ENDURE
	db SUPERSONIC
	db ROLLOUT
	db DEFENSE_CURL
	db HEADBUTT
	db MIMIC
	db MUD_SLAP
	db $ff

ShuckleEggMoves:
	db MUD_SLAP
	db ACID
	db ENDURE
	db HEADBUTT
	db MIMIC
	db SAFEGUARD
	db HEADBUTT
	db $ff

HeracrossEggMoves:
	db FLAIL
	db HEADBUTT
	db MIMIC
	db DOUBLE_EDGE
	db $ff

SneaselEggMoves:
	db COUNTER
	db FORESIGHT
	db REFLECT
	db IRON_TAIL
	db HEADBUTT
	db MUD_SLAP
	db SPITE
	db SWIFT
	db DEFENSE_CURL
	db DOUBLE_EDGE
	db DREAM_EATER
	db NASTY_PLOT
	db NIGHTMARE
	db $ff

TeddiursaEggMoves:
	db MIMIC
	db MUD_SLAP
	db SWIFT
	db $ff

SlugmaEggMoves:
	db MIMIC
	db $ff

SwinubEggMoves:
	db MIMIC
	db $ff

CorsolaEggMoves:
	db ROCK_POLISH
	db MIST
	db AMNESIA
	db IRON_DEFENSE
	db DOUBLE_EDGE
	db HEADBUTT
	db MIMIC
	db MUD_SLAP
	db REFLECT
	db LIGHT_SCREEN
	db $ff

RemoraidEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db $ff

DelibirdEggMoves:
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db ROLLOUT
	db COUNTER
	db DOUBLE_EDGE
	db MEGA_KICK
	db SPIKES
	db HEADBUTT
	db MIMIC
	db MUD_SLAP
	db SWIFT
	db $ff

MantineEggMoves:
	db SEED_BOMB
	db HAZE
	db SLAM
	db HEADBUTT
	db MUD_SLAP
	db SWIFT
	db MIMIC
	db $ff

SkarmoryEggMoves:
	db MIMIC
	db DOUBLE_EDGE
	db ROAR
	db SWIFT
	db TWISTER
	db $ff

HoundourEggMoves:
	db CHARM
	db DOUBLE_EDGE
	db MUD_SLAP
	db DREAM_EATER
	db NIGHTMARE
	db MIMIC
	db $ff

PhanpyEggMoves:
	db FOCUS_ENERGY
	db COUNTER
	db MIMIC
	db $ff

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db SWIFT
	db DOUBLE_EDGE
	db DREAM_EATER
	db MUD_SLAP
	db ROAR
	db MIMIC
	db $ff

TyrogueEggMoves:
	db MUD_SLAP
	db METRONOME
	db POISON_JAB
	db DOUBLE_EDGE
	db BIDE
	db MIMIC
	db RAGE
	db $ff

SmoochumEggMoves:
	db THRASH
	db COUNTER
	db DOUBLE_EDGE
	db HEADBUTT
	db MEGA_KICK
	db MIMIC
	db MUD_SLAP
	db BIDE
	db RAGE
	db SUBMISSION
	db DOUBLESLAP
	db DIZZY_PUNCH
	db $ff

ElekidEggMoves:
	db MIMIC
	db BIDE
	db PSYWAVE
	db DOUBLE_EDGE
	db MUD_SLAP
	db SWIFT
	db $ff

MagbyEggMoves:
	db MUD_SLAP
	db SWIFT
	db BIDE
	db COUNTER
	db DOUBLE_EDGE
	db MEGA_KICK
	db MIMIC
	db METRONOME
	db RAGE
	db $ff

MiltankEggMoves:
	db IRON_TAIL
	db HEADBUTT
	db MUD_SLAP
	db DIZZY_PUNCH
	db METRONOME
	db PRESENT
	db $ff

LarvitarEggMoves:
	db COUNTER
	db DOUBLE_EDGE
	db NIGHTMARE
	db $ff

NoEggMoves:
	db $ff
