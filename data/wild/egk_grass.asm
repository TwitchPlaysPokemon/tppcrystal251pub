	map DIGLETTS_CAVE_RB
	db $0a
	db 13
	db $10
;morning
		db DIGLETT ;30
		db DIGLETT ;10
		db DIGLETT ;10
		db DIGLETT ;10
		db DUGTRIO ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;4
		db DIGLETT ;4
		db DIGLETT ;3
		db DIGLETT ;3
		db DIGLETT ;2
		db DIGLETT ;2
		db DIGLETT ;1
		db DIGLETT ;1
;day
		db DIGLETT ;30
		db DIGLETT ;10
		db DIGLETT ;10
		db DIGLETT ;10
		db DUGTRIO ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;4
		db DIGLETT ;4
		db DIGLETT ;3
		db DIGLETT ;3
		db DIGLETT ;2
		db DIGLETT ;2
		db DIGLETT ;1
		db DIGLETT ;1
;night
		db DIGLETT ;30
		db DIGLETT ;10
		db DIGLETT ;10
		db DIGLETT ;10
		db DUGTRIO ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db DIGLETT ;4
		db DIGLETT ;4
		db DIGLETT ;3
		db DIGLETT ;3
		db DIGLETT ;2
		db DIGLETT ;2
		db DIGLETT ;1
		db DIGLETT ;1

	map MT_MOON_B1F_RB
	db $0a
	db 8
	db $00
;morning
		db ZUBAT ;30
		db CUBONE ;10
		db GEODUDE ;10
		db ONIX ;10
		db CUBONE ;5
		db GEODUDE ;5
		db ONIX ;5
		db GEODUDE ;5
		db ONIX ;4
		db SANDSHREW ;4
		db PARAS ;3
		db PARAS ;3
		db PARAS ;2
		db PARAS ;2
		db SANDSHREW ;1
		db ONIX ;1
;day
		db ZUBAT ;30
		db ZUBAT ;10
		db ONIX ;10
		db ONIX ;10
		db GEODUDE ;5
		db GEODUDE ;5
		db GEODUDE ;5
		db GEODUDE ;5
		db CUBONE ;4
		db CLEFAIRY ;4
		db SANDSHREW ;3
		db SANDSHREW ;3
		db SANDSHREW ;2
		db SANDSHREW ;2
		db CLEFAIRY ;1
		db CUBONE ;1
;night
		db GEODUDE ;30
		db PARAS ;10
		db ZUBAT ;10
		db ONIX ;10
		db PARAS ;5
		db ZUBAT ;5
		db ONIX ;5
		db PARAS ;5
		db CLEFAIRY ;4
		db SANDSHREW ;4
		db CLEFAIRY ;3
		db SANDSHREW ;3
		db CLEFAIRY ;2
		db SANDSHREW ;2
		db CLEFAIRY ;1
		db SANDSHREW ;1

	map MT_MOON_B2F_RB
	db $0a
	db 8
	db $00
;morning
		db ZUBAT ;30
		db GEODUDE ;10
		db GEODUDE ;10
		db DIGLETT ;10
		db ZUBAT ;5
		db DIGLETT ;5
		db GEODUDE ;5
		db CLEFAIRY ;5
		db GRIMER ;4
		db PARAS ;4
		db GRIMER ;3
		db PARAS ;3
		db GRIMER ;2
		db PARAS ;2
		db GRIMER ;1
		db PARAS ;1
;day
		db ZUBAT ;30
		db ZUBAT ;10
		db GEODUDE ;10
		db GEODUDE ;10
		db GEODUDE ;5
		db DIGLETT ;5
		db DIGLETT ;5
		db GRIMER ;5
		db GRIMER ;4
		db ONIX ;4
		db PARAS ;3
		db CLEFAIRY ;3
		db PARAS ;2
		db CLEFAIRY ;2
		db ONIX ;1
		db GRIMER ;1
;night
		db GEODUDE ;30
		db DIGLETT ;10
		db DIGLETT ;10
		db PARAS ;10
		db PARAS ;5
		db ZUBAT ;5
		db ZUBAT ;5
		db GRIMER ;5
		db GRIMER ;4
		db CLEFAIRY ;4
		db CLEFAIRY ;3
		db CLEFAIRY ;3
		db CLEFAIRY ;2
		db CLEFAIRY ;2
		db CLEFAIRY ;1
		db GRIMER ;1

	map MT_MOON_B3F_RB
	db $0a
	db 9
	db $01
;morning
		db GEODUDE ;20
		db ZUBAT ;20
		db RHYHORN ;10
		db PARAS ;10
		db GEODUDE ;5
		db RHYHORN ;5
		db PARAS ;5
		db CLEFAIRY ;5
		db CLEFAIRY ;4
		db MACHOP ;4
		db KOFFING ;3
		db KOFFING ;3
		db KOFFING ;2
		db KOFFING ;2
		db MACHOP ;1
		db CLEFAIRY ;1
;day
		db GEODUDE ;20
		db ZUBAT ;20
		db RHYHORN ;10
		db PARAS ;10
		db GEODUDE ;5
		db ZUBAT ;5
		db RHYHORN ;5
		db CLEFAIRY ;5
		db MACHOP ;4
		db KOFFING ;4
		db MACHOP ;3
		db KOFFING ;3
		db MACHOP ;2
		db KOFFING ;2
		db MACHOP ;1
		db KOFFING ;1
;night
		db GEODUDE ;20
		db CLEFAIRY ;20
		db GEODUDE ;10
		db ZUBAT ;10
		db ZUBAT ;5
		db PARAS ;5
		db PARAS ;5
		db PARAS ;5
		db RHYHORN ;4
		db KOFFING ;4
		db RHYHORN ;3
		db KOFFING ;3
		db RHYHORN ;2
		db KOFFING ;2
		db RHYHORN ;1
		db KOFFING ;1

	map ROUTE_1_RB ;map is unchanged
	db $19 ;encounter rate, unchanged exept there's 1 for all day
	db 2 ;base level before variance (+0-4) and variance table
	db $00 ;most significant nyble is level variance table, least significant is what % chance table to use.
;morning
		db PIDGEY ;30
		db PIDGEY ;10
		db RATTATA ;10
		db EXEGGCUTE ;10
		db EXEGGCUTE ;5
		db RATTATA ;5
		db RATTATA ;5
		db VULPIX ;5
		db VULPIX ;4
		db VULPIX ;4
		db PIKACHU ;3
		db CUBONE ;3
		db VULPIX ;2
		db PIKACHU ;2
		db CUBONE ;1
		db CUBONE ;1
;day
		db PIDGEY ;30
		db PIDGEY ;10
		db RATTATA ;10
		db VULPIX ;10
		db PIDGEY ;5
		db RATTATA ;5
		db VULPIX ;5
		db EXEGGCUTE ;5
		db EXEGGCUTE ;4
		db PIKACHU ;4
		db VULPIX ;3
		db EXEGGCUTE ;3
		db PIKACHU ;2
		db PIKACHU ;2
		db PIKACHU ;1
		db PIKACHU ;1
;night
		db RATTATA ;30
		db RATTATA ;10
		db RATTATA ;10
		db PIDGEY ;10
		db PIDGEY ;5
		db PIKACHU ;5
		db PIKACHU ;5
		db PIKACHU ;5
		db VULPIX ;4
		db CUBONE ;4
		db CUBONE ;3
		db CUBONE ;3
		db CUBONE ;2
		db CUBONE ;2
		db CUBONE ;1
		db VULPIX ;1

	map ROUTE_2_RB
	db $19
	db 3
	db $03
;morning
		db PIDGEY ;15
		db CATERPIE ;10
		db WEEDLE ;10
		db POLIWAG ;10
		db GRIMER ;10
		db RATTATA ;5
		db POLIWAG ;5
		db CATERPIE ;5
		db WEEDLE ;5
		db NIDORAN_F ;5
		db NIDORAN_F ;5
		db NIDORAN_M ;5
		db NIDORAN_M ;4
		db PIDGEY ;3
		db NIDORAN_M ;2
		db NIDORAN_F ;1
;day
		db NIDORAN_M ;15
		db NIDORAN_F ;10
		db NIDORAN_F ;10
		db PIDGEY ;10
		db GRIMER ;10
		db NIDORAN_M ;5
		db RATTATA ;5
		db CATERPIE ;5
		db CATERPIE ;5
		db WEEDLE ;5
		db WEEDLE ;5
		db POLIWAG ;5
		db POLIWAG ;4
		db CATERPIE ;3
		db WEEDLE ;2
		db WEEDLE ;1
;night
		db RATTATA ;15
		db RATTATA ;10
		db POLIWAG ;10
		db POLIWAG ;10
		db GRIMER ;10
		db POLIWAG ;5
		db PIDGEY ;5
		db GRIMER ;5
		db NIDORAN_F ;5
		db NIDORAN_M ;5
		db CATERPIE ;5
		db WEEDLE ;5
		db NIDORAN_F ;4
		db NIDORAN_M ;3
		db NIDORAN_M ;2
		db NIDORAN_F ;1

	map ROUTE_3_RB
	db $19
	db 8
	db $02
;morning
		db SPEAROW ;20
		db JIGGLYPUFF ;15
		db MANKEY ;10
		db VOLTORB ;10
		db EKANS ;10
		db MANKEY ;5
		db CUBONE ;5
		db ZUBAT ;5
		db SANDSHREW ;6
		db SANDSHREW ;4
		db EKANS ;3
		db VOLTORB ;2
		db RATTATA ;2
		db RATTATA ;1
		db RATTATA ;1
		db RATTATA ;1
;day
		db EKANS ;20
		db SANDSHREW ;15
		db EKANS ;10
		db EKANS ;10
		db VOLTORB ;10
		db CUBONE ;5
		db MANKEY ;5
		db SPEAROW ;5
		db SANDSHREW ;6
		db SPEAROW ;4
		db SPEAROW ;3
		db VOLTORB ;2
		db SANDSHREW ;2
		db SPEAROW ;1
		db SPEAROW ;1
		db SPEAROW ;1
;night
		db ZUBAT ;20
		db RATTATA ;15
		db JIGGLYPUFF ;10
		db SANDSHREW ;10
		db CUBONE ;10
		db CUBONE ;5
		db EKANS ;5
		db SPEAROW ;5
		db VOLTORB ;6
		db VOLTORB ;4
		db RATTATA ;3
		db VOLTORB ;2
		db MANKEY ;2
		db MANKEY ;1
		db MANKEY ;1
		db MANKEY ;1

	map ROUTE_4_RB
	db $19
	db 8
	db $0
;morning
		db SPEAROW ;20
		db FARFETCH_D ;15
		db DITTO ;10
		db SANDSHREW ;10
		db MANKEY ;10
		db DITTO ;5
		db ZUBAT ;5
		db EKANS ;5
		db RATTATA ;6
		db RATTATA ;4
		db SPEAROW ;3
		db RATTATA ;2
		db CUBONE ;2
		db CUBONE ;1
		db CUBONE ;1
		db CUBONE ;1
;day
		db EKANS ;20
		db SANDSHREW ;15
		db FARFETCH_D ;10
		db DITTO ;10
		db SPEAROW ;10
		db FARFETCH_D ;5
		db DITTO ;5
		db RATTATA ;5
		db SPEAROW ;6
		db SPEAROW ;4
		db SANDSHREW ;3
		db FARFETCH_D ;2
		db MANKEY ;2
		db MANKEY ;1
		db MANKEY ;1
		db MANKEY ;1
;night
		db RATTATA ;20
		db DITTO ;15
		db ZUBAT ;10
		db CUBONE ;10
		db CLEFAIRY ;10
		db ZUBAT ;5
		db CUBONE ;5
		db SANDSHREW ;5
		db RATTATA ;6
		db SPEAROW ;4
		db FARFETCH_D ;3
		db FARFETCH_D ;2
		db FARFETCH_D ;2
		db FARFETCH_D ;1
		db SPEAROW ;1
		db RATTATA ;1

	map ROUTE_5_RB
	db $19
	db 13
	db $01
;morning
		db MANKEY ;20
		db PIDGEY ;20
		db GRIMER ;10
		db BELLSPROUT ;10
		db MEOWTH ;5
		db MEOWTH ;5
		db JIGGLYPUFF ;5
		db JIGGLYPUFF ;5
		db ABRA ;4
		db ABRA ;4
		db DRATINI ;3
		db DRATINI ;3
		db ODDISH ;2
		db ODDISH ;2
		db ODDISH ;1
		db DRATINI ;1
;day
		db BELLSPROUT ;20
		db JIGGLYPUFF ;20
		db GRIMER ;10
		db MANKEY ;10
		db DRATINI ;5
		db DRATINI ;5
		db PIDGEY ;5
		db PIDGEY ;5
		db PIDGEY ;4
		db ABRA ;4
		db ABRA ;3
		db MEOWTH ;3
		db DRATINI ;2
		db MEOWTH ;2
		db ABRA ;1
		db PIDGEY ;1
;night
		db ODDISH ;20
		db MEOWTH ;20
		db GRIMER ;10
		db GRIMER ;10
		db MEOWTH ;5
		db BELLSPROUT ;5
		db JIGGLYPUFF ;5
		db PIDGEY ;5
		db ABRA ;4
		db ABRA ;4
		db DRATINI ;3
		db MANKEY ;3
		db MANKEY ;2
		db DRATINI ;2
		db PIDGEY ;1
		db PIDGEY ;1

	map ROUTE_6_RB
	db $19
	db 14
	db $02
;morning
		db PIDGEY ;20
		db MANKEY ;15
		db MAGNEMITE ;10
		db BELLSPROUT ;10
		db MEOWTH ;10
		db MAGNEMITE ;5
		db PARAS ;5
		db RATTATA ;5
		db ABRA ;6
		db JIGGLYPUFF ;4
		db JIGGLYPUFF ;3
		db ABRA ;2
		db JIGGLYPUFF ;2
		db JIGGLYPUFF ;1
		db ODDISH ;1
		db ODDISH ;1
;day
		db BELLSPROUT ;20
		db JIGGLYPUFF ;15
		db PIDGEY ;10
		db MANKEY ;10
		db MAGNEMITE ;10
		db JIGGLYPUFF ;5
		db PIDGEY ;5
		db MAGNEMITE ;5
		db RATTATA ;6
		db MEOWTH ;4
		db ABRA ;3
		db ABRA ;2
		db ABRA ;2
		db ABRA ;1
		db MEOWTH ;1
		db RATTATA ;1
;night
		db MEOWTH ;20
		db MAGNEMITE ;15
		db PARAS ;10
		db ODDISH ;10
		db RATTATA ;10
		db ODDISH ;5
		db JIGGLYPUFF ;5
		db PARAS ;5
		db PIDGEY ;6
		db ABRA ;4
		db RATTATA ;3
		db MANKEY ;2
		db ABRA ;2
		db ABRA ;1
		db ABRA ;1
		db MANKEY ;1

	map ROUTE_11_RB
	db $19
	db 15
	db $02
;morning
		db SPEAROW ;20
		db EKANS ;15
		db DROWZEE ;10
		db LICKITUNG ;10
		db SANDSHREW ;10
		db MEOWTH ;6
		db RATTATA ;5
		db MAGNEMITE ;5
		db MAGNEMITE ;5
		db SANDSHREW ;4
		db MAGNEMITE ;3
		db MAGNEMITE ;2
		db MEOWTH ;2
		db MAGNEMITE ;1
		db MAGNEMITE ;1
		db MAGNEMITE ;1
;day
		db SANDSHREW ;20
		db SPEAROW ;15
		db EKANS ;10
		db MAGNEMITE ;10
		db EKANS ;10
		db MAGNEMITE ;6
		db LICKITUNG ;5
		db MEOWTH ;5
		db LICKITUNG ;5
		db DROWZEE;4
		db RATTATA ;3
		db SPEAROW ;2
		db SANDSHREW ;2
		db SPEAROW ;1
		db LICKITUNG ;1
		db LICKITUNG ;1
;night
		db DROWZEE ;20
		db MEOWTH ;15
		db DROWZEE ;10
		db MAGNEMITE ;10
		db EKANS ;10
		db RATTATA ;6
		db MEOWTH ;5
		db SPEAROW ;5
		db SANDSHREW ;5
		db RATTATA ;4
		db MAGNEMITE ;3
		db MAGNEMITE ;2
		db LICKITUNG ;2
		db MAGNEMITE ;1
		db MAGNEMITE ;1
		db MAGNEMITE ;1

	map ROUTE_22_RB
	db $19
	db 2
	db $02
;morning
		db MANKEY ;20
		db SPEAROW ;15
		db NIDORAN_F ;10
		db NIDORAN_M ;10
		db PONYTA ;10
		db MANKEY ;5
		db DODUO ;5
		db DODUO ;5
		db SPEAROW ;6
		db RATTATA ;4
		db POLIWAG ;3
		db RATTATA ;2
		db DODUO ;2
		db NIDORAN_F ;1
		db NIDORAN_M ;1
		db SPEAROW ;1
;day
		db PONYTA ;20
		db SPEAROW ;15
		db NIDORAN_F ;10
		db NIDORAN_M ;10
		db DODUO ;10
		db NIDORAN_F ;5
		db NIDORAN_M ;5
		db MANKEY ;5
		db DODUO ;6
		db MANKEY ;4
		db RATTATA ;3
		db NIDORAN_F ;2
		db NIDORAN_M ;2
		db POLIWAG ;1
		db POLIWAG ;1
		db MANKEY ;1
;night
		db RATTATA ;20
		db POLIWAG ;15
		db RATTATA ;10
		db NIDORAN_F ;10
		db NIDORAN_M ;10
		db DODUO ;5
		db SPEAROW ;5
		db MANKEY ;5
		db POLIWAG ;6
		db PONYTA ;4
		db RATTATA ;3
		db PONYTA ;2
		db PONYTA ;2
		db NIDORAN_F ;1
		db NIDORAN_M ;1
		db POLIWAG ;1

	map ROUTE_24_RB
	db $19
	db 12
	db $02
;morning
		db PIDGEY ;20
		db SLOWPOKE ;15
		db BELLSPROUT ;10
		db CATERPIE ;10
		db WEEDLE ;10
		db PIDGEY ;5
		db METAPOD ;5
		db KAKUNA ;5
		db ABRA ;6
		db ABRA ;4
		db VENONAT ;3
		db VENONAT ;2
		db ODDISH ;2
		db ODDISH ;1
		db ODDISH ;1
		db ODDISH ;1
;day
		db BELLSPROUT ;20
		db SLOWPOKE ;15
		db PIDGEY ;10
		db PIDGEY ;10
		db CATERPIE ;10
		db ABRA ;5
		db ABRA ;5
		db METAPOD ;5
		db WEEDLE ;6
		db WEEDLE ;4
		db KAKUNA ;3
		db BELLSPROUT ;2
		db KAKUNA ;2
		db VENONAT ;1
		db VENONAT ;1
		db VENONAT ;1
;night
		db ODDISH ;20
		db SLOWPOKE ;15
		db VENONAT ;10
		db ABRA ;10
		db VENONAT ;10
		db CATERPIE ;5
		db WEEDLE ;5
		db METAPOD ;5
		db PIDGEY ;6
		db KAKUNA ;4
		db ODDISH ;3
		db BELLSPROUT ;2
		db PIDGEY ;2
		db BELLSPROUT ;1
		db KAKUNA ;1
		db BELLSPROUT ;1

	map ROUTE_25_RB
	db $19
	db 12
	db $02
;morning
		db PIDGEY ;20
		db GROWLITHE ;15
		db BELLSPROUT ;10
		db CATERPIE ;10
		db WEEDLE ;10
		db PIDGEY ;5
		db METAPOD ;5
		db KAKUNA ;5
		db ABRA ;6
		db ABRA ;4
		db ODDISH ;3
		db ODDISH ;2
		db VENONAT ;2
		db VENONAT ;1
		db VENONAT ;1
		db VENONAT ;1
;day
		db PIDGEY ;20
		db BELLSPROUT ;15
		db GROWLITHE ;10
		db CATERPIE ;10
		db WEEDLE ;10
		db GROWLITHE ;5
		db ABRA ;5
		db ABRA ;5
		db BELLSPROUT ;6
		db METAPOD ;4
		db VENONAT ;3
		db KAKUNA ;2
		db KAKUNA ;2
		db METAPOD ;1
		db KAKUNA ;1
		db BELLSPROUT ;1
;night
		db ODDISH ;20
		db VENONAT ;15
		db VENONAT ;10
		db ABRA ;10
		db PIDGEY ;10
		db ODDISH ;5
		db METAPOD ;5
		db KAKUNA ;5
		db GROWLITHE ;6
		db BELLSPROUT ;4
		db CATERPIE ;3
		db CATERPIE ;2
		db WEEDLE ;2
		db WEEDLE ;1
		db WEEDLE ;1
		db WEEDLE ;1

	map VIRIDIAN_FOREST_RB
	db $0a
	db 3
	db $f1
;morning
		db WEEDLE ;20
		db CATERPIE ;20
		db METAPOD ;10
		db KAKUNA ;10
		db PIDGEY ;5
		db PIDGEY ;5
		db ABRA ;5
		db ABRA ;5
		db PIKACHU ;4
		db PIDGEY ;4
		db VENONAT ;3
		db VENONAT ;3
		db METAPOD ;2
		db KAKUNA ;2
		db PIKACHU ;1
		db PIKACHU ;1
;day
		db WEEDLE ;20
		db CATERPIE ;20
		db METAPOD ;10
		db KAKUNA ;10
		db PIDGEY ;5
		db PIDGEY ;5
		db PIKACHU ;5
		db PIKACHU ;5
		db PIKACHU ;4
		db ABRA ;4
		db ABRA ;3
		db ABRA ;3
		db METAPOD ;2
		db KAKUNA ;2
		db PIDGEY ;1
		db PIKACHU ;1
;night
		db PIKACHU ;20
		db VENONAT ;20
		db METAPOD ;10
		db KAKUNA ;10
		db DIGLETT ;5
		db DIGLETT ;5
		db ABRA ;5
		db ABRA ;5
		db WEEDLE ;4
		db CATERPIE ;4
		db WEEDLE ;3
		db CATERPIE ;3
		db METAPOD ;2
		db KAKUNA ;2
		db PIDGEY ;1
		db PIDGEY ;1

	db $ff ; end
