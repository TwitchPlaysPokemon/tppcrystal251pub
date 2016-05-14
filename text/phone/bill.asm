BillPhoneMornGreetingText: ; 0x1b4427
	text "Good morning!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneDayGreetingText: ; 0x1b4470
	text "Good day!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneNiteGreetingText: ; 0x1b44b5
	text "Good evening!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneGeneriText: ; 0x1b44fe
	db $0, "Who's calling?", $51
	db $14, ", is it?", $4f
	db "Hang on a sec<...>", $51
	db $56, $4f
	db $56, $57

BillPhoneNotFullText: ; 0x1b452a
	text "Thanks for"
	line "waiting!"

	para $14, ", your BOX"
	line "has room for @"
	TX_RAM StringBuffer3
	text $55
	db "more #MON."

	para "Get out there and"
	line "fill it up!"
	done

BillPhoneNearlyFullText: ; 0x1b4587
	text "Thanks for"
	line "waiting!"

	para $14, ", your BOX"
	line "has room for only"
	cont "@"
	TX_RAM StringBuffer3
	text " more #MON."

	para "Maybe you should"
	line "switch your BOX."
	done

BillPhoneFullText: ; 0x1b45ed
	text "Thanks for"
	line "waiting!"

	para $14, ", your BOX"
	line "is full!"
	prompt

BillPhoneNewlyFullText: ; 0x1b4652
	text "Hi, ", $14, "?"
	line "It's me, BILL!"

	para "Thanks for using"
	line "my STORAGE SYSTEM."

	para "That last #MON"
	line "you sent filled"
	cont "your BOX up."
	prompt

BillWholePCFullText:
	text "Wow, you filled"
	line "a whole server."

	para "You'll have to"
	line "release #MON"
	cont "to make space."
	done

BillWantNextBox:
	text "I'll swap to the"
	line "next BOX with"
	cont "space for you."

	para "However<...>"
	prompt

BillThankYouText:
	text "Thank you for"
	line "using the PC"
	cont "STORAGE SYSTEM!"
	done

BillCallMeToSwitch:
	text "Okay, I'll leave"
	line "it alone."

	para "Call me back if"
	line "you change your"
	cont "mind."

	para "You can also"
	line "change boxes your-"
	cont "self via PC."
	prompt
