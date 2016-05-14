EnteiRoom_MapScriptHeader:
	db	0
	db	0

StaticEnteiScript:
	loadfont
	writetext StaticEnteiCry
	cry ENTEI
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadpokedata ENTEI, 0 ; Grab level from memory
	startbattle
	returnafterbattle
	disappear $2
	end

StaticEnteiCry:
	text "Gurooahhh!!"
	done

EnteiRoom_MapEventHeader:
	db 0, 0
	db 1
	warp_def 5, 5, 3, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND

	db 0
	db 0
	db 1
	person_event SPRITE_ENTEI, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, StaticEnteiScript, EVENT_STATIC_ENTEI
