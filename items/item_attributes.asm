Item1Attributes:

; MASTER BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

Item2Attributes:

; ULTRA BALL
	dw 1200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; BRIGHTPOWDER
	dw 6000 ; price
	db HELD_BRIGHTPOWDER ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; GREAT BALL
	dw 600 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; # BALL
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; PREMIER BALL
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT ; can select + toss
	db BALL
	dn 0, 6 ; ball

; BICYCLE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; MOON STONE
	dw 5000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; ANTIDOTE
	dw 100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; BURN HEAL
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; ICE HEAL
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; AWAKENING
	dw 250 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; PARLYZ HEAL
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; FULL RESTORE
	dw 3000 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; MAX POTION
	dw 2500 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; HYPER POTION
	dw 1200 ; price
	db NONE ; effect
	db 200 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; SUPER POTION
	dw 700 ; price
	db NONE ; effect
	db 50 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; POTION
	dw 300 ; price
	db NONE ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; ESCAPE ROPE
	dw 550 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 6, 0 ; overworld

; REPEL
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 4, 0 ; current menu

; MAX ELIXER
	dw 4500 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; FIRE STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; THUNDERSTONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; WATER STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; POISON GUARD
	dw 5000 ; price
	db HELD_PREVENT_POISON ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; HP UP
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; PROTEIN
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; IRON
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; CARBOS
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; LUCKY PUNCH
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; CALCIUM
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; RARE CANDY
	dw 4800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; X ACCURACY
	dw 950 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; LEAF STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; METAL POWDER
	dw 10 ; price
	db HELD_METAL_POWDER ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; NUGGET
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; # DOLL
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; FULL HEAL
	dw 600 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; REVIVE
	dw 1500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; MAX REVIVE
	dw 4000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; GUARD SPEC.
	dw 700 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; SUPER REPEL
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 4, 0 ; current menu

; MAX REPEL
	dw 700 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 4, 0 ; current menu

; DIRE HIT
	dw 650 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; BURN GUARD
	dw 6000 ; price
	db HELD_PREVENT_BURN ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; FRESH WATER
	dw 200 ; price
	db NONE ; effect
	db 50 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; SODA POP
	dw 300 ; price
	db NONE ; effect
	db 60 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; LEMONADE
	dw 350 ; price
	db NONE ; effect
	db 80 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; X ATTACK
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; FREEZE GUARD
	dw 100 ; price
	db HELD_PREVENT_FREEZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; X DEFEND
	dw 550 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; X SPEED
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; X SPECIAL
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; COIN CASE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 4, 0 ; current menu

; ITEMFINDER
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; # FLUTE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 6 ; overworld

; EXP.SHARE
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; OLD ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; GOOD ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; SILVER LEAF
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SUPER ROD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; PP UP
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; ETHER
	dw 1200 ; price
	db NONE ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; MAX ETHER
	dw 2000 ; price
	db NONE ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; ELIXER
	dw 3000 ; price
	db NONE ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; RED SCALE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; SECRETPOTION
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; S.S.TICKET
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; MYSTERY EGG
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; CLEAR BELL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; SILVER WING
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; MOOMOO MILK
	dw 500 ; price
	db NONE ; effect
	db 100 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; QUICK CLAW
	dw 100 ; price
	db HELD_QUICK_CLAW ; effect
	db 60 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PSNCUREBERRY
	dw 10 ; price
	db HELD_HEAL_POISON ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; GOLD LEAF
	dw 1000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SOFT SAND
	dw 5000 ; price
	db HELD_GROUND_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SHARP BEAK
	dw 5000 ; price
	db HELD_FLYING_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PRZCUREBERRY
	dw 10 ; price
	db HELD_HEAL_PARALYZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; BURNT BERRY
	dw 10 ; price
	db HELD_HEAL_FREEZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; ICE BERRY
	dw 10 ; price
	db HELD_HEAL_BURN ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; POISON BARB
	dw 5000 ; price
	db HELD_POISON_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; KING'S ROCK
	dw 5000 ; price
	db HELD_TRADE_EVOLVE ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BITTER BERRY
	dw 10 ; price
	db HELD_HEAL_CONFUSION ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 5 ; heal menu (battle only)

; MINT BERRY
	dw 10 ; price
	db HELD_HEAL_SLEEP ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; RED APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TINYMUSHROOM
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BIG MUSHROOM
	dw 5000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SILVERPOWDER
	dw 5000 ; price
	db HELD_BUG_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BLU APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SLEEP GUARD
	dw 7000 ; price
	db HELD_PREVENT_SLEEP ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; AMULET COIN
	dw 100 ; price
	db HELD_AMULET_COIN ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; YLW APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; GRN APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; CLEANSE TAG
	dw 200 ; price
	db HELD_CLEANSE_TAG ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MYSTIC WATER
	dw 5000 ; price
	db HELD_WATER_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TWISTEDSPOON
	dw 5000 ; price
	db HELD_PSYCHIC_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; WHT APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BLACKBELT
	dw 5000 ; price
	db HELD_FIGHTING_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BLK APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PARLYZ GUARD
	dw 5000 ; price
	db HELD_PREVENT_PARALYZE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PNK APRICORN
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BLACKGLASSES
	dw 5000 ; price
	db HELD_DARK_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SLOWPOKETAIL
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PINK BOW
	dw 5000 ; price
	db HELD_FAIRY_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; STICK
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SMOKE BALL
	dw 200 ; price
	db HELD_ESCAPE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; NEVERMELTICE
	dw 5000 ; price
	db HELD_ICE_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MAGNET
	dw 5000 ; price
	db HELD_ELECTRIC_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MIRACLEBERRY
	dw 1000 ; price
	db HELD_HEAL_STATUS ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; PEARL
	dw 1400 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BIG PEARL
	dw 7500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; EVERSTONE
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SPELL TAG
	dw 5000 ; price
	db HELD_GHOST_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; RAGECANDYBAR
	dw 300 ; price
	db NONE ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; GS BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; BLUE CARD
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 4, 0 ; current menu

; MIRACLE SEED
	dw 5000 ; price
	db HELD_GRASS_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; THICK CLUB
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; FOCUS BAND
	dw 4000 ; price
	db HELD_FOCUS_BAND ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; CONFUSEGUARD
	dw 5000 ; price
	db HELD_PREVENT_CONFUSE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; ENERGYPOWDER
	dw 500 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; ENERGY ROOT
	dw 800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; HEAL POWDER
	dw 450 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; REVIVAL HERB
	dw 2800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; HARD STONE
	dw 5000 ; price
	db HELD_ROCK_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; LUCKY EGG
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; CARD KEY
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; MACHINE PART
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; EGG TICKET
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; LOST ITEM
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; STARDUST
	dw 2000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; STAR PIECE
	dw 9800 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BASEMENT KEY
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; PASS
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; HELIX FOSSIL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS ; can select + toss
	db KEY_ITEM
	dn 0, 0 ; can't use

; DOME FOSSIL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS ; can select + toss
	db KEY_ITEM
	dn 0, 0 ; can't use

; OLD AMBER
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; CHARCOAL
	dw 5000 ; price
	db HELD_FIRE_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BERRY JUICE
	dw 100 ; price
	db HELD_BERRY ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; SCOPE LENS
	dw 4000 ; price
	db HELD_CRITICAL_UP ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; OAKS PARCEL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS ; can select + toss
	db KEY_ITEM
	dn 0, 0 ; can't use

; POWER HERB
	dw 800 ; price
	db HELD_SKIP_CHARGE ; effect
	db 0 ; param
	db CANT_SELECT ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; METAL COAT
	dw 5000 ; price
	db HELD_STEEL_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; DRAGON FANG
	dw 5000 ; price
	db HELD_DRAGON_BOOST ; effect ; fixes Dragon Fang glitch
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw 750 ; price
	db HELD_CATCH_CHANCE ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; LEFTOVERS
	dw 200 ; price
	db HELD_LEFTOVERS ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; RESEARCH NOTES
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; overworld

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; MYSTERYBERRY
	dw 3000 ; price
	db HELD_RESTORE_PP ; effect
	db 255 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; DRAGON SCALE
	dw 2100 ; price
	db NONE ; effect ; fixes Dragon Fang glitch
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BERSERK GENE
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; X SP.DEF
	dw 350 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 6 ; ball

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; SACRED ASH
	dw 200 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 6, 0 ; overworld

; HEAVY BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; FLOWER MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; LEVEL BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; LURE BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; FAST BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; LIGHT BALL
	dw 3000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; FRIEND BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; MOON BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; LOVE BALL
	dw 150 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; NORMAL BOX
	dw 10 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 4, 0 ; current menu

; GORGEOUS BOX
	dw 10 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 4, 0 ; current menu

; SUN STONE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 0 ; party menu

; POLKADOT BOW
	dw 5000 ; price
	db HELD_NORMAL_BOOST ; effect
	db 20 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; UP-GRADE
	dw 2100 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BERRY
	dw 10 ; price
	db HELD_BERRY ; effect
	db 10 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; GOLD BERRY
	dw 700 ; price
	db HELD_BERRY ; effect
	db 30 ; param
	db CANT_SELECT
	db ITEM
	dn 5, 5 ; heal menu

; SQUIRTBOTTLE
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 6, 0 ; overworld

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; PARK BALL
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db BALL
	dn 0, 6 ; ball

; RAINBOW WING
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db KEY_ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; BRICK PIECE
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; SURF MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; LITEBLUEMAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; PORTRAITMAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; LOVELY MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; EON MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MORPH MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; BLUESKY MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MUSIC MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; MIRAGE MAIL
	dw 50 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TM01
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM02
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM03
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM04
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TM05
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM06
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM07
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM08
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM09
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM10
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM11
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM12
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM13
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM14
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM15
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM16
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM17
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM18
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM19
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM20
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM21
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM22
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM23
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM24
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM25
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM26
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM27
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM28
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TM29
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM30
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM31
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM32
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM33
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM34
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM35
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM36
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM37
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM38
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM39
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM40
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM41
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM42
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM43
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM44
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM45
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM46
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM47
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM48
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM49
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TM50
	dw 10000 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM01
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM02
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM03
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM04
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM05
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM06
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; HM07
	dw 0 ; price
	db NONE ; effect
	db 0 ; param
	db CANT_SELECT | CANT_TOSS
	db TM_HM
	dn 5, 0 ; party menu

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; TERU-SAMA
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use

; ?
	dw $9999 ; price
	db NONE ; effect
	db 0 ; param
	db 0 ; can select + toss
	db ITEM
	dn 0, 0 ; can't use


