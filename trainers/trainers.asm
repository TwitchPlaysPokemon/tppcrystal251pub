Trainers:

; All trainers follow a basic structure:
	; Name
		; String in format "Text@"
	; Type
		; Bit 0: moves
		; Bit 1: item
		; Bit 2: nickname
	; Party
		; Up to six monsters following the data type
	; $ff

;List is sorted by trainer class
;fist string is the name, ending in an @ symbol
; then it's how many features the trainer uses, 0 means none, (1 << TRAINERTYPE_MOVES) = custom sets, (1 << TRAINERTYPE_ITEM) = hold items and (1 << TRAINERTYPE_NICKNAME) = nickname
; multiple can be used by sepperating them by | , but those you use must be fully specified on the whole trainer
; specifying moves requires specifying all 4 as the game assumes the trainer is so long based on that. items and nicknames are inserted after the species name behind commas with nicknames in quotes ("Aiiiiiirrr@")
; Mon syntax: level, specicies, item/nickname, 4 moves. remove features that you have not turned on. up to 6 mons can be entered
; then, lastly an $ff to show that the trainer is complete

; what trainer is where is not recorded here, the game instead records where they are on here in the map files. The easiest way to find which trainer is pointed to from where is to use bulba as refernce


FalknerGroup:
; ================================
; ================

	; FALKNER (1)
	db "FALKNER@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 22, SPEAROW, SHARP_BEAK
		db PECK
		db MUD_SLAP
		db LEER
		db SONICBOOM

	db 25, PIDGEOTTO , CONFUSEGUARD
		db SKY_ATTACK
		db TAKE_DOWN
		db MUD_SLAP
		db SAND_ATTACK

	db 27, GLIGAR, BURN_GUARD
		db EARTH_POWER
		db HARDEN
		db WING_ATTACK
		db METAL_CLAW

	db $ff ; end

	; FALKNER (2)
	db "FALKNER@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, DELIBIRD, LEFTOVERS
		db SPIKES
		db BLIZZARD
		db FLY
		db DESTINY_BOND

	db 100, MOLTRES, SHARP_BEAK
		db AIR_SLASH
		db FLAMETHROWER
		db ROAR
		db SUNNY_DAY

	db 100, ZAPDOS, MIRACLEBERRY
		db THUNDERBOLT
		db DRILL_PECK
		db ROAR
		db REST

	db 100, CROBAT, POISON_BARB
		db GUNK_SHOT
		db SKY_ATTACK
		db CONFUSE_RAY
		db HYPNOSIS

	db 100, GLIGAR, GOLD_BERRY
		db EARTHQUAKE
		db POISON_JAB
		db SWORDS_DANCE
		db ROCK_POLISH

	db 100, PIDGEOT, LEFTOVERS
		db DOUBLE_EDGE
		db SUBMISSION
		db WHIRLWIND
		db DOUBLE_TEAM

	db $ff

; ================
; ================================


WhitneyGroup:
; ================================
; ================

	; WHITNEY (1)
	db "WHITNEY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 33, JIGGLYPUFF, GOLD_BERRY
		db ROLLOUT
		db DEFENSE_CURL
		db SING
		db DAZZLINGLEAM

	db 34, SNUBBULL, PINK_BOW
		db BITE
		db PLAY_ROUGH
		db CHARM
		db THUNDER_WAVE

	db 35, CLEFAIRY, GOLD_BERRY
		db SOFTBOILED
		db MINIMIZE
		db MOONBLAST
		db METRONOME

	db 38, MILTANK, HARD_STONE
		db ROLLOUT
		db ATTRACT
		db BODY_SLAM
		db MILK_DRINK

	db $ff ; end

	; WHITNEY (2)
	db "WHITNEY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, MILTANK, HARD_STONE
		db BODY_SLAM
		db ROLLOUT
		db MILK_DRINK
		db HEAL_BELL

	db 100, AZUMARILL, MIRACLEBERRY
		db PLAY_ROUGH
		db AQUA_JET
		db BELLY_DRUM
		db ENCORE

	db 100, BLISSEY, MYSTERYBERRY
		db SEISMIC_TOSS
		db SOFTBOILED
		db TOXIC
		db LIGHT_SCREEN

	db 100, CLEFABLE, PINK_BOW
		db PLAY_ROUGH
		db THUNDERPUNCH
		db BELLY_DRUM
		db MOONLIGHT

	db 100, SNORLAX, POLKADOT_BOW
		db BODY_SLAM
		db METRONOME
		db REST
		db CURSE

	db 100, URSARING, LEFTOVERS
		db DOUBLE_EDGE
		db EARTHQUAKE
		db ATTRACT
		db BELLY_DRUM


	db $ff


; ================
; ================================


BugsyGroup:
; ================================
; ================

	; BUGSY (1)
	db "BUGSY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 28, BEEDRILL, SILVERPOWDER
		db TWINEEDLE
		db FURY_ATTACK
		db ROCK_SMASH
		db SPIKES

	db 28, BUTTERFREE, TWISTEDSPOON
		db PSYBEAM
		db GIGA_DRAIN
		db GUST
		db STUN_SPORE

	db 32, SCYTHER, GOLD_BERRY
		db QUICK_ATTACK
		db SLASH
		db FURY_CUTTER
		db DOUBLE_TEAM

	db $ff ; end

	; BUGSY (2)
	db "BUGSY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, BUTTERFREE, LEFTOVERS
		db BUG_BUZZ
		db AIR_SLASH
		db SLEEP_POWDER
		db WHIRLWIND

	db 100, BEEDRILL, SILVERPOWDER
		db X_SCISSOR
		db POISON_JAB
		db SWORDS_DANCE
		db BATON_PASS

	db 100, ARIADOS, GOLD_BERRY
		db MEGAHORN
		db CURSE
		db MEAN_LOOK
		db BATON_PASS

	db 100, VENOMOTH, BRIGHTPOWDER
		db BUG_BUZZ
		db SLUDGE_BOMB
		db SLEEP_POWDER
		db DOUBLE_TEAM

	db 100, PARASECT, SILVERPOWDER
		db FURY_CUTTER
		db SEED_BOMB
		db SPORE
		db AGILITY

	db 100, SCYTHER, SHARP_BEAK
		db X_SCISSOR
		db WING_ATTACK
		db SWORDS_DANCE
		db SWAGGER

	db $ff

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY (1)
	db "MORTY@"
	db (1 << TRAINERTYPE_MOVES)  | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 35, GASTLY, BRIGHTPOWDER
		db NIGHT_SHADE
		db PERISH_SONG
		db MEAN_LOOK
		db CURSE

	db 37, HAUNTER, BLACKGLASSES
		db HYPNOSIS
		db DARK_PULSE
		db DESTINY_BOND
		db SHADOW_CLAW

	db 39, MISDREAVUS, GOLD_BERRY
		db HYPNOSIS
		db MEAN_LOOK
		db NIGHTMARE
		db NIGHT_SHADE

	db 42, GENGAR, SPELL_TAG
		db HYPNOSIS
		db SHADOW_CLAW
		db MEAN_LOOK
		db DREAM_EATER

	db $ff ; end

	; MORTY (2)
	db "MORTY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, MURKROW, BLACKGLASSES
		db DARK_PULSE
		db DRILL_PECK
		db NASTY_PLOT
		db MEAN_LOOK

	db 100, SNEASEL, NEVERMELTICE
		db CRUNCH
		db ICE_PUNCH
		db MOONLIGHT
		db SWORDS_DANCE

	db 100, HOUNDOOM, CHARCOAL
		db CRUNCH
		db FIRE_BLAST
		db ROAR
		db DESTINY_BOND

	db 100, GENGAR, GOLD_BERRY
		db SHADOW_BALL
		db HYPNOSIS
		db MEAN_LOOK
		db CURSE

	db 100, UMBREON, MIRACLEBERRY
		db DARK_PULSE
		db MEAN_LOOK
		db BATON_PASS
		db MOONLIGHT

	db 100, MISDREAVUS, LEFTOVERS
		db SHADOW_BALL
		db HYPNOSIS
		db MEAN_LOOK
		db PERISH_SONG

	db $ff

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE (1)
	db "PRYCE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 44, SEEL, MYSTIC_WATER
		db HEADBUTT
		db ICY_WIND
		db AURORA_BEAM
		db AQUA_JET

	db 46, DEWGONG, NEVERMELTICE
		db BUBBLEBEAM
		db AURORA_BEAM
		db REST
		db SLEEP_TALK

	db 48, PILOSWINE, GOLD_BERRY
		db MIST
		db EARTH_POWER
		db ROCK_SLIDE
		db ICY_WIND

	db 45, DELIBIRD, LEFTOVERS
		db PRESENT
		db GUNK_SHOT
		db BLIZZARD
		db FLY

	db 49, JYNX, PARLYZ_GUARD
		db ICE_BEAM
		db PSYCHIC_M
		db LOVELY_KISS
		db SEISMIC_TOSS

	db $ff ; end

	; PRYCE (2)
	db "PRYCE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, CLOYSTER, MIRACLEBERRY
		db SPIKES
		db WATERFALL
		db BLIZZARD
		db SCREECH

	db 100, DEWGONG, BRIGHTPOWDER
		db ICE_BEAM
		db DRILL_RUN
		db REST
		db SLEEP_TALK

	db 100, PILOSWINE, NEVERMELTICE
		db ICY_WIND
		db EARTHQUAKE
		db ROCK_SLIDE
		db CHARM

	db 100, JYNX, NEVERMELTICE
		db ICY_WIND
		db PSYCHIC_M
		db NASTY_PLOT
		db LOVELY_KISS

	db 100, ARTICUNO, GOLD_BERRY
		db AIR_SLASH
		db BLIZZARD
		db ROAR
		db SHEER_COLD

	db 100, LAPRAS, LEFTOVERS
		db ICE_BEAM
		db SURF
		db DRILL_RUN
		db PERISH_SONG

	db $ff

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE (1)
	db "JASMINE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 51, MAGNEMITE, MAGNET
		db FLASH_CANNON
		db THUNDERBOLT
		db SUPERSONIC
		db THUNDER_WAVE

	db 53, STEELIX, BURN_GUARD
		db IRON_TAIL
		db ROCK_SLIDE
		db ROCK_POLISH
		db SCREECH

	db 55, MAGNETON, METAL_COAT
		db ZAP_CANNON
		db FLASH_CANNON
		db MIND_READER
		db METAL_SOUND

	db 57, SCIZOR, SCOPE_LENS
		db METAL_CLAW
		db SLASH
		db IRON_DEFENSE
		db DOUBLE_TEAM

	db 54, SKARMORY, SHARP_BEAK
		db WHIRLWIND
		db SPIKES
		db STEEL_WING
		db DRILL_PECK

	db $ff ; end

	; JASMINE (2)
	db "JASMINE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP) | ( 1 << TRAINERTYPE_NICKNAME)

	; party

	db 100, FORRETRESS, GOLD_BERRY, "SHELLNUT@"
		db PIN_MISSILE
		db SANDSTORM
		db EXPLOSION
		db SPIKES

	db 100, AMPHAROS, LEFTOVERS, "AMPHY@"
		db THUNDERBOLT
		db DRAGON_PULSE
		db THUNDER_WAVE
		db HEAL_BELL

	db 100, SKARMORY, SHARP_BEAK, "SKARLET@"
		db DRILL_PECK
		db WHIRLWIND
		db REST
		db SLEEP_TALK

	db 100, MAGNETON, BRIGHTPOWDER, "MAGNUM@"
		db THUNDER
		db FLASH_CANNON
		db TOXIC
		db REST

	db 100, STEELIX, SOFT_SAND, "RUSTY@"
		db EARTHQUAKE
		db IRON_HEAD
		db REST
		db SLEEP_TALK

	db 100, SCIZOR, METAL_COAT, "SNIPS@"
		db X_SCISSOR
		db BATON_PASS
		db IRON_HEAD
		db SWORDS_DANCE

	db $ff ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK (1)
	db "CHUCK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 50, PRIMEAPE, BLACKBELT
		db CROSS_CHOP
		db THRASH
		db FORESIGHT
		db SCREECH

	db 52, POLIWRATH, GOLD_BERRY
		db HYPNOSIS
		db MIND_READER
		db WATERFALL
		db DYNAMICPUNCH

	db 54, MACHAMP, BURN_GUARD
		db DYNAMICPUNCH
		db POISON_JAB
		db THUNDERPUNCH
		db FOCUS_ENERGY

	db 52, HERACROSS, SILVERPOWDER
		db ENDURE
		db REVERSAL
		db PIN_MISSILE
		db SEISMIC_TOSS

	db 53, HITMONTOP, SCOPE_LENS
		db DYNAMICPUNCH
		db DRILL_RUN
		db ROCK_SLIDE
		db COUNTER

	db $ff ; end

	; CHUCK (2)
	db "CHUCK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, HITMONTOP, BLACKBELT
		db MACH_PUNCH
		db DRILL_RUN
		db PURSUIT
		db METRONOME

	db 100, PRIMEAPE, MIRACLEBERRY
		db REVERSAL
		db GUNK_SHOT
		db ROCK_SLIDE
		db ENDURE

	db 100, HITMONCHAN, LEFTOVERS
		db DYNAMICPUNCH
		db THUNDERPUNCH
		db ICE_PUNCH
		db CURSE

	db 100, HERACROSS, BLACKBELT
		db MEGAHORN
		db REVERSAL
		db SWORDS_DANCE
		db ENDURE

	db 100, HITMONLEE, BURN_GUARD
		db HI_JUMP_KICK
		db FAINT_ATTACK
		db ROCK_SLIDE
		db MEDITATE

	db 100, POLIWRATH, GOLD_BERRY
		db DYNAMICPUNCH
		db HYDRO_PUMP
		db FISSURE
		db MIND_READER

	db $ff

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR (1)
	db "CLAIR@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 61, DRAGONAIR, LEFTOVERS
		db THUNDER_WAVE
		db SURF
		db SLAM
		db DRAGONBREATH

	db 61, DRAGONAIR, DRAGON_FANG
		db AQUA_JET
		db THUNDERBOLT
		db FLAMETHROWER
		db DRAGONBREATH

	db 61, DRAGONAIR, POLKADOT_BOW
		db EXTREMESPEED
		db ICE_BEAM
		db WATERFALL
		db DRAGON_PULSE

	db 63, KINGDRA, GOLD_BERRY
		db SMOKESCREEN
		db SURF
		db HYPER_BEAM
		db DRAGON_PULSE

	db 65, DRAGONITE, SLEEP_GUARD
		db OUTRAGE
		db HYPER_BEAM
		db EARTHQUAKE
		db THUNDER

	db $ff ; end

	; CLAIR (2)
	db "CLAIR@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, GYARADOS, MYSTIC_WATER
		db WATERFALL
		db OUTRAGE
		db IRON_HEAD
		db ROAR

	db 100, STEELIX, MIRACLEBERRY
		db IRON_HEAD
		db EARTHQUAKE
		db REST
		db CURSE

	db 100, CHARIZARD, GOLD_BERRY
		db FIRE_PUNCH
		db REST
		db BELLY_DRUM
		db EARTHQUAKE

	db 100, AERODACTYL, HARD_STONE
		db ROCK_SLIDE
		db PURSUIT
		db EARTHQUAKE
		db REFLECT

	db 100, DRAGONITE, POLKADOT_BOW
		db OUTRAGE
		db FIRE_PUNCH
		db CURSE
		db EXTREMESPEED

	db 100, KINGDRA, DRAGON_FANG
		db DRAGON_PULSE
		db HYDRO_PUMP
		db FOCUS_ENERGY
		db SWAGGER

	db $ff

; ================
; ================================


Rival1Group:
; ================================
; ================

	; RIVAL1 (1)
	db "?@"
	db 0 ; normal

	; party
	db 20, CHIKORITA

	db $ff ; end

; ================

	; RIVAL1 (2)
	db "?@"
	db 0 ; normal

	; party
	db 20, CYNDAQUIL

	db $ff ; end

; ================

	; RIVAL1 (3)
	db "?@"
	db 0 ; normal

	; party
	db 20, TOTODILE

	db $ff ; end

; ================

	; RIVAL1 (4)
	db "?@"
	db 0 ; normal

	; party
	db 26, LARVITAR
	db 28, ZUBAT
	db 30, BAYLEEF

	db $ff ; end

; ================

	; RIVAL1 (5)
	db "?@"
	db 0 ; normal

	; party
	db 26, LARVITAR
	db 28, ZUBAT
	db 30, QUILAVA

	db $ff ; end

; ================

	; RIVAL1 (6)
	db "?@"
	db 0 ; normal

	; party
	db 26, LARVITAR
	db 28, ZUBAT
	db 30, CROCONAW

	db $ff ; end

; ================

	; RIVAL1 (7)
	db "?@"
	db 0 ; normal

	; party

	db 33, MAGNEMITE
	db 35, PUPITAR
	db 37, GOLBAT
	db 39, MEGANIUM

	db $ff ; end

; ================

	; RIVAL1 (8)
	db "?@"
	db 0 ; normal

	; party

	db 33, MAGNEMITE
	db 35, PUPITAR
	db 37, GOLBAT
	db 39, QUILAVA

	db $ff ; end

; ================

	; RIVAL1 (9)
	db "?@"
	db 0 ; normal

	; party

	db 33, MAGNEMITE
	db 35, PUPITAR
	db 37, GOLBAT
	db 39, CROCONAW

	db $ff ; end

; ================

	; RIVAL1 (10)
	db "?@"
	db 0 ; normal

	; party

	db 52, SNEASEL
	db 52, GOLBAT
	db 53, PUPITAR
	db 53, MAGNETON
	db 54, MEGANIUM

	db $ff ; end

; ================

	; RIVAL1 (11)
	db "?@"
	db 0 ; normal

	; party

	db 52, SNEASEL
	db 52, GOLBAT
	db 53, PUPITAR
	db 53, MAGNETON
	db 54, TYPHLOSION

	db $ff ; end

; ================

	; RIVAL1 (12)
	db "?@"
	db 0 ; normal

	; party

	db 52, SNEASEL
	db 52, GOLBAT
	db 53, PUPITAR
	db 53, MAGNETON
	db 54, FERALIGATR

	db $ff ; end

; ================

	; RIVAL1 (13)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 61, SNEASEL, FOCUS_BAND
		db SWORDS_DANCE
		db BITE
		db ICE_PUNCH
		db DIG

	db 65, GOLBAT, KINGS_ROCK
		db SUPER_FANG
		db POISON_JAB
		db WING_ATTACK
		db ZEN_HEADBUTT

	db 63, MAGNETON, LEFTOVERS
		db THUNDERBOLT
		db FLASH_CANNON
		db TRI_ATTACK
		db METAL_SOUND

	db 63, BLISSEY, POLKADOT_BOW
		db ICE_BEAM
		db THUNDERBOLT
		db SUBSTITUTE
		db SOFTBOILED

	db 64, TYRANITAR, GOLD_BERRY
		db DARK_PULSE
		db ROCK_SLIDE
		db FLAMETHROWER
		db ROCK_POLISH

	db 66, MEGANIUM, MIRACLE_SEED
		db GIGA_DRAIN
		db EARTH_POWER
		db ANCIENTPOWER
		db LEECH_SEED

	db $ff ; end

; ================

	; RIVAL1 (14)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 61, SNEASEL, FOCUS_BAND
		db SWORDS_DANCE
		db BITE
		db ICE_PUNCH
		db DIG

	db 65, GOLBAT, KINGS_ROCK
		db SUPER_FANG
		db POISON_JAB
		db WING_ATTACK
		db ZEN_HEADBUTT

	db 63, MAGNETON, LEFTOVERS
		db THUNDERBOLT
		db FLASH_CANNON
		db TRI_ATTACK
		db METAL_SOUND

	db 63, BLISSEY, POLKADOT_BOW
		db ICE_BEAM
		db THUNDERBOLT
		db SUBSTITUTE
		db SOFTBOILED

	db 64, TYRANITAR, GOLD_BERRY
		db DARK_PULSE
		db ROCK_SLIDE
		db FLAMETHROWER
		db ROCK_POLISH

	db 66, TYPHLOSION, CHARCOAL
		db SHARPEN
		db FLAME_WHEEL
		db WILD_CHARGE
		db DOUBLE_EDGE

	db $ff ; end

; ================

	; RIVAL1 (15)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 61, SNEASEL, FOCUS_BAND
		db SWORDS_DANCE
		db BITE
		db ICE_PUNCH
		db DIG

	db 65, GOLBAT, KINGS_ROCK
		db SUPER_FANG
		db POISON_JAB
		db WING_ATTACK
		db ZEN_HEADBUTT

	db 63, MAGNETON, LEFTOVERS
		db THUNDERBOLT
		db FLASH_CANNON
		db TRI_ATTACK
		db METAL_SOUND

	db 63, BLISSEY, POLKADOT_BOW
		db ICE_BEAM
		db THUNDERBOLT
		db SUBSTITUTE
		db SOFTBOILED

	db 64, TYRANITAR, GOLD_BERRY
		db DARK_PULSE
		db ROCK_SLIDE
		db FLAMETHROWER
		db ROCK_POLISH

	db 66, FERALIGATR, MYSTIC_WATER
		db SWORDS_DANCE
		db AQUA_JET
		db CRUNCH
		db IRON_TAIL

	db $ff ; end

; ================
; ================================


PokemonProfGroup:
; ================================
; ================

	; PROFESSOR (1)
	db "OAK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, TAUROS, BURN_GUARD
		db PURSUIT
		db EARTHQUAKE
		db THRASH
		db SWAGGER

	db 100, EXEGGUTOR, MIRACLE_SEED
		db EXPLOSION
		db PSYCHIC_M
		db HYPNOSIS
		db GIGA_DRAIN

	db 100, ARCANINE, CHARCOAL
		db EXTREMESPEED
		db FLARE_BLITZ
		db OUTRAGE
		db WILLOWISP

	db 100, BLASTOISE, LEFTOVERS
		db ICE_BEAM
		db HYDRO_PUMP
		db IRON_DEFENSE
		db ZAP_CANNON

	db 100, GYARADOS, MYSTIC_WATER
		db ENDURE
		db OUTRAGE
		db FLAIL
		db WATERFALL

	db 100, PIKACHU, LIGHT_BALL
		db SURF
		db FLY
		db THUNDERBOLT
		db ENCORE

	db $ff ; end


	; PROFESSOR (2)
	db "OAK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, TAUROS, BURN_GUARD
		db PURSUIT
		db EARTHQUAKE
		db THRASH
		db SWAGGER

	db 100, EXEGGUTOR, MIRACLE_SEED
		db EXPLOSION
		db PSYCHIC_M
		db HYPNOSIS
		db GIGA_DRAIN

	db 100, ARCANINE, CHARCOAL
		db EXTREMESPEED
		db FLARE_BLITZ
		db OUTRAGE
		db WILLOWISP

	db 100, VENUSAUR, LEFTOVERS
		db EARTHQUAKE
		db GROWTH
		db SUNNY_DAY
		db SOLARBEAM

	db 100, GYARADOS, MYSTIC_WATER
		db ENDURE
		db OUTRAGE
		db FLAIL
		db WATERFALL

	db 100, PIKACHU, LIGHT_BALL
		db SURF
		db FLY
		db THUNDERBOLT
		db ENCORE

	db $ff ; end


	; PROFESSOR (3)
	db "OAK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, TAUROS, BURN_GUARD
		db PURSUIT
		db EARTHQUAKE
		db THRASH
		db SWAGGER

	db 100, EXEGGUTOR, MIRACLE_SEED
		db EXPLOSION
		db PSYCHIC_M
		db HYPNOSIS
		db GIGA_DRAIN

	db 100, ARCANINE, CHARCOAL
		db EXTREMESPEED
		db FLARE_BLITZ
		db OUTRAGE
		db WILLOWISP

	db 100, CHARIZARD, POWER_HERB
		db FIRE_BLAST
		db SKY_ATTACK
		db DRAGON_PULSE
		db REFLECT

	db 100, GYARADOS, MYSTIC_WATER
		db ENDURE
		db OUTRAGE
		db FLAIL
		db WATERFALL

	db 100, PIKACHU, LIGHT_BALL
		db SURF
		db FLY
		db THUNDERBOLT
		db ENCORE

	db $ff ; end


WillGroup:
; ================================
; ================

	; WILL (1)
	db "WILL@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 63, WOBBUFFET
		db COUNTER
		db MIRROR_COAT
		db DESTINY_BOND
		db ENCORE

	db 64, JYNX
		db ZEN_HEADBUTT
		db ICE_PUNCH
		db MEDITATE
		db LOVELY_KISS

	db 65, EXEGGUTOR
		db GIGA_DRAIN
		db PSYWAVE
		db LEECH_SEED
		db REFLECT

	db 66, SLOWBRO
		db WATERFALL
		db ZEN_HEADBUTT
		db CURSE
		db DISABLE

	db 67, XATU
		db PSYCHIC_M
		db DRILL_PECK
		db HEAT_WAVE
		db HAZE

	db $ff ; end

	; WILL (2)
	db "WILL@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, MR__MIME
		db PSYCHIC_M
		db MOONBLAST
		db SUBSTITUTE
		db BATON_PASS

	db 100, WOBBUFFET
		db DESTINY_BOND
		db MIRROR_COAT
		db COUNTER
		db SAFEGUARD

	db 100, HYPNO
		db ZEN_HEADBUTT
		db BODY_SLAM
		db FIRE_PUNCH
		db MEDITATE

	db 100, CLEFABLE
		db MOONBLAST
		db METRONOME
		db MOONLIGHT
		db HEAL_BELL

	db 100, XATU
		db PSYCHIC_M
		db AIR_SLASH
		db FUTURE_SIGHT
		db CONFUSE_RAY

	db 100, SLOWKING
		db ZEN_HEADBUTT
		db WATERFALL
		db HEADBUTT
		db THUNDER_WAVE

	db $ff

; ================
; ================================


PKMNTrainerGroup:
; ================================
; ================

	; CAL (1)
	db "CAL@"
	db 0 ; normal

	; party
	db 15, CHIKORITA
	db 15, CYNDAQUIL
	db 15, TOTODILE

	db $ff ; end

; ================

	; CAL (2)
	db "CAL@"
	db 0 ; normal

	; party
	db 35, BAYLEEF
	db 35, QUILAVA
	db 35, CROCONAW

	db $ff ; end

; ================

	; CAL (3)
	db "CAL@"
	db 0 ; normal

	; party
	db 100, MEGANIUM
	db 100, TYPHLOSION
	db 100, FERALIGATR

	db $ff ; end

; ================

	; CAL (4)
	db "AJDNNW@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_NICKNAME) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, STEELIX, LEFTOVERS, "AAJRR  RRR@"
		db ROCK_THROW
		db STRENGTH
		db EARTHQUAKE
		db IRON_TAIL

	db 100, DRAGONITE, MAX_REVIVE, "KT @"
		db OUTRAGE
		db DRAGONBREATH
		db TWISTER
		db WATERFALL

	db 100, ESPEON, FULL_HEAL, "AAAS  RJ-I@"
		db MORNING_SUN
		db FLASH
		db ATTRACT
		db PSYCHIC_M

	db 100, FERALIGATR, ICE_HEAL, "AAAAAtttta@"
		db SURF
		db ICY_WIND
		db CUT
		db NONE

	db 100, PIDGEOT,SLOWPOKETAIL, "BBBBBD@"
		db FLY
		db QUICK_ATTACK
		db WING_ATTACK
		db MIRROR_MOVE

	db $ff ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; BRUNO (1)
	db "BRUNO@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 67, ONIX
		db EARTHQUAKE
		db ROCK_SLIDE
		db SANDSTORM
		db ROCK_POLISH

	db 68, HITMONCHAN
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH
		db MACH_PUNCH

	db 68, HITMONLEE
		db HI_JUMP_KICK
		db DOUBLE_KICK
		db FOCUS_ENERGY
		db FORESIGHT

	db 69, RHYDON
		db DRILL_RUN
		db ROCK_SLIDE
		db MEGAHORN
		db SCARY_FACE

	db 71, HITMONTOP
		db ROLLING_KICK
		db MACH_PUNCH
		db DRILL_RUN
		db PROTECT

	db $ff ; end

	; BRUNO (2)
	db "BRUNO@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, RHYDON
		db EARTHQUAKE
		db ROCK_SLIDE
		db MEGAHORN
		db SCARY_FACE

	db 100, HITMONTOP
		db ROLLING_KICK
		db MACH_PUNCH
		db DRILL_RUN
		db PROTECT

	db 100, HITMONLEE
		db HI_JUMP_KICK
		db DOUBLE_KICK
		db FORESIGHT
		db MIND_READER

	db 100, HITMONCHAN
		db MACH_PUNCH
		db ICE_PUNCH
		db FIRE_PUNCH
		db THUNDERPUNCH

	db 100, STEELIX
		db IRON_TAIL
		db EARTHQUAKE
		db ROCK_SLIDE
		db IRON_DEFENSE

	db 100, MACHAMP
		db DYNAMICPUNCH
		db ROCK_SLIDE
		db POISON_JAB
		db FORESIGHT

	db $ff


; ================
; ================================


KarenGroup:
; ================================
; ================

	; KAREN (1)
	db "KAREN@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 69, UMBREON
		db BITE
		db CONFUSE_RAY
		db SAND_ATTACK
		db MEAN_LOOK

	db 70, VILEPLUME
		db PETAL_DANCE
		db MOONBLAST
		db STUN_SPORE
		db MOONLIGHT

	db 71, MURKROW
		db FAINT_ATTACK
		db DRILL_PECK
		db HEAT_WAVE
		db CONFUSE_RAY

	db 72, GENGAR
		db SHADOW_BALL
		db DAZZLINGLEAM
		db CURSE
		db DESTINY_BOND

	db 73, HOUNDOOM
		db DARK_PULSE
		db FLAMETHROWER
		db NASTY_PLOT
		db ROAR

	db $ff ; end

	; KAREN (2)
	db "KAREN@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, UMBREON
		db FAINT_ATTACK
		db MEAN_LOOK
		db DOUBLE_TEAM
		db BATON_PASS

	db 100, VILEPLUME
		db PETAL_DANCE
		db SLUDGE_BOMB
		db MOONLIGHT
		db TOXIC

	db 100, GENGAR
		db SHADOW_BALL
		db SPITE
		db CURSE
		db PROTECT

	db 100, MURKROW
		db FLY
		db DARK_PULSE
		db WHIRLWIND
		db TOXIC

	db 100, HOUNDOOM
		db FLAMETHROWER
		db CRUNCH
		db WILLOWISP
		db ROAR

	db 100, SNEASEL
		db ICE_PUNCH
		db BITE
		db SWORDS_DANCE
		db BATON_PASS
	db $ff

; ================
; ================================


KogaGroup:
; ================================
; ================

	; KOGA (1)
	db "KOGA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 65, FORRETRESS
		db SPIKES
		db PIN_MISSILE
		db DRILL_RUN
		db IRON_DEFENSE

	db 66, VENOMOTH
		db SLUDGE_BOMB
		db BUG_BUZZ
		db SUPERSONIC
		db TOXIC

	db 67, ARIADOS
		db MEGAHORN
		db MEAN_LOOK
		db BATON_PASS
		db DOUBLE_TEAM

	db 68, CROBAT
		db AIR_SLASH
		db POISON_JAB
		db WHIRLWIND
		db TOXIC

	db 69, MUK
		db POISON_JAB
		db FIRE_PUNCH
		db MINIMIZE
		db ACID_ARMOR

	db $ff ; end

	; KOGA (2)
	db "KOGA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, FORRETRESS
		db SPIKES
		db FLASH_CANNON
		db PIN_MISSILE
		db EXPLOSION

	db 100, ARBOK
		db GUNK_SHOT
		db IRON_TAIL
		db ROCK_SLIDE
		db GLARE

	db 100, ARIADOS
		db MEGAHORN
		db DOUBLE_TEAM
		db BATON_PASS
		db TOXIC

	db 100, VENOMOTH
		db BUG_BUZZ
		db SLUDGE_BOMB
		db SUPERSONIC
		db TOXIC

	db 100, CROBAT
		db FLY
		db DOUBLE_TEAM
		db BATON_PASS
		db TOXIC

	db 100, NIDOKING
		db POISON_JAB
		db DRILL_RUN
		db HORN_DRILL
		db FOCUS_ENERGY

	db $ff

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION (1)
	db "LANCE@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 71, GYARADOS
		db WATERFALL
		db CRUNCH
		db RAIN_DANCE
		db HYPER_BEAM

	db 72, DRAGONITE
		db DRAGONBREATH
		db THUNDER
		db AQUA_JET
		db HYPER_BEAM

	db 72, DRAGONITE
		db TWISTER
		db BLIZZARD
		db THUNDER_WAVE
		db HYPER_BEAM

	db 73, AERODACTYL
		db WING_ATTACK
		db ROCK_SLIDE
		db IRON_HEAD
		db HYPER_BEAM

	db 74, CHARIZARD
		db FLAMETHROWER
		db WING_ATTACK
		db SLASH
		db HYPER_BEAM

	db 75, DRAGONITE
		db OUTRAGE
		db FIRE_BLAST
		db SAFEGUARD
		db HYPER_BEAM

	db $ff ; end

	; CHAMPION (2)
	db "LANCE@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GYARADOS
		db WATERFALL
		db THRASH
		db RAIN_DANCE
		db HYPER_BEAM

	db 100, TYRANITAR
		db CRUNCH
		db ROCK_SLIDE
		db SANDSTORM
		db HYPER_BEAM

	db 100, KINGDRA
		db DRAGON_PULSE
		db OCTAZOOKA
		db SMOKESCREEN
		db HYPER_BEAM

	db 100, MEWTWO
		db PSYCHIC_M
		db LIGHT_SCREEN
		db SELFDESTRUCT
		db SUBMISSION

	db 100, CHARIZARD
		db FIRE_PUNCH
		db WING_ATTACK
		db SWORDS_DANCE
		db HYPER_BEAM

	db 100, DRAGONITE
		db OUTRAGE
		db THUNDER
		db BLIZZARD
		db HYPER_BEAM

	db $ff

; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "BROCK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 85, ONIX, LEFTOVERS
		db ROCK_SLIDE
		db IRON_TAIL
		db BIDE
		db SANDSTORM

	db 86, SUDOWOODO, GOLD_BERRY
		db ROCK_SLIDE
		db FIRE_PUNCH
		db THUNDERPUNCH
		db STRING_SHOT

	db 87, KABUTOPS, HARD_STONE
		db WATERFALL
		db ANCIENTPOWER
		db GIGA_DRAIN
		db METAL_SOUND

	db 87, OMASTAR, MYSTIC_WATER
		db SURF
		db ANCIENTPOWER
		db ROCK_POLISH
		db IRON_DEFENSE

	db 88, GOLEM, GOLD_BERRY
		db ROLLOUT
		db EARTHQUAKE
		db EXPLOSION
		db DEFENSE_CURL

	db 89, AERODACTYL, SHARP_BEAK
		db ROCK_SLIDE
		db WING_ATTACK
		db CRUNCH
		db DOUBLE_TEAM

	db $ff ; end

; ================

	; BROCK (1)
	db "BROCK@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, GOLEM, LEFTOVERS
		db EARTHQUAKE
		db ROCK_SLIDE
		db SANDSTORM
		db PROTECT

	db 100, TYRANITAR, BURN_GUARD
		db CRUNCH
		db ROCK_SLIDE
		db CURSE
		db SANDSTORM

	db 100, MAGCARGO, CHARCOAL
		db FLAMETHROWER
		db SANDSTORM
		db RECOVER
		db WILLOWISP

	db 100, SHUCKLE, GOLD_BERRY
		db WRAP
		db SANDSTORM
		db TOXIC
		db PROTECT

	db 100, KABUTOPS, MYSTIC_WATER
		db WATERFALL
		db ROCK_SLIDE
		db AQUA_JET
		db SWORDS_DANCE

	db 100, AERODACTYL, SHARP_BEAK
		db FLY
		db IRON_HEAD
		db ROCK_SLIDE
		db DOUBLE_TEAM

	db $ff ; end


; ================================


MistyGroup:
; ================================
; ================

	; MISTY (1)
	db "MISTY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 84, QWILFISH, POISON_BARB
		db WATERFALL
		db POISON_JAB
		db PAIN_SPLIT
		db SPIKES

	db 85, GOLDUCK, MYSTIC_WATER
		db SURF
		db PSYCHIC_M
		db AQUA_JET
		db DISABLE

	db 85, QUAGSIRE, SOFT_SAND
		db SURF
		db EARTHQUAKE
		db AMNESIA
		db RAIN_DANCE

	db 86, LAPRAS, MYSTIC_WATER
		db SURF
		db BLIZZARD
		db THUNDERBOLT
		db PERISH_SONG

	db 87, KINGDRA, DRAGON_FANG
		db OCTAZOOKA
		db DRAGON_PULSE
		db HAZE
		db IRON_HEAD

	db 88, STARMIE, GOLD_BERRY
		db SURF
		db PSYCHIC_M
		db ICE_BEAM
		db RECOVER


	db $ff ; end

	; MISTY (2)
	db "MISTY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, QWILFISH, GOLD_BERRY
		db POISON_JAB
		db WATERFALL
		db SPIKES
		db EXPLOSION

	db 100, KINGLER, MIRACLEBERRY
		db CRABHAMMER
		db SWORDS_DANCE
		db AGILITY
		db X_SCISSOR

	db 100, QUAGSIRE, SOFT_SAND
		db SURF
		db RECOVER
		db EARTHQUAKE
		db RAIN_DANCE

	db 100, LAPRAS, MAGNET
		db SURF
		db PERISH_SONG
		db THUNDER
		db RAIN_DANCE

	db 100, STARMIE, PARLYZ_GUARD
		db SURF
		db PSYCHIC_M
		db RECOVER
		db THUNDER_WAVE

	db 100, SUICUNE, MYSTIC_WATER
		db SURF
		db ICE_BEAM
		db REST
		db RAIN_DANCE



	db $ff ; end


; ================
; ================================


LtSurgeGroup:
; ================================
; ================

	; LT_SURGE (1)
	db "LT.SURGE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 75, ELECTRODE, POLKADOT_BOW
		db EXPLOSION
		db SWIFT
		db RAIN_DANCE
		db SCREECH

	db 77, RAICHU, MAGNET
		db THUNDER
		db IRON_TAIL
		db QUICK_ATTACK
		db THUNDER_WAVE

	db 75, ELECTRODE, GOLD_BERRY
		db EXPLOSION
		db THUNDER
		db SCREECH
		db DOUBLE_TEAM

	db 76, MAGNETON, METAL_COAT
		db ZAP_CANNON
		db FLASH_CANNON
		db TRI_ATTACK
		db MIND_READER

	db 77, JOLTEON, MAGNET
		db THUNDERBOLT
		db BITE
		db AGILITY
		db MUD_SLAP

	db 78, ELECTABUZZ, LEFTOVERS
		db THUNDER
		db WILD_CHARGE
		db CROSS_CHOP
		db LIGHT_SCREEN

	db $ff ; end


		; LT_SURGE (2)
	db "LT.SURGE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	;party

	db 100, ELECTRODE, MAGNET
		db THUNDERBOLT
		db FLASH_CANNON
		db MIRROR_COAT
		db EXPLOSION

	db 100, RAICHU, MAGNET
		db THUNDER
		db PETAL_DANCE
		db NASTY_PLOT
		db ENCORE

	db 100, LANTURN, LEFTOVERS
		db THUNDER
		db SURF
		db RAIN_DANCE
		db THUNDER_WAVE

	db 100, ELECTABUZZ, BLACKBELT
		db THUNDER
		db PSYCHIC_M
		db CROSS_CHOP
		db THUNDER_WAVE

	db 100, RAIKOU, SLEEP_GUARD
		db THUNDER
		db THUNDER_WAVE
		db REFLECT
		db ROAR

	db 100, JOLTEON, CONFUSEGUARD
		db THUNDERBOLT
		db SHADOW_BALL
		db GROWTH
		db BATON_PASS

	db $ff ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST (1)
	db "ROSS@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 41, DITTO, METAL_POWDER

	db $ff ; end

; ================

	; SCIENTIST (2)
	db "MITCH@"
	db 0 ; normal

	; party
	db 36, HOPPIP
	db 37, BELLSPROUT
	db 37, ODDISH
	db 38, SUNFLORA
	db 39, BELLOSSOM
	db 39, VILEPLUME

	db $ff ; end

; ================

	; SCIENTIST (3)
	db "JED@"
	db 0 ; normal

	; party
	db 38, SKARMORY
	db 37, FLAAFFY
	db 38, PORYGON

	db $ff ; end

; ================

	; SCIENTIST (4)
	db "MARC@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 49, KOFFING, LEFTOVERS
		db ROLLOUT
		db PAIN_SPLIT
		db CURSE
		db SCREECH

	db 49, KOFFING, LEFTOVERS
		db SLUDGE_BOMB
		db FLAMETHROWER
		db THUNDERBOLT
		db EXPLOSION

	db 51, KOFFING, LEFTOVERS
		db FIRE_BLAST
		db SLUDGE_BOMB
		db REST
		db SLEEP_TALK

	db 51, KOFFING, LEFTOVERS
		db TOXIC
		db FLAMETHROWER
		db PROTECT
		db SWAGGER

	db 53, KOFFING, LEFTOVERS
		db TOXIC
		db SMOKESCREEN
		db ATTRACT
		db THUNDER

	db 53, KOFFING, LEFTOVERS
		db SLUDGE_BOMB
		db ZAP_CANNON
		db ATTRACT
		db SWAGGER

	db $ff ; end

; ================

	; SCIENTIST (5)
	db "RICH@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 53, PORYGON2, BERSERK_GENE
		db DOUBLE_EDGE
		db THIEF
		db RECOVER
		db CONVERSION2

	db $ff ; end

; ================
; ================================


ErikaGroup:
; ================================
; ================

	; ERIKA (1)
	db "ERIKA@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 77, TANGELA, LEFTOVERS
		db GIGA_DRAIN
		db WRAP
		db AMNESIA
		db SLEEP_POWDER

	db 78, JUMPLUFF, MIRACLE_SEED
		db GIGA_DRAIN
		db DAZZLINGLEAM
		db LEECH_SEED
		db COTTON_SPORE

	db 78, VILEPLUME, POISON_BARB
		db PETAL_DANCE
		db SLUDGE_BOMB
		db SUNNY_DAY
		db SYNTHESIS

	db 79, SUNFLORA, SOFT_SAND
		db GIGA_DRAIN
		db EARTH_POWER
		db LIGHT_SCREEN
		db MORNING_SUN

	db 79, VICTREEBEL, BURN_GUARD
		db SEED_BOMB
		db POISON_JAB
		db SYNTHESIS
		db SWORDS_DANCE

	db 80, BELLOSSOM, GOLD_BERRY
		db SOLARBEAM
		db PETAL_DANCE
		db SUNNY_DAY
		db SYNTHESIS


	db $ff ; end

		; ERIKA (2)
	db "ERIKA@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, JUMPLUFF, MIRACLE_SEED
		db GIGA_DRAIN
		db STUN_SPORE
		db SUBSTITUTE
		db LEECH_SEED

	db 100, SUNFLORA, MYSTERYBERRY
		db GIGA_DRAIN
		db SUNNY_DAY
		db GROWTH
		db SPORE

	db 100, CELEBI, MIRACLE_SEED
		db GIGA_DRAIN
		db PSYCHIC_M
		db EARTH_POWER
		db LEECH_SEED

	db 100, VICTREEBEL, LEFTOVERS
		db SOLARBEAM
		db SLUDGE_BOMB
		db GROWTH
		db SUNNY_DAY

	db 100, MEGANIUM, MIRACLEBERRY
		db SEED_BOMB
		db OUTRAGE
		db SWORDS_DANCE
		db SYNTHESIS

	db 100, VILEPLUME, MIRACLE_SEED
		db PETAL_DANCE
		db SLUDGE_BOMB
		db STUN_SPORE
		db SYNTHESIS

	db $ff ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "JOEY@"
	db 0 ; normal

	; party
	db 20, SENTRET
	db 22, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (2)
	db "MIKEY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 20, TEDDIURSA, QUICK_CLAW
	db 20, HOOTHOOT, BERRY
	db 22, FURRET, FOCUS_BAND

	db $ff ; end

; ================

	; YOUNGSTER (3)
	db "ALBERT@"
	db 0 ; normal

	; party
	db 22, MAREEP
	db 22, SNUBBULL
	db 24, FLAAFFY

	db $ff ; end

; ================

	; YOUNGSTER (4)
	db "GORDON@"
	db 0 ; normal

	; party
	db 23, SUNKERN
	db 23, TOGEPI
	db 24, SMEARGLE

	db $ff ; end

; ================

	; YOUNGSTER (5)
	db "SAMUEL@"
	db 0 ; normal

	; party
	db 26, AIPOM
	db 25, NIDORINO
	db 25, NIDORINA
	db 27, GIRAFARIG

	db $ff ; end

; ================

	; YOUNGSTER (6)
	db "IAN@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 26, CHANSEY, LUCKY_PUNCH
	db 30, DITTO, METAL_POWDER

	db $ff ; end

; ================

	; YOUNGSTER (7)
	db "JOEY@"
	db 0 ; normal

	; party
	db 30, FURRET
	db 32, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (8)
	db "JOEY@"
	db 0 ; normal

	; party

	db 40, SQUIRTLE
	db 41, FURRET
	db 42, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (9)
	db "WARREN@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 84, EEVEE, FOCUS_BAND
	db 84, JIGGLYPUFF, FOCUS_BAND
	db 84, CLEFAIRY, FOCUS_BAND

	db $ff ; end

; ================

	; YOUNGSTER (10)
	db "JIMMY@"
	db 0 ; normal

	; party
	db 84, WIGGLYTUFF
	db 84, GOLBAT
	db 84, ELECTRODE

	db $ff ; end

; ================

	; YOUNGSTER (11)
	db "OWEN@"
	db 0 ; normal

	; party
	db 80, IVYSAUR

	db $ff ; end

; ================

	; YOUNGSTER (12)
	db "JASON@"
	db 0 ; normal

	; party
	db 79, RHYHORN
	db 79, TANGELA
	db 80, LICKITUNG

	db $ff ; end

; ================

	; YOUNGSTER (13)
	db "JOEY@"
	db 0 ; normal

	; party

	db 60, WARTORTLE
	db 61, FURRET
	db 62, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (14)
	db "JOEY@"
	db 0 ; normal

	; party

	db 80, FURRET
	db 81, BLASTOISE
	db 82, RATICATE

	db $ff ; end

	db "BEN@"
	db 0
	db 11, RATTATA
	db 11, EKANS
	db $ff

	db "CALVIN@"
	db 0
	db 14, SPEAROW
	db $ff

; ================

	db "JOSH@"
	db 0
	db 10, RATTATA
	db 11, RATTATA
	db 12, ZUBAT
	db $ff

	db "TIMMY@"
	db 0
	db 14, SANDSHREW
	db 14, EKANS
	db $ff
;==========
	db "JOEY@"
	db 0
	db 15, SPEAROW
	db 16, RATTATA
	db $ff

	db "DAN@"
	db 0
	db 17, SLOWPOKE
	db $ff

	db "CHAD@"
	db 0
	db 14, EKANS
	db 14, SANDSHREW
	db $ff

	db "EDDIE@"
	db 0
	db 21, EKANS
	db $ff

	db "DAVE@"
	db 0
	db 18, NIDORAN_M
	db 19, NIDORINO
	db $ff

	db "DILLON@"
	db 0
	db 19, SANDSHREW
	db 19, ZUBAT
	db $ff

	db "YASU@"
	db 0
	db 15, RATTATA
	db 17, RATTATA
	db 19, RATICATE
	db $ff

	db "TYLER@"
	db 0
	db 21, NIDORAN_M
	db $ff
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY (1)
	db "JACK@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 28, HOUNDOUR
		db FLAMETHROWER
		db SLUDGE_BOMB
		db BODY_SLAM
		db BITE

	db 30, PINSIR
		db TACKLE
		db MEGAHORN
		db HARDEN
		db PIN_MISSILE

	db $ff ; end

; ================

	; SCHOOLBOY (2)
	db "KIPP@"
	db 0 ; normal

	; party
	db 76, GROWLITHE
	db 76, KADABRA

	db $ff ; end

; ================

	; SCHOOLBOY (3)
	db "ALAN@"
	db 0 ; normal

	; party
	db 31, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (4)
	db "JOHNNY@"
	db 0 ; normal

	; party
	db 75, YANMA
	db 75, PARASECT

	db $ff ; end

; ================

	; SCHOOLBOY (5)
	db "DANNY@"
	db 0 ; normal

	; party
	db 85, JYNX
	db 85, ELECTABUZZ
	db 85, MAGMAR

	db $ff ; end

; ================

	; SCHOOLBOY (6)
	db "TOMMY@"
	db 0 ; normal

	; party
	db 80, DITTO
	db 75, ALAKAZAM

	db $ff ; end

; ================

	; SCHOOLBOY (7)
	db "DUDLEY@"
	db (1 << TRAINERTYPE_ITEM) ; normal

	; party
	db 80, ODDISH, FOCUS_BAND
	db 80, GROWLITHE, FOCUS_BAND
	db 80, VENONAT, FOCUS_BAND
	db 80, KRABBY, FOCUS_BAND
	db 80, ABRA, FOCUS_BAND

	db $ff ; end

; ================

	; SCHOOLBOY (8)
	db "JOE@"
	db 0 ; normal

	; party
	db 81, PSYDUCK
	db 81, GLOOM
	db 82, VENOMOTH

	db $ff ; end

; ================

	; SCHOOLBOY (9)
	db "BILLY@"
	db 0 ; normal

	; party
	db 75, MACHOP
	db 75, MACHOKE
	db 76, HITMONTOP

	db $ff ; end

; ================

	; SCHOOLBOY (10)
	db "CHAD@"
	db 0 ; normal

	; party
	db 34, MAGNEMITE
	db 34, EEVEE
	db 34, FLAAFFY

	db $ff ; end

; ================

	; SCHOOLBOY (11)
	db "NATE@"
	db 0 ; normal

	; party
	db 79, DRATINI
	db 79, PONYTA
	db 82, SNORLAX

	db $ff ; end

; ================

	; SCHOOLBOY (12)
	db "RICKY@"
	db 0 ; normal

	; party
	db 81, SANDSHREW
	db 81, DIGLETT
	db 83, PILOSWINE

	db $ff ; end

; ================

	; SCHOOLBOY (13)
	db "JACK@"
	db 0 ; normal

	; party
	db 40, HOUNDOUR
	db 40, STARYU
	db 42, PINSIR

	db $ff ; end

; ================

	; SCHOOLBOY (14)
	db "JACK@"
	db 0 ; normal

	; party
	db 60, BULBASAUR
	db 61, STARYU
	db 62, PINSIR
	db 63, HOUNDOOM

	db $ff ; end

; ================

	; SCHOOLBOY (15)
	db "ALAN@"
	db 0 ; normal

	; party
	db 45, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (16)
	db "ALAN@"
	db 0 ; normal

	; party
	db 70, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (17)
	db "CHAD@"
	db 0 ; normal

	; party
	db 39, EEVEE
	db 40, MAGNEMITE
	db 41, FLAAFFY
	db 42, VAPOREON

	db $ff ; end

; ================

	; SCHOOLBOY (18)
	db "CHAD@"
	db 0 ; normal

	; party
	db 60, EEVEE
	db 61, FLAAFFY
	db 61, VAPOREON
	db 62, MAGNETON

	db $ff ; end

; ================

	; SCHOOLBOY (19)
	db "JACK@"
	db 0 ; normal

	; party
	db 80, IVYSAUR
	db 81, PINSIR
	db 82, HOUNDOOM
	db 83, STARMIE

	db $ff ; end

; ================

	; SCHOOLBOY (20)
	db "JACK@"
	db 0 ; normal

	; party

	db 95, PINSIR
	db 95, HOUNDOOM
	db 95, STARMIE
	db 95, VENUSAUR

	db $ff ; end

; ================

	; SCHOOLBOY (21)
	db "ALAN@"
	db 0 ; normal

	; party
	db 90, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (22)
	db "ALAN@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (23)
	db "CHAD@"
	db 0 ; normal

	; party
	db 80, EEVEE
	db 80, FLAAFFY
	db 82, VAPOREON
	db 82, MAGNETON
	db 84, FLAREON

	db $ff ; end

; ================

	; SCHOOLBOY (24)
	db "CHAD@"
	db 0 ; normal

	; party

	db 95, MAGNETON
	db 95, FLAREON
	db 95, JOLTEON
	db 95, VAPOREON
	db 95, MAGNETON
	db 95, ESPEON

	db $ff ; end

	db "BRETT@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, PICHU, FOCUS_BAND
		db THUNDERBOLT
		db IRON_TAIL
		db SING
		db SWEET_KISS

	db 100, MAREEP, FOCUS_BAND
		db SPARK
		db HEADBUTT
		db COTTON_SPORE
		db CONFUSE_RAY

	db 100, ELEKID, FOCUS_BAND
		db THUNDERPUNCH
		db MEGA_KICK
		db CROSS_CHOP
		db MEDITATE

	db $ff ; end
; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER (1)
	db "ROD@"
	db 0 ; normal

	; party
	db 21, SPEAROW
	db 23, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (2)
	db "ABE@"
	db 0 ; normal

	; party
	db 21, PIDGEY
	db 21, DODUO
	db 23, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (3)
	db "BRYAN@"
	db 0 ; normal

	; party
	db 29, TOGETIC
	db 30, PIDGEOTTO

	db $ff ; end

; ================

	; BIRD_KEEPER (4)
	db "THEO@"
	db 0 ; normal

	; party
	db 45, PIDGEY
	db 45, SPEAROW
	db 45, DODUO
	db 45, NATU

	db $ff ; end

; ================

	; BIRD_KEEPER (5)
	db "TOBY@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 35, NOCTOWL
		db HYPNOSIS
		db DREAM_EATER
		db NIGHTMARE
		db NONE

	db $ff ; end

; ================

	; BIRD_KEEPER (6)
	db "DENIS@"
	db 0 ; normal

	; party
	db 47, SKIPLOOM
	db 48, LEDIAN

	db $ff ; end

; ================

	; BIRD_KEEPER (7)
	db "VANCE@"
	db 0 ; normal

	; party
	db 54, PIDGEOTTO
	db 57, DELIBIRD

	db $ff ; end

; ================

	; BIRD_KEEPER (8)
	db "HANK@"
	db 0 ; normal

	; party
	db 81, NOCTOWL
	db 81, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (9)
	db "ROY@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 76, MURKROW
		db FLY
		db PURSUIT
		db PERISH_SONG
		db PROTECT

	db 77, XATU
		db PSYCHIC_M
		db DRILL_PECK
		db SOLARBEAM
		db ATTRACT

	db 77, FEAROW
		db FLY
		db TOXIC
		db REST
		db SLEEP_TALK

	db $ff ; end

; ================

	; BIRD_KEEPER (10)
	db "BORIS@"
	db 0 ; normal

	; party
	db 73, DODUO
	db 76, DODRIO

	db $ff ; end

; ================

	; BIRD_KEEPER (11)
	db "BOB@"
	db 0 ; normal

	; party
	db 73, SPEAROW
	db 76, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (12)
	db "JOSE@"
	db 0 ; normal

	; party
	db 82, FARFETCH_D
	db 84, DODRIO

	db $ff ; end

; ================

	; BIRD_KEEPER (13)
	db "PETER@"
	db 0 ; normal

	; party
	db 23, TOGETIC
	db 25, MURKROW

	db $ff ; end

; ================

	; BIRD_KEEPER (14)
	db "JOSE@"
	db 0 ; normal

	; party
	db 58, FARFETCH_D
	db 60, DODRIO

	db $ff ; end

; ================

	; BIRD_KEEPER (15)
	db "PERRY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 78, FARFETCH_D, STICK

	db $ff ; end

; ================

	; BIRD_KEEPER (16)
	db "BRET@"
	db 0 ; normal

	; party
	db 77, SCYTHER
	db 77, VENOMOTH

	db $ff ; end

; ================

	; BIRD_KEEPER (17)
	db "JOSE@"
	db 0 ; normal

	; party

	db 94, DODRIO
	db 96, FEAROW
	db 98, FARFETCH_D


	db $ff ; end

; ================

	; BIRD_KEEPER (18)
	db "VANCE@"
	db 0 ; normal

	; party
	db 80, PIDGEOTTO
	db 85, DELIBIRD

	db $ff ; end

; ================

	; BIRD_KEEPER (19)
	db "VANCE@"
	db 0 ; normal

	; party

	db 96, PIDGEOT
	db 98, MANTINE
	db 100, DELIBIRD

	db $ff ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "CARRIE@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 33, SMEARGLE
		db TRI_ATTACK
		db MOONBLAST
		db EARTHQUAKE
		db SPORE

	db $ff ; end

; ================

	; LASS (2)
	db "BRIDGET@"
	db 0 ; normal

	; party
	db 30, TOGETIC
	db 31, MARILL
	db 32, MR__MIME

	db $ff ; end

; ================

	; LASS (3)
	db "ALICE@"
	db 0 ; normal

	; party
	db 76, GLOOM
	db 76, VENONAT
	db 76, HAUNTER

	db $ff ; end

; ================

	; LASS (4)
	db "KRISE@"
	db 0 ; normal

	; party
	db 30, LEDIAN
	db 31, VENOMOTH

	db $ff ; end

; ================

	; LASS (5)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 50, DELIBIRD

	db $ff ; end

; ================

	; LASS (6)
	db "LINDA@"
	db 0 ; normal

	; party
	db 77, VENUSAUR

	db $ff ; end

; ================

	; LASS (7)
	db "LAURA@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 80, TYROGUE, FOCUS_BAND
	db 80, MAGBY, FOCUS_BAND
	db 80, IGGLYBUFF, FOCUS_BAND
	db 80, ELEKID, FOCUS_BAND
	db 80, PICHU, FOCUS_BAND
	db 80, SMOOCHUM, FOCUS_BAND

	db $ff ; end

; ================

	; LASS (8)
	db "SHANNON@"
	db 0 ; normal

	; party
	db 81, ARBOK
	db 81, HYPNO
	db 81, VICTREEBEL

	db $ff ; end

; ================

	; LASS (9)
	db "MICHELLE@"
	db 0 ; normal

	; party
	db 74, SKIPLOOM
	db 74, WEEPINBELL
	db 74, BAYLEEF

	db $ff ; end

; ================

	; LASS (10)
	db "DANA@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 34, TOGEPI
		db METRONOME
		db 0
		db 0
		db 0

	db 36, DROWZEE
		db METRONOME
		db 0
		db 0
		db 0

	db 38, CLEFAIRY
		db METRONOME
		db 0
		db 0
		db 0

	db 40, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0
	db $ff ; end

; ================

	; LASS (11)
	db "ELLEN@"
	db 0 ; normal

	; party
	db 81, WIGGLYTUFF
	db 81, CLEFABLE

	db $ff ; end

; ================

	; LASS (12)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (13)
	db "CONNIE@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (14)
	db "DANA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 50, TEDDIURSA
		db METRONOME
		db 0
		db 0
		db 0

	db 50, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 50, GRANBULL
		db METRONOME
		db 0
		db 0
		db 0


	db $ff ; end

; ================

	; LASS (15)
	db "DANA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 65, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 65, GRANBULL
		db METRONOME
		db 0
		db 0
		db 0

	db 65, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 65, URSARING
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; LASS (16)
	db "DANA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 80, MACHAMP
		db METRONOME
		db 0
		db 0
		db 0

	db 80, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 80, GOLEM
		db METRONOME
		db 0
		db 0
		db 0

	db 80, HYPNO
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; LASS (17)
	db "DANA@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 100, ALAKAZAM
		db METRONOME
		db 0
		db 0
		db 0

	db 100, POLITOED
		db METRONOME
		db 0
		db 0
		db 0

	db 100, GENGAR
		db METRONOME
		db 0
		db 0
		db 0

	db 100, BLISSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 100, SNORLAX
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

	db "JANICE@"
	db 0
	db 9, PIDGEY
	db 9, PIDGEY
	db $ff

	db "SALLY@"
	db 0
	db 10, RATTATA
	db 10, NIDORAN_F
	db $ff

	db "ROBIN@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 14, JIGGLYPUFF, "JIGGLES@"
	db $ff

	db "MIRIAM@"
	db 0
	db 11, ODDISH
	db 11, BELLSPROUT
	db $ff

	db "IRIS@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 14, CLEFAIRY, "CLEFFLES@"
	db $ff

	db "CRISSY@"
	db 0
	db 31, PARAS
	db 31, PARAS
	db 33, PARASECT
	db $ff

	db "ALI@"
	db 0
	db 12, PIDGEY
	db 12, ODDISH
	db 12, BELLSPROUT
	db $ff

	db "RELI@"
	db 0
	db 16, NIDORAN_M
	db 16, NIDORAN_F
	db $ff

	db "HALEY@"
	db 0
	db 13, ODDISH
	db 14, PIDGEY
	db 13, ODDISH
	db $ff

	db "ANN@"
	db 0
	db 18, PIDGEY
	db 18, NIDORAN_F
	db $ff

	db "DAWN@"
	db 0
	db 18, RATTATA
	db 18, PIKACHU
	db $ff

; ================
; ================================


JanineGroup:
; ================================
; ================

	; JANINE (1)
	db "JANINE@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 79, TENTACRUEL, GOLD_BERRY
		db SURF
		db MIRROR_COAT
		db RAPID_SPIN
		db SPIKES

	db 80, MUK, POISON_BARB
		db SLUDGE_BOMB
		db DIG
		db MINIMIZE
		db ACID_ARMOR

	db 80, CROBAT, SHARP_BEAK
		db POISON_JAB
		db WING_ATTACK
		db SCREECH
		db CONFUSE_RAY

	db 81, WEEZING, POISON_BARB
		db SLUDGE_BOMB
		db FIRE_BLAST
		db TOXIC
		db EXPLOSION

	db 81, ARBOK, LEFTOVERS
		db GUNK_SHOT
		db CRUNCH
		db WRAP
		db GLARE

	db 82, VENOMOTH, SILVERPOWDER
		db SLUDGE_BOMB
		db BUG_BUZZ
		db PSYCHIC_M
		db DOUBLE_TEAM

	db $ff ; end

	; JANINE (2)
	db "JANINE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, TENTACRUEL, GOLD_BERRY
		db WHIRLPOOL
		db SPIKES
		db SLUDGE_BOMB
		db TOXIC

	db 100, WEEZING, LEFTOVERS
		db FIRE_BLAST
		db SLUDGE_BOMB
		db PROTECT
		db WILLOWISP

	db 100, CROBAT, SHARP_BEAK
		db SUPER_FANG
		db TOXIC
		db AIR_SLASH
		db WHIRLWIND

	db 100, MUK, LEFTOVERS
		db SLUDGE_BOMB
		db MINIMIZE
		db TOXIC
		db FIRE_BLAST

	db 100, NIDOQUEEN, SOFT_SAND
		db TOXIC
		db POISON_JAB
		db EARTHQUAKE
		db MOONLIGHT

	db 100, VENUSAUR, MIRACLE_SEED
		db PROTECT
		db LEECH_SEED
		db SEED_BOMB
		db SYNTHESIS

	db $ff
; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM (1)
	db "NICK@"
	db 0 ; normal

	; party

	db 53, CHARIZARD
	db 53, VENUSAUR
	db 53, BLASTOISE

	db $ff ; end

; ================

	; COOLTRAINERM (2)
	db "AARON@"
	db 0 ; normal

	; party
	db 45, IVYSAUR
	db 45, CHARMELEON
	db 45, WARTORTLE

	db $ff ; end

; ================

	; COOLTRAINERM (3)
	db "PAUL@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, DRATINI, CHARCOAL
	db 57, DRATINI, DRAGON_FANG
	db 59, DRAGONAIR, MINT_BERRY

	db $ff ; end

; ================

	; COOLTRAINERM (4)
	db "CODY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, HORSEA, FOCUS_BAND
	db 59, SEADRA, DRAGON_FANG

	db $ff ; end

; ================

	; COOLTRAINERM (5)
	db "MIKE@"
	db 0 ; normal

	; party
	db 57, ONIX
	db 59, STEELIX

	db $ff ; end

; ================

	; COOLTRAINERM (6)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 82, VICTREEBEL
	db 82, KINGLER
	db 84, FLAREON
	db 84, MACHAMP

	db $ff ; end

; ================

	; COOLTRAINERM (7)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 96, VICTREEBEL
	db 97, KINGLER
	db 98, FLAREON
	db 99, SNORLAX
	db 100, MACHAMP

	db $ff ; end

; ================

	; COOLTRAINERM (8)
	db "RYAN@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, CHANSEY, LUCKY_PUNCH
	db 56, DUGTRIO, KINGS_ROCK
	db 57, CLEFABLE, QUICK_CLAW

	db $ff ; end

; ================

	; COOLTRAINERM (9)
	db "JAKE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 60, CORSOLA, QUICK_CLAW
	db 61, PARASECT, MIRACLEBERRY
	db 62, MAGCARGO, LEFTOVERS

	db $ff ; end

; ================

	; COOLTRAINERM (10)
	db "GAVEN@"
	db 0 ; normal

	; party

	db 60, WEEPINBELL
	db 61, KINGLER
	db 62, FLAREON
	db 63, MACHAMP

	db $ff ; end

; ================

	; COOLTRAINERM (11)
	db "BLAKE@"
	db 0 ; normal

	; party

	db 58, JYNX
	db 59, HITMONTOP
	db 60, MAGNETON

	db $ff ; end

; ================

	; COOLTRAINERM (12)
	db "BRIAN@"
	db 0 ; normal

	; party

	db 59, STARMIE
	db 59, MILTANK

	db $ff ; end

; ================

	; COOLTRAINERM (13)
	db "ERICK@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (14)
	db "ANDY@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (15)
	db "TYLER@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (16)
	db "SEAN@"
	db 0 ; normal

	; party
	db 78, TANGELA
	db 80, RAICHU
	db 82, TAUROS

	db $ff ; end

; ================

	; COOLTRAINERM (17)
	db "KEVIN@"
	db 0 ; normal

	; party
	db 82, HERACROSS
	db 82, URSARING
	db 82, SCIZOR

	db $ff ; end

; ================

	; COOLTRAINERM (18)
	db "STEVE@"
	db 0 ; normal

	; party
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (19)
	db "ALLEN@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 56,CHARMELEON, FOCUS_BAND
	db 56,BELLOSSOM, QUICK_CLAW

	db $ff ; end

; ================

	; COOLTRAINERM (20)
	db "DARIN@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 61, MEGANIUM, LEFTOVERS

	db $ff ; end

	db "BONITA@"
	db 0 ; normal

	db 90, GRANBULL
	db 92, SUDOWOODO
	db $ff


	; COOLTRAINERM (Rematch)
	db "MIKE@"
	db 0 ; normal

	; party
	db 100, STEELIX
	db 100, AERODACTYL
	db 100, TYPHLOSION

	db $ff ; end

	; COOLTRAINERM (Rematch)
	db "PAUL@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 100, KINGDRA, DRAGON_FANG
	db 100, DRAGONITE, DRAGON_FANG
	db 100, DRAGONAIR, MINT_BERRY

	db $ff ; end

	db "CHASE@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, PORYGON2
		db THUNDERBOLT
		db ICE_BEAM
		db 0
		db 0

	db 100, RAPIDASH
		db WILD_CHARGE
		db FLAME_WHEEL
		db 0
		db 0
	db 100, MISDREAVUS
		db THUNDERBOLT
		db SHADOW_BALL
		db 0
		db 0

	db 100, TAUROS
		db WILD_CHARGE
		db STOMP
		db 0
		db 0

	db 100, LAPRAS
		db THUNDER
		db SURF
		db RAIN_DANCE
		db SHEER_COLD
	db $ff ; end

; ================
; ================================


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF (1)
	db "GWEN@"
	db 0 ; normal

	; party
	db 53, EEVEE
	db 53, FLAREON
	db 53, VAPOREON
	db 53, JOLTEON
	db 53, ESPEON
	db 53, UMBREON

	db $ff ; end

; ================

	; COOLTRAINERF (2)
	db "LOIS@"
	db 0 ; normal

	; party

	db 37, FORRETRESS
	db 37, HERACROSS

	db $ff ; end

; ================

	; COOLTRAINERF (3)
	db "FRAN@"
	db 0 ; normal

	; party
	db 58, GYARADOS

	db $ff ; end

; ================

	; COOLTRAINERF (4)
	db "LOLA@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 60, CHARIZARD, BITTER_BERRY

	db $ff ; end

; ================

	; COOLTRAINERF (5)
	db "KATE@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 52, SNEASEL
		db ICE_PUNCH
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; COOLTRAINERF (6)
	db "IRENE@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 48, MAGMAR
		db FIRE_PUNCH
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; COOLTRAINERF (7)
	db "KELLY@"
	db 0 ; normal

	; party

	db 55, WARTORTLE
	db 56, GRAVELER
	db 57, SCIZOR

	db $ff ; end

; ================

	; COOLTRAINERF (8)
	db "JOYCE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 60, RAPIDASH, GOLD_BERRY
	db 61, MANTINE, MIRACLEBERRY
	db 62, BELLOSSOM, LEFTOVERS

	db $ff ; end

; ================

	; COOLTRAINERF (9)
	db "BETH@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 59, CATERPIE, FOCUS_BAND
	db 60, CHARMANDER, CHARCOAL
	db 61, PIDGEOTTO, PINK_BOW
	db 62, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (10)
	db "REENA@"
	db 0 ; normal

	; party
	db 59, NIDOKING
	db 59, NIDOQUEEN

	db $ff ; end

; ================

	; COOLTRAINERF (11)
	db "MEGAN@"
	db 0 ; normal

	; party

	db 59, BULBASAUR
	db 59, IVYSAUR
	db 59, VENUSAUR

	db $ff ; end

; ================

	; COOLTRAINERF (12)
	db "BETH@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 79, METAPOD, FOCUS_BAND
	db 80, SQUIRTLE, BLACKGLASSES
	db 81, PIDGEOTTO, PINK_BOW
	db 82, CHARMELEON, CHARCOAL
	db 83, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (13)
	db "CAROL@"
	db 0 ; normal

	; party
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES

	db $ff ; end

; ================

	; COOLTRAINERF (14)
	db "QUINN@"
	db 0 ; normal

	; party
	db 85, PRIMEAPE
	db 85, JUMPLUFF
	db 85, STARMIE
	db 85, HOUNDOOM

	db $ff ; end

; ================

	; COOLTRAINERF (15)
	db "EMMA@"
	db 0 ; normal

	; party
	db 55, LAPRAS

	db $ff ; end

; ================

	; COOLTRAINERF (16)
	db "CYBIL@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, JUMPLUFF, LEFTOVERS
	db 57, BUTTERFREE, GOLD_BERRY

	db $ff ; end

; ================

	; COOLTRAINERF (17)
	db "JENN@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 48, ELECTABUZZ
		db THUNDERPUNCH
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; COOLTRAINERF (18)
	db "BETH@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 95, BULBASAUR, LEFTOVERS
	db 96, BUTTERFREE, FOCUS_BAND
	db 95, SQUIRTLE, BLACKGLASSES
	db 97, PIDGEOT, PINK_BOW
	db 98, CHARIZARD, CHARCOAL
	db 100, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (19)
	db "REENA@"
	db 0 ; normal

	; party
	db 81, NIDORINO
	db 81, NIDORINA
	db 83, NIDOQUEEN
	db 83, NIDOKING

	db $ff ; end

; ================

	; COOLTRAINERF (20)
	db "REENA@"
	db 0 ; normal

	; party

	db 94, NIDORAN_M
	db 94, NIDORAN_F
	db 96, NIDORINA
	db 96, NIDORINO
	db 98, NIDOKING
	db 98, NIDOQUEEN

	db $ff ; end

; ================

	; COOLTRAINERF (21)
	db "CARA@"
	db 0 ; normal

	; party

	db 59, FORRETRESS
	db 61, AMPHAROS

	db $ff ; end

	db "SALMA@"
	db (1 << TRAINERTYPE_ITEM)

	db 90, SLOWKING, BERRY
	db 92, LICKITUNG, NO_ITEM
	db $ff

; ================
; ================================

	; COOLTRAINERF (Rematch)
	db "LOLA@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 100, NINETALES, CHARCOAL
	db 100, MAGCARGO, BRIGHTPOWDER
	db 100, CHARIZARD, BITTER_BERRY

	db $ff ; end


BeautyGroup:
; ================================
; ================

	; BEAUTY (1)
	db "VICTORIA@"
	db 0 ; normal

	; party

	db 30, MEOWTH
	db 31, DUNSPARCE
	db 31, AIPOM
	db 32, FURRET

	db $ff ; end

; ================

	; BEAUTY (2)
	db "SAMANTHA@"
	db 0 ; normal

	; party

	db 30, STANTLER
	db 32, GIRAFARIG

	db $ff ; end

; ================

	; BEAUTY (3)
	db "JULIE@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (4)
	db "JACLYN@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (5)
	db "BRENDA@"
	db 0 ; normal

	; party
	db 16, FURRET

	db $ff ; end

; ================

	; BEAUTY (6)
	db "CASSIE@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 79, MEOWTH, FOCUS_BAND
	db 79, EEVEE, FOCUS_BAND
	db 79, SNUBBULL, FOCUS_BAND
	db 79, TEDDIURSA, FOCUS_BAND

	db $ff ; end

; ================

	; BEAUTY (7)
	db "CAROLINE@"
	db 0 ; normal

	; party
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL

	db $ff ; end

; ================

	; BEAUTY (8)
	db "CARLENE@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (9)
	db "JESSICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (10)
	db "RACHAEL@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (11)
	db "ANGELICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (12)
	db "KENDRA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (13)
	db "VERONICA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (14)
	db "JULIA@"
	db 0 ; normal

	; party
	db 74, PARAS
	db 74, SUNKERN
	db 75, PARASECT

	db $ff ; end

; ================

	; BEAUTY (15)
	db "THERESA@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (16)
	db "VALERIE@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 34, MAREEP
		db THUNDER_WAVE
		db HEADBUTT
		db LIGHT_SCREEN
		db THUNDERBOLT

	db 34, PERSIAN
		db HEADBUTT
		db BITE
		db BUBBLEBEAM
		db NONE

	db $ff ; end

; ================

	; BEAUTY (17)
	db "OLIVIA@"
	db 0 ; normal

	; party
	db 35, MILTANK

	db $ff ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "LARRY@"
	db 0 ; normal

	; party
	db 24, GLIGAR
	db 25, QUAGSIRE

	db $ff ; end

; ================

	; POKEMANIAC (2)
	db "ANDREW@"
	db 0 ; normal

	; party
	db 48, GOLDUCK
	db 48, MAROWAK
	db 48, KINGLER

	db $ff ; end

; ================

	; POKEMANIAC (3)
	db "CALVIN@"
	db 0 ; normal

	; party
	db 50, HITMONCHAN

	db $ff ; end

; ================

	; POKEMANIAC (4)
	db "SHANE@"
	db 0 ; normal

	; party
	db 33, NIDORINO
	db 33, NIDORINA
	db 34, MR__MIME

	db $ff ; end

; ================

	; POKEMANIAC (5)
	db "BEN@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, SLOWBRO, LEFTOVERS

	db $ff ; end

; ================

	; POKEMANIAC (6)
	db "BRENT@"
	db 0 ; normal

	; party
	db 36, NOCTOWL
	db 36, SNEASEL
	db 37, STANTLER

	db $ff ; end

; ================

	; POKEMANIAC (7)
	db "RON@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 35, VENONAT, QUICK_CLAW
	db 36, ARIADOS, BERRY_JUICE
	db 37, VENOMOTH, GOLD_BERRY

	db $ff ; end

; ================

	; POKEMANIAC (8)
	db "ETHAN@"
	db 0 ; normal

	; party
	db 79, RHYHORN
	db 80, SANDSLASH
	db 80, MAROWAK
	db 81, GLIGAR
	db 82, RHYDON

	db $ff ; end

; ================

	; POKEMANIAC (9)
	db "BRENT@"
	db 0 ; normal

	; party
	db 51, NOCTOWL
	db 52, STANTLER
	db 53, KANGASKHAN

	db $ff ; end

; ================

	; POKEMANIAC (10)
	db "BRENT@"
	db 0 ; normal

	; party

	db 74, NOCTOWL
	db 75, PORYGON
	db 76, KANGASKHAN

	db $ff ; end

; ================

	; POKEMANIAC (11)
	db "ISSAC@"
	db 0 ; normal

	; party

	db 30, LICKITUNG

	db $ff ; end

; ================

	; POKEMANIAC (12)
	db "DONALD@"
	db 0 ; normal

	; party
	db 29, SLOWPOKE
	db 29, VULPIX

	db $ff ; end

; ================

	; POKEMANIAC (13)
	db "ZACH@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, SLOWKING, QUICK_CLAW

	db $ff ; end

; ================

	; POKEMANIAC (14)
	db "BRENT@"
	db 0 ; normal

	; party

	db 98, KANGASKHAN
	db 99, CHANSEY
	db 100, PORYGON2

	db $ff ; end

; ================

	; POKEMANIAC (15)
	db "MILLER@"
	db 0 ; normal

	; party
	db 34, NIDOKING
	db 34, NIDOQUEEN

	db $ff ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; GRUNTM (1)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 27, PSYDUCK, GOLD_BERRY
	db 27, GASTLY, FOCUS_BAND
	db 28, DUNSPARCE, LEFTOVERS
	db 30, SNEASEL, KINGS_ROCK


	db $ff ; end

; ================

	; GRUNTM (2)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, WOOPER
	db 23, MANKEY
	db 27, WOBBUFFET

	db $ff ; end

; ================

	; GRUNTM (3)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 49, HOOTHOOT
	db 50, DIGLETT
	db 51, RATICATE

	db $ff ; end

; ================

	; GRUNTM (4)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 51, SLUGMA
	db 51, GRIMER
	db 53, MISDREAVUS

	db $ff ; end

; ================

	; GRUNTM (5)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 50, TANGELA
	db 50, MARILL
	db 50, FLAAFFY
	db 50, PERSIAN

	db $ff ; end

; ================

	; GRUNTM (6)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 51, MACHOKE, BERSERK_GENE
	db 52, PINSIR, BERSERK_GENE
	db 53, GIRAFARIG, BERSERK_GENE

	db $ff ; end

; ================

	; GRUNTM (7)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 51, SPINARAK
	db 51, RHYHORN
	db 51, VENONAT
	db 52, DROWZEE
	db 53, DUNSPARCE

	db $ff ; end

; ================

	; GRUNTM (8)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 51, LEDYBA
	db 52, WEEZING
	db 53, YANMA

	db $ff ; end

; ================

	; GRUNTM (9)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 53, AZUMARILL, LEFTOVERS
	db 56, MAROWAK, THICK_CLUB


	db $ff ; end

; ================

	; GRUNTM (10)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 51, CUBONE, THICK_CLUB
	db 51, FURRET, LEFTOVERS
	db 53, HAUNTER, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (11)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 51, PSYDUCK
	db 53, PARASECT

	db $ff ; end

; ================

	; GRUNTM (12)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 33, HOUNDOUR

	db $ff ; end

; ================

	; GRUNTM (13)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 53, PHANPY
	db 53, SUNFLORA

	db $ff ; end

; ================

	; GRUNTM (14)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 51, NIDORAN_M
	db 51, NIDORAN_F
	db 53, NIDORINA
	db 53, NIDORINO

	db $ff ; end

; ================

	; GRUNTM (15)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 53, WOBBUFFET, GOLD_BERRY
	db 55, STEELIX, LEFTOVERS

	db $ff ; end

; ================

	; GRUNTM (16)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 37, AIPOM
	db 37, EEVEE
	db 37, SENTRET
	db 38, LICKITUNG

	db $ff ; end

; ================

	; GRUNTM (17)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 35, ZUBAT
	db 36, GOLBAT
	db 37, CROBAT

	db $ff ; end

; ================

	; GRUNTM (18)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 36, ONIX
	db 37, STEELIX

	db $ff ; end

; ================

	; GRUNTM (19)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 36, WOOPER
	db 37, GRIMER
	db 37, EKANS
	db 38, QUAGSIRE

	db $ff ; end

; ================

	; GRUNTM (20)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 37, SPINARAK, FOCUS_BAND
	db 38, DROWZEE, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (21)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 37, RATTATA, FOCUS_BAND
	db 38, SLUGMA, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (22)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 36, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (23)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 30, KOFFING

	db $ff ; end

; ================

	; GRUNTM (24)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 52, AIPOM, BERSERK_GENE
	db 54, XATU, BRIGHTPOWDER
	db 56, FORRETRESS, BERSERK_GENE

	db $ff ; end

; ================

	; GRUNTM (25)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 53, SWINUB
	db 53, SKIPLOOM
	db 53, MUK

	db $ff ; end

; ================

	; GRUNTM (26)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 15, RATTATA
	db 15, RATTATA

	db $ff ; end

; ================

	; GRUNTM (27)
	db "EXECUTIVE@"
	db 0 ; normal

	; party
	db 22, ZUBAT

	db $ff ; end

; ================

	; GRUNTM (28)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, SUDOWOODO, FOCUS_BAND
	db 38, DUNSPARCE, BERRY_JUICE

	db $ff ; end

; ================

	; GRUNTM (29)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, HOUNDOUR
	db 23, EKANS
	db 27, FURRET

	db $ff ; end

; ================

	; GRUNTM (30)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK

	db $ff ; end

; ================

	; GRUNTM (31)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 83, MISDREAVUS
	db 83, PORYGON2
	db 84, SKARMORY
	db 84, CROBAT

	db $ff ; end

; ================

; 32
	db "GRUNT@"
	db 0
	db 12, RATTATA
	db 12, KOFFING
	db $ff

; 33
	db "GRUNT@"
	db 0
	db 12, ZUBAT
	db 14, GRIMER
	db 12, RATTATA
	db $ff

; 34
	db "GRUNT@"
	db 0
	db 12, ZUBAT
	db 12, EKANS
	db $ff

; 35
	db "GRUNT@"
	db 0
	db 13, RATTATA
	db 13, ZUBAT
	db $ff

; 36
	db "GRUNT@"
	db 0
	db 15, EKANS
	db 15, ZUBAT
	db $ff

; 37
	db "GRUNT@"
	db 0
	db 17, MACHOP
	db 17, DROWZEE
	db $ff

; ================================

GentlemanGroup:
; ================================
; ================

	; GENTLEMAN (1)
	db "PRESTON@"
	db 0 ; normal

	; party
	db 46, ELECTABUZZ

	db $ff ; end

; ================

	; GENTLEMAN (2)
	db "EDWARD@"
	db 0 ; normal

	; party
	db 80, ARCANINE
	db 80, PERSIAN
	db 80, RAPIDASH
	db 80, KANGASKHAN
	db 80, SLOWKING

	db $ff ; end

; ================

	; GENTLEMAN (3)
	db "GREGORY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 72, AMPHAROS, KINGS_ROCK

	db $ff ; end

; ================

	; GENTLEMAN (4)
	db "VIRGIL@"
	db 0 ; normal

	; party
	db 20, PONYTA

	db $ff ; end

; ================

	; GENTLEMAN (5)
	db "ALFRED@"
	db 0 ; normal

	; party
	db 45, QUILAVA

	db $ff ; end

	db "HUGO@"
	db 0
	db 18, POLIWAG
	db 18, HORSEA
	db $ff

	db "JASPER@"
	db 0
	db 18, BELLSPROUT
	db 18, ODDISH
	db $ff

	db "DARIAN@"
	db 0
	db 18, GROWLITHE
	db 18, VULPIX
	db $ff

	db "DIRK@"
	db 0
	db 18, VOLTORB
	db 18, MAGNEMITE
	db $ff

	db "ARTHUR@"
	db 0
	db 19, NIDORAN_M
	db 19, NIDORAN_F
	db $ff

	db "THOMAS@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 18, GROWLITHE, "FIDO@"
	db 18, GROWLITHE, "MAX@"
	db $ff

	db "BROOKS@"
	db (1 << TRAINERTYPE_ITEM)
	db 23, PIKACHU, LIGHT_BALL
	db $ff

	db "LAMAR@"
	db 0
	db 17, GROWLITHE
	db 17, PONYTA
	db $ff

	db "GREGORY@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, FLAAFFY, FOCUS_BAND
		db THUNDERPUNCH
		db FIRE_PUNCH
		db CONFUSE_RAY
		db THUNDER_WAVE
	db 100, PIKACHU, LIGHT_BALL
		db THUNDERBOLT
		db SURF
		db FLY
		db DIG

	db 100, AMPHAROS, DRAGON_SCALE
		db THUNDER
		db DRAGON_PULSE
		db FLASH_CANNON
		db HYPER_BEAM
	db $ff ; end

; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER (1)
	db "ROXANNE@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 44, DELIBIRD
		db ICE_BEAM
		db FLY
		db TOXIC
		db PROTECT

	db $ff ; end

; ================

	; SKIER (2)
	db "CLARISSA@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, SNEASEL, FOCUS_BAND

	db $ff ; end

; ================

	; TEACHER (4)
	db "HELENNA@"
	db 0 ; normal

	; party
	db 85, PICHU
	db 85, PICHU

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER (1)
	db "COLETTE@"
	db 0 ; normal

	; party
	db 76, JYNX

	db $ff ; end

; ================

	; TEACHER (2)
	db "HILLARY@"
	db 0 ; normal

	; party
	db 76, MACHAMP

	db $ff ; end

; ================

	; TEACHER (3)
	db "SHIRLEY@"
	db 0 ; normal

	; party
	db 80, JIGGLYPUFF
	db 80, CLEFAIRY
	db 82, WIGGLYTUFF
	db 82, CLEFABLE

	db $ff ; end

; ================
; ================================


SabrinaGroup:
; ================================
; ================

	; SABRINA (1)
	db "SABRINA@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 76, XATU, SHARP_BEAK
		db PSYCHIC_M
		db FUTURE_SIGHT
		db DRILL_PECK
		db RECOVER

	db 76, ESPEON ,GOLD_BERRY
		db PSYCHIC_M
		db SWIFT
		db MORNING_SUN
		db SAND_ATTACK

	db 77, JYNX, NEVERMELTICE
		db PSYCHIC_M
		db ICE_BEAM
		db LIGHT_SCREEN
		db LOVELY_KISS

	db 77, EXEGGUTOR, MIRACLE_SEED
		db PSYCHIC_M
		db SEED_BOMB
		db LEECH_SEED
		db SYNTHESIS

	db 78, MR__MIME, PINK_BOW
		db PSYCHIC_M
		db MOONBLAST
		db BARRIER
		db BATON_PASS

	db 79, ALAKAZAM, TWISTEDSPOON
		db PSYCHIC_M
		db SHADOW_BALL
		db FUTURE_SIGHT
		db RECOVER

	db $ff ; end

	; SABRINA (2)
	db "SABRINA@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, MEW, CONFUSEGUARD
		db PSYCHIC_M
		db FLAMETHROWER
		db LOVELY_KISS
		db BATON_PASS

	db 100, GIRAFARIG, LEFTOVERS
		db ZEN_HEADBUTT
		db HYPER_BEAM
		db AGILITY
		db BATON_PASS

	db 100, ESPEON, CONFUSEGUARD
		db PSYCHIC_M
		db DAZZLINGLEAM
		db DOUBLE_TEAM
		db BATON_PASS

	db 100, EXEGGUTOR, MIRACLE_SEED
		db PSYCHIC_M
		db GIGA_DRAIN
		db LEECH_SEED
		db SYNTHESIS

	db 100, MR__MIME, PINK_BOW
		db PSYCHIC_M
		db MOONBLAST
		db BARRIER
		db BATON_PASS

	db 100, ALAKAZAM, TWISTEDSPOON
		db PSYCHIC_M
		db SHADOW_BALL
		db FUTURE_SIGHT
		db RECOVER

	db $ff ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "DON@"
	db 0

	; party
	db 20, LEDYBA
	db 21, SPINARAK
	db 23, LEDIAN

	db $ff ; end

; ================

	; BUG_CATCHER (2)
	db "ROB@"
	db 0 ; normal

	; party
	db 84, BEEDRILL
	db 84, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (3)
	db "ED@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 84, WEEDLE, QUICK_CLAW
	db 84, CATERPIE, QUICK_CLAW
	db 84, KAKUNA, FOCUS_BAND
	db 84, METAPOD, FOCUS_BAND
	db 84, PINSIR, LEFTOVERS

	db $ff ; end

; ================

	; BUG_CATCHER (4)
	db "WADE@"
	db 0 ; normal

	; party
	db 20, PINECO
	db 20, HOPPIP
	db 22, PINECO
	db 23, ARIADOS

	db $ff ; end

; ================

	; BUG_CATCHER (5)
	db "BENNY@"
	db 0 ; normal

	; party
	db 26, SHUCKLE
	db 25, PARASECT
	db 27, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (6)
	db "AL@"
	db 0 ; normal

	; party
	db 26, PINECO
	db 25, PARAS
	db 25, VENONAT
	db 28, YANMA

	db $ff ; end

; ================

	; BUG_CATCHER (7)
	db "JOSH@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 27, LEDIAN
		db DYNAMICPUNCH
		db ICE_PUNCH
		db THUNDERPUNCH
		db NONE

	db 27, ARIADOS
		db SLUDGE_BOMB
		db PROTECT
		db DISABLE
		db DIG

	db $ff ; end

; ================

	; BUG_CATCHER (8)
	db "ARNIE@"
	db 0 ; normal

	; party
	db 28, SCYTHER
	db 30, YANMA

	db $ff ; end

; ================

	; BUG_CATCHER (9)
	db "KEN@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 78, SPINARAK, FOCUS_BAND
	db 78, PARAS, FOCUS_BAND
	db 78, VENONAT, FOCUS_BAND
	db 78, LEDYBA, FOCUS_BAND
	db 80, SCYTHER, GOLD_BERRY
	db 82, PINSIR, QUICK_CLAW

	db $ff ; end

; ================

	; BUG_CATCHER (10)
	db "WADE@"
	db 0 ; normal

	; party
	db 30, PINECO
	db 31, ARIADOS
	db 32, SKIPLOOM

	db $ff ; end

; ================

	; BUG_CATCHER (11)
	db "WADE@"
	db 0 ; normal

	; party
	db 40, PINECO
	db 41, ARIADOS
	db 42, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (12)
	db "DOUG@"
	db 0 ; normal

	; party
	db 84, PINECO
	db 84, LEDIAN
	db 84, ARIADOS

	db $ff ; end

; ================

	; BUG_CATCHER (13)
	db "ARNIE@"
	db 0 ; normal

	; party
	db 39, PARAS
	db 41, YANMA
	db 43, SCYTHER

	db $ff ; end

; ================

	; BUG_CATCHER (14)
	db "ARNIE@"
	db 0 ; normal

	; party

	db 60, VENONAT
	db 60, YANMA
	db 60, PARASECT
	db 60, SCYTHER

	db $ff ; end

; ================

	; BUG_CATCHER (15)
	db "WADE@"
	db 0 ; normal

	; party

	db 60, FORRETRESS
	db 61, ARIADOS
	db 62, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (16)
	db "WADE@"
	db 0 ; normal

	; party

	db 80, FORRETRESS
	db 82, BUTTERFREE
	db 83, ARIADOS
	db 82, BEEDRILL
	db 83, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (17)
	db "ARNIE@"
	db 0 ; normal

	; party

	db 80, YANMA
	db 80, PARASECT
	db 80, SCYTHER
	db 80, VENOMOTH

	db $ff ; end

; ================

	; BUG_CATCHER (18)
	db "ARNIE@"
	db 0 ; normal

	; party

	db 95, YANMA
	db 95, VENOMOTH
	db 95, PARASECT
	db 95, SCIZOR

	db $ff ; end

; ================

	; BUG_CATCHER (19)
	db "WAYNE@"
	db 0 ; normal

	; party
	db 26, FARFETCH_D
	db 27, HERACROSS

	db $ff ; end

	db "RICK@"
	db 0
	db 6, WEEDLE
	db 6, CATERPIE
	db $ff

	db "DOUG@"
	db 0
	db 7, WEEDLE
	db 7, KAKUNA
	db 7, WEEDLE
	db $ff

	db "CHUCK@"
	db 0
	db 7, CATERPIE
	db 7, METAPOD
	db 7, CATERPIE
	db $ff

	db "SAMMY@"
	db 0
	db 9, WEEDLE
	db $ff

	db "GREG@"
	db 0
	db 9, WEEDLE
	db 9, KAKUNA
	db 9, CATERPIE
	db 9, METAPOD
	db $ff

	db "COLTON@"
	db 0
	db 10, CATERPIE
	db 10, WEEDLE
	db 10, CATERPIE
	db $ff

	db "JAMES@"
	db 0
	db 11, CATERPIE
	db 11, METAPOD
	db $ff

; ================

	db "KENT@"
	db 0
	db 11, WEEDLE
	db 11, KAKUNA
	db $ff

	db "ROBBY@"
	db 0
	db 10, CATERPIE
	db 12, METAPOD
	db 10, CATERPIE
	db $ff

	db "CALE@"
	db 0
	db 10, CATERPIE
	db 10, WEEDLE
	db 11, METAPOD
	db 11, KAKUNA
	db $ff

	db "KEIGO@"
	db 0
	db 16, WEEDLE
	db 16, CATERPIE
	db 18, WEEDLE
	db $ff

	db "ELIJAH@"
	db 0
	db 20, BUTTERFREE
	db $ff

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "JUSTIN@"
	db 0 ; normal

	; party
	db 20,REMORAID
	db 20,GOLDEEN
	db 22,REMORAID
	db 25,OCTILLERY

	db $ff ; end

; ================

	; FISHER (2)
	db "RALPH@"
	db 0 ; normal

	; party
	db 25, GOLDEEN

	db $ff ; end

; ================

	; FISHER (3)
	db "ARNOLD@"
	db 0 ; normal

	; party
	db 85, TENTACRUEL

	db $ff ; end

; ================

	; FISHER (4)
	db "KYLE@"
	db 0 ; normal

	; party
	db 77, HORSEA
	db 77, POLIWAG
	db 77, KRABBY
	db 78, SEADRA

	db $ff ; end

; ================

	; FISHER (5)
	db "HENRY@"
	db 0 ; normal

	; party
	db 23, WARTORTLE

	db $ff ; end

; ================

	; FISHER (6)
	db "MARVIN@"
	db 0 ; normal

	; party
	db 35, YANMA
	db 36, LEDIAN
	db 37, POLITOED

	db $ff ; end

; ================

	; FISHER (7)
	db "TULLY@"
	db 0 ; normal

	; party
	db 34, POLIWHIRL
	db 34, SEAKING

	db $ff ; end

; ================

	; FISHER (8)
	db "ANDRE@"
	db 0 ; normal

	; party
	db 38, GYARADOS

	db $ff ; end

; ================

	; FISHER (9)
	db "RAYMOND@"
	db 0 ; normal

	; party
	db 35, MAGIKARP
	db 40, MAGIKARP
	db 45, MAGIKARP
	db 45, FERALIGATR

	db $ff ; end

; ================

	; FISHER (10)
	db "WILTON@"
	db 0 ; normal

	; party
	db 55, POLIWAG
	db 56, POLIWHIRL
	db 57, POLITOED

	db $ff ; end

; ================

	; FISHER (11)
	db "EDGAR@"
	db 0 ; normal

	; party

	db 56, QWILFISH
	db 56, OCTILLERY

	db $ff ; end

; ================

	; FISHER (12)
	db "JONAH@"
	db 0 ; normal

	; party
	db 78, POLIWAG
	db 78, GOLDEEN
	db 78, TENTACOOL
	db 78, SEEL
	db 82, CLOYSTER

	db $ff ; end

; ================

	; FISHER (13)
	db "MARTIN@"
	db 0 ; normal

	; party
	db 77, POLIWHIRL
	db 78, KINGLER
	db 79, POLIWRATH

	db $ff ; end

; ================

	; FISHER (14)
	db "STEPHEN@"
	db 0 ; normal

	; party
	db 76, GASTLY
	db 79, HAUNTER

	db $ff ; end

; ================

	; FISHER (15)
	db "BARNEY@"
	db 0 ; normal

	; party
	db 60, GYARADOS
	db 70, GYARADOS
	db 80, GYARADOS

	db $ff ; end

; ================

	; FISHER (16)
	db "RALPH@"
	db 0 ; normal

	; party
	db 35, GOLDEEN

	db $ff ; end

; ================

	; FISHER (17)
	db "RALPH@"
	db 0 ; normal

	; party
	db 42, GOLDEEN
	db 44, SEAKING

	db $ff ; end

; ================

	; FISHER (18)
	db "TULLY@"
	db 0 ; normal

	; party
	db 44, MARILL
	db 45, POLIWHIRL
	db 46, SEAKING

	db $ff ; end

; ================

	; FISHER (19)
	db "TULLY@"
	db 0 ; normal

	; party
	db 80, POLIWRATH
	db 81, SEAKING
	db 82, AZUMARILL

	db $ff ; end

; ================

	; FISHER (20)
	db "WILTON@"
	db 0 ; normal

	; party
	db 80, POLIWAG
	db 81, POLIWHIRL
	db 82, POLITOED

	db $ff ; end

; ================

	; FISHER (21)
	db "SCOTT@"
	db 0 ; normal

	; party
	db 58, SEAKING
	db 60, GOLDUCK
	db 62, BLASTOISE

	db $ff ; end

; ================

	; FISHER (22)
	db "WILTON@"
	db 0 ; normal

	; party

	db 94, POLIWAG
	db 95, POLIWHIRL
	db 96, POLITOED
	db 97, POLIWRATH

	db $ff ; end

; ================

	; FISHER (23)
	db "RALPH@"
	db 0 ; normal

	; party
	db 62, WARTORTLE
	db 64, SEAKING

	db $ff ; end

; ================

	; FISHER (24)
	db "RALPH@"
	db 0 ; normal

	; party

	db 82, SEAKING
	db 84, BLASTOISE


	db $ff ; end

; ================

	; FISHER (25)
	db "TULLY@"
	db 0 ; normal

	; party

	db 95, SEAKING
	db 95, AZUMARILL
	db 95, POLITOED

	db $ff ; end

	db "DALE@"
	db 0
	db 17, GOLDEEN
	db 19, GOLDEEN
	db 17, TENTACOOL
	db $ff

	db "BARNY@"
	db 0
	db 17, TENTACOOL
	db 17, STARYU
	db 17, SHELLDER
	db $ff

	db "WILLY@"
	db 0
	db 95, MAGIKARP
	db 95, MAGIKARP
	db 95, MAGIKARP
	db 95, MAGIKARP
	db 95, MAGIKARP
	db 95, MAGIKARP
	db $ff

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "HAROLD@"
	db 0 ; normal

	; party
	db 85, WEEZING
	db 85, RHYDON

	db $ff ; end

; ================

	; SWIMMERM (2)
	db "SIMON@"
	db 0 ; normal

	; party
	db 45, HORSEA
	db 46, AZUMARILL

	db $ff ; end

; ================

	; SWIMMERM (3)
	db "RANDALL@"
	db 0 ; normal

	; party
	db 44, MANKEY
	db 45, AIPOM
	db 46, SQUIRTLE

	db $ff ; end

; ================

	; SWIMMERM (4)
	db "CHARLIE@"
	db 0 ; normal

	; party
	db 45, TENTACOOL
	db 46, FEAROW
	db 47, TENTACRUEL

	db $ff ; end

; ================

	; SWIMMERM (5)
	db "GEORGE@"
	db 0 ; normal

	; party
	db 45, REMORAID
	db 45, MARILL
	db 45, HORSEA
	db 45, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERM (6)
	db "BERKE@"
	db 0 ; normal

	; party
	db 47, LANTURN

	db $ff ; end

; ================

	; SWIMMERM (7)
	db "KIRK@"
	db 0 ; normal

	; party
	db 47, PIDGEOT
	db 47, QUAGSIRE

	db $ff ; end

; ================

	; SWIMMERM (8)
	db "MATHEW@"
	db 0 ; normal

	; party
	db 47, OCTILLERY

	db $ff ; end

; ================

	; SWIMMERM (9)
	db "HAL@"
	db 0 ; normal

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db $ff ; end

; ================

	; SWIMMERM (10)
	db "PATON@"
	db 0 ; normal

	; party
	db 26, PILOSWINE
	db 26, PILOSWINE

	db $ff ; end

; ================

	; SWIMMERM (11)
	db "DARYL@"
	db 0 ; normal

	; party
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER

	db $ff ; end

; ================

	; SWIMMERM (12)
	db "WALTER@"
	db 0 ; normal

	; party
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA

	db $ff ; end

; ================

	; SWIMMERM (13)
	db "TONY@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (14)
	db "JEROME@"
	db 0 ; normal

	; party
	db 85, STARYU
	db 85, SEADRA
	db 85, SEAKING

	db $ff ; end

; ================

	; SWIMMERM (15)
	db "TUCKER@"
	db 0 ; normal

	; party
	db 85, SHELLDER
	db 85, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (16)
	db "RICK@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (17)
	db "CAMERON@"
	db 0 ; normal

	; party
	db 85, TENTACOOL
	db 85, GOLDUCK

	db $ff ; end

; ================

	; SWIMMERM (18)
	db "SETH@"
	db 0 ; normal

	; party
	db 85, SHELLDER
	db 85, KRABBY
	db 85, VAPOREON

	db $ff ; end

; ================

	; SWIMMERM (19)
	db "JAMES@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (20)
	db "LEWIS@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (21)
	db "PARKER@"
	db 0 ; normal

	; party
	db 82, SQUIRTLE
	db 83, WARTORTLE
	db 84, BLASTOISE

	db $ff ; end

; ================
	; SWIMMERM (21)
	db "PARKER@"
	db 0 ; normal

	; party
	db 16, HORSEA
	db 16, SHELLDER

	db $ff ; end

; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "ELAINE@"
	db 0 ; normal

	; party
	db 46, QWILFISH

	db $ff ; end

; ================

	; SWIMMERF (2)
	db "PAULA@"
	db 0 ; normal

	; party
	db 46, SEADRA

	db $ff ; end

; ================

	; SWIMMERF (3)
	db "KAYLEE@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, CHINCHOU, FOCUS_BAND
	db 45, CHINCHOU, FOCUS_BAND
	db 47, CHINCHOU, FOCUS_BAND

	db $ff ; end

; ================

	; SWIMMERF (4)
	db "SUSIE@"
	db 0 ; normal

	; party

	db 47, SEADRA

	db $ff ; end

; ================

	; SWIMMERF (5)
	db "DENISE@"
	db 0 ; normal

	; party
	db 47, MANTINE

	db $ff ; end

; ================

	; SWIMMERF (6)
	db "KARA@"
	db 0 ; normal

	; party
	db 47, CORSOLA

	db $ff ; end

; ================

	; SWIMMERF (7)
	db "WENDY@"
	db 0 ; normal

	; party

	db 47, STARYU

	db $ff ; end

; ================

	; SWIMMERF (8)
	db "LISA@"
	db 0 ; normal

	; party
	db 28, JYNX

	db $ff ; end

; ================

	; SWIMMERF (9)
	db "JILL@"
	db 0 ; normal

	; party
	db 28, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (10)
	db "MARY@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (11)
	db "KATIE@"
	db 0 ; normal

	; party
	db 33, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (12)
	db "DAWN@"
	db 0 ; normal

	; party
	db 85, KRABBY
	db 85, KINGLER

	db $ff ; end

; ================

	; SWIMMERF (13)
	db "TARA@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (14)
	db "NICOLE@"
	db 0 ; normal

	; party
	db 85, MARILL
	db 85, LAPRAS
	db 85, AZUMARILL

	db $ff ; end

; ================

	; SWIMMERF (15)
	db "LORI@"
	db 0 ; normal

	; party
	db 85, CORSOLA

	db $ff ; end

; ================

	; SWIMMERF (16)
	db "JODY@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (17)
	db "NIKKI@"
	db 0 ; normal

	; party
	db 85, SEEL
	db 85, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (18)
	db "DIANA@"
	db 0 ; normal

	; party
	db 84, MANTINE
	db 84, LANTURN

	db $ff ; end

; ================

	; SWIMMERF (19)
	db "BRIANA@"
	db 0 ; normal

	; party
	db 84, SEAKING
	db 84, TENTACRUEL

	db $ff ; end

; ================

	db "DIANA@"
	db 0
	db 19, GOLDEEN
	db $ff
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR (1)
	db "EUGENE@"
	db 0 ; normal

	; party
	db 36, ODDISH
	db 37, TANGELA
	db 38, EXEGGCUTE

	db $ff ; end

; ================

	; SAILOR (2)
	db "HUEY@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 44, VOLTORB
		db EXPLOSION
		db NONE
		db NONE
		db NONE
	db 46, ELECTRODE
		db RAIN_DANCE
		db THUNDER
		db EXPLOSION
		db NONE

	db $ff ; end

; ================

	; SAILOR (3)
	db "TERRELL@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 44, GROWLITHE, CHARCOAL
	db 46, SMEARGLE, FOCUS_BAND

	db $ff ; end

; ================

	; SAILOR (4)
	db "KENT@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 47, SLOWPOKE
		db ZAP_CANNON
		db FLAMETHROWER
		db PSYCHIC_M
		db ICE_BEAM

	db 48, KRABBY
		db CRABHAMMER
		db FISSURE
		db ROCK_SMASH
		db ATTRACT

	db $ff ; end

; ================

	; SAILOR (5)
	db "ERNEST@"
	db 0 ; normal

	; party
	db 44, REMORAID
	db 46, REMORAID
	db 48, REMORAID

	db $ff ; end

; ================

	; SAILOR (6)
	db "JEFF@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, RATICATE, PINK_BOW

	db $ff ; end

; ================

	; SAILOR (7)
	db "GARRETT@"
	db 0 ; normal

	; party
	db 79, SLOWPOKE
	db 79, STARYU
	db 81, GOLDUCK

	db $ff ; end

; ================

	; SAILOR (8)
	db "KENNETH@"
	db 0 ; normal

	; party
	db 81, SUNFLORA
	db 81, DODRIO
	db 82, POLIWRATH

	db $ff ; end

; ================

	; SAILOR (9)
	db "STANLY@"
	db 0 ; normal

	; party
	db 68, MACHOP
	db 69, PSYDUCK
	db 70, MACHOKE

	db $ff ; end

; ================

	; SAILOR (10)
	db "HARRY@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 33, CROCONAW
		db SCARY_FACE
		db SCRATCH
		db WATER_GUN
		db LEER
	db 36, SENTRET
		db CUT
		db DEFENSE_CURL
		db FORESIGHT
		db NONE

	db $ff ; end

; ================

	; SAILOR (11)
	db "HUEY@"
	db 0 ; normal

	; party
	db 61, VOLTORB
	db 63, ELECTRODE

	db $ff ; end

; ================

	; SAILOR (12)
	db "HUEY@"
	db 0 ; normal

	; party
	db 81, VOLTORB
	db 83, ELECTRODE

	db $ff ; end

; ================

	; SAILOR (13)
	db "HUEY@"
	db 0 ; normal

	; party

	db 94, VOLTORB
	db 96, ELECTRODE

	db $ff ; end

; ================

	db "TREVOR@"
	db 0
	db 17, MACHOP
	db 17, TENTACOOL
	db $ff

	db "EDMOND@"
	db 0
	db 18, MACHOP
	db 18, SHELLDER
	db $ff

	db "PHILLIP@"
	db 0
	db 20, MACHOP
	db $ff

	db "HUEY@"
	db 0
	db 18, TENTACOOL
	db 18, STARYU
	db $ff

	db "DYLAN@"
	db 0
	db 17, HORSEA
	db 18, HORSEA
	db 19, HORSEA
	db $ff

	db "DUNCAN@"
	db 0
	db 17, HORSEA
	db 19, SHELLDER
	db 17, TENTACOOL
	db $ff

	db "LEONARD@"
	db 0
	db 21, SHELLDER
	db $ff
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD (1)
	db "STAN@"
	db 0 ; normal

	; party
	db 20, GRIMER

	db $ff ; end

; ================

	; SUPER_NERD (2)
	db "ERIC@"
	db 0 ; normal

	; party
	db 30, PORYGON

	db $ff ; end

; ================

	; SUPER_NERD (3)
	db "GREGG@"
	db 0 ; normal

	; party
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (4)
	db "JAY@"
	db 0 ; normal

	; party
	db 22, KOFFING
	db 22, KOFFING

	db $ff ; end

; ================

	; SUPER_NERD (5)
	db "DAVE@"
	db 0 ; normal

	; party
	db 24, DITTO

	db $ff ; end

; ================

	; SUPER_NERD (6)
	db "SAM@"
	db 0 ; normal

	; party
	db 72, GRIMER
	db 72, EKANS
	db 72, KOFFING

	db $ff ; end

; ================

	; SUPER_NERD (7)
	db "TOM@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, GASTLY, BRIGHTPOWDER
	db 70, MANKEY, BLACKBELT
	db 71, KADABRA, FOCUS_BAND
	db 71, WIGGLYTUFF, POLKADOT_BOW
	db 72, HAUNTER, BRIGHTPOWDER

	db $ff ; end

; ================

	; SUPER_NERD (8)
	db "PAT@"
	db 0 ; normal

	; party
	db 82, PORYGON2

	db $ff ; end

; ================

	; SUPER_NERD (9)
	db "SHAWN@"
	db 0 ; normal

	; party
	db 81, PORYGON
	db 81, MISDREAVUS
	db 81, MAGNETON

	db $ff ; end

; ================

	; SUPER_NERD (10)
	db "TERU@"
	db 0 ; normal

	; party
	db 29, MAGNEMITE
	db 29, VOLTORB

	db $ff ; end

; ================

	; SUPER_NERD (11)
	db "RUSS@"
	db 0 ; normal

	; party
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (12)
	db "NORTON@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 30, PORYGON
		db CONVERSION
		db CONVERSION2
		db RECOVER
		db TRI_ATTACK

	db $ff ; end

; ================

	; SUPER_NERD (13)
	db "HUGH@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 60, MAGCARGO
		db STRENGTH
		db FLAMETHROWER
		db REST
		db ACID_ARMOR

	db 60, FERALIGATR
		db WATERFALL
		db SCARY_FACE
		db SCREECH
		db ICE_PUNCH

	db $ff ; end

; ================

	; SUPER_NERD (14)
	db "MARKUS@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 33, PORYGON
		db RAIN_DANCE
		db THUNDER
		db CONVERSION
		db SWIFT

	db 35, STARMIE
		db SURF
		db CONFUSION
		db MINIMIZE
		db RECOVER

	db $ff ; end

; ================

	; SUPER_NERD (15)
	db "MIGUEL@"
	db 0 ; normal

	; party
	db 68, MUK
	db 68, ELECTRODE
	db 68, WEEZING
	db 70, OMASTAR
	db 70, KABUTOPS

	db $ff ; end

; ================

	db "JOVAN@"
	db 0
	db 11, MAGNEMITE
	db 11, VOLTORB
	db $ff

	db "MIGUEL@"
	db 0
	db 12, GRIMER
	db 12, VOLTORB
	db 12, KOFFING
	db $ff
; ================================


Rival2Group:
; ================================
; ================

	; RIVAL2 (1)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 91, SNEASEL, BRIGHTPOWDER
		db QUICK_ATTACK
		db SCREECH
		db CRUNCH
		db FURY_CUTTER

	db 94, GOLBAT,LEFTOVERS
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db AIR_SLASH

	db 92, TYRANITAR, BLACKGLASSES
		db ROCK_SLIDE
		db PURSUIT
		db ROAR
		db ROCK_POLISH

	db 92, MAGNETON, MAGNET
		db THUNDER
		db FLASH_CANNON
		db THUNDER_WAVE
		db EXPLOSION

	db 93, BLISSEY, GOLD_BERRY
		db TRI_ATTACK
		db HEAL_BELL
		db TOXIC
		db SOFTBOILED

	db 95, MEGANIUM, MIRACLE_SEED
		db SEED_BOMB
		db OUTRAGE
		db SYNTHESIS
		db SWORDS_DANCE

	db $ff ; end

; ================

	; RIVAL2 (2)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) ; normal

	; party

	db 91, SNEASEL, BRIGHTPOWDER
		db QUICK_ATTACK
		db SCREECH
		db CRUNCH
		db FURY_CUTTER

	db 94, GOLBAT,LEFTOVERS
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db AIR_SLASH

	db 92, TYRANITAR, BLACKGLASSES
		db ROCK_SLIDE
		db PURSUIT
		db ROAR
		db ROCK_POLISH

	db 92, MAGNETON, MAGNET
		db THUNDER
		db FLASH_CANNON
		db THUNDER_WAVE
		db EXPLOSION

	db 93, BLISSEY, GOLD_BERRY
		db TRI_ATTACK
		db HEAL_BELL
		db TOXIC
		db SOFTBOILED

	db 95, TYPHLOSION, CHARCOAL
		db WILLOWISP
		db HEAT_WAVE
		db EARTHQUAKE
		db ROAR

	db $ff ; end

; ================

	; RIVAL2 (3)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) ; normal

	; party

	db 91, SNEASEL, BRIGHTPOWDER
		db QUICK_ATTACK
		db SCREECH
		db CRUNCH
		db FURY_CUTTER

	db 94, GOLBAT,LEFTOVERS
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db AIR_SLASH

	db 92, TYRANITAR, BLACKGLASSES
		db ROCK_SLIDE
		db PURSUIT
		db ROAR
		db ROCK_POLISH

	db 92, MAGNETON, MAGNET
		db THUNDER
		db FLASH_CANNON
		db THUNDER_WAVE
		db EXPLOSION

	db 93, BLISSEY, GOLD_BERRY
		db TRI_ATTACK
		db HEAL_BELL
		db TOXIC
		db SOFTBOILED

	db 95, FERALIGATR, MYSTIC_WATER
		db SWORDS_DANCE
		db WATERFALL
		db OUTRAGE
		db AQUA_JET

	db $ff ; end

; ================

	; RIVAL2 (4)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, SNEASEL, BLACKGLASSES
		db IRON_TAIL
		db ICE_PUNCH
		db CRUNCH
		db PURSUIT

	db 100, CROBAT, KINGS_ROCK
		db SLUDGE_BOMB
		db NASTY_PLOT
		db CONFUSE_RAY
		db AIR_SLASH

	db 100, MAGNETON, MAGNET
		db THUNDERBOLT
		db FLASH_CANNON
		db THUNDER_WAVE
		db REFLECT

	db 100, TYRANITAR, HARD_STONE
		db CRUNCH
		db CURSE
		db ROCK_SLIDE
		db FIRE_PUNCH

	db 100, BLISSEY, LEFTOVERS
		db REFLECT
		db SOFTBOILED
		db TOXIC
		db SEISMIC_TOSS

	db 100, MEGANIUM, GOLD_BERRY
		db SOLARBEAM
		db SYNTHESIS
		db EARTH_POWER
		db SUNNY_DAY

	db $ff ; end

; ================

	; RIVAL2 (5)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, SNEASEL, BLACKGLASSES
		db IRON_TAIL
		db ICE_PUNCH
		db CRUNCH
		db PURSUIT

	db 100, CROBAT, KINGS_ROCK
		db SLUDGE_BOMB
		db NASTY_PLOT
		db CONFUSE_RAY
		db AIR_SLASH

	db 100, MAGNETON, MAGNET
		db THUNDERBOLT
		db FLASH_CANNON
		db THUNDER_WAVE
		db REFLECT

	db 100, TYRANITAR, HARD_STONE
		db CRUNCH
		db CURSE
		db ROCK_SLIDE
		db FIRE_PUNCH

	db 100, BLISSEY, LEFTOVERS
		db REFLECT
		db SOFTBOILED
		db TOXIC
		db SEISMIC_TOSS

	db 100, TYPHLOSION, CHARCOAL
		db WILD_CHARGE
		db EARTHQUAKE
		db FIRE_BLAST
		db WILLOWISP

	db $ff ; end

; ================

	; RIVAL2 (6)
	db "?@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, SNEASEL, BLACKGLASSES
		db IRON_TAIL
		db ICE_PUNCH
		db CRUNCH
		db PURSUIT

	db 100, CROBAT, KINGS_ROCK
		db SLUDGE_BOMB
		db NASTY_PLOT
		db CONFUSE_RAY
		db AIR_SLASH

	db 100, MAGNETON, MAGNET
		db THUNDER
		db FLASH_CANNON
		db THUNDER_WAVE
		db REFLECT

	db 100, TYRANITAR, HARD_STONE
		db CRUNCH
		db CURSE
		db ROCK_SLIDE
		db FIRE_PUNCH

	db 100, BLISSEY, LEFTOVERS
		db REFLECT
		db SOFTBOILED
		db TOXIC
		db SEISMIC_TOSS

	db 100, FERALIGATR, MYSTIC_WATER
		db HYDRO_PUMP
		db RAIN_DANCE
		db ICE_PUNCH
		db OUTRAGE

	db $ff ; end

; ================
; ================================


GuitaristGroup:
; ================================
; ================

	; GUITARIST (1)
	db "CLYDE@"
	db 0 ; normal

	; party
	db 78, MAREEP
	db 78, CHINCHOU
	db 80, FLAAFFY
	db 80, LANTURN
	db 82, AMPHAROS

	db $ff ; end

; ================

	; GUITARIST (2)
	db "VINCENT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, MAREEP, FOCUS_BAND
	db 70, MAGNEMITE, BRIGHTPOWDER
	db 71, PIKACHU, LIGHT_BALL
	db 72, FLAAFFY, KINGS_ROCK

	db $ff ; end

	db "BERNIE@"
	db 0
	db 18, MAGNEMITE
	db 18, MAGNEMITE
	db 20, MAGNETON
	db $ff

	db "BRAXTON@"
	db 0
	db 21, MAGNEMITE
	db $ff

	db "VINCENT@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, MAGNEMITE, FOCUS_BAND
		db WILD_CHARGE
		db IRON_HEAD
		db LIGHT_SCREEN
		db AGILITY
	db 100, MAGNEMITE, FOCUS_BAND
		db THUNDERBOLT
		db SWIFT
		db REFLECT
		db THUNDER_WAVE

	db 100, MAGNEMITE, FOCUS_BAND
		db THUNDER
		db FLASH_CANNON
		db RAIN_DANCE
		db EXPLOSION
	db 100, MAGNETON, LEFTOVERS
		db ZAP_CANNON
		db MIND_READER
		db METAL_SOUND
		db IRON_DEFENSE
	db $ff ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 30,STANTLER
	db 32,CYNDAQUIL

	db $ff ; end

; ================

	; HIKER (2)
	db "RUSSELL@"
	db 0 ; normal

	; party
	db 23, TYROGUE
	db 23, SWINUB
	db 23, LARVITAR

	db $ff ; end

; ================

	; HIKER (3)
	db "PHILLIP@"
	db 0 ; normal

	; party
	db 46, SHUCKLE
	db 47, PUPITAR
	db 48, RHYDON

	db $ff ; end

; ================

	; HIKER (4)
	db "LEONARD@"
	db 0 ; normal

	; party
	db 48, GEODUDE
	db 48, RHYHORN

	db $ff ; end

; ================

	; HIKER (5)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 25,STANTLER
	db 26,CYNDAQUIL

	db $ff ; end

; ================

	; HIKER (6)
	db "BENJAMIN@"
	db 0 ; normal

	; party
	db 33, GOLBAT
	db 33, ONIX
	db 35, PRIMEAPE

	db $ff ; end

; ================

	; HIKER (7)
	db "ERIK@"
	db 0 ; normal

	; party
	db 55, GEODUDE
	db 56, SHUCKLE
	db 57, GLIGAR

	db $ff ; end

; ================

	; HIKER (8)
	db "MICHAEL@"
	db 0 ; normal

	; party
	db 56, SLUGMA
	db 57, CROBAT
	db 58, LARVITAR

	db $ff ; end

; ================

	; HIKER (9)
	db "PARRY@"
	db 0 ; normal

	; party
	db 80, ONIX
	db 82, STANTLER
	db 80, SWINUB
	db 82, SANDSLASH

	db $ff ; end

; ================

	; HIKER (10)
	db "TIMOTHY@"
	db 0 ; normal

	; party

	db 60, DONPHAN

	db $ff ; end

; ================

	; HIKER (11)
	db "BAILEY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, NIDORAN_F, FOCUS_BAND
	db 45, TYROGUE, FOCUS_BAND
	db 43, NIDORAN_M, FOCUS_BAND
	db 45, SANDSHREW, FOCUS_BAND

	db $ff ; end

; ================

	; HIKER (12)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 41, STANTLER
	db 41, QUILAVA

	db $ff ; end

; ================

	; HIKER (13)
	db "TIM@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 79, SANDSHREW, QUICK_CLAW
	db 80, MAROWAK, THICK_CLUB

	db $ff ; end

; ================

	; HIKER (14)
	db "NOLAND@"
	db 0 ; normal

	; party
	db 68, SUDOWOODO
	db 70, DONPHAN

	db $ff ; end

; ================

	; HIKER (15)
	db "SIDNEY@"
	db 0 ; normal

	; party
	db 80, DIGLETT
	db 80, RHYDON

	db $ff ; end

; ================

	; HIKER (16)
	db "KENNY@"
	db 0 ; normal

	; party
	db 77, MUK
	db 77, SANDSLASH

	db $ff ; end

; ================

	; HIKER (17)
	db "JIM@"
	db 0 ; normal

	; party
	db 79, ONIX
	db 80, GOLBAT

	db $ff ; end

; ================

	; HIKER (18)
	db "DANIEL@"
	db 0 ; normal

	; party
	db 26,SHUCKLE

	db $ff ; end

; ================

	; HIKER (19)
	db "PARRY@"
	db 0 ; normal

	; party

	db 94, STANTLER
	db 94, SANDSLASH
	db 96, PILOSWINE
	db 96, STEELIX

	db $ff ; end

; ================

	; HIKER (20)
	db "PARRY@"
	db 0 ; normal

	; party
	db 56, STANTLER
	db 58, SANDSLASH

	db $ff ; end

; ================

	; HIKER (21)
	db "ANTHONY@"
	db 0 ; normal

	; party
	db 61, STANTLER
	db 63, ONIX
	db 65, QUILAVA

	db $ff ; end

; ================

	; HIKER (22)
	db "ANTHONY@"
	db 0 ; normal

	; party

	db 80, GYARADOS
	db 85, STEELIX
	db 90, TYPHLOSION

	db $ff ; end

; ================

	db "MARCOS@"
	db 0
	db 10, GEODUDE
	db 10, GEODUDE
	db 12, ONIX
	db $ff

	db "FRANK@"
	db 0
	db 15, MACHOP
	db 15, GEODUDE
	db $ff

	db "WAYNE@"
	db 0
	db 17, ONIX
	db $ff

	db "NOB@"
	db 0
	db 13, GEODUDE
	db 14, GEODUDE
	db 15, GEODUDE
	db 16, MACHOP
	db $ff
; ================================


BikerGroup:
; ================================
; ================

	; BIKER (1)
	db "BENNY@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (2)
	db "KAZU@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (3)
	db "DWAYNE@"
	db 0 ; normal

	; party
	db 70, FARFETCH_D
	db 70, GLOOM
	db 70, RATICATE
	db 70, CHARMELEON

	db $ff ; end

; ================

	; BIKER (4)
	db "HARRIS@"
	db 0 ; normal

	; party
	db 71, FLAREON
	db 73, KABUTO

	db $ff ; end

; ================

	; BIKER (5)
	db "ZEKE@"
	db 0 ; normal

	; party
	db 75, OMANYTE

	db $ff ; end

; ================

	; BIKER (6)
	db "CHARLES@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 75, MAGMAR, "SMOKER@"
	db 75, SNORLAX, "BELLYFAT@"

	db $ff ; end

; ================

	; BIKER (7)
	db "RILEY@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 75, BEEDRILL, "STINGER@"

	db $ff ; end

; ================

	; BIKER (8)
	db "JOEL@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 75, GRANBULL, "HARDTEETH@"
	db 75, TAUROS, "BULLRIDE@"

	db $ff ; end

; ================

	; BIKER (9)
	db "GLENN@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 75, RATICATE, "SHARPFANG@"

	db $ff ; end

; ================
; ================================


BlaineGroup:
; ================================
; ================

	; BLAINE (1)
	db "BLAINE@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 87, MAGCARGO, GOLD_BERRY
		db FLAMETHROWER
		db ROCK_SLIDE
		db CURSE
		db TOXIC

	db 88, MAGMAR, CHARCOAL
		db FIRE_PUNCH
		db THUNDERPUNCH
		db CROSS_CHOP
		db SUNNY_DAY

	db 89, RAPIDASH, MAGNET
		db FLARE_BLITZ
		db WILD_CHARGE
		db MEGAHORN
		db TAIL_WHIP

	db 89, NINETALES, MIRACLE_SEED
		db FIRE_BLAST
		db SOLARBEAM
		db SUNNY_DAY
		db QUICK_ATTACK

	db 90, CHARIZARD, PARLYZ_GUARD
		db FLARE_BLITZ
		db FLY
		db BELLY_DRUM
		db AGILITY

	db 91, ARCANINE, LEFTOVERS
		db FLAMETHROWER
		db DRAGON_PULSE
		db EXTREMESPEED
		db WILLOWISP

	db $ff ; end

		; BLAINE (2)
	db "BLAINE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, RAPIDASH, CHARCOAL
		db FLARE_BLITZ
		db DRILL_RUN
		db MORNING_SUN
		db SUNNY_DAY

	db 100, MAGCARGO, POISON_GUARD
		db FIRE_BLAST
		db SOLARBEAM
		db RECOVER
		db SUNNY_DAY

	db 100, FLAREON, LEFTOVERS
		db FLARE_BLITZ
		db GROWTH
		db BATON_PASS
		db SUNNY_DAY

	db 100, NINETALES, CHARCOAL
		db FLAMETHROWER
		db SOLARBEAM
		db HYPNOSIS
		db SUNNY_DAY

	db 100, ENTEI, POLKADOT_BOW
		db SACRED_FIRE
		db IRON_HEAD
		db EXTREMESPEED
		db ROAR

	db 100, ARCANINE, CHARCOAL
		db FLARE_BLITZ
		db WILD_CHARGE
		db EXTREMESPEED
		db WILLOWISP

	db $ff

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR (1)
	db "DUNCAN@"
	db 0 ; normal

	; party
	db 50, STARYU
	db 52, SKIPLOOM
	db 54, MAGMAR

	db $ff ; end

; ================

	; BURGLAR (2)
	db "EDDIE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 54, SHUCKLE, LEFTOVERS

	db $ff ; end

; ================

	; BURGLAR (3)
	db "COREY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 79, SWINUB, FOCUS_BAND
	db 79, ZUBAT, FOCUS_BAND
	db 81, STANTLER, LEFTOVERS
	db 81, DUGTRIO, KINGS_ROCK

	db $ff ; end

; ================

	; BURGLAR (4)
	db "SIMON@"
	db 0 ; normal

	; party
	db 25, GRIMER
	db 27, VULPIX

	db $ff ; end

; ================

	; BURGLAR (5)
	db "SIMON@"
	db 0 ; normal

	; party
	db 45, KOFFING
	db 46, GRIMER
	db 47, VULPIX

	db $ff ; end

; ================

	; BURGLAR (6)
	db "SIMON@"
	db 0 ; normal

	; party
	db 54, WEEZING
	db 54, MUK
	db 54, GROWLITHE
	db 54, HOUNDOUR
	db 54, NINETALES

	db $ff ; end

; ================

	; BURGLAR (7)
	db "SIMON@"
	db 0 ; normal

	; party
	db 70, HOUNDOOM
	db 71, WEEZING
	db 72, MUK
	db 73, ARCANINE
	db 74, NINETALES

	db $ff ; end

; ================

	; BURGLAR (8)
	db "SIMON@"
	db 0 ; normal

	; party
	db 95, MURKROW
	db 96, HOUNDOOM
	db 96, WEEZING
	db 96, MUK
	db 96, ARCANINE
	db 100, NINETALES

	db $ff ; end

; ================

	; BURGLAR (9)
	db "SIMON@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, HOUNDOOM, BLACKGLASSES
		db NASTY_PLOT
		db DARK_PULSE
		db HEAT_WAVE
		db DESTINY_BOND

	db 100, WEEZING, LEFTOVERS
		db SLUDGE_BOMB
		db WILLOWISP
		db PROTECT
		db EXPLOSION

	db 100, MURKROW, SHARP_BEAK
		db DRILL_PECK
		db DARK_PULSE
		db PERISH_SONG
		db CONFUSE_RAY

	db 100, MUK, CHARCOAL
		db REST
		db SLEEP_TALK
		db GUNK_SHOT
		db FIRE_PUNCH

	db 100, ARCANINE, CONFUSEGUARD
		db ROAR
		db SUNNY_DAY
		db FLAMETHROWER
		db OUTRAGE

	db 100, NINETALES, GOLD_BERRY
		db DARK_PULSE
		db NASTY_PLOT
		db FIRE_BLAST
		db HYPNOSIS
	db $ff ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER (1)
	db "OTIS@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 84, GYARADOS
		db FLAMETHROWER
		db 0
		db 0
		db 0
	db 84, OCTILLERY
		db FLAMETHROWER
		db 0
		db 0
		db 0
	db 84, SLOWBRO
		db FIRE_BLAST
		db THUNDER_WAVE
		db FUTURE_SIGHT
		db PROTECT

	db $ff ; end

; ================

	; FIREBREATHER (2)
	db "DICK@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 33, SLUGMA, LEFTOVERS
	db 35, MAGMAR, MIRACLEBERRY

	db $ff ; end

; ================

	; FIREBREATHER (3)
	db "NED@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 33, PONYTA, GOLD_BERRY
	db 33, KOFFING, LEFTOVERS
	db 34, HOUNDOUR, FOCUS_BAND

	db $ff ; end

; ================

	; FIREBREATHER (4)
	db "BURT@"
	db 0 ; normal

	; party
	db 84, CHARMELEON
	db 84, QUILAVA

	db $ff ; end

; ================

	; FIREBREATHER (5)
	db "BILL@"
	db 0 ; normal

	; party
	db 23,SLUGMA
	db 25,HOUNDOUR

	db $ff ; end

; ================

	; FIREBREATHER (6)
	db "WALT@"
	db 0 ; normal

	; party
	db 30, GROWLITHE
	db 30, HOUNDOOM

	db $ff ; end

; ================

	; FIREBREATHER (7)
	db "RAY@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 26, SLUGMA
		db FIRE_BLAST
		db SUNNY_DAY
		db ACID_ARMOR
		db RECOVER

	db $ff ; end

; ================

	; FIREBREATHER (8)
	db "LYLE@"
	db 0 ; normal

	; party
	db 68, SLUGMA
	db 69, HOUNDOUR
	db 70, QUILAVA

	db $ff ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER (1)
	db "IRWIN@"
	db 0 ; normal

	; party
	db 29, ABRA
	db 29, NIDORAN_M
	db 29, SHELLDER
	db 29, NIDORAN_M
	db 29, PIKACHU

	db $ff ; end

; ================

	; JUGGLER (2)
	db "FRITZ@"
	db 0 ; normal

	; party
	db 68, DUNSPARCE
	db 69, ARIADOS
	db 70, MR__MIME

	db $ff ; end

; ================

	; JUGGLER (3)
	db "HORTON@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 72, VOLTORB, FOCUS_BAND
	db 72, VOLTORB, FOCUS_BAND
	db 72, VOLTORB, FOCUS_BAND

	db $ff ; end

; ================
;
	; JUGGLER (4)
;	db "IRWIN@"
;	db 0 ; normal
;
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
;
	; JUGGLER (5)
;	db "IRWIN@"
;	db 0 ; normal
;
	; party
;
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
;
	; JUGGLER (6)
;	db "IRWIN@"
;	db 0 ; normal
;
	; party
;
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
; ================================

	; team #5
	db "HORTON@"
	db (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, VOLTORB
	db 100, VOLTORB
	db 100, VOLTORB
	db 100, VOLTORB
	db 100, VOLTORB
	db 100, VOLTORB

	db $ff ; end


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T (1)
	db "KENJI@"
	db 0 ; normal

	; party
	db 80, HITMONLEE
	db 84, HERACROSS

	db $ff ; end

; ================

	; BLACKBELT_T (2)
	db "YOSHI@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 49, HITMONLEE, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (3)
	db "KENJI@"
	db 0 ; normal

	; party

	db 94, PRIMEAPE
	db 95, HITMONCHAN
	db 94, MACHAMP
	db 95, HITMONLEE
	db 97, HERACROSS
	db 99, HITMONTOP

	db $ff ; end

; ================

	; BLACKBELT_T (4)
	db "LAO@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 49, HITMONCHAN, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (5)
	db "NOB@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 47, MACHOP, BLACKBELT
	db 49, MACHOKE, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (6)
	db "KIYO@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 66, TYROGUE, BRIGHTPOWDER
	db 68, HITMONLEE, BLACKBELT
	db 68, HITMONCHAN, BLACKBELT
	db 70, HITMONTOP, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (7)
	db "LUNG@"
	db 0 ; normal

	; party
	db 50, TYROGUE
	db 50, HITMONTOP

	db $ff ; end

; ================

	; BLACKBELT_T (8)
	db "KENJI@"
	db 0 ; normal

	; party
	db 60, HERACROSS

	db $ff ; end

; ================

	; BLACKBELT_T (9)
	db "WAI@"
	db 0 ; normal

	; party
	db 80, MANKEY
	db 82, MACHOKE
	db 83, PRIMEAPE

	db $ff ; end

; ================
; ================================


ExecutiveMGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 56, GOLDUCK, BERSERK_GENE
	db 58, HOUNDOOM, MIRACLEBERRY
	db 60, EXEGGUTOR, LEFTOVERS
	db 62, URSARING, MINT_BERRY

	db $ff ; end

; ================

	; EXECUTIVEM (2)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 54, SNEASEL, BERSERK_GENE
	db 56, GOLBAT, LEFTOVERS
	db 56, VICTREEBEL, BERSERK_GENE
	db 58, UMBREON, LEFTOVERS

	db $ff ; end

; ================

	; EXECUTIVEM (3)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 50, MURKROW, BERSERK_GENE
	db 52, MR__MIME, GOLD_BERRY
	db 54, LICKITUNG, BERSERK_GENE
	db 56, QUAGSIRE, LEFTOVERS

	db $ff ; end

; ================

	; EXECUTIVEM (4)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 39, PSYDUCK, GOLD_BERRY
	db 41, EXEGGCUTE, MIRACLEBERRY
	db 41, HOUNDOOM, KINGS_ROCK
	db 43, URSARING, LEFTOVERS

	db $ff ; end

PsychicGroup:
; ================================
; ================

	; PSYCHIC_T (1)
	db "NATHAN@"
	db 0 ; normal

	; party
	db 55, UNOWN

	db $ff ; end

; ================

	; PSYCHIC_T (2)
	db "FRANKLIN@"
	db 0 ; normal

	; party
	db 73, EXEGGUTOR
	db 73, WOBBUFFET
	db 74, KADABRA
	db 74, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (3)
	db "HERMAN@"
	db 0 ; normal

	; party
	db 80, HYPNO

	db $ff ; end

; ================

	; PSYCHIC_T (4)
	db "FIDEL@"
	db 0 ; normal

	; party
	db 79, DROWZEE
	db 79, XATU

	db $ff ; end

; ================

	; PSYCHIC_T (5)
	db "GREG@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 34, XATU, LEFTOVERS

	db $ff ; end

; ================

	; PSYCHIC_T (6)
	db "NORMAN@"
	db 0 ; normal

	; party

	db 37, ESPEON
	db 37, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (7)
	db "MARK@"
	db 0 ; normal

	; party

	db 29, WOBBUFFET
	db 31, NATU
	db 33, HYPNO

	db $ff ; end

; ================

	; PSYCHIC_T (8)
	db "PHIL@"
	db 0 ; normal

	; party

	db 53, ABRA
	db 55, HYPNO
	db 57, ESPEON

	db $ff ; end

; ================

	; PSYCHIC_T (9)
	db "RICHARD@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 63, ALAKAZAM, BRIGHTPOWDER

	db $ff ; end

; ================

	; PSYCHIC_T (10)
	db "GILBERT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 58, EXEGGCUTE, LEFTOVERS
	db 59, GIRAFARIG, KINGS_ROCK
	db 60, KADABRA, FOCUS_BAND

	db $ff ; end

; ================

	; PSYCHIC_T (11)
	db "JARED@"
	db 0 ; normal

	; party
	db 75, UNOWN
	db 75, UNOWN
	db 75, UNOWN
	db 75, UNOWN
	db 75, UNOWN
	db 75, UNOWN

	db $ff ; end

; ================

	; PSYCHIC_T (12)
	db "RODNEY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 80, ABRA, FOCUS_BAND
	db 80, EXEGGCUTE, FOCUS_BAND
	db 80, DROWZEE, FOCUS_BAND
	db 80, UNOWN, FOCUS_BAND
	db 82, MR__MIME, PINK_BOW

	db $ff ; end

; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER (1)
	db "LIZ@"
	db 0 ; normal

	; party
	db 22,NATU
	db 22,TOTODILE

	db $ff ; end

; ================

	; PICNICKER (2)
	db "GINA@"
	db 0 ; normal

	; party
	db 28, HOPPIP
	db 28, GLOOM
	db 28, CHIKORITA

	db $ff ; end

; ================

	; PICNICKER (3)
	db "BROOKE@"
	db 0 ; normal

	; party

	db 31, BAYLEEF

	db $ff ; end

; ================

	; PICNICKER (4)
	db "KIM@"
	db 0 ; normal

	; party
	db 29, SUNFLORA
	db 30, BELLOSSOM

	db $ff ; end

; ================

	; PICNICKER (5)
	db "CINDY@"
	db 0 ; normal

	; party
	db 77, NIDOQUEEN

	db $ff ; end

; ================

	; PICNICKER (6)
	db "HOPE@"
	db 0 ; normal

	; party
	db 80, VULPIX
	db 80, TENTACOOL
	db 81, WEEPINBELL

	db $ff ; end

; ================

	; PICNICKER (7)
	db "SHARON@"
	db 0 ; normal

	; party
	db 81, VILEPLUME

	db $ff ; end

; ================

	; PICNICKER (8)
	db "DEBRA@"
	db 0 ; normal

	; party
	db 68, LEDIAN
	db 69, FURRET
	db 70, CROBAT

	db $ff ; end

; ================

	; PICNICKER (9)
	db "GINA@"
	db 0 ; normal

	; party
	db 41, HOPPIP
	db 41, GLOOM
	db 41, CHIKORITA

	db $ff ; end

; ================

	; PICNICKER (10)
	db "ERIN@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, SMOOCHUM, FOCUS_BAND
	db 43, ELEKID, FOCUS_BAND
	db 43, MAGBY, FOCUS_BAND

	db $ff ; end

; ================

	; PICNICKER (11)
	db "LIZ@"
	db 0 ; normal

	; party
	db 31, NATU
	db 31, TOTODILE

	db $ff ; end

; ================

	; PICNICKER (12)
	db "LIZ@"
	db 0 ; normal

	; party
	db 41, NATU
	db 41, CROCONAW

	db $ff ; end

; ================

	; PICNICKER (13)
	db "HEIDI@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 79, MAGNEMITE, LEFTOVERS
	db 80, PIKACHU, LIGHT_BALL
	db 81, JOLTEON, BRIGHTPOWDER

	db $ff ; end

; ================

	; PICNICKER (14)
	db "EDNA@"
	db 0 ; normal

	; party
	db 80, PORYGON
	db 80, WEEZING

	db $ff ; end

; ================

	; PICNICKER (15)
	db "GINA@"
	db 0 ; normal

	; party
	db 60, GLOOM
	db 61, BAYLEEF
	db 62, JUMPLUFF

	db $ff ; end

; ================

	; PICNICKER (16)
	db "TIFFANY@"
	db 0 ; normal

	; party

	db 70, CLEFAIRY

	db $ff ; end

; ================

	; PICNICKER (17)
	db "TIFFANY@"
	db 0 ; normal

	; party

	db 89, CLEFAIRY

	db $ff ; end

; ================

	; PICNICKER (18)
	db "ERIN@"
	db 0 ; normal

	; party
	db 83, SMOOCHUM
	db 83, ELEKID
	db 83, MAGBY

	db $ff ; end

; ================

	; PICNICKER (19)
	db "TANYA@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 75, EXEGGUTOR
		db SEED_BOMB
		db LEECH_SEED
		db SLEEP_POWDER
		db NIGHTMARE

	db $ff ; end

; ================

	; PICNICKER (20)
	db "TIFFANY@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 42, CLEFAIRY, BERRY_JUICE

	db $ff ; end

; ================

	; PICNICKER (21)
	db "ERIN@"
	db 0 ; normal

	; party

	db 96, JYNX
	db 96, ELECTABUZZ
	db 96, MAGMAR

	db $ff ; end

; ================

	; PICNICKER (22)
	db "LIZ@"
	db 0 ; normal

	; party
	db 60, NATU
	db 61, CROCONAW
	db 62, XATU

	db $ff ; end

; ================

	; PICNICKER (23)
	db "LIZ@"
	db 0 ; normal

	; party

	db 80, NATU
	db 81, XATU
	db 82, FERALIGATR

	db $ff ; end

; ================

	; PICNICKER (24)
	db "GINA@"
	db 0 ; normal

	; party
	db 80, BAYLEEF
	db 81, JUMPLUFF
	db 82, VILEPLUME

	db $ff ; end

; ================

	; PICNICKER (25)
	db "GINA@"
	db 0 ; normal

	; party

	db 95, JUMPLUFF
	db 95, VILEPLUME
	db 95, MEGANIUM

	db $ff ; end

; ================

	; PICNICKER (26)
	db "TIFFANY@"
	db 0 ; normal

	; party

	db 98, XATU

	db $ff ; end

	db "KELSEY@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 15, NIDORAN_M, "NEEDLES@"
	db 15, NIDORAN_F, "PRINCESS@"
	db $ff
; ================
	db "NANCY@"
	db 0
	db 16, RATTATA
	db 16, PIKACHU
	db $ff

	db "IZZY@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 16, PIDGEY, "HOPSY@"
	db 16, PIDGEY, "PECKSY@"
	db 16, PIDGEY, "FLAPSY@"
	db $ff
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "ROLAND@"
	db 0 ; normal

	; party
	db 21, MARILL
	db 22, AIPOM
	db 21, WOOPER
	db 23, AZUMARILL

	db $ff ; end

; ================

	; CAMPER (2)
	db "TODD@"
	db 0 ; normal

	; party
	db 27, POLIWAG
	db 29, MANTINE

	db $ff ; end

; ================

	; CAMPER (3)
	db "IVAN@"
	db 0 ; normal

	; party
	db 29, MACHOP
	db 31, SKIPLOOM
	db 31, DUGTRIO

	db $ff ; end

; ================

	; CAMPER (4)
	db "ELLIOT@"
	db 0 ; normal

	; party
	db 30, MAREEP
	db 29, AZUMARILL

	db $ff ; end

; ================

	; CAMPER (5)
	db "BARRY@"
	db 0 ; normal

	; party
	db 77, NIDOKING

	db $ff ; end

; ================

	; CAMPER (6)
	db "LLOYD@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 81, ZUBAT, FOCUS_BAND
	db 83, HYPNO, LEFTOVERS
	db 85, DITTO, METAL_POWDER

	db $ff ; end

; ================

	; CAMPER (7)
	db "DEAN@"
	db 0 ; normal

	; party
	db 80, MEOWTH
	db 80, CHARMANDER
	db 80, RAICHU

	db $ff ; end

; ================

	; CAMPER (8)
	db "SID@"
	db 0 ; normal

	; party
	db 79, NIDORINA
	db 79, NIDORINO
	db 80, DUGTRIO

	db $ff ; end

; ================

	; CAMPER (9)
	db "HARVEY@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (10)
	db "DALE@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (11)
	db "TED@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 45, HOOTHOOT, FOCUS_BAND
	db 45, TEDDIURSA, FOCUS_BAND

	db $ff ; end

; ================

	; CAMPER (12)
	db "TODD@"
	db 0 ; normal

	; party
	db 50, POLIWAG
	db 50, MANTINE

	db $ff ; end

; ================

	; CAMPER (13)
	db "TODD@"
	db 0 ; normal

	; party
	db 59, MAREEP
	db 61, POLIWHIRL
	db 63, MANTINE

	db $ff ; end

; ================

	; CAMPER (14)
	db "THOMAS@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (15)
	db "LEROY@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (16)
	db "DAVID@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (17)
	db "JOHN@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (18)
	db "JERRY@"
	db 0 ; normal

	; party
	db 84, SANDSLASH

	db $ff ; end

; ================

	; CAMPER (19)
	db "SPENCER@"
	db 0 ; normal

	; party
	db 34, NATU
	db 35, PARASECT
	db 36, FURRET

	db $ff ; end

; ================

	; CAMPER (20)
	db "TODD@"
	db 0 ; normal

	; party
	db 80, FLAAFFY
	db 81, MANTINE
	db 82, POLIWRATH

	db $ff ; end

; ================

	; CAMPER (21)
	db "TODD@"
	db 0 ; normal

	; party

	db 95, MANTINE
	db 95, POLIWRATH
	db 95, AMPHAROS

	db $ff ; end

; ================

	; CAMPER (22)
	db "QUENTIN@"
	db 0 ; normal

	; party

	db 57, JUMPLUFF
	db 57, TAUROS
	db 57, SUDOWOODO

	db $ff ; end

; ================

	db "JERRY@"
	db 0

	db 11, DIGLETT
	db 11, SANDSHREW
	db $ff

	db "ETHAN@"
	db 0
	db 18, MANKEY
	db $ff

	db "SHANE@"
	db 0
	db 14, RATTATA
	db 14, EKANS
	db $ff

	db "FLINT@"
	db (1 << TRAINERTYPE_NICKNAME | 1 << TRAINERTYPE_ITEM)
	db 14, RATTATA, BERRY, "RATMAN@"
	db 14, EKANS, BERRY, "PYTHON@"
	db $ff

	db "RICKY@"
	db 0
	db 20, SQUIRTLE
	db $ff

	db "JEFF@"
	db 0
	db 16, SPEAROW
	db 17, RATICATE
	db $ff
; ================================


ExecutiveFGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, DONPHAN, BERSERK_GENE
	db 57, VILEPLUME, LEFTOVERS
	db 59, GRANBULL, BERSERK_GENE

	db $ff ; end

; ================

	; EXECUTIVEF (2)
	db "EXECUTIVE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 38, GLIGAR, LEFTOVERS
	db 40, GLOOM, MIRACLEBERRY
	db 42, GRANBULL, KINGS_ROCK

	db $ff ; end

; ================
; ================================


SageGroup:
; ================================
; ================

	; SAGE (1)
	db "CHOW@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOUNDOUR
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (2)
	db "NICO@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, ZUBAT
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (3)
	db "JIN@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 22, BELLSPROUT
		db SLUDGE_BOMB
		db SLEEP_POWDER
		db GROWTH
		db SWAGGER

	db $ff ; end

; ================

	; SAGE (4)
	db "TROY@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOOTHOOT
	db 20, MISDREAVUS
	db 20, ODDISH

	db $ff ; end

; ================

	; SAGE (5)
	db "JEFFREY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, SNEASEL, GOLD_BERRY

	db $ff ; end

; ================

	; SAGE (6)
	db "PING@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 34, HOUNDOUR
		db SUNNY_DAY
		db FLAMETHROWER
		db 0
		db 0
	db 34, HOUNDOUR
		db SOLARBEAM
		db FIRE_BLAST
		db 0
		db 0
	db 36, HOUNDOOM
		db BODY_SLAM
		db BITE
		db SPITE
		db PROTECT

	db $ff ; end

; ================

	; SAGE (7)
	db "EDMOND@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOOTHOOT
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (8)
	db "NEAL@"
	db 0 ; normal

	; party
	db 22, WEEPINBELL

	db $ff ; end

; ================

	; SAGE (9)
	db "LI@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 22, BELLSPROUT
		db SUNNY_DAY
		db SYNTHESIS
		db SOLARBEAM
		db SLEEP_POWDER
	db 23, NOCTOWL
		db HYPNOSIS
		db NIGHTMARE
		db WING_ATTACK
		db SUPERSONIC
	db 24, WEEPINBELL
		db SWORDS_DANCE
		db LEECH_LIFE
		db VINE_WHIP
		db SLEEP_POWDER

	db $ff ; end

; ================

	; SAGE (10)
	db "GAKU@"
	db 0 ; normal

	; party
	db 58, JYNX
	db 60, FLAREON

	db $ff ; end

; ================

	; SAGE (11)
	db "MASA@"
	db 0 ; normal

	; party
	db 58, MAGMAR
	db 60, JOLTEON

	db $ff ; end

; ================

	; SAGE (12)
	db "KOJI@"
	db 0 ; normal

	; party
	db 58, ELECTABUZZ
	db 60, VAPOREON

	db $ff ; end

; ================
; ================================

	db "ZEKE@"

	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, KAKUNA
		db HARDEN
		db 0
		db 0
		db 0

	db 100, HITMONLEE
		db HI_JUMP_KICK
		db THIEF
		db CURSE
		db METRONOME

	db 100, HAUNTER
		db NIGHT_SHADE
		db DREAM_EATER
		db HYPNOSIS
		db CURSE
	db 100, AMPHAROS
		db ZAP_CANNON
		db DYNAMICPUNCH
		db SWIFT
		db FLASH

	db 100, VAPOREON
		db WATERFALL
		db AURORA_BEAM
		db ACID_ARMOR
		db REST

	db 100, TYPHLOSION
		db SHADOW_CLAW
		db FLAME_WHEEL
		db SWAGGER
		db DOUBLE_TEAM
	db $ff ; end

	db "JEFFREY@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, LARVITAR
		db EARTHQUAKE
		db ROCK_SLIDE
		db BITE
		db ROCK_POLISH
	
	db 100, PUPITAR
		db DIG
		db IRON_DEFENSE
		db TOXIC
		db CURSE
		
	db 100, TYRANITAR
		db DARK_PULSE
		db FLAMETHROWER
		db HYPER_BEAM
		db METAL_SOUND
	db $ff ; end

	db "PING@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, HOUNDOUR
		db DARK_PULSE
		db FLAMETHROWER
		db PURSUIT
		db DESTINY_BOND
		
	db 100, VILEPLUME
		db POISON_JAB
		db SEED_BOMB
		db STRING_SHOT
		db CURSE
	db 100, GYARADOS
		db WATERFALL
		db CRUNCH
		db RAIN_DANCE
		db THUNDER_WAVE
	db $ff ; end


MediumGroup:
; ================================
; ================

	; MEDIUM (1)
	db "MARTHA@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)
	
	; party
	db 36, UMBREON, LEFTOVERS
		db PURSUIT
		db MOONLIGHT
		db TACKLE
		db SAND_ATTACK
	db $ff ; end

; ================

	; MEDIUM (2)
	db "GRACE@"
	db 0 ; normal

	; party
	db 32, MURKROW
	db 35, MURKROW

	db $ff ; end

; ================

	; MEDIUM (3)
	db "BETHANY@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (4)
	db "MARGRET@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (5)
	db "ETHEL@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (6)
	db "REBECCA@"
	db 0 ; normal

	; party
	db 71, DROWZEE
	db 74, HYPNO

	db $ff ; end

; ================

	; MEDIUM (7)
	db "DORIS@"
	db 0 ; normal

	; party
	db 74, SLOWPOKE
	db 74, SLOWBRO
	db 74, SLOWKING

	db $ff ; end

	db "MARTHA@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, GASTLY, POLKADOT_BOW
		db EXPLOSION
		db 0
		db 0
		db 0

	db 100, GASTLY, FOCUS_BAND
		db MEAN_LOOK
		db CURSE
		db CONFUSE_RAY
		db NIGHT_SHADE

	db 100, GASTLY, GOLD_BERRY
		db DREAM_EATER
		db NIGHTMARE
		db HYPNOSIS
		db SPITE
	db 100, GASTLY, LEFTOVERS
		db DESTINY_BOND
		db SHADOW_CLAW
		db WILLOWISP
		db ATTRACT

	db 100, GASTLY, QUICK_CLAW
		db SHADOW_BALL
		db SLUDGE_BOMB
		db THUNDERBOLT
		db DAZZLINGLEAM
	db $ff ; end

	db "GRACE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)
	; party
	db 100, MAROWAK, THICK_CLUB
		db BONEMERANG
		db PLAY_ROUGH
		db IRON_HEAD
		db COUNTER
	db $ff ; end
; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER (1)
	db "RONALD@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 40, SEEL, MINT_BERRY
	db 42, DEWGONG, LEFTOVERS

	db $ff ; end

; ================

	; BOARDER (2)
	db "BRAD@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 40, SWINUB, BRIGHTPOWDER
	db 42, PILOSWINE, LEFTOVERS

	db $ff ; end

; ================

	; BOARDER (3)
	db "DOUGLAS@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 41, SHELLDER, FOCUS_BAND
	db 42, SMOOCHUM, BRIGHTPOWDER
	db 43, CLOYSTER, LEFTOVERS

	db $ff ; end

; ================
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM (1)
	db "WILLIAM@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 30, SKARMORY, GOLD_BERRY

	db $ff ; end

; ================

	; POKEFANM (2)
	db "DEREK@"
	db 0 ; normal

	; party
	db 36, PONYTA
	db 37, STANTLER
	db 38, TAUROS

	db $ff ; end

; ================

	; POKEFANM (3)
	db "ROBERT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 80, CUBONE, THICK_CLUB

	db $ff ; end

; ================

	; POKEFANM (4)
	db "JOSHUA@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 79, TENTACRUEL
		db WATERFALL
		db SURF
		db HIDDEN_POWER
		db 0

	db 78, GRAVELER
		db STRENGTH
		db DOUBLE_EDGE
		db ROCK_THROW
		db 0

	db 77, VILEPLUME
		db PETAL_DANCE
		db SLUDGE_BOMB
		db SLEEP_POWDER
		db GIGA_DRAIN

	db 80, AZUMARILL
		db ROLLOUT
		db STRENGTH
		db SURF
		db ROCK_SMASH

	db $ff ; end

; ================

	; POKEFANM (5)
	db "CARTER@"
	db 0 ; normal

	; party
	db 76, PSYDUCK
	db 76, PIDGEOTTO
	db 77, PERSIAN

	db $ff ; end

; ================

	; POKEFANM (6)
	db "TREVOR@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 77, BUTTERFREE, LEFTOVERS

	db $ff ; end

; ================

	; POKEFANM (7)
	db "BRANDON@"
	db 0 ; normal

	; party
	db 28, CLEFFA
	db 28, SMOOCHUM
	db 28, PICHU
	db 28, IGGLYBUFF
	db 28, MAGBY
	db 28, ELEKID

	db $ff ; end

; ================

	; POKEFANM (8)
	db "JEREMY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 80, HOOTHOOT, FOCUS_BAND
	db 80, HOPPIP, FOCUS_BAND
	db 80, WOOPER, FOCUS_BAND

	db $ff ; end

; ================

	; POKEFANM (9)
	db "COLIN@"
	db 0 ; normal

	; party
	db 80, DELIBIRD

	db $ff ; end

; ================

	; POKEFANM (10)
	db "DEREK@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 19, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (11)
	db "DEREK@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 36, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (12)
	db "ALEX@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 100, MAGIKARP, FOCUS_BAND

	db $ff ; end

; ================

	; POKEFANM (13)
	db "REX@"
	db 0 ; normal

	; party
	db 70, PONYTA

	db $ff ; end

; ================

	; POKEFANM (14)
	db "ALLAN@"
	db 0 ; normal

	; party
	db 70, BELLSPROUT

	db $ff ; end

; ================
; ================================


KimonoGirlGroup:
; ================================
; ================

	; KIMONO_GIRL (1)
	db "NAOKO@"
	db 0 ; normal

	; party
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM

	db $ff ; end

; ================

	; KIMONO_GIRL (2)
	db "NAOKO@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, FLAREON, QUICK_CLAW

	db $ff ; end

; ================

	; KIMONO_GIRL (3)
	db "SAYO@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, ESPEON, GOLD_BERRY

	db $ff ; end

; ================

	; KIMONO_GIRL (4)
	db "ZUKI@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, UMBREON, MIRACLEBERRY

	db $ff ; end

; ================

	; KIMONO_GIRL (5)
	db "KUNI@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, VAPOREON, LEFTOVERS

	db $ff ; end

; ================

	; KIMONO_GIRL (6)
	db "MIKI@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, JOLTEON, KINGS_ROCK

	db $ff ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS (1)
	db "AMY & MAY@"
	db 0 ; normal

	; party
	db 25, SPINARAK
	db 25, LEDYBA

	db $ff ; end

; ================

	; TWINS (2)
	db "ANN & ANNE@"
	db 0 ; normal

	; party
	db 31, TEDDIURSA
	db 31, PHANPY

	db $ff ; end

; ================

	; TWINS (3)
	db "ANN & ANNE@"
	db 0 ; normal

	; party
	db 31, PHANPY
	db 31, TEDDIURSA

	db $ff ; end

; ================

	; TWINS (4)
	db "AMY & MAY@"
	db 0 ; normal

	; party
	db 25, LEDYBA
	db 25, SPINARAK

	db $ff ; end

; ================

	; TWINS (5)
	db "JO & ZOE@"
	db 0 ; normal

	; party
	db 76, BULBASAUR
	db 76, CHIKORITA

	db $ff ; end

; ================

	; TWINS (6)
	db "JO & ZOE@"
	db 0 ; normal

	; party
	db 76, CHIKORITA
	db 76, BULBASAUR

	db $ff ; end

; ================

	; TWINS (7)
	db "MEG & PEG@"
	db 0 ; normal

	; party
	db 69, WOOPER
	db 69, MARILL

	db $ff ; end

; ================

	; TWINS (8)
	db "MEG & PEG@"
	db 0 ; normal

	; party
	db 69, MARILL
	db 69, WOOPER

	db $ff ; end

; ================

	; TWINS (9)
	db "LEA & PIA@"
	db 0 ; normal

	; party

	db 60, SEADRA
	db 60, DRAGONAIR

	db $ff ; end

; ================

	; TWINS (10)
	db "LEA & PIA@"
	db 0 ; normal

	; party

	db 60, DRAGONAIR
	db 60, SEADRA

	db $ff ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF (1)
	db "BEVERLY@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 30, KANGASKHAN, GOLD_BERRY

	db $ff ; end

; ================

	; POKEFANF (2)
	db "RUTH@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 38, AMPHAROS, "ZAPPY@"

	db $ff ; end

; ================

	; POKEFANF (3)
	db "BEVERLY@"
	db 0 ; normal

	; party
	db 45, KANGASKHAN

	db $ff ; end

; ================

	; POKEFANF (4)
	db "BEVERLY@"
	db 0 ; normal

	; party
	db 60, KANGASKHAN

	db $ff ; end

; ================

	; POKEFANF (5)
	db "GEORGIA@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 78, SENTRET, GOLD_BERRY
	db 78, SENTRET, QUICK_CLAW
	db 80, SENTRET, FOCUS_BAND
	db 80, SENTRET, POLKADOT_BOW
	db 82, SENTRET, GOLD_BERRY
	db 84, FURRET, LEFTOVERS

	db $ff ; end

; ================

	; POKEFANF (6)
	db "JAIME@"
	db 0 ; normal

	; party
	db 40, MEOWTH

	db $ff ; end

; ================
; ================================




RedGroup:
; ================================
; ================

	; RED (1)
	db "<RED>@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_NICKNAME) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, SLOWBRO, "AAbbABCabb@"
		db SURF
		db STRENGTH
		db AMNESIA
		db PSYCHIC_M

	db 100, VENOMOTH, " RRRRIIIIH@"
		db STUN_SPORE
		db PSYBEAM
		db SLEEP_POWDER
		db PSYCHIC_M

	db 100, CLOYSTER, "IIII--??(U@"
		db SURF
		db CLAMP
		db AURORA_BEAM
		db DOUBLE_TEAM

	db 100, DRAGONITE, "AAA--××<MN><MN><MN>@"
		db WRAP
		db STRENGTH
		db HYPER_BEAM
		db SLAM

	db 100, ZAPDOS, "(ssjj <MN>..,@"
		db DRILL_PECK
		db THUNDER
		db SKY_ATTACK
		db DOUBLE_TEAM

	db 100, VICTREEBEL, "RRQPO:<PK><PK><PK><PK>@"
		db RAZOR_LEAF
		db WRAP
		db CUT
		db SLEEP_POWDER

	db $ff ; end

	; RED (2)

	db "RED@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_NICKNAME) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, ZAPDOS, "AA-j@"
		db THUNDERSHOCK
		db DRILL_PECK
		db TAKE_DOWN
		db THUNDER

	db 100, NIDOKING, "AAAAAAAAAA@"
		db SURF
		db POISON_STING
		db STRENGTH
		db FURY_ATTACK

	db 100, OMASTAR, "OMASTAR@"
		db HYDRO_PUMP
		db WITHDRAW
		db SURF
		db HORN_ATTACK

	db 100, VENOMOTH, "AATTVVV@"
		db DISABLE
		db POISONPOWDER
		db LEECH_LIFE
		db STUN_SPORE

	db 100, LAPRAS, "AIIIIIIRRR@"
		db MIST
		db BODY_SLAM
		db SURF
		db STRENGTH

	db 100, PIDGEOT, "aaabaaajss@"
		db MIRROR_MOVE
		db SAND_ATTACK
		db QUICK_ATTACK
		db SKY_ATTACK

	db $ff

; ================
; ================================


BlueGroup:
; ================================
; ================

	; BLUE (1) - AR Champion rematch team
	db "BLUE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	; party

	db 100, SANDSLASH, POISON_BARB
		db EARTHQUAKE
		db POISON_JAB
		db SWORDS_DANCE
		db FISSURE

	db 100, ALAKAZAM, FOCUS_BAND
		db PSYCHIC_M
		db REFLECT
		db DISABLE
		db RECOVER

	db 100, EXEGGUTOR, MIRACLEBERRY
		db SOLARBEAM
		db ZEN_HEADBUTT
		db LEECH_SEED
		db SUNNY_DAY

	db 100, NINETALES, POLKADOT_BOW
		db FIRE_BLAST
		db WILD_CHARGE
		db QUICK_ATTACK
		db NASTY_PLOT

	db 100, MAGNETON, QUICK_CLAW
		db THUNDER
		db FLASH_CANNON
		db RAIN_DANCE
		db THUNDER_WAVE

	db 100, VAPOREON, LEFTOVERS
		db HYDRO_PUMP
		db AURORA_BEAM
		db BATON_PASS
		db GROWTH

	db $ff ; end

	; BLUE (2) - AR Champion team
	db "BLUE@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	; party

	db 100, PIDGEOT, GOLD_BERRY
		db SKY_ATTACK
		db WING_ATTACK
		db MIRROR_MOVE
		db AGILITY

	db 100, FEAROW , SHARP_BEAK
		db AGILITY
		db MIRROR_MOVE
		db DRILL_PECK
		db FURY_ATTACK

	db 100, KINGLER , SCOPE_LENS
		db STOMP
		db HARDEN
		db FISSURE
		db CRABHAMMER

	db 100, TAUROS, LEFTOVERS
		db RAGE
		db TAKE_DOWN
		db TAIL_WHIP
		db LEER

	db 100, PARASECT , SCOPE_LENS
		db LEECH_LIFE
		db SPORE
		db SLASH
		db GROWTH

	db 100, VAPOREON, GOLD_BERRY
		db BLIZZARD
		db HAZE
		db ACID_ARMOR
		db HYDRO_PUMP

	db $ff ; end

; ================
; ================================


OfficerGroup:
; ================================
; ================

	; OFFICER (1)
	db "KEITH@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 28, GRANBULL, KINGS_ROCK

	db $ff ; end

; ================

	; OFFICER (2)
	db "DIRK@"
	db 0 ; normal

	; party
	db 30, GROWLITHE
	db 30, URSARING

	db $ff ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF (1)
	db "GRUNT@"
	db 0 ; normal

	; party
	db 25, SENTRET
	db 23, DIGLETT
	db 27, HOUNDOOM

	db $ff ; end

; ================

	; GRUNTF (2)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 51, EKANS, GOLD_BERRY
	db 52, WEEPINBELL, MIRACLE_SEED
	db 53, ARBOK, LEFTOVERS

	db $ff ; end

; ================

	; GRUNTF (3)
	db "GRUNT@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 54, AMPHAROS, BERSERK_GENE
		db THUNDERPUNCH
		db THUNDER_WAVE
		db HEADBUTT
		db IRON_TAIL

	db $ff ; end

; ================

	; GRUNTF (4)
	db "GRUNT@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 54, GLIGAR, BERSERK_GENE
		db BATON_PASS
		db EARTHQUAKE
		db WING_ATTACK
		db SCREECH

	db 57, RAICHU, BERSERK_GENE
		db EXTREMESPEED
		db SPARK
		db DIZZY_PUNCH
		db REVERSAL

	db $ff ; end

; ================

	; GRUNTF (5)
	db "GRUNT@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 37, ODDISH, LEFTOVERS
	db 39, SNUBBULL, KINGS_ROCK

	db $ff ; end

	db "GRUNT@" ; 6
	db 0
	db 11, SANDSHREW
	db 11, RATTATA
	db 11, ZUBAT
	db $ff

; ================
; ================================


MysticalmanGroup:
; ================================
; ================

	; MYSTICALMAN (1)
	db "EUSINE@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 50, SKARMORY, LEFTOVERS
	db 50, HAUNTER, BRIGHTPOWDER
	db 50, PORYGON2, PINK_BOW

	db $ff ; end

; ================
; ================================
