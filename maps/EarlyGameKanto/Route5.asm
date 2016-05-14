Route5RB_MapScriptHeader:
	db 0
	db 1
	dbw 1, .Callback
.Callback
	changeblock 10, 10, $66
	return

MapRoute5RBSignpost0Script:
	jumptext MapRoute5RBSignpost0Text

MapRoute5RBSignpost1Script:
	jumptext MapRoute5RBSignpost1Text

MapRoute5RBSignpost0Text:
	TX_FAR UnknownText_0x1adb66
	db "@"

MapRoute5RBSignpost1Text:
	TX_FAR Text_CeruleanCityRBLockedDoor
	db "@"

Route5RB_MapEventHeader:
	db 0, 0
	db 3
	warp_def $f, $11, 1, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE_RB, MAP_ROUTE_5_UNDERGROUND_ENTRANCE_RB
	warp_def $11, $8, 1, GROUP_ROUTE_5_SAFFRON_CITY_GATE_RB, MAP_ROUTE_5_SAFFRON_CITY_GATE_RB
	warp_def $11, $9, 2, GROUP_ROUTE_5_SAFFRON_CITY_GATE_RB, MAP_ROUTE_5_SAFFRON_CITY_GATE_RB

	db 0
	db 2
	signpost 17, 17, $0, MapRoute5RBSignpost0Script
	signpost 11, 10, $0, MapRoute5RBSignpost1Script

	db 0
