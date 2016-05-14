Marts: ; 160a9
	dw Mart0          ; 00
	dw Mart1          ; 01
	dw Mart2          ; 02
	dw Mart3          ; 03
	dw Mart4          ; 04
	dw Mart5          ; 05
	dw Mart6          ; 06
	dw Mart7          ; 07
	dw Mart8          ; 08
	dw Mart9          ; 09
	dw Mart10         ; 0a
	dw Mart11         ; 0b
	dw Mart12         ; 0c
	dw Mart13         ; 0d
	dw Mart14         ; 0e
	dw Mart15         ; 0f
	dw Mart16         ; 10
	dw Mart17         ; 11
	dw Mart18         ; 12
	dw Mart19         ; 13
	dw Mart20         ; 14
	dw Mart21         ; 15
	dw Mart22         ; 16
	dw Mart23         ; 17
	dw Mart24         ; 18
	dw Mart25         ; 19
	dw Mart26         ; 1a
	dw Mart27         ; 1b
	dw Mart28         ; 1c
	dw Mart29         ; 1d
	dw Mart30         ; 1e
	dw Mart31         ; 1f
	dw Mart32         ; 20
	dw Mart33         ; 21
	dw TmDepot1       ; 22
	dw TmDepot2       ; 23
	dw TmDepot3       ; 24
	dw TmDepot4       ; 25
	dw TmDepot5       ; 26
	dw TmDepot6       ; 27
	dw ViridianMartRB ; 28
	dw PewterMartRB       ; 29
	dw CeruleanMartRB     ; 2a
	dw CeruleanBikeShopRB ; 2b
	dw VermilionMartRB    ; 2c
MartsEnd
; 160ed


Mart0: ; 160ed
	db 10 ; # items
	db POISON_GUARD
	db PARLYZ_GUARD
	db SLEEP_GUARD
	db CONFUSEGUARD
	db BURN_GUARD
	db FREEZE_GUARD
	db LUCKY_PUNCH
	db METAL_POWDER
	db THICK_CLUB
	db STICK
	db $ff
; 160f3

Mart1: ; 160f3
	db 8 ; # items
	db POKE_BALL
	db SUPER_POTION
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db REPEL
	db $ff
; 160fa

Mart2: ; 160fa
	db 10 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db FLOWER_MAIL
	db $ff
; 16106

Mart3: ; 16106
	db 9 ; # items
	db CHARCOAL
	db GREAT_BALL
	db POKE_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db FLOWER_MAIL
	db $ff
; 16111

Mart4: ; 16111
	db 5 ; # items
	db HYPER_POTION
	db SUPER_POTION
	db POTION
	db FULL_HEAL
	db REVIVE
	db $ff
; 16118

Mart5: ; 16118
	db 9 ; # items
	db HYPER_POTION
	db SUPER_POTION
	db POTION
	db FULL_HEAL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db $ff
; 16121

Mart6: ; 16121
	db 10 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db POKE_BALL
	db ESCAPE_ROPE
	db MAX_REPEL
	db SUPER_REPEL
	db REPEL
	db REVIVE
	db POKE_DOLL
	db FLOWER_MAIL
	db $ff
; 1612b

Mart7: ; 1612b
	db 8 ; # items goldenrod
	db X_ATTACK
	db X_SPEED
	db X_SPECIAL
	db X_SPDEF
	db X_DEFEND
	db DIRE_HIT
	db GUARD_SPEC
	db X_ACCURACY
	db $ff
; 16134

Mart8: ; 16134
	db 10 ; # items
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db DRAGON_SCALE
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db $ff
; 1613b

Mart9: ; 1613b
	db 4 ; # items
	db TM_SUNNY_DAY
	db TM_THUNDER_WAVE
	db TM_STRING_SHOT
	db TM_SEISMIC_TOSS
	db $ff
; 16140

Mart10: ; 16140
	db 10 ; # items
	db METAL_COAT
	db KINGS_ROCK
	db TWISTEDSPOON
	db SILVERPOWDER
	db POLKADOT_BOW
	db SCOPE_LENS
	db SOFT_SAND
	db POISON_BARB
	db MIRACLE_SEED
	db QUICK_CLAW
	db $ff
; 16146

Mart11: ; 16146 ;unused
	db 1 ; # items
	db POISON_BARB
	db $ff
; 1614c

Mart12: ; 1614c ;unused
	db 1 ; # items
	db POISON_BARB
	db $ff
; 16153

Mart13: ; 16153
	db 9 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db MAX_REPEL
	db SURF_MAIL
	db $ff
; 1615e

Mart14: ; 1615e
	db 10 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db HYPER_POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db REVIVE
	db $ff
; 1616a

Mart15: ; 1616a
	db 4 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db $ff
; 16170

Mart16: ; 16170
	db 9 ; # items
	db RAGECANDYBAR
	db ULTRA_BALL
	db GREAT_BALL
	db HYPER_POTION
	db FULL_HEAL
	db ESCAPE_ROPE
	db SUPER_REPEL
	db REVIVE
	db FLOWER_MAIL
	db $ff
; 1617b

Mart17: ; 1617b
	db 9 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db MAX_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db $ff
; 16186

Mart18: ; 16186
	db 9 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db FLOWER_MAIL
	db $ff
; 16191

Mart19: ; 16191
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db $ff
; 1619a

Mart20: ; 1619a
	db 9 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db SURF_MAIL
	db $ff
; 161a5

Mart21: ; 161a5
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db $ff
; 161af

Mart22: ; 161af
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db SUPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db LITEBLUEMAIL
	db $ff
; 161b9

Mart23: ; 161b9
	db 7 ; # items
	db MAX_POTION
	db HYPER_POTION
	db SUPER_POTION
	db POTION
	db REVIVE
	db MAX_REPEL
	db SUPER_REPEL
	db $ff
; 161c2

Mart24: ; 161c2
	db 10 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db POKE_BALL
	db ESCAPE_ROPE
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db $ff
; 161ce

Mart25: ; 161ce
	db 10 ; # items
	db FOCUS_BAND
	db BRIGHTPOWDER
	db HARD_STONE
	db NEVERMELTICE
	db SHARP_BEAK
	db DRAGON_FANG
	db EXP_SHARE
	db MIRACLEBERRY
	db MYSTERYBERRY
	db GOLD_BERRY
	db POWER_HERB
	db $ff
; 161d5

Mart26: ; 161d5
	db 10 ; # items
	db LOVELY_MAIL
	db SURF_MAIL
	db POKE_DOLL
	db BLACKGLASSES
	db PINK_BOW
	db BLACKBELT
	db SPELL_TAG
	db MAGNET
	db LIGHT_BALL
	db AMULET_COIN
	db $ff
; 161da

Mart27: ; 161da
	db 10 ; # items
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db MOON_STONE
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db $ff
; 161e1

Mart28: ; 161e1
	db 8 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db X_SPDEF
	db $ff
; 161ea

Mart29: ; 161ea
	db 8 ; # items
	db FRIEND_CHARM
	db ULTRA_BALL
	db GREAT_BALL
	db HYPER_POTION
	db SUPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db FLOWER_MAIL
	db $ff
; 161f3

Mart30: ; 161f3
	db 8 ; # items
	db ULTRA_BALL
	db GREAT_BALL
	db MAX_POTION
	db HYPER_POTION
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db FLOWER_MAIL
	db $ff
; 161fd

Mart31: ; 161fd
	db 6 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db PORTRAITMAIL
	db $ff
; 16205

Mart32: ; 16205
	db 11 ; # items
	db FULL_RESTORE
	db MAX_POTION
	db HYPER_POTION
	db ULTRA_BALL
	db REVIVE
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db X_SPDEF
	db $ff
; 1620e

Mart33: ; 1620e
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db $ff
; 16214

TmDepot1:
	db 9
	db TM_DYNAMICPUNCH
	db TM_ZEN_HEADBUTT
	db TM_CURSE
	db TM_BODY_SLAM
	db TM_DAZZLINGLEAM
	db TM_TOXIC
	db TM_ZAP_CANNON
	db TM_ROCK_SMASH
	db TM_FOCUS_BLAST
	db $ff

TmDepot2:
	db 9
	db TM_HIDDEN_POWER
	db TM_SUNNY_DAY
	db TM_EARTH_POWER
	db TM_WILLOWISP
	db TM_BLIZZARD
	db TM_HYPER_BEAM
	db TM_ICY_WIND
	db TM_PROTECT
	db TM_RAIN_DANCE
	db $ff

TmDepot3:
	db 8
	db TM_GIGA_DRAIN
	db TM_FLARE_BLITZ
	db TM_WILD_CHARGE
	db TM_SOLARBEAM
	db TM_FLASH_CANNON
	db TM_DRAGON_PULSE
	db TM_THUNDER
	db TM_EARTHQUAKE
	db $ff

TmDepot4:
	db 8
	db TM_RETURN
	db TM_DIG
	db TM_PSYCHIC
	db TM_SHADOW_BALL
	db TM_SKY_ATTACK
	db TM_DOUBLE_TEAM
	db TM_SHADOW_CLAW
	db TM_SWAGGER
	db $ff

TmDepot5:
	db 8
	db TM_SLEEP_TALK
	db TM_SLUDGE_BOMB
	db TM_SANDSTORM
	db TM_FIRE_BLAST
	db TM_GUNK_SHOT
	db TM_SEISMIC_TOSS
	db TM_SWORDS_DANCE
	db TM_STRING_SHOT
	db $ff

TmDepot6:
	db 8
	db TM_DARK_PULSE
	db TM_REST
	db TM_ATTRACT
	db TM_THIEF
	db TM_THUNDER_WAVE
	db TM_ROCK_SLIDE
	db TM_FURY_CUTTER
	db TM_SUBSTITUTE
	db $ff

DefaultMart: ; 16214
	db 2 ; # items
	db POKE_BALL
	db POTION
	db $ff
; 16218

ViridianMartRB:
	db 5
	db POKE_BALL
	db ANTIDOTE
	db PARLYZ_HEAL
	db BURN_HEAL
	db REPEL
	db $ff

PewterMartRB:
	db 9
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db BURN_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db REPEL
	db X_SPEED
	db $ff

CeruleanMartRB: ; 2453 (0:2453)
	db 7
	db POKE_BALL
	db POTION
	db REPEL
	db ANTIDOTE
	db BURN_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db $ff

; Bike shop
CeruleanBikeShopRB:
	db 1
	db BICYCLE
	db $ff

; Vermilion
VermilionMartRB: ; 2461 (0:2461)
	db 6
	db POKE_BALL
	db SUPER_POTION
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db REPEL
	db $ff

