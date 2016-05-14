Route1RB_MapScriptHeader: ; 0x1ac554
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac556

Route1RB_Youngster1Script:
	faceplayer
	loadfont
	checkevent EVENT_ROUTE_1_RB_POTION
	iftrue .GotPotion
	writetext Route1RBGivePotionText
	buttonsound
	verbosegiveitem POTION, 1
	iffalse .NoRoomForItem
	setevent EVENT_ROUTE_1_RB_POTION
.GotPotion
	writetext Route1RBGavePotionText
.NoRoomForItem
	waitbutton
	closetext
	end

Route1RB_Youngster2Script:
	jumptextfaceplayer Route1RB_CoolTrainerFText

FruitTreeScript_Route1RB: ; 0x1ac581
	fruittree $1a
; 0x1ac583

MapRoute1RBSignpost0Script:
	jumptext Route1RBSignpost0Text

Route1RBSignpost0Text: ; 0x1ac675
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done
; 0x1ac69a

Route1RBGivePotionText:
	text "Hi! I work at a"
	line "#MON MART!"

	para "It's a convenient"
	line "shop, so please"
	cont "stop by."

	para "Here, I'll give"
	line "you a sample!"
	done

Route1RBGavePotionText:
	text "We also sell #"
	line "BALLS for catching"
	cont "#MON."
	done

Route1RB_CoolTrainerFText:
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done

Route1RB_MapEventHeader: ; 0x1ac69a
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 27, 7, $0, MapRoute1RBSignpost0Script

	; people-events
	db 3
	person_event SPRITE_YOUNGSTER, 33,  8, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Route1RB_Youngster1Script, -1
	person_event SPRITE_YOUNGSTER, 17, 17, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Route1RB_Youngster2Script, -1
	person_event SPRITE_FRUIT_TREE, 11, 7, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_Route1RB, -1
; 0x1ac6cc

