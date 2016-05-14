RockTunnel1F_MapScriptHeader: ; 0x743b3
	; trigger count
	db 0

	; callback count
	db 0
; 0x743b5

ItemFragment_0x743b5: ; 0x743b5
	db THICK_CLUB, 1
; 0x743b7

ItemFragment_0x743b7: ; 0x743b7
	db ULTRA_BALL, 10
; 0x743b9

MapRockTunnel1FSignpostItem0: ; 0x743b9
	dw $00e7
	db X_ACCURACY

; 0x743bc

MapRockTunnel1FSignpostItem1: ; 0x743bc
	dw $00e8
	db ELIXER

; 0x743bf

RockTunnel1F_MapEventHeader: ; 0x743bf
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $3, $f, 1, GROUP_ROUTE_9, MAP_ROUTE_9
	warp_def $19, $b, 1, GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH
	warp_def $3, $5, 3, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $9, $f, 2, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $3, $1b, 4, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $d, $1b, 1, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 24, $7, MapRockTunnel1FSignpostItem0
	signpost 15, 21, $7, MapRockTunnel1FSignpostItem1

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 22, 8, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x743b5, EVENT_ITEM_ROCKTUNNEL1F_X_ACCURACY
	person_event SPRITE_POKE_BALL, 19, 14, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x743b7, EVENT_ITEM_ROCKTUNNEL1F_X_DEFEND
; 0x74407

