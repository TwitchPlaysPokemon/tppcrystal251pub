PokecenterRB_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

RBPokemonCenterScript: ; 0x18db28
	jumpstd pokecenternurse
	
PokecenterRB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $5, 4, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $6, 4, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 1
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, RBPokemonCenterScript, -1