; swarms in grass

; Dunsparce swarm
	map DARK_CAVE_VIOLET_ENTRANCE ;obviosly wrong, need to come back to this
	db $19
	db 25
	db $00
;morning
		db DUNSPARCE ;30
		db DUNSPARCE ;10
		db DUNSPARCE ;10
		db LARVITAR ;10
		db LARVITAR ;5
		db LARVITAR ;5
		db SWINUB ;5
		db SHUCKLE ;5
		db QUAGSIRE ;4
		db SHUCKLE ;4
		db SHUCKLE ;3
		db SHUCKLE ;3
		db WOBBUFFET ;2
		db WOBBUFFET ;2
		db WOBBUFFET ;1
		db WOBBUFFET ;1
;day
		db DUNSPARCE ;30
		db DUNSPARCE ;10
		db DUNSPARCE ;10
		db LARVITAR ;10
		db LARVITAR ;5
		db SWINUB ;5
		db SWINUB ;5
		db SWINUB ;5
		db SHUCKLE ;4
		db QUAGSIRE ;4
		db QUAGSIRE ;3
		db WOBBUFFET ;3
		db WOBBUFFET  ;2
		db WOBBUFFET  ;2
		db WOBBUFFET  ;1
		db SHUCKLE ;1
;night
		db DUNSPARCE ;30
		db DUNSPARCE ;10
		db DUNSPARCE ;10
		db LARVITAR ;10
		db LARVITAR ;5
		db LARVITAR ;5
		db LARVITAR ;5
		db WOBBUFFET ;5
		db WOBBUFFET ;4
		db QUAGSIRE ;4
		db SWINUB ;3
		db SHUCKLE ;3
		db SHUCKLE ;2
		db SWINUB ;2
		db QUAGSIRE ;1
		db WOBBUFFET ;1

; Yanma swarm
	map ROUTE_35
	db $19 ; encounter rates: morn/day/nite
	db 35
	db $00
;morning
		db YANMA ;30
		db YANMA ;10
		db SKIPLOOM ;10
		db SKIPLOOM ;10
		db YANMA ;5
		db JUMPLUFF ;5
		db JUMPLUFF ;5
		db YANMA ;5
		db SKIPLOOM ;4
		db BAYLEEF ;4
		db SUNFLORA ;3
		db SUNFLORA ;3
		db SUNFLORA ;2
		db SUNFLORA ;2
		db BAYLEEF ;1
		db SKIPLOOM ;1
;day
		db YANMA ;30
		db YANMA ;10
		db YANMA ;10
		db BAYLEEF ;10
		db YANMA ;5
		db YANMA ;5
		db BAYLEEF ;5
		db SUNFLORA ;5
		db SUNFLORA ;4
		db SUNFLORA ;4
		db SKIPLOOM ;3
		db JUMPLUFF ;3
		db SKIPLOOM ;2
		db SKIPLOOM ;2
		db SUNFLORA ;1
		db SUNFLORA ;1
;night
		db YANMA ;30
		db YANMA ;10
		db HOUNDOOM ;10
		db HOUNDOOM ;10
		db YANMA ;5
		db HOUNDOOM ;5
		db YANMA ;5
		db YANMA ;5
		db YANMA ;4
		db YANMA ;4
		db YANMA ;3
		db YANMA ;3
		db YANMA ;2
		db YANMA ;2
		db YANMA ;1
		db YANMA ;1

	db $ff ; end
