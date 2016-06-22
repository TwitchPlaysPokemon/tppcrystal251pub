ReadMonMenuIcon: ; 8eab3
	cp EGG
	jr z, .egg
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.egg
	ld a, ICON_EGG
	ret
; 8eac4

MonMenuIcons: ; 8eac4
	db ICON_BULBASAUR    ; BULBASAUR
	db ICON_IVYSAUR      ; IVYSAUR
	db ICON_VENUSAUR     ; VENUSAUR
	db ICON_CHARMANDER   ; CHARMANDER
	db ICON_CHARMELEON   ; CHARMELEON
	db ICON_CHARIZARD    ; CHARIZARD
	db ICON_SQUIRTLE     ; SQUIRTLE
	db ICON_WARTORTLE    ; WARTORTLE
	db ICON_BLASTOISE    ; BLASTOISE
	db ICON_CATERPILLAR  ; CATERPIE
	db ICON_CATERPILLAR  ; METAPOD
	db ICON_MOTH         ; BUTTERFREE
	db ICON_CATERPILLAR  ; WEEDLE
	db ICON_CATERPILLAR  ; KAKUNA
	db ICON_BUG          ; BEEDRILL
	db ICON_PIDGEY       ; PIDGEY
	db ICON_PIDGEOTTO    ; PIDGEOTTO
	db ICON_PIDGEOT      ; PIDGEOT
	db ICON_RATTATA      ; RATTATA
	db ICON_RATICATE     ; RATICATE
	db ICON_BIRD         ; SPEAROW
	db ICON_BIRD         ; FEAROW
	db ICON_SERPENT      ; EKANS
	db ICON_SERPENT      ; ARBOK
	db ICON_PIKACHU      ; PIKACHU
	db ICON_RAICHU       ; RAICHU
	db ICON_MONSTER      ; SANDSHREW
	db ICON_MONSTER      ; SANDSLASH
	db ICON_FOX          ; NIDORAN_F
	db ICON_FOX          ; NIDORINA
	db ICON_MONSTER      ; NIDOQUEEN
	db ICON_FOX          ; NIDORAN_M
	db ICON_FOX          ; NIDORINO
	db ICON_MONSTER      ; NIDOKING
	db ICON_CLEFAIRY     ; CLEFAIRY
	db ICON_CLEFAIRY     ; CLEFABLE
	db ICON_FOX          ; VULPIX
	db ICON_FOX          ; NINETALES
	db ICON_JIGGLYPUFF   ; JIGGLYPUFF
	db ICON_JIGGLYPUFF   ; WIGGLYTUFF
	db ICON_BAT          ; ZUBAT
	db ICON_BAT          ; GOLBAT
	db ICON_ODDISH       ; ODDISH
	db ICON_ODDISH       ; GLOOM
	db ICON_ODDISH       ; VILEPLUME
	db ICON_PARAS        ; PARAS
	db ICON_PARASECT     ; PARASECT
	db ICON_VENONAT      ; VENONAT
	db ICON_VENOMOTH     ; VENOMOTH
	db ICON_DIGLETT      ; DIGLETT
	db ICON_DIGLETT      ; DUGTRIO
	db ICON_FOX          ; MEOWTH
	db ICON_FOX          ; PERSIAN
	db ICON_MONSTER      ; PSYDUCK
	db ICON_MONSTER      ; GOLDUCK
	db ICON_FIGHTER      ; MANKEY
	db ICON_FIGHTER      ; PRIMEAPE
	db ICON_FOX          ; GROWLITHE
	db ICON_FOX          ; ARCANINE
	db ICON_POLIWAG      ; POLIWAG
	db ICON_POLIWAG      ; POLIWHIRL
	db ICON_POLIWAG      ; POLIWRATH
	db ICON_HUMANSHAPE   ; ABRA
	db ICON_HUMANSHAPE   ; KADABRA
	db ICON_HUMANSHAPE   ; ALAKAZAM
	db ICON_FIGHTER      ; MACHOP
	db ICON_FIGHTER      ; MACHOKE
	db ICON_FIGHTER      ; MACHAMP
	db ICON_ODDISH       ; BELLSPROUT
	db ICON_ODDISH       ; WEEPINBELL
	db ICON_ODDISH       ; VICTREEBEL
	db ICON_JELLYFISH    ; TENTACOOL
	db ICON_JELLYFISH    ; TENTACRUEL
	db ICON_GEODUDE      ; GEODUDE
	db ICON_GEODUDE      ; GRAVELER
	db ICON_GEODUDE      ; GOLEM
	db ICON_EQUINE       ; PONYTA
	db ICON_EQUINE       ; RAPIDASH
	db ICON_SLOWPOKE     ; SLOWPOKE
	db ICON_SLOWBRO      ; SLOWBRO
	db ICON_VOLTORB      ; MAGNEMITE
	db ICON_VOLTORB      ; MAGNETON
	db ICON_FARFETCHD    ; FARFETCH_D
	db ICON_BIRD         ; DODUO
	db ICON_BIRD         ; DODRIO
	db ICON_LAPRAS       ; SEEL
	db ICON_LAPRAS       ; DEWGONG
	db ICON_BLOB         ; GRIMER
	db ICON_BLOB         ; MUK
	db ICON_SHELL        ; SHELLDER
	db ICON_SHELL        ; CLOYSTER
	db ICON_GASTLY       ; GASTLY
	db ICON_HAUNTER      ; HAUNTER
	db ICON_GHOST        ; GENGAR
	db ICON_SERPENT      ; ONIX
	db ICON_HUMANSHAPE   ; DROWZEE
	db ICON_HUMANSHAPE   ; HYPNO
	db ICON_SHELL        ; KRABBY
	db ICON_SHELL        ; KINGLER
	db ICON_VOLTORB      ; VOLTORB
	db ICON_VOLTORB      ; ELECTRODE
	db ICON_ODDISH       ; EXEGGCUTE
	db ICON_ODDISH       ; EXEGGUTOR
	db ICON_CUBONE       ; CUBONE
	db ICON_MAROWAK      ; MAROWAK
	db ICON_FIGHTER      ; HITMONLEE
	db ICON_FIGHTER      ; HITMONCHAN
	db ICON_MONSTER      ; LICKITUNG
	db ICON_KOFFING      ; KOFFING
	db ICON_WEEZING      ; WEEZING
	db ICON_EQUINE       ; RHYHORN
	db ICON_MONSTER      ; RHYDON
	db ICON_CLEFAIRY     ; CHANSEY
	db ICON_ODDISH       ; TANGELA
	db ICON_MONSTER      ; KANGASKHAN
	db ICON_FISH         ; HORSEA
	db ICON_FISH         ; SEADRA
	db ICON_FISH         ; GOLDEEN
	db ICON_FISH         ; SEAKING
	db ICON_STARYU       ; STARYU
	db ICON_STARMIE      ; STARMIE
	db ICON_HUMANSHAPE   ; MR__MIME
	db ICON_SCYTHER      ; SCYTHER
	db ICON_HUMANSHAPE   ; JYNX
	db ICON_HUMANSHAPE   ; ELECTABUZZ
	db ICON_HUMANSHAPE   ; MAGMAR
	db ICON_BUG          ; PINSIR
	db ICON_EQUINE       ; TAUROS
	db ICON_MAGIKARP     ; MAGIKARP
	db ICON_GYARADOS     ; GYARADOS
	db ICON_LAPRAS       ; LAPRAS
	db ICON_BLOB         ; DITTO
	db ICON_EEVEE        ; EEVEE
	db ICON_VAPOREON     ; VAPOREON
	db ICON_JOLTEON      ; JOLTEON
	db ICON_FLAREON      ; FLAREON
	db ICON_PORYGON      ; PORYGON
	db ICON_OMANYTE      ; OMANYTE
	db ICON_OMASTAR      ; OMASTAR
	db ICON_KABUTO       ; KABUTO
	db ICON_KABUTOPS     ; KABUTOPS
	db ICON_AERODACTYL   ; AERODACTYL
	db ICON_SNORLAX      ; SNORLAX
	db ICON_ARTICUNO     ; ARTICUNO
	db ICON_ZAPDOS       ; ZAPDOS
	db ICON_MOLTRES      ; MOLTRES
	db ICON_SERPENT      ; DRATINI
	db ICON_SERPENT      ; DRAGONAIR
	db ICON_DRAGONITE    ; DRAGONITE
	db ICON_MEWTWO       ; MEWTWO
	db ICON_MEW          ; MEW
	db ICON_CHIKORITA    ; CHIKORITA
	db ICON_BAYLEEF      ; BAYLEEF
	db ICON_MEGANIUM     ; MEGANIUM
	db ICON_CYNDAQUIL    ; CYNDAQUIL
	db ICON_QUILAVA      ; QUILAVA
	db ICON_TYPHLOSION   ; TYPHLOSION
	db ICON_TOTODILE     ; TOTODILE
	db ICON_CROCONAW     ; CROCONAW
	db ICON_FERALIGATR   ; FERALIGATR
	db ICON_FOX          ; SENTRET
	db ICON_FOX          ; FURRET
	db ICON_BIRD         ; HOOTHOOT
	db ICON_BIRD         ; NOCTOWL
	db ICON_LEDIAN       ; LEDYBA
	db ICON_LEDIAN       ; LEDIAN
	db ICON_BUG          ; SPINARAK
	db ICON_BUG          ; ARIADOS
	db ICON_BAT          ; CROBAT
	db ICON_FISH         ; CHINCHOU
	db ICON_FISH         ; LANTURN
	db ICON_PIKACHU      ; PICHU
	db ICON_CLEFAIRY     ; CLEFFA
	db ICON_JIGGLYPUFF   ; IGGLYBUFF
	db ICON_CLEFAIRY     ; TOGEPI
	db ICON_BIRD         ; TOGETIC
	db ICON_BIRD         ; NATU
	db ICON_BIRD         ; XATU
	db ICON_FOX          ; MAREEP
	db ICON_MONSTER      ; FLAAFFY
	db ICON_MONSTER      ; AMPHAROS
	db ICON_ODDISH       ; BELLOSSOM
	db ICON_MARILL       ; MARILL
	db ICON_AZUMARILL    ; AZUMARILL
	db ICON_SUDOWOODO    ; SUDOWOODO
	db ICON_POLIWAG      ; POLITOED
	db ICON_ODDISH       ; HOPPIP
	db ICON_ODDISH       ; SKIPLOOM
	db ICON_ODDISH       ; JUMPLUFF
	db ICON_MONSTER      ; AIPOM
	db ICON_ODDISH       ; SUNKERN
	db ICON_ODDISH       ; SUNFLORA
	db ICON_BUG          ; YANMA
	db ICON_MONSTER      ; WOOPER
	db ICON_MONSTER      ; QUAGSIRE
	db ICON_ESPEON       ; ESPEON
	db ICON_UMBREON      ; UMBREON
	db ICON_BIRD         ; MURKROW
	db ICON_SLOWKING     ; SLOWKING
	db ICON_GHOST        ; MISDREAVUS
	db ICON_UNOWN        ; UNOWN
	db ICON_GHOST        ; WOBBUFFET
	db ICON_EQUINE       ; GIRAFARIG
	db ICON_BUG          ; PINECO
	db ICON_BUG          ; FORRETRESS
	db ICON_SERPENT      ; DUNSPARCE
	db ICON_BUG          ; GLIGAR
	db ICON_SERPENT      ; STEELIX
	db ICON_MONSTER      ; SNUBBULL
	db ICON_MONSTER      ; GRANBULL
	db ICON_FISH         ; QWILFISH
	db ICON_SCIZOR       ; SCIZOR
	db ICON_BUG          ; SHUCKLE
	db ICON_BUG          ; HERACROSS
	db ICON_FOX          ; SNEASEL
	db ICON_MONSTER      ; TEDDIURSA
	db ICON_MONSTER      ; URSARING
	db ICON_BLOB         ; SLUGMA
	db ICON_BLOB         ; MAGCARGO
	db ICON_EQUINE       ; SWINUB
	db ICON_EQUINE       ; PILOSWINE
	db ICON_SHELL        ; CORSOLA
	db ICON_FISH         ; REMORAID
	db ICON_FISH         ; OCTILLERY
	db ICON_MONSTER      ; DELIBIRD
	db ICON_FISH         ; MANTINE
	db ICON_SKARMORY     ; SKARMORY
	db ICON_FOX          ; HOUNDOUR
	db ICON_FOX          ; HOUNDOOM
	db ICON_BIGMON       ; KINGDRA
	db ICON_EQUINE       ; PHANPY
	db ICON_EQUINE       ; DONPHAN
	db ICON_PORYGON      ; PORYGON2
	db ICON_EQUINE       ; STANTLER
	db ICON_MONSTER      ; SMEARGLE
	db ICON_FIGHTER      ; TYROGUE
	db ICON_FIGHTER      ; HITMONTOP
	db ICON_HUMANSHAPE   ; SMOOCHUM
	db ICON_HUMANSHAPE   ; ELEKID
	db ICON_HUMANSHAPE   ; MAGBY
	db ICON_EQUINE       ; MILTANK
	db ICON_CLEFAIRY     ; BLISSEY
	db ICON_RAIKOU       ; RAIKOU
	db ICON_ENTEI        ; ENTEI
	db ICON_SUICUNE      ; SUICUNE
	db ICON_MONSTER      ; LARVITAR
	db ICON_MONSTER      ; PUPITAR
	db ICON_MONSTER      ; TYRANITAR
	db ICON_LUGIA        ; LUGIA
	db ICON_HO_OH        ; HO_OH
	db ICON_CELEBI       ; CELEBI

IconPointers:
	dw NullIcon
	dw PoliwagIcon
	dw JigglypuffIcon
	dw DiglettIcon
	dw PikachuIcon
	dw StaryuIcon
	dw FishIcon
	dw BirdIcon
	dw MonsterIcon
	dw ClefairyIcon
	dw OddishIcon
	dw BugIcon
	dw GhostIcon
	dw LaprasIcon
	dw HumanshapeIcon
	dw FoxIcon
	dw EquineIcon
	dw ShellIcon
	dw BlobIcon
	dw SerpentIcon
	dw VoltorbIcon
	dw SquirtleIcon
	dw BulbasaurIcon
	dw CharmanderIcon
	dw CaterpillarIcon
	dw UnownIcon
	dw GeodudeIcon
	dw FighterIcon
	dw EggIcon
	dw JellyfishIcon
	dw MothIcon
	dw BatIcon
	dw SnorlaxIcon
	dw HoOhIcon
	dw LugiaIcon
	dw GyaradosIcon
	dw SlowpokeIcon
	dw SudowoodoIcon
	dw BigmonIcon
	dw EeveeIcon
	dw VaporeonIcon
	dw JolteonIcon
	dw FlareonIcon
	dw EspeonIcon
	dw UmbreonIcon
	dw IvysaurIcon
	dw VenusaurIcon
	dw CharmeleonIcon
	dw CharizardIcon
	dw WartortleIcon
	dw BlastoiseIcon
	dw GastlyIcon
	dw HaunterIcon
	dw MewIcon
	dw MewtwoIcon
	dw SlowbroIcon
	dw SlowkingIcon
	dw RaichuIcon
	dw OmanyteIcon
	dw OmastarIcon
	dw KabutoIcon
	dw KabutopsIcon
	dw AerodactylIcon
	dw RaikouIcon
	dw EnteiIcon
	dw SuicuneIcon
	dw CelebiIcon
	dw ArticunoIcon
	dw ZapdosIcon
	dw MoltresIcon
	dw MagikarpIcon
	dw ChikoritaIcon
	dw BayleefIcon
	dw MeganiumIcon
	dw CyndaquilIcon
	dw QuilavaIcon
	dw TyphlosionIcon
	dw TotodileIcon
	dw CroconawIcon
	dw FeraligatrIcon
	dw ParasIcon
	dw ParasectIcon
	dw MarillIcon
	dw AzumarillIcon
	dw LedianIcon
	dw PorygonIcon
	dw DragoniteIcon
	dw SkarmoryIcon
	dw FarfetchdIcon
	dw RattataIcon
	dw RaticateIcon
	dw CuboneIcon
	dw MarowakIcon
	dw KoffingIcon
	dw WeezingIcon
	dw VenonatIcon
	dw VenomothIcon
	dw StarmieIcon
	dw ScytherIcon
	dw ScizorIcon
	dw PidgeyIcon
	dw PidgeottoIcon
	dw PidgeotIcon
