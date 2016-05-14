; Johto Pokémon in grass

	map SPROUT_TOWER_2F ;MAP tells you what map this encounter table is for, should be pretty obvious. don't touch it
	db $05 ; encounter rates for all day Encounter rate out of 255, delete 2 of the 3 identical numbers and both commas
	db 14 ;base level for the area before alteration. Use lower bound for random spread (for 2-6, use 2)
	db $70 ;Tables to use. first is a $ for tech reasons Left number/letter is level alteration table. Right number is what %chance table to use. 0 = big 30, 1 = 2020, 2 = 2015, 3 = 1510
	; The level alteration table hasn't been decided/coded yet, though 0 is for no alteration exept random variance
;morning Mons go here, make sure no semi-colons are where they shouldn't be (before mons), and that morning/day/night are after semi-colons
		db BELLSPROUT ;30 level is no longer stored next to mon
		db ZUBAT ;10
		db HOUNDOUR ;10
		db BELLSPROUT ;10
		db SPINARAK;5
		db MURKROW ;5
		db SPINARAK ;5
		db BELLSPROUT ;5
		db HOOTHOOT ;4
		db WEEPINBELL ;4
		db WEEPINBELL ;3
		db BELLSPROUT ;3
		db GOLBAT ;2
		db BELLSPROUT ;2
		db HOOTHOOT ;1
		db ODDISH ;1
;day
		db BELLSPROUT ;30
		db ZUBAT ;10
		db SPINARAK ;10
		db BELLSPROUT ;10
		db HOOTHOOT ;5
		db BELLSPROUT ;5
		db MURKROW ;5
		db BELLSPROUT ;5
		db HOUNDOUR ;4
		db WEEPINBELL ;4
		db GOLBAT ;3
		db WEEPINBELL ;3
		db ZUBAT ;2
		db SPINARAK ;2
		db HOUNDOUR ;1
		db ODDISH ;1
;night
		db BELLSPROUT ;30
		db MISDREAVUS ;10
		db BELLSPROUT ;10
		db MISDREAVUS ;10
		db ZUBAT ;5
		db MISDREAVUS ;5
		db SPINARAK ;5
		db BELLSPROUT ;5
		db WEEPINBELL ;4
		db SPINARAK ;4
		db WEEPINBELL ;3
		db BELLSPROUT ;3
		db HOUNDOUR ;2
		db BELLSPROUT ;2
		db GOLBAT ;1
		db ODDISH ;1

	map SPROUT_TOWER_3F
	db $05
	db 14
	db $70
;morning Mons go here, make sure no semi-colons are where they shouldn't be (before mons), and that morning/day/night are after semi-colons
		db BELLSPROUT ;30 level is no longer stored next to mons
		db ZUBAT ;10
		db HOUNDOUR ;10
		db BELLSPROUT ;10
		db SPINARAK;5
		db MURKROW ;5
		db SPINARAK ;5
		db BELLSPROUT ;5
		db HOOTHOOT ;4
		db WEEPINBELL ;4
		db WEEPINBELL ;3
		db BELLSPROUT ;3
		db GOLBAT ;2
		db BELLSPROUT ;2
		db HOOTHOOT ;1
		db ODDISH ;1
;day
		db BELLSPROUT ;30
		db ZUBAT ;10
		db SPINARAK ;10
		db BELLSPROUT ;10
		db HOOTHOOT ;5
		db BELLSPROUT ;5
		db MURKROW ;5
		db BELLSPROUT ;5
		db HOUNDOUR ;4
		db WEEPINBELL ;4
		db GOLBAT ;3
		db WEEPINBELL ;3
		db ZUBAT ;2
		db SPINARAK ;2
		db HOUNDOUR ;1
		db ODDISH ;1
;night
		db BELLSPROUT ;30
		db MISDREAVUS ;10
		db BELLSPROUT ;10
		db MISDREAVUS ;10
		db ZUBAT ;5
		db MISDREAVUS ;5
		db SPINARAK ;5
		db BELLSPROUT ;5
		db WEEPINBELL ;4
		db SPINARAK ;4
		db WEEPINBELL ;3
		db BELLSPROUT ;3
		db HOUNDOUR ;2
		db BELLSPROUT ;2
		db GOLBAT ;1
		db ODDISH ;1

;	map TIN_TOWER_2F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

;	map TIN_TOWER_3F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

;	map TIN_TOWER_4F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

;	map TIN_TOWER_5F
;	db $05,$05,$05 ; encounter rates: morn/day/nite

	; morn

	; day

	; nite

;	map TIN_TOWER_6F
;	db $05,$05,$05 ; encounter rates: morn/day/nite

	; morn

	; day

	; nite

;	map TIN_TOWER_7F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

;	map TIN_TOWER_8F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

;	map TIN_TOWER_9F
;	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn

	; day

	; nite

	map BURNED_TOWER_1F
	db $0a ; encounter rates: morn/day/nite
	db 27
	db $02
	; morn
		db HOUNDOUR ;20
		db SPINARAK ;15
		db SLUGMA ;10
		db HOOTHOOT ;10
		db ZUBAT ;10
		db MURKROW ;5
		db NOCTOWL ;5
		db MURKROW ;5
		db ARIADOS ;6
		db GOLBAT ;4
		db HOUNDOOM ;3
		db HOUNDOUR ;2
		db ARIADOS ;2
		db ARIADOS ;1
		db ARIADOS ;1
		db CROBAT ;1
	; day
		db HOUNDOUR ;20
		db ZUBAT ;15
		db SLUGMA ;10
		db SPINARAK ;10
		db HOUNDOUR ;10
		db HOUNDOOM ;5
		db HOOTHOOT ;5
		db MURKROW ;5
		db GOLBAT ;6
		db ARIADOS ;4
		db ARIADOS ;3
		db ARIADOS ;2
		db CROBAT ;2
		db ARIADOS ;1
		db CROBAT ;1
		db GOLBAT ;1
	; nite
		db MISDREAVUS ;20
		db SPINARAK ;15
		db SLUGMA ;10
		db ARIADOS ;10
		db MISDREAVUS ;10
		db HOUNDOUR ;5
		db MAGMAR ;5
		db MISDREAVUS ;5
		db HOUNDOUR ;6
		db HOUNDOUR ;4
		db SPINARAK ;3
		db SPINARAK ;2
		db HOUNDOOM ;2
		db HOUNDOUR ;1
		db HOUNDOOM ;1
		db HOUNDOUR ;1

	map BURNED_TOWER_B1F
	db $0f ; encounter rates: morn/day/nite
	db 28
	db $02
	; morn
		db KOFFING ;20
		db HOUNDOUR ;15
		db SWINUB ;10
		db SLUGMA ;10
		db SHUCKLE ;10
		db SWINUB ;5
		db SLUGMA ;5
		db SHUCKLE ;5
		db LARVITAR ;6
		db MAGMAR ;4
		db LARVITAR ;3
		db LARVITAR ;2
		db HOUNDOOM ;2
		db LARVITAR ;1
		db MAGMAR ;1
		db HOUNDOOM ;1
	; day
		db SWINUB ;20
		db HOUNDOUR ;15
		db SLUGMA ;10
		db KOFFING ;10
		db LARVITAR ;10
		db HOUNDOOM ;5
		db HOUNDOOM ;5
		db SLUGMA ;5
		db MAGMAR ;6
		db LARVITAR ;4
		db SWINUB ;3
		db SHUCKLE ;2
		db MAGMAR ;2
		db SHUCKLE ;1
		db SHUCKLE ;1
		db SHUCKLE ;1
	; nite
		db MISDREAVUS ;20
		db LARVITAR ;15
		db SLUGMA ;10
		db MAGMAR ;10
		db MISDREAVUS ;10
		db KOFFING ;5
		db SHUCKLE ;5
		db SLUGMA ;5
		db HOUNDOUR ;6
		db LARVITAR ;4
		db HOUNDOUR ;3
		db SWINUB ;2
		db SWINUB ;2
		db SWINUB ;1
		db LARVITAR ;1
		db HOUNDOOM ;1

	map NATIONAL_PARK
	db $19 ; encounter rates: morn/day/nite
	db 24
	db $03
	; morn
		db LEDIAN ;15
		db SKARMORY ;10
		db PINSIR ;10
		db SCYTHER ;10
		db HERACROSS ;10
		db SUNFLORA ;5
		db CHANSEY ;5
		db ARIADOS ;5
		db GLOOM ;5
		db CHANSEY ;5
		db SUNFLORA ;5
		db BAYLEEF ;5
		db SUNFLORA ;4
		db SUNFLORA ;3
		db SCIZOR ;2
		db CHANSEY ;1
	; day
		db SCYTHER ;15
		db SKARMORY ;10
		db SUNFLORA ;10
		db BAYLEEF ;10
		db CHANSEY;10
		db AZUMARILL ;5
		db LEDIAN ;5
		db PINSIR ;5
		db SCYTHER ;5
		db SUNFLORA ;5
		db SCIZOR ;5
		db CHANSEY ;5
		db HERACROSS ;4
		db SCIZOR ;3
		db HERACROSS ;2
		db HERACROSS ;1
	; nite
		db ARIADOS ;15
		db GLOOM ;10
		db HOUNDOUR ;10
		db SKARMORY ;10
		db SNEASEL ;10
		db ARIADOS ;5
		db GLOOM ;5
		db BAYLEEF ;5
		db CHANSEY ;5
		db SNEASEL ;5
		db HOUNDOUR ;5
		db GLOOM ;5
		db SCYTHER ;4
		db SCIZOR ;3
		db SCIZOR ;2
		db SCYTHER ;1

	map RUINS_OF_ALPH_OUTSIDE
	db $0a ; encounter rates: morn/day/nite
	db 33
	db $03
;morning
		db PICHU ;15
		db CLEFFA ;10
		db SKARMORY ;10
		db BELLOSSOM ;10
		db TYROGUE ;10
		db TYROGUE ;5
		db SMEARGLE ;5
		db SMEARGLE ;5
		db SMEARGLE ;5
		db TEDDIURSA ;5
		db TEDDIURSA ;5
		db TEDDIURSA ;5
		db URSARING ;4
		db TEDDIURSA ;3
		db URSARING ;2
		db URSARING ;1
;day
		db IGGLYBUFF ;15
		db PICHU ;10
		db TYROGUE ;10
		db TYROGUE ;10
		db SMEARGLE ;10
		db TEDDIURSA ;5
		db TEDDIURSA ;5
		db TEDDIURSA ;5
		db CLEFFA ;5
		db BELLOSSOM ;5
		db SKARMORY ;5
		db SKARMORY ;5
		db URSARING ;4
		db URSARING ;3
		db TEDDIURSA ;2
		db URSARING ;1
;night
		db CLEFFA ;15
		db IGGLYBUFF ;10
		db TYROGUE ;10
		db SKARMORY ;10
		db MISDREAVUS ;10
		db MISDREAVUS ;5
		db MISDREAVUS ;5
		db MISDREAVUS ;5
		db MISDREAVUS ;5
		db PICHU ;5
		db SMEARGLE ;5
		db TEDDIURSA ;5
		db URSARING ;4
		db TEDDIURSA ;3
		db URSARING ;2
		db URSARING ;1

	map RUINS_OF_ALPH_INNER_CHAMBER
	db $0f ; encounter rates: morn/day/nite
	db 25
	db $00
;morning
		db UNOWN ;30
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;4
		db UNOWN ;4
		db UNOWN ;3
		db UNOWN ;3
		db UNOWN ;2
		db UNOWN ;2
		db UNOWN ;1
		db UNOWN ;1
;day
		db UNOWN ;30
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;4
		db UNOWN ;4
		db UNOWN ;3
		db UNOWN ;3
		db UNOWN ;2
		db UNOWN ;2
		db UNOWN ;1
		db UNOWN ;1
;night
		db UNOWN ;30
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;10
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;5
		db UNOWN ;4
		db UNOWN ;4
		db UNOWN ;3
		db UNOWN ;3
		db UNOWN ;2
		db UNOWN ;2
		db UNOWN ;1
		db UNOWN ;1

	map UNION_CAVE_1F
	db $0f ; encounter rates: morn/day/nite
	db 18
	db $01
	; morn
		db WOOPER ;20
		db SLUGMA ;20
		db SHUCKLE ;10
		db TYROGUE ;10
		db SWINUB ;5
		db LARVITAR ;5
		db SHUCKLE ;5
		db SWINUB ;5
		db GLIGAR ;4
		db LARVITAR ;4
		db GLIGAR ;3
		db PUPITAR ;3
		db GLIGAR ;2
		db QUAGSIRE ;2
		db GLIGAR ;1
		db LARVITAR ;1
	; day
		db SWINUB ;20
		db SLUGMA ;20
		db SWINUB ;10
		db SHUCKLE ;10
		db TYROGUE ;5
		db SWINUB ;5
		db SWINUB ;5
		db WOOPER ;5
		db GLIGAR ;4
		db LARVITAR ;4
		db GLIGAR ;3
		db WOOPER ;3
		db GLIGAR ;2
		db LARVITAR ;2
		db GLIGAR ;1
		db LARVITAR ;1
	; nite
		db SLUGMA ;20
		db LARVITAR ;20
		db WOOPER ;10
		db SHUCKLE ;10
		db SWINUB ;5
		db TYROGUE ;5
		db WOOPER ;5
		db TYROGUE ;5
		db GLIGAR ;4
		db SWINUB ;4
		db GLIGAR ;3
		db SHUCKLE ;3
		db GLIGAR ;2
		db TYROGUE ;2
		db GLIGAR ;1
		db SWINUB ;1

	map UNION_CAVE_B1F
	db $0f ; encounter rates: morn/day/nite
	db 19
	db $01
	; morn
		db WOOPER ;20
		db SLUGMA ;20
		db SHUCKLE ;10
		db TYROGUE ;10
		db SWINUB ;5
		db LARVITAR ;5
		db SHUCKLE ;5
		db SWINUB ;5
		db GLIGAR ;4
		db LARVITAR ;4
		db GLIGAR ;3
		db SWINUB ;3
		db GLIGAR ;2
		db SWINUB ;2
		db GLIGAR ;1
		db LARVITAR ;1
	; day
		db SWINUB ;20
		db SLUGMA ;20
		db SWINUB ;10
		db SHUCKLE ;10
		db TYROGUE ;5
		db SWINUB ;5
		db SWINUB ;5
		db WOOPER ;5
		db GLIGAR ;4
		db LARVITAR ;4
		db GLIGAR ;3
		db WOOPER ;3
		db GLIGAR ;2
		db LARVITAR ;2
		db GLIGAR ;1
		db LARVITAR ;1
	; nite
		db SLUGMA ;20
		db LARVITAR ;20
		db WOOPER ;10
		db SHUCKLE ;10
		db SWINUB ;5
		db TYROGUE ;5
		db WOOPER ;5
		db TYROGUE ;5
		db GLIGAR ;4
		db SWINUB ;4
		db GLIGAR ;3
		db SHUCKLE ;3
		db GLIGAR ;2
		db TYROGUE ;2
		db GLIGAR ;1
		db SWINUB ;1

	map UNION_CAVE_B2F
	db $0a ; encounter rates: morn/day/nite
	db 38
	db $03
	; morn
		db SLUGMA ;15
		db WOOPER ;10
		db WOOPER ;10
		db QUAGSIRE ;10
		db TYROGUE ;10
		db HITMONCHAN ;5
		db MAGCARGO ;5
		db LARVITAR ;5
		db LARVITAR ;5
		db LARVITAR ;5
		db PUPITAR ;5
		db PUPITAR ;5
		db PUPITAR ;4
		db PUPITAR ;3
		db PUPITAR ;2
		db PUPITAR ;1
	; day
		db SLUGMA ;15
		db WOOPER ;10
		db QUAGSIRE ;10
		db LARVITAR ;10
		db HITMONCHAN ;10
		db HITMONCHAN ;5
		db TYROGUE ;5
		db MAGCARGO ;5
		db PSYDUCK ;5
		db PUPITAR ;5
		db QUAGSIRE ;5
		db PUPITAR ;5
		db OCTILLERY ;4
		db GOLDUCK ;3
		db PSYDUCK ;2
		db OCTILLERY ;1
	; nite
		db SLUGMA ;15
		db LARVITAR ;10
		db LARVITAR ;10
		db QUAGSIRE ;10
		db PSYDUCK ;10
		db GOLDUCK ;5
		db MAGCARGO ;5
		db PUPITAR ;5
		db PUPITAR ;5
		db PUPITAR ;5
		db HITMONCHAN ;5
		db WOOPER ;5
		db OCTILLERY ;4
		db OCTILLERY ;3
		db OCTILLERY ;2
		db OCTILLERY ;1

	map SLOWPOKE_WELL_B1F
	db $05 ; encounter rates: morn/day/nite
	db 20
	db $00
	; morn
		db SLOWPOKE ;30
		db MARILL ;10
		db SWINUB ;10
		db WOOPER ;10
		db CORSOLA ;5
		db WOOPER ;5
		db MARILL ;5
		db SLOWPOKE ;5
		db MARILL ;4
		db AZUMARILL ;4
		db MARILL ;3
		db SWINUB ;3
		db MARILL ;2
		db AZUMARILL ;2
		db MARILL ;1
		db AZUMARILL ;1
	; day
		db SLOWPOKE ;30
		db SWINUB ;10
		db WOOPER ;10
		db SWINUB ;10
		db CORSOLA ;5
		db WOOPER ;5
		db SPINARAK ;5
		db SLOWPOKE ;5
		db SWINUB ;4
		db MARILL ;4
		db MARILL ;3
		db SWINUB ;3
		db MARILL ;2
		db AZUMARILL ;2
		db AZUMARILL ;1
		db AZUMARILL ;1
	; nite
		db SLOWPOKE ;30
		db WOOPER ;10
		db SPINARAK ;10
		db WOOPER ;10
		db WOOPER ;5
		db CORSOLA ;5
		db SPINARAK ;5
		db SLOWPOKE ;5
		db SWINUB ;4
		db SPINARAK ;4
		db SPINARAK ;3
		db SPINARAK ;3
		db SPINARAK ;2
		db SWINUB ;2
		db SPINARAK ;1
		db SPINARAK ;1

	map SLOWPOKE_WELL_B2F
	db $05 ; encounter rates: morn/day/nite
	db 38
	db $00
	; morn
		db SLOWPOKE ;30
		db AZUMARILL ;10
		db MARILL ;10
		db SLOWKING ;10
		db SLOWPOKE ;5
		db SWINUB ;5
		db WOOPER ;5
		db AZUMARILL ;5
		db SWINUB ;4
		db CORSOLA ;4
		db WOOPER ;3
		db SLOWBRO ;3
		db QUAGSIRE ;2
		db CORSOLA ;2
		db CORSOLA ;1
		db PILOSWINE ;1
	; day
		db SLOWPOKE ;30
		db SWINUB ;10
		db WOOPER ;10
		db AZUMARILL ;10
		db SLOWPOKE ;5
		db WOOPER ;5
		db SLOWBRO ;5
		db SLOWKING ;5
		db QUAGSIRE ;4
		db CORSOLA ;4
		db SWINUB ;3
		db PILOSWINE ;3
		db SWINUB ;2
		db PILOSWINE ;2
		db QUAGSIRE ;1
		db CORSOLA ;1
	; nite
		db SLOWPOKE ;30
		db SLOWBRO ;10
		db WOOPER ;10
		db WOOPER ;10
		db SLOWPOKE ;5
		db QUAGSIRE ;5
		db QUAGSIRE ;5
		db WOOPER ;5
		db CORSOLA;4
		db QUAGSIRE ;4
		db SLOWKING ;3
		db CORSOLA ;3
		db SWINUB ;2
		db PILOSWINE ;2
		db QUAGSIRE ;1
		db SWINUB ;1

	map ILEX_FOREST
	db $0a ; encounter rates: morn/day/nite
	db 22
	db $01
	; morn
		db PINECO ;20
		db GIRAFARIG ;20
		db BUTTERFREE ;10
		db AIPOM ;10
		db BEEDRILL ;5
		db PIDGEOTTO ;5
		db BUTTERFREE ;5
		db PINECO ;5
		db FARFETCH_D ;4
		db PIDGEOTTO ;4
		db FARFETCH_D ;3
		db STANTLER ;3
		db PIDGEOTTO ;2
		db PIDGEOTTO ;2
		db BEEDRILL ;1
		db BEEDRILL ;1
	; day
		db GIRAFARIG ;20
		db AIPOM ;20
		db BEEDRILL ;10
		db PINECO ;10
		db BUTTERFREE ;5
		db GIRAFARIG ;5
		db BEEDRILL ;5
		db FARFETCH_D ;5
		db PINECO ;4
		db PIDGEOTTO ;4
		db PINECO ;3
		db PINECO ;3
		db PIDGEOTTO ;2
		db PIDGEOTTO ;2
		db BUTTERFREE ;1
		db BUTTERFREE ;1
	; nite
		db STANTLER ;20
		db NOCTOWL ;20
		db MURKROW ;10
		db MISDREAVUS ;10
		db BUTTERFREE ;5
		db BEEDRILL ;5
		db MURKROW ;5
		db NOCTOWL ;5
		db MISDREAVUS ;4
		db MISDREAVUS ;4
		db PINECO ;3
		db PINECO ;3
		db PINECO ;2
		db PINECO ;2
		db MISDREAVUS ;1
		db MISDREAVUS ;1

	map MOUNT_MORTAR_1F_OUTSIDE
	db $0f ; encounter rates: morn/day/nite
	db 30
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db GRAVELER ;10
		db GOLBAT ;10
		db ONIX ;10
		db WOBBUFFET ;5
		db CORSOLA ;5
		db TYROGUE ;5
		db ONIX ;6
		db STEELIX ;4
		db STEELIX ;3
		db GRAVELER ;2
		db SWINUB ;2
		db CROBAT ;1
		db CROBAT ;1
		db CROBAT ;1
	; day
		db GOLBAT ;20
		db PUPITAR ;15
		db LARVITAR ;10
		db SWINUB ;10
		db CROBAT ;10
		db QUAGSIRE ;5
		db STEELIX ;5
		db GRAVELER ;5
		db ONIX ;6
		db CORSOLA ;4
		db WOBBUFFET ;3
		db ONIX ;2
		db WOBBUFFET ;2
		db GRAVELER ;1
		db PILOSWINE ;1
		db CORSOLA ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GRAVELER ;10
		db ONIX ;10
		db GOLBAT ;10
		db CORSOLA ;5
		db PUPITAR ;5
		db WOBBUFFET ;5
		db LARVITAR ;6
		db GRAVELER ;4
		db SWINUB ;3
		db CROBAT ;2
		db ONIX ;2
		db GRAVELER ;1
		db SWINUB ;1
		db GRAVELER ;1

	map MOUNT_MORTAR_1F_INSIDE
	db $0f ; encounter rates: morn/day/nite
	db 30
	db $01
	; morn
		db LARVITAR ;20
		db PUPITAR ;20
		db SLUGMA ;10
		db ONIX ;10
		db GRAVELER ;5
		db WOBBUFFET ;5
		db SHUCKLE ;5
		db GRAVELER ;5
		db STEELIX ;4
		db SLUGMA ;4
		db MAGCARGO ;3
		db GRAVELER ;3
		db MAGCARGO ;2
		db GRAVELER ;2
		db ONIX ;1
		db SLUGMA ;1
	; day
		db PUPITAR ;20
		db SLUGMA ;20
		db MAGCARGO ;10
		db LARVITAR ;10
		db GRAVELER ;5
		db WOBBUFFET ;5
		db SHUCKLE ;5
		db QUAGSIRE ;5
		db ONIX ;4
		db MAGCARGO ;4
		db GRAVELER ;3
		db STEELIX ;3
		db ONIX ;2
		db GRAVELER ;2
		db MAGCARGO ;1
		db ONIX ;1
	; nite
		db LARVITAR ;20
		db ONIX ;20
		db SLUGMA ;10
		db PUPITAR ;10
		db WOBBUFFET ;5
		db LARVITAR ;5
		db SLUGMA ;5
		db PUPITAR ;5
		db SHUCKLE ;4
		db GRAVELER ;4
		db STEELIX ;3
		db MAGCARGO ;3
		db STEELIX ;2
		db MAGCARGO ;2
		db SHUCKLE ;1
		db GRAVELER ;1

	map MOUNT_MORTAR_2F_INSIDE
	db $0f ; encounter rates: morn/day/nite
	db 53
	db $01
	; morn
		db PUPITAR ;20
		db LARVITAR ;20
		db POLIWHIRL ;10
		db WOOPER ;10
		db WOBBUFFET ;5
		db CORSOLA ;5
		db TYROGUE ;5
		db HITMONLEE ;5
		db ONIX ;4
		db POLITOED ;4
		db ONIX ;3
		db POLITOED ;3
		db STEELIX ;2
		db QUAGSIRE ;2
		db POLIWRATH ;1
		db ONIX ;1
	; day
		db PUPITAR ;20
		db POLIWHIRL ;20
		db LARVITAR ;10
		db CORSOLA ;10
		db QUAGSIRE ;5
		db HITMONTOP ;5
		db WOBBUFFET ;5
		db WOOPER ;5
		db POLIWRATH ;4
		db ONIX ;4
		db HITMONLEE ;3
		db POLITOED ;3
		db QUAGSIRE ;2
		db HITMONLEE ;2
		db QUAGSIRE ;1
		db STEELIX ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;20
		db LARVITAR ;10
		db HITMONLEE ;10
		db CORSOLA ;5
		db WOBBUFFET ;5
		db QUAGSIRE ;5
		db HITMONLEE ;5
		db POLIWHIRL ;4
		db ONIX ;4
		db ONIX ;3
		db POLIWHIRL ;3
		db STEELIX ;2
		db POLIWHIRL ;2
		db ONIX ;1
		db POLITOED ;1

	map MOUNT_MORTAR_B1F
	db $0f ; encounter rates: morn/day/nite
	db 34
	db $01
	; morn
		db PUPITAR ;20
		db WOOPER ;20
		db POLIWHIRL ;10
		db LARVITAR ;10
		db WOBBUFFET ;5
		db CORSOLA ;5
		db POLIWHIRL ;5
		db LARVITAR ;5
		db ONIX ;4
		db POLITOED ;4
		db ONIX ;3
		db POLITOED ;3
		db STEELIX ;2
		db QUAGSIRE ;2
		db POLIWRATH ;1
		db ONIX ;1
	; day
		db PUPITAR ;20
		db POLIWHIRL ;20
		db QUAGSIRE;10
		db CORSOLA ;10
		db LARVITAR ;5
		db LARVITAR ;5
		db WOBBUFFET ;5
		db WOOPER ;5
		db POLIWRATH ;4
		db ONIX ;4
		db ONIX ;3
		db POLITOED ;3
		db QUAGSIRE ;2
		db STEELIX ;2
		db QUAGSIRE ;1
		db ONIX ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;20
		db LARVITAR ;10
		db WOOPER ;10
		db CORSOLA ;5
		db WOBBUFFET ;5
		db QUAGSIRE ;5
		db WOOPER ;5
		db POLIWHIRL ;4
		db ONIX ;4
		db ONIX ;3
		db POLIWHIRL ;3
		db STEELIX ;2
		db POLIWHIRL ;2
		db ONIX ;1
		db POLITOED ;1

	map ICE_PATH_1F
	db $07 ; encounter rates: morn/day/nite
	db 47
	db $02
	; morn
		db SWINUB ;20
		db SMOOCHUM ;15
		db SNEASEL ;10
		db DELIBIRD ;10
		db GOLBAT ;10
		db SNEASEL ;5
		db PILOSWINE ;5
		db SNEASEL ;5
		db JYNX ;6
		db SWINUB ;4
		db SMOOCHUM ;3
		db CROBAT ;2
		db PILOSWINE ;2
		db CROBAT ;1
		db GOLBAT ;1
		db JYNX ;1
	; day
		db SWINUB ;20
		db SWINUB ;15
		db GOLBAT ;10
		db DELIBIRD ;10
		db SNEASEL ;10
		db GOLBAT ;5
		db CROBAT ;5
		db PILOSWINE ;5
		db SMOOCHUM ;6
		db JYNX ;4
		db SMOOCHUM ;3
		db PILOSWINE ;2
		db PILOSWINE ;2
		db PILOSWINE ;1
		db SNEASEL ;1
		db SNEASEL ;1
	; nite
		db SNEASEL ;20
		db SNEASEL ;15
		db SWINUB ;10
		db JYNX ;10
		db DELIBIRD ;10
		db PILOSWINE ;5
		db SMOOCHUM ;5
		db SMOOCHUM ;5
		db PILOSWINE ;6
		db GOLBAT ;4
		db PILOSWINE ;3
		db SMOOCHUM ;2
		db SMOOCHUM ;2
		db GOLBAT ;1
		db SMOOCHUM ;1
		db CROBAT ;1

	map ICE_PATH_B1F
	db $02 ; encounter rates: morn/day/nite
	db 48
	db $02
	; morn
		db SWINUB ;20
		db SMOOCHUM ;15
		db SNEASEL ;10
		db DELIBIRD ;10
		db GOLBAT ;10
		db SNEASEL ;5
		db PILOSWINE ;5
		db SNEASEL ;5
		db JYNX ;6
		db SWINUB ;4
		db SMOOCHUM ;3
		db CROBAT ;2
		db PILOSWINE ;2
		db CROBAT ;1
		db GOLBAT ;1
		db JYNX ;1
	; day
		db SWINUB ;20
		db SWINUB ;15
		db GOLBAT ;10
		db DELIBIRD ;10
		db SNEASEL ;10
		db GOLBAT ;5
		db CROBAT ;5
		db PILOSWINE ;5
		db SMOOCHUM ;6
		db JYNX ;4
		db SMOOCHUM ;3
		db PILOSWINE ;2
		db PILOSWINE ;2
		db PILOSWINE ;1
		db SNEASEL ;1
		db SNEASEL ;1
	; nite
		db SNEASEL ;20
		db SNEASEL ;15
		db SWINUB ;10
		db JYNX ;10
		db DELIBIRD ;10
		db PILOSWINE ;5
		db SMOOCHUM ;5
		db SMOOCHUM ;5
		db PILOSWINE ;6
		db GOLBAT ;4
		db PILOSWINE ;3
		db SMOOCHUM ;2
		db SMOOCHUM ;2
		db GOLBAT ;1
		db SMOOCHUM ;1
		db CROBAT ;1

;	map ICE_PATH_B2F_MAHOGANY_SIDE
;	db $05,$05,$05 ; encounter rates: morn/day/nite

;	map ICE_PATH_B2F_BLACKTHORN_SIDE
;	db $05,$05,$05 ; encounter rates: morn/day/nite

;	map ICE_PATH_B3F
;	db $05,$05,$05 ; encounter rates: morn/day/nite

	map WHIRL_ISLAND_NW
	db $0f ; encounter rates: morn/day/nite
	db 73
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db SHUCKLE ;10
		db KRABBY ;10
		db GLIGAR ;10
		db GOLBAT ;5
		db CORSOLA ;5
		db SHUCKLE ;5
		db KINGLER ;6
		db RHYHORN ;4
		db KRABBY ;3
		db GOLBAT ;2
		db CROBAT ;2
		db CROBAT ;1
		db RHYDON ;1
		db KINGLER ;1
	; day
		db PUPITAR ;20
		db GOLBAT ;15
		db LARVITAR ;10
		db KRABBY ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db SHUCKLE ;5
		db RHYHORN ;5
		db CROBAT ;6
		db KINGLER ;4
		db CORSOLA ;3
		db RHYDON ;2
		db CORSOLA ;2
		db RHYHORN ;1
		db CROBAT ;1
		db RHYHORN ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GOLDUCK ;10
		db GLIGAR ;10
		db SHUCKLE ;10
		db KRABBY ;5
		db CORSOLA ;5
		db PUPITAR ;5
		db RHYHORN ;6
		db RHYHORN ;4
		db KINGLER ;3
		db RHYHORN ;2
		db KRABBY ;2
		db RHYDON ;1
		db RHYDON ;1
		db RHYDON ;1

	map WHIRL_ISLAND_NE
	db $0f ; encounter rates: morn/day/nite
	db 73
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db SHUCKLE ;10
		db KRABBY ;10
		db GLIGAR ;10
		db GOLBAT ;5
		db CORSOLA ;5
		db SHUCKLE ;5
		db KINGLER ;6
		db RHYHORN ;4
		db KRABBY ;3
		db GOLBAT ;2
		db CROBAT ;2
		db CROBAT ;1
		db RHYDON ;1
		db KINGLER ;1
	; day
		db PUPITAR ;20
		db GOLBAT ;15
		db LARVITAR ;10
		db KRABBY ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db SHUCKLE ;5
		db RHYHORN ;5
		db CROBAT ;6
		db KINGLER ;4
		db CORSOLA ;3
		db RHYDON ;2
		db CORSOLA ;2
		db RHYHORN ;1
		db CROBAT ;1
		db RHYHORN ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GOLDUCK ;10
		db GLIGAR ;10
		db SHUCKLE ;10
		db KRABBY ;5
		db CORSOLA ;5
		db PUPITAR ;5
		db RHYHORN ;6
		db RHYHORN ;4
		db KINGLER ;3
		db RHYHORN ;2
		db KRABBY ;2
		db RHYDON ;1
		db RHYDON ;1
		db RHYDON ;1

	map WHIRL_ISLAND_SW
	db $0f ; encounter rates: morn/day/nite
	db 73
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db SHUCKLE ;10
		db KRABBY ;10
		db GLIGAR ;10
		db GOLBAT ;5
		db CORSOLA ;5
		db SHUCKLE ;5
		db KINGLER ;6
		db RHYHORN ;4
		db KRABBY ;3
		db GOLBAT ;2
		db CROBAT ;2
		db CROBAT ;1
		db RHYDON ;1
		db KINGLER ;1
	; day
		db PUPITAR ;20
		db GOLBAT ;15
		db LARVITAR ;10
		db KRABBY ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db SHUCKLE ;5
		db RHYHORN ;5
		db CROBAT ;6
		db KINGLER ;4
		db CORSOLA ;3
		db RHYDON ;2
		db CORSOLA ;2
		db RHYHORN ;1
		db CROBAT ;1
		db RHYHORN ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GOLDUCK ;10
		db GLIGAR ;10
		db SHUCKLE ;10
		db KRABBY ;5
		db CORSOLA ;5
		db PUPITAR ;5
		db RHYHORN ;6
		db RHYHORN ;4
		db KINGLER ;3
		db RHYHORN ;2
		db KRABBY ;2
		db RHYDON ;1
		db RHYDON ;1
		db RHYDON ;1

	map WHIRL_ISLAND_CAVE
	db $0f ; encounter rates: morn/day/nite
	db 73
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db SHUCKLE ;10
		db KRABBY ;10
		db GLIGAR ;10
		db GOLBAT ;5
		db CORSOLA ;5
		db SHUCKLE ;5
		db KINGLER ;6
		db RHYHORN ;4
		db KRABBY ;3
		db GOLBAT ;2
		db CROBAT ;2
		db CROBAT ;1
		db RHYDON ;1
		db KINGLER ;1
	; day
		db PUPITAR ;20
		db GOLBAT ;15
		db LARVITAR ;10
		db KRABBY ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db SHUCKLE ;5
		db RHYHORN ;5
		db CROBAT ;6
		db KINGLER ;4
		db CORSOLA ;3
		db RHYDON ;2
		db CORSOLA ;2
		db RHYHORN ;1
		db CROBAT ;1
		db RHYHORN ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GOLDUCK ;10
		db GLIGAR ;10
		db SHUCKLE ;10
		db KRABBY ;5
		db CORSOLA ;5
		db PUPITAR ;5
		db RHYHORN ;6
		db RHYHORN ;4
		db KINGLER ;3
		db RHYHORN ;2
		db KRABBY ;2
		db RHYDON ;1
		db RHYDON ;1
		db RHYDON ;1

	map WHIRL_ISLAND_SE
	db $0f ; encounter rates: morn/day/nite
	db 73
	db $02
	; morn
		db PUPITAR ;20
		db LARVITAR ;15
		db SHUCKLE ;10
		db KRABBY ;10
		db GLIGAR ;10
		db GOLBAT ;5
		db CORSOLA ;5
		db SHUCKLE ;5
		db KINGLER ;6
		db RHYHORN ;4
		db KRABBY ;3
		db GOLBAT ;2
		db CROBAT ;2
		db CROBAT ;1
		db RHYDON ;1
		db KINGLER ;1
	; day
		db PUPITAR ;20
		db GOLBAT ;15
		db LARVITAR ;10
		db KRABBY ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db SHUCKLE ;5
		db RHYHORN ;5
		db CROBAT ;6
		db KINGLER ;4
		db CORSOLA ;3
		db RHYDON ;2
		db CORSOLA ;2
		db RHYHORN ;1
		db CROBAT ;1
		db RHYHORN ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db GOLDUCK ;10
		db GLIGAR ;10
		db SHUCKLE ;10
		db KRABBY ;5
		db CORSOLA ;5
		db PUPITAR ;5
		db RHYHORN ;6
		db RHYHORN ;4
		db KINGLER ;3
		db RHYHORN ;2
		db KRABBY ;2
		db RHYDON ;1
		db RHYDON ;1
		db RHYDON ;1

	map WHIRL_ISLAND_B1F
	db $0f ; encounter rates: morn/day/nite
	db 74
	db $01
	; morn
		db LARVITAR ;20
		db PUPITAR ;20
		db SHUCKLE ;10
		db GLIGAR ;10
		db SHUCKLE ;5
		db MAGCARGO ;5
		db SHUCKLE ;5
		db MAGCARGO ;5
		db ONIX ;4
		db WOBBUFFET ;4
		db STEELIX ;3
		db ONIX ;3
		db ONIX ;2
		db ONIX ;2
		db ONIX ;1
		db WOBBUFFET ;1
	; day
		db PUPITAR ;20
		db ONIX ;20
		db LARVITAR ;10
		db WOBBUFFET ;10
		db GLIGAR ;5
		db SHUCKLE ;5
		db GLIGAR ;5
		db SHUCKLE ;5
		db MAGCARGO ;4
		db MAGCARGO ;4
		db STEELIX ;3
		db STEELIX ;3
		db LARVITAR ;2
		db LARVITAR ;2
		db LARVITAR ;1
		db STEELIX ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;20
		db GLIGAR ;10
		db LARVITAR ;10
		db WOBBUFFET ;5
		db SHUCKLE ;5
		db ONIX ;5
		db SHUCKLE ;5
		db GLIGAR ;4
		db WOBBUFFET ;4
		db ONIX ;3
		db GLIGAR ;3
		db STEELIX ;2
		db GLIGAR ;2
		db GLIGAR ;1
		db ONIX ;1

	map WHIRL_ISLAND_B2F
	db $0f ; encounter rates: morn/day/nite
	db 75
	db $03
	; morn
		db MARILL ;15
		db AZUMARILL ;10
		db KRABBY ;10
		db SHUCKLE ;10
		db CORSOLA ;10
		db AZUMARILL ;5
		db QUAGSIRE ;5
		db KINGLER ;5
		db WOBBUFFET ;5
		db KRABBY ;5
		db SHUCKLE ;5
		db AZUMARILL ;5
		db KINGLER ;4
		db QUAGSIRE ;3
		db QUAGSIRE ;2
		db KINGLER ;1
	; day
		db KRABBY ;15
		db QUAGSIRE ;10
		db MARILL ;10
		db KINGLER ;10
		db KRABBY ;10
		db QUAGSIRE ;5
		db AZUMARILL ;5
		db WOBBUFFET ;5
		db SHUCKLE ;5
		db WOBBUFFET ;5
		db SHUCKLE ;5
		db GOLDUCK ;5
		db CORSOLA ;4
		db CORSOLA ;3
		db CORSOLA ;2
		db CORSOLA ;1
	; nite
		db PSYDUCK ;15
		db QUAGSIRE ;10
		db MARILL ;10
		db QUAGSIRE ;10
		db PSYDUCK ;10
		db AZUMARILL ;5
		db GOLDUCK ;5
		db SHUCKLE ;5
		db WOBBUFFET ;5
		db AZUMARILL ;5
		db GOLDUCK ;5
		db SHUCKLE ;5
		db CORSOLA ;4
		db CORSOLA ;3
		db CORSOLA ;2
		db CORSOLA ;1

;	map WHIRL_ISLAND_LUGIA_CHAMBER
;	db $0f,$0f,$0f ; encounter rates: morn/day/nite

	map SILVER_CAVE_ROOM_1
	db $0f ; encounter rates: morn/day/nite
	db 88
	db $03
;morning
		db STEELIX ;15
		db FLAREON ;10
		db MAGMAR ;10
		db CROBAT ;10
		db DONPHAN ;10
		db GOLEM ;5
		db GOLEM ;5
		db DUGTRIO ;5
		db BLASTOISE ;5
		db BLASTOISE ;5
		db HITMONLEE ;5
		db HITMONLEE ;5
		db LARVITAR ;4
		db LARVITAR ;3
		db LARVITAR ;2
		db LARVITAR ;1
;day
		db CROBAT ;15
		db FLAREON ;10
		db MAGMAR ;10
		db STEELIX ;10
		db BLASTOISE ;10
		db BLASTOISE ;5
		db DUGTRIO ;5
		db DONPHAN ;5
		db DUGTRIO ;5
		db DUGTRIO ;5
		db HITMONLEE ;5
		db HITMONLEE ;5
		db LARVITAR ;4
		db LARVITAR ;3
		db LARVITAR ;2
		db LARVITAR ;1
;night
		db DONPHAN ;15
		db FLAREON ;10
		db MAGMAR ;10
		db GOLEM ;10
		db DUGTRIO ;10
		db GOLEM ;5
		db CROBAT ;5
		db BLASTOISE ;5
		db STEELIX ;5
		db GOLEM ;5
		db HITMONLEE ;5
		db HITMONLEE ;5
		db LARVITAR ;4
		db LARVITAR ;3
		db LARVITAR ;2
		db LARVITAR ;1

	map SILVER_CAVE_ROOM_2
	db $0f ; encounter rates: morn/day/nite
	db 88
	db $03
;morning
		db FERALIGATR ;15
		db VAPOREON ;10
		db UMBREON ;10
		db URSARING ;10
		db JYNX;10
		db JYNX ;5
		db DRAGONITE ;5
		db RHYDON ;5
		db KANGASKHAN ;5
		db KANGASKHAN ;5
		db HITMONCHAN ;5
		db HITMONCHAN ;5
		db PUPITAR ;4
		db PUPITAR ;3
		db PUPITAR ;2
		db PUPITAR ;1
;day
		db DRAGONITE ;15
		db VAPOREON ;10
		db UMBREON ;10
		db JYNX ;10
		db RHYDON ;10
		db RHYDON ;5
		db FERALIGATR ;5
		db URSARING ;5
		db KANGASKHAN ;5
		db KANGASKHAN ;5
		db HITMONCHAN ;5
		db HITMONCHAN ;5
		db PUPITAR ;4
		db PUPITAR ;3
		db PUPITAR ;2
		db PUPITAR ;1
;night
		db URSARING ;15
		db VAPOREON ;10
		db UMBREON ;10
		db FERALIGATR ;10
		db DRAGONITE ;10
		db RHYDON ;5
		db RHYDON ;5
		db JYNX ;5
		db KANGASKHAN ;5
		db KANGASKHAN ;5
		db HITMONCHAN ;5
		db HITMONCHAN ;5
		db PUPITAR ;4
		db PUPITAR ;3
		db PUPITAR ;2
		db PUPITAR ;1

	map SILVER_CAVE_ROOM_3
	db $0f ; encounter rates: morn/day/nite
	db 88
	db $03
;morning
		db TYPHLOSION ;15
		db CHARIZARD ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db GENGAR ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1
;day
		db CHARIZARD ;15
		db GENGAR ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db TYPHLOSION ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1
;night
		db GENGAR ;15
		db TYPHLOSION ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db CHARIZARD ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1

	map SILVER_CAVE_ITEM_ROOMS
	db $0f ; encounter rates: morn/day/nite
	db 88
	db $03
;morning
		db TYPHLOSION ;15
		db CHARIZARD ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db GENGAR ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1
;day
		db CHARIZARD ;15
		db GENGAR ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db TYPHLOSION ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1
;night
		db GENGAR ;15
		db TYPHLOSION ;10
		db ELECTABUZZ ;10
		db HITMONTOP ;10
		db ALAKAZAM ;10
		db CHARIZARD ;5
		db ESPEON ;5
		db ESPEON ;5
		db JOLTEON ;5
		db JOLTEON ;5
		db SNORLAX ;5
		db SNORLAX ;5
		db TYRANITAR ;4
		db TYRANITAR ;3
		db TYRANITAR ;2
		db TYRANITAR ;1

	map DARK_CAVE_VIOLET_ENTRANCE
	db $0a ; encounter rates: morn/day/nite
	db 18
	db $60
	; morn
		db TYROGUE ;30
		db LARVITAR ;10
		db SLUGMA ;10
		db SHUCKLE ;10
		db WOOPER ;5
		db WOOPER ;5
		db SLUGMA ;5
		db SWINUB ;5
		db LARVITAR ;4
		db WOBBUFFET ;4
		db LARVITAR ;3
		db DUNSPARCE ;3
		db LARVITAR ;2
		db DUNSPARCE ;2
		db LARVITAR ;1
		db QUAGSIRE ;1
	; day
		db SWINUB ;30
		db LARVITAR ;10
		db SLUGMA ;10
		db TYROGUE ;10
		db LARVITAR ;5
		db SLUGMA ;5
		db SPINARAK ;5
		db SHUCKLE ;5
		db WOBBUFFET ;4
		db DUNSPARCE ;4
		db WOOPER ;3
		db QUAGSIRE ;3
		db WOOPER ;2
		db WOOPER ;2
		db WOBBUFFET ;1
		db DUNSPARCE ;1
	; nite
		db LARVITAR ;30
		db SPINARAK ;10
		db SLUGMA ;10
		db WOBBUFFET ;10
		db SPINARAK ;5
		db SLUGMA ;5
		db ARIADOS ;5
		db SWINUB ;5
		db ARIADOS ;4
		db WOOPER ;4
		db SHUCKLE ;3
		db DUNSPARCE ;3
		db SHUCKLE ;2
		db DUNSPARCE ;2
		db QUAGSIRE ;1
		db SPINARAK ;1

	map DARK_CAVE_BLACKTHORN_ENTRANCE
	db $0a ; encounter rates: morn/day/nite
	db 49
	db $e2
	; morn
		db PUPITAR ;20
		db SHUCKLE ;15
		db LARVITAR ;10
		db SLUGMA ;10
		db TEDDIURSA ;10
		db WOBBUFFET ;5
		db QUAGSIRE ;5
		db DUNSPARCE ;5
		db TYRANITAR ;6
		db SPINARAK ;4
		db MAGCARGO ;3
		db LARVITAR ;2
		db URSARING ;2
		db MAGCARGO ;1
		db MAGCARGO ;1
		db ARIADOS ;1
	; day
		db PUPITAR ;20
		db TEDDIURSA ;15
		db SLUGMA ;10
		db QUAGSIRE ;10
		db SHUCKLE ;10
		db DUNSPARCE ;5
		db WOBBUFFET ;5
		db URSARING ;5
		db LARVITAR ;6
		db MAGCARGO ;4
		db LARVITAR ;3
		db TYRANITAR ;2
		db URSARING ;2
		db LARVITAR ;1
		db MAGCARGO ;1
		db TYRANITAR ;1
	; nite
		db LARVITAR ;20
		db PUPITAR ;15
		db SLUGMA ;10
		db SPINARAK ;10
		db ARIADOS ;10
		db MAGCARGO ;5
		db QUAGSIRE ;5
		db ARIADOS ;5
		db SHUCKLE ;6
		db SHUCKLE ;4
		db WOBBUFFET ;3
		db DUNSPARCE ;2
		db WOBBUFFET ;2
		db DUNSPARCE ;1
		db DUNSPARCE ;1
		db DUNSPARCE ;1

	map ROUTE_29
	db $19 ; encounter rates: morn/day/nite
	db 16
	db $20
	; morn
		db HOPPIP ;30
		db SENTRET ;10
		db ELEKID ;10
		db SENTRET ;10
		db SENTRET ;5
		db SPINARAK ;5
		db MAGBY ;5
		db SMOOCHUM ;5
		db SENTRET ;4
		db HOPPIP ;4
		db SKIPLOOM ;3
		db FURRET ;3
		db SKIPLOOM ;2
		db FURRET ;2
		db SENTRET ;1
		db HOPPIP ;1
	; day
		db SENTRET ;30
		db MARILL ;10
		db HOPPIP ;10
		db MAGBY ;10
		db MARILL ;5
		db SPINARAK ;5
		db ELEKID ;5
		db SMOOCHUM ;5
		db PHANPY ;4
		db AZUMARILL ;4
		db MARILL ;3
		db MARILL ;3
		db MARILL ;2
		db MARILL ;2
		db TEDDIURSA ;1
		db SKIPLOOM ;1
	; nite
		db HOOTHOOT ;30
		db SPINARAK ;10
		db SENTRET ;10
		db SMOOCHUM ;10
		db HOOTHOOT ;5
		db SPINARAK ;5
		db ELEKID ;5
		db MAGBY ;5
		db SPINARAK ;4
		db SPINARAK ;4
		db SPINARAK ;3
		db NOCTOWL ;3
		db ARIADOS ;2
		db SPINARAK ;2
		db SPINARAK ;1
		db SPINARAK ;1

	map ROUTE_30
	db $19 ; encounter rates: morn/day/nite
	db 16
	db $41
	; morn
		db LEDYBA ;20
		db HOPPIP ;20
		db PINECO ;10
		db MAGBY ;10
		db HOPPIP ;5
		db SPINARAK ;5
		db SMOOCHUM ;5
		db ELEKID ;5
		db MARILL ;4
		db LEDIAN ;4
		db SKIPLOOM ;3
		db FURRET ;3
		db SKIPLOOM ;2
		db LEDIAN ;2
		db AZUMARILL ;1
		db ARIADOS ;1
	; day
		db PINECO ;20
		db NATU ;20
		db LEDYBA ;10
		db SMOOCHUM ;10
		db MARILL ;5
		db MAGBY ;5
		db ELEKID ;5
		db MARILL ;5
		db FURRET ;4
		db LEDIAN ;4
		db MARILL ;3
		db HOPPIP ;3
		db AZUMARILL ;2
		db HOPPIP ;2
		db FURRET ;1
		db LEDIAN ;1
	; nite
		db SPINARAK ;20
		db HOOTHOOT ;20
		db PINECO ;10
		db ELEKID ;10
		db MAGBY ;5
		db SMOOCHUM ;5
		db MARILL ;5
		db NOCTOWL ;5
		db LEDYBA ;4
		db HOOTHOOT ;4
		db MARILL ;3
		db NOCTOWL ;3
		db NOCTOWL ;2
		db ARIADOS ;2
		db LEDYBA ;1
		db HOOTHOOT ;1

	map ROUTE_31
	db $19 ; encounter rates: morn/day/nite
	db 17
	db $52
	; morn
		db SUNKERN ;20
		db MAREEP ;15
		db LEDYBA ;10
		db TYROGUE ;10
		db WOOPER ;10
		db LEDYBA ;5
		db LEDIAN ;5
		db LEDYBA ;5
		db CHIKORITA ;6
		db SUNKERN ;4
		db SUNFLORA ;3
		db FLAAFFY ;2
		db QUAGSIRE ;2
		db SUNKERN ;1
		db SUNKERN ;1
		db BAYLEEF ;1
	; day
		db MAREEP ;20
		db TYROGUE ;15
		db SUNKERN ;10
		db NATU ;10
		db WOOPER ;10
		db NATU ;5
		db FLAAFFY ;5
		db WOOPER ;5
		db CHIKORITA ;6
		db BAYLEEF ;4
		db WOOPER ;3
		db QUAGSIRE ;2
		db CHIKORITA ;2
		db SUNFLORA ;1
		db CHIKORITA ;1
		db CHIKORITA ;1
	; nite
		db WOOPER ;20
		db HOOTHOOT ;15
		db MURKROW ;10
		db MAREEP ;10
		db WOOPER ;10
		db QUAGSIRE ;5
		db NOCTOWL ;5
		db HOOTHOOT ;5
		db MURKROW ;6
		db MURKROW ;4
		db SPINARAK ;3
		db FLAAFFY ;2
		db SPINARAK ;2
		db NOCTOWL ;1
		db NOCTOWL ;1
		db CHIKORITA ;1

	map ROUTE_32
	db $19 ; encounter rates: morn/day/nite
	db 18
	db $91
	; morn
		db SUNKERN ;20
		db TOGEPI ;20
		db TOTODILE ;10
		db AIPOM ;10
		db TOGETIC ;5
		db WOOPER ;5
		db MARILL ;5
		db YANMA ;5
		db AZUMARILL ;4
		db CROCONAW ;4
		db QUAGSIRE ;3
		db SUNFLORA ;3
		db SUNFLORA ;2
		db SUNFLORA ;2
		db WOOPER ;1
		db WOOPER ;1
	; day
		db MARILL ;20
		db TOGETIC ;20
		db AIPOM ;10
		db SMEARGLE ;10
		db YANMA ;5
		db TOTODILE ;5
		db AZUMARILL ;5
		db AIPOM ;5
		db AZUMARILL ;4
		db WOOPER ;4
		db YANMA ;3
		db WOOPER ;3
		db YANMA ;2
		db WOOPER ;2
		db CROCONAW ;1
		db QUAGSIRE ;1
	; nite
		db YANMA ;20
		db MURKROW ;20
		db HOOTHOOT ;10
		db NOCTOWL ;10
		db HOUNDOUR ;5
		db SMEARGLE ;5
		db WOOPER ;5
		db HOOTHOOT ;5
		db HOUNDOUR ;4
		db NOCTOWL ;4
		db HOOTHOOT ;3
		db HOUNDOUR ;3
		db HOOTHOOT ;2
		db TOTODILE ;2
		db QUAGSIRE ;1
		db TOTODILE ;1

	map ROUTE_33
	db $19 ; encounter rates: morn/day/nite
	db 20
	db $a1
	; morn
		db HOPPIP ;20
		db FURRET ;20
		db SMEARGLE ;10
		db NATU ;10
		db LEDIAN ;5
		db SKIPLOOM ;5
		db CYNDAQUIL ;5
		db NATU ;5
		db LEDIAN ;4
		db XATU ;4
		db LEDIAN ;3
		db SKIPLOOM ;3
		db LEDIAN ;2
		db SKIPLOOM ;2
		db LEDIAN ;1
		db QUILAVA ;1
	; day
		db NATU ;20
		db FURRET ;20
		db SMEARGLE ;10
		db GIRAFARIG ;10
		db LEDIAN ;5
		db HOUNDOUR ;5
		db NATU ;5
		db SMEARGLE ;5
		db XATU ;4
		db XATU ;4
		db CYNDAQUIL ;3
		db HOUNDOUR ;3
		db HOUNDOOM ;2
		db HOUNDOUR ;2
		db HOUNDOOM ;1
		db QUILAVA ;1
	; nite
		db HOUNDOUR ;20
		db MURKROW ;20
		db NOCTOWL ;10
		db CYNDAQUIL ;10
		db HOOTHOOT ;5
		db NOCTOWL ;5
		db STANTLER ;5
		db HOUNDOOM ;5
		db QUILAVA ;4
		db NOCTOWL ;4
		db HOOTHOOT ;3
		db SMEARGLE ;3
		db HOOTHOOT ;2
		db SMEARGLE ;2
		db HOUNDOOM ;1
		db NOCTOWL ;1

	map ROUTE_34
	db $19 ; encounter rates: morn/day/nite
	db 23
	db $03
	; morn
		db CHANSEY ;15
		db TOGETIC ;10
		db GIRAFARIG ;10
		db DITTO ;10
		db IGGLYBUFF ;10
		db TOGEPI ;5
		db POLIWHIRL ;5
		db MANTINE ;5
		db PICHU ;5
		db MAGBY ;5
		db TYROGUE ;5
		db TOGEPI ;5
		db TYROGUE ;4
		db TOGEPI ;3
		db TOGEPI ;2
		db TYROGUE ;1
	; day
		db CHANSEY ;15
		db TOGETIC ;10
		db DITTO ;10
		db TOGETIC ;10
		db GIRAFARIG ;10
		db IGGLYBUFF ;5
		db SMOOCHUM ;5
		db MAGBY ;5
		db TYROGUE ;5
		db ELEKID ;5
		db TOGEPI ;5
		db MANTINE ;5
		db IGGLYBUFF ;4
		db ELEKID ;3
		db ELEKID ;2
		db CLEFFA ;1
	; nite
		db GLOOM ;15
		db POLIWHIRL ;10
		db STANTLER ;10
		db DITTO ;10
		db PICHU ;10
		db SMOOCHUM ;5
		db QUAGSIRE ;5
		db CHANSEY ;5
		db MAGBY ;5
		db ELEKID ;5
		db TYROGUE ;5
		db MANTINE ;5
		db SMOOCHUM ;4
		db CLEFFA ;3
		db CLEFFA ;2
		db SMOOCHUM ;1

	map ROUTE_35
	db $19 ; encounter rates: morn/day/nite
	db 24
	db $02
	; morn
		db LEDIAN ;20
		db YANMA ;15
		db SKIPLOOM ;10
		db SCYTHER ;10
		db BELLOSSOM ;10
		db SUNKERN ;5
		db SUNFLORA ;5
		db BAYLEEF ;5
		db SKIPLOOM ;6
		db SKIPLOOM ;4
		db SUNKERN ;3
		db AZUMARILL ;2
		db POLIWHIRL ;2
		db SUNKERN ;1
		db SUNFLORA ;1
		db SUNKERN ;1
	; day
		db SCYTHER ;20
		db AZUMARILL ;15
		db SKIPLOOM ;10
		db LEDIAN ;10
		db BAYLEEF ;10
		db YANMA ;5
		db MARILL ;5
		db BELLOSSOM ;5
		db SUNKERN ;6
		db SUNFLORA ;4
		db SUNFLORA ;3
		db SUNFLORA ;2
		db SUNKERN ;2
		db YANMA ;1
		db SUNFLORA ;1
		db SUNFLORA ;1
	; nite
		db YANMA ;20
		db HOUNDOUR ;15
		db GLOOM ;10
		db ARIADOS ;10
		db POLIWHIRL ;10
		db GLOOM ;5
		db GLOOM ;5
		db VILEPLUME ;5
		db NOCTOWL ;6
		db YANMA ;4
		db ARIADOS ;3
		db SCYTHER ;2
		db POLIWHIRL ;2
		db YANMA ;1
		db NOCTOWL ;1
		db POLIWHIRL ;1

	map ROUTE_36
	db $19 ; encounter rates: morn/day/nite
	db 17
	db $81
	; morn
		db SNUBBULL ;20
		db TEDDIURSA ;20
		db SNUBBULL ;10
		db MAREEP ;10
		db WOOPER ;5
		db SUDOWOODO ;5
		db WOOPER ;5
		db MAREEP ;5
		db FLAAFFY ;4
		db GRANBULL ;4
		db WOOPER ;3
		db MAREEP ;3
		db WOOPER ;2
		db MAREEP ;2
		db FLAAFFY ;1
		db GRANBULL ;1
	; day
		db TEDDIURSA ;20
		db MAREEP ;20
		db WOOPER ;10
		db SNUBBULL ;10
		db TEDDIURSA ;5
		db SUDOWOODO ;5
		db FLAAFFY ;5
		db WOOPER ;5
		db NATU ;4
		db FLAAFFY ;4
		db GRANBULL ;3
		db NATU ;3
		db NATU ;2
		db NATU ;2
		db FLAAFFY ;1
		db NATU ;1
	; nite
		db MURKROW ;20
		db SNEASEL ;20
		db MAREEP ;10
		db WOOPER ;10
		db FLAAFFY ;5
		db SUDOWOODO ;5
		db SNEASEL ;5
		db WOOPER ;5
		db MURKROW ;4
		db WOOPER ;4
		db QUAGSIRE ;3
		db WOOPER ;3
		db QUAGSIRE ;2
		db WOOPER ;2
		db MURKROW ;1
		db WOOPER ;1

	map ROUTE_37
	db $19 ; encounter rates: morn/day/nite
	db 27
	db $b3
	; morn
		db SNUBBULL ;15
		db TEDDIURSA ;10
		db FLAAFFY ;10
		db MAREEP ;10
		db PIDGEOTTO ;10
		db GRANBULL ;5
		db TEDDIURSA ;5
		db URSARING ;5
		db SUDOWOODO ;5
		db FLAAFFY ;5
		db ARIADOS ;5
		db BELLOSSOM ;5
		db BELLOSSOM ;4
		db STANTLER ;3
		db PIDGEOT ;2
		db AMPHAROS ;1
	; day
		db GRANBULL ;15
		db TEDDIURSA ;10
		db URSARING ;10
		db MAREEP ;10
		db FLAAFFY ;10
		db PIDGEOTTO ;5
		db AMPHAROS ;5
		db SUDOWOODO ;5
		db BELLOSSOM ;5
		db SNUBBULL ;5
		db FLAAFFY ;5
		db PIDGEOTTO ;5
		db MAREEP ;4
		db PIDGEOT ;3
		db PIDGEOTTO ;2
		db MAREEP ;1
	; nite
		db MURKROW ;15
		db STANTLER ;10
		db SNEASEL ;10
		db GLOOM ;10
		db ARIADOS ;10
		db MURKROW ;5
		db STANTLER ;5
		db SNEASEL ;5
		db TEDDIURSA ;5
		db URSARING ;5
		db SUDOWOODO ;5
		db STANTLER ;5
		db HOUNDOOM ;4
		db SNEASEL ;3
		db SNEASEL ;2
		db HOUNDOOM ;1

	map ROUTE_38
	db $19 ; encounter rates: morn/day/nite
	db 28
	db $d2
	; morn
		db FURRET ;20
		db TAUROS ;15
		db MAREEP ;10
		db MAGNEMITE ;10
		db PINECO ;10
		db EEVEE ;5
		db MILTANK ;5
		db FLAAFFY ;5
		db ESPEON ;6
		db FORRETRESS ;4
		db EEVEE ;3
		db MAGNETON ;2
		db MAGNETON ;2
		db MAGNETON ;1
		db AMPHAROS ;1
		db ESPEON ;1
	; day
		db FURRET ;20
		db FLAAFFY ;15
		db MAREEP ;10
		db MAGNEMITE ;10
		db TAUROS ;10
		db MAGNETON ;5
		db MILTANK ;5
		db EEVEE ;5
		db PINECO ;6
		db ESPEON ;4
		db ESPEON ;3
		db EEVEE ;2
		db AMPHAROS ;2
		db EEVEE ;1
		db AMPHAROS ;1
		db FORRETRESS ;1
	; nite
		db NOCTOWL ;20
		db STANTLER ;15
		db UMBREON ;10
		db PERSIAN ;10
		db HOUNDOUR ;10
		db MILTANK ;5
		db HOUNDOOM ;5
		db EEVEE ;5
		db MAGNETON ;6
		db FLAAFFY ;4
		db EEVEE ;3
		db MAGNETON ;2
		db UMBREON ;2
		db TAUROS ;1
		db AMPHAROS ;1
		db TAUROS ;1

	map ROUTE_39
	db $05 ; encounter rates: morn/day/nite
	db 30
	db $02
	; morn
		db MILTANK ;20
		db FLAAFFY ;15
		db TAUROS ;10
		db TANGELA ;10
		db MAREEP ;10
		db PONYTA ;5
		db EXEGGCUTE ;5
		db TAUROS ;5
		db PONYTA ;6
		db ODDISH ;4
		db PONYTA ;3
		db AMPHAROS ;2
		db AMPHAROS ;2
		db GLOOM ;1
		db EXEGGUTOR ;1
		db PONYTA ;1
	; day
		db FLAAFFY ;20
		db MAREEP ;15
		db AMPHAROS ;10
		db MILTANK ;10
		db TAUROS ;10
		db TANGELA ;5
		db PONYTA ;5
		db EXEGGCUTE ;5
		db TAUROS ;6
		db TAUROS ;4
		db PONYTA ;3
		db PONYTA ;2
		db EXEGGCUTE ;2
		db EXEGGUTOR ;1
		db EXEGGCUTE ;1
		db EXEGGUTOR ;1
	; nite
		db STANTLER ;20
		db SNEASEL ;15
		db MILTANK ;10
		db ODDISH ;10
		db FLAAFFY ;10
		db TAUROS ;5
		db GLOOM ;5
		db PONYTA ;5
		db ODDISH ;6
		db STANTLER ;4
		db SNEASEL ;3
		db VILEPLUME ;2
		db GLOOM ;2
		db SNEASEL ;1
		db STANTLER ;1
		db AMPHAROS ;1

	map ROUTE_42
	db $19 ; encounter rates: morn/day/nite
	db 29
	db $c3
	; morn
		db TOGEPI ;15
		db GIRAFARIG ;10
		db TOGETIC ;10
		db SUNFLORA ;10
		db SPEAROW ;10
		db WOOPER ;5
		db MANKEY ;5
		db PRIMEAPE ;5
		db WOOPER ;5
		db GIRAFARIG ;5
		db QUAGSIRE ;5
		db MANKEY ;5
		db MR__MIME ;4
		db FEAROW ;3
		db SPEAROW ;2
		db QUILAVA ;1
	; day
		db TOGETIC ;15
		db GIRAFARIG ;10
		db WOOPER ;10
		db QUILAVA;10
		db GIRAFARIG ;10
		db SUNFLORA ;5
		db TOGETIC ;5
		db WOOPER ;5
		db MANKEY ;5
		db SPEAROW ;5
		db FEAROW ;5
		db SPEAROW ;5
		db QUAGSIRE ;4
		db TYPHLOSION ;3
		db PRIMEAPE ;2
		db TYPHLOSION ;1
	; nite
		db MURKROW ;15
		db WOOPER ;10
		db SNEASEL ;10
		db QUAGSIRE ;10
		db MURKROW ;10
		db GOLBAT ;5
		db QUAGSIRE ;5
		db SNEASEL ;5
		db WOOPER ;5
		db GOLBAT ;5
		db CROBAT ;5
		db SNEASEL ;5
		db QUILAVA ;4
		db WOOPER ;3
		db WOOPER ;2
		db TYPHLOSION ;1

	map ROUTE_43
	db $19 ; encounter rates: morn/day/nite
	db 30
	db $01
	; morn
		db LEDIAN ;20
		db FURRET ;20
		db NATU ;10
		db GIRAFARIG ;10
		db YANMA ;5
		db PARAS ;5
		db PARASECT ;5
		db ARIADOS ;5
		db PARAS ;4
		db PARASECT ;4
		db YANMA ;3
		db PARAS ;3
		db YANMA ;2
		db PARASECT ;2
		db PARAS ;1
		db PARASECT ;1
	; day
		db NATU ;20
		db GIRAFARIG ;20
		db FURRET ;10
		db FURRET ;10
		db GIRAFARIG ;5
		db XATU ;5
		db NATU ;5
		db XATU ;5
		db PARAS ;4
		db POLIWHIRL ;4
		db POLIWHIRL ;3
		db POLITOED ;3
		db XATU ;2
		db XATU ;2
		db PARASECT ;1
		db XATU ;1
	; nite
		db YANMA ;20
		db SNEASEL ;20
		db STANTLER ;10
		db NOCTOWL ;10
		db ARIADOS ;5
		db GOLBAT ;5
		db VENOMOTH ;5
		db ARIADOS ;5
		db VENONAT ;4
		db ARIADOS ;4
		db VENONAT ;3
		db CROBAT ;3
		db VENONAT ;2
		db GOLBAT ;2
		db VENONAT ;1
		db ARIADOS ;1

	map ROUTE_44
	db $19 ; encounter rates: morn/day/nite
	db 46
	db $03
	; morn
		db SKIPLOOM ;15
		db SUNKERN ;10
		db DELIBIRD ;10
		db LICKITUNG ;10
		db SUNFLORA ;10
		db OCTILLERY ;5
		db TANGELA ;5
		db WEEPINBELL ;5
		db TANGELA ;5
		db WEEPINBELL ;5
		db SUNKERN ;5
		db PIDGEOTTO ;5
		db JUMPLUFF ;4
		db PIDGEOT ;3
		db PIDGEOTTO ;2
		db JUMPLUFF ;1
	; day
		db DELIBIRD ;15
		db OCTILLERY ;10
		db LICKITUNG ;10
		db WEEPINBELL ;10
		db PIDGEOTTO ;10
		db DELIBIRD ;5
		db TOGETIC ;5
		db PIDGEOT ;5
		db SUNFLORA ;5
		db TANGELA ;5
		db AZUMARILL ;5
		db TOGETIC ;5
		db SKIPLOOM ;4
		db AZUMARILL ;3
		db AZUMARILL ;2
		db JUMPLUFF ;1
	; nite
		db POLIWHIRL ;15
		db MURKROW ;10
		db SNEASEL ;10
		db LICKITUNG ;10
		db POLIWHIRL ;10
		db MURKROW ;5
		db SNEASEL ;5
		db WEEPINBELL ;5
		db DELIBIRD ;5
		db POLITOED ;5
		db DELIBIRD ;5
		db SNEASEL ;5
		db POLITOED ;4
		db MURKROW ;3
		db MURKROW ;2
		db POLITOED ;1

	map ROUTE_45
	db $19 ; encounter rates: morn/day/nite
	db 48
	db $02
	; morn
		db PHANPY ;20
		db SKIPLOOM ;15
		db JUMPLUFF ;10
		db GLIGAR ;10
		db KANGASKHAN ;10
		db SKIPLOOM ;5
		db SKARMORY ;5
		db TEDDIURSA ;5
		db SANDSHREW ;6
		db DONPHAN ;4
		db URSARING ;3
		db SANDSLASH ;2
		db TEDDIURSA ;2
		db KANGASKHAN ;1
		db DONPHAN ;1
		db KANGASKHAN ;1
	; day
		db PHANPY ;20
		db DONPHAN ;15
		db TEDDIURSA ;10
		db GLIGAR ;10
		db PHANPY ;10
		db URSARING ;5
		db SKARMORY ;5
		db OCTILLERY ;5
		db SKIPLOOM ;6
		db SANDSHREW ;4
		db JUMPLUFF ;3
		db TEDDIURSA ;2
		db URSARING ;2
		db JUMPLUFF ;1
		db SANDSLASH ;1
		db KANGASKHAN ;1
	; nite
		db NOCTOWL ;20
		db STANTLER ;15
		db PHANPY ;10
		db SANDSHREW ;10
		db GLIGAR ;10
		db DONPHAN ;5
		db SKARMORY ;5
		db DONPHAN ;5
		db ARIADOS ;6
		db KANGASKHAN ;4
		db SANDSLASH ;3
		db SANDSHREW ;2
		db TEDDIURSA ;2
		db TEDDIURSA ;1
		db URSARING ;1
		db ARIADOS ;1

	map ROUTE_46
	db $19 ; encounter rates: morn/day/nite
	db 17
	db $30
	; morn
		db PHANPY ;30
		db TEDDIURSA ;10
		db TYROGUE ;10
		db SMOOCHUM ;10
		db TEDDIURSA ;5
		db TYROGUE ;5
		db ELEKID ;5
		db MAGBY ;5
		db GLIGAR ;4
		db TEDDIURSA ;4
		db GLIGAR ;3
		db PHANPY ;3
		db GLIGAR ;2
		db SKARMORY ;2
		db GLIGAR ;1
		db TEDDIURSA ;1
	; day
		db PHANPY ;30
		db TEDDIURSA ;10
		db ELEKID ;10
		db GLIGAR ;10
		db PHANPY ;5
		db TEDDIURSA ;5
		db SMOOCHUM ;5
		db MAGBY ;5
		db TYROGUE ;4
		db TEDDIURSA ;4
		db PHANPY ;3
		db TEDDIURSA ;3
		db SKARMORY ;2
		db TEDDIURSA ;2
		db TYROGUE ;1
		db TEDDIURSA ;1
	; nite
		db HOOTHOOT ;30
		db PHANPY ;10
		db MAGBY ;10
		db GLIGAR ;10
		db SPINARAK ;5
		db SMOOCHUM ;5
		db ELEKID ;5
		db TEDDIURSA ;5
		db SPINARAK ;4
		db PHANPY ;4
		db TEDDIURSA ;3
		db NOCTOWL ;3
		db ARIADOS ;2
		db TEDDIURSA ;2
		db SKARMORY ;1
		db SKARMORY ;1

	map SILVER_CAVE_OUTSIDE
	db $19 ; encounter rates: morn/day/nite
	db 86
	db $03
;morning
		db VILEPLUME ;15
		db FERALIGATR ;10
		db AZUMARILL ;10
		db ARBOK ;10
		db URSARING ;10
		db DONPHAN ;5
		db DONPHAN ;5
		db VENUSAUR ;5
		db VENUSAUR ;5
		db VENUSAUR ;5
		db MEGANIUM ;5
		db MEGANIUM ;5
		db POLIWRATH ;4
		db MEGANIUM ;3
		db MEGANIUM ;2
		db POLIWRATH ;1
;day
		db MEGANIUM ;15
		db VENUSAUR ;10
		db POLIWRATH ;10
		db AZUMARILL ;10
		db ARBOK ;10
		db AZUMARILL ;5
		db ARBOK ;5
		db FERALIGATR ;5
		db URSARING ;5
		db URSARING ;5
		db URSARING ;5
		db DONPHAN ;5
		db DONPHAN ;4
		db DONPHAN ;3
		db DONPHAN ;2
		db DONPHAN ;1
;night
		db CROBAT ;15
		db VILEPLUME ;10
		db FERALIGATR ;10
		db POLIWRATH ;10
		db SNEASEL ;10
		db FERALIGATR ;5
		db POLIWRATH ;5
		db SNEASEL ;5
		db MISDREAVUS ;5
		db MISDREAVUS ;5
		db MISDREAVUS ;5
		db ARBOK ;5
		db MEGANIUM ;4
		db VENUSAUR ;3
		db VENUSAUR ;2
		db MEGANIUM ;1

	db $ff ; end
