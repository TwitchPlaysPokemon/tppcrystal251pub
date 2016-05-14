SuicuneRoom_MapScriptHeader:
	db	0
	db	0

StaticSuicuneScript:
	loadfont
	writetext StaticSuicuneCry
	cry SUICUNE
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadpokedata SUICUNE, 0 ; Grab level from memory
	startbattle
	returnafterbattle
	disappear $2
	end

StaticSuicuneCry:
	text "Furoooooh!!"
	done

SuicuneRoom_MapEventHeader:
	db 0, 0
	db 1
	warp_def 5, 5, 4, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS

	db 0
	db 0
	db 1
	person_event SPRITE_SUICUNE, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, StaticSuicuneScript, EVENT_STATIC_SUICUNE
