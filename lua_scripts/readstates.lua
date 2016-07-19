-- Originally PikalaxALT's battlestate reader, made into an importable LUA file.
-- AKA readbattlestate_clean.lua
-- Version 0.7.1

dofile("battle_ram.lua")
dofile("constants.lua")

function getBigDW(pointer)
	-- There is no built-in for big-endian DWs, which are used extensively in battle structs.
	return memory.readbyte(pointer) * 256 + memory.readbyte(pointer + 1)
end

function parseString(start_addr, length)
	outstr = ""
	-- vba.print(charmap)
	for i = 0, length do
		curr_byte = memory.readbyte(start_addr + i)
		if curr_byte == 0x50 then return outstr end
		if curr_byte < 0x7f then return outstr end
		-- vba.print(string.format("%02X - %s",curr_byte, charmap[curr_byte - 0x7f + 1]))
		outstr = outstr .. charmap[curr_byte - 0x7f + 1]
	end
end

function getMove(movePointer, ppPointer)
	local move = {}
	move_idx = memory.readbyte(movePointer)
	if move_idx == 0 then return nil end
	move["name"] = moveTable[move_idx + 1]
	tempPP = memory.readbyte(ppPointer)
	move["curpp"] = bit.band(tempPP, 0x3f)
	move["ppUp"] = (bit.band(tempPP, 0xc0)) / 0x40
    --vba.print(move_idx)
    --vba.print("MOVE ID:", string.format("%02x", PPVal[move_idx]))
	move["maxpp"] = PPVal[move_idx] * (move["ppUp"] + 5) / 5
	return move
end

function getMoves(movePointer, ppPointer)
	local moves = {}
	for i = 0, 3 do
        -- vba.print("Pointers:", string.format("%02x", movePointer), string.format("%02x", ppPointer))
		table.insert(moves, getMove(movePointer + i, ppPointer + i))
        -- vba.print(moves)
	end
	return moves
end

function getMonStatus(pointer)
	status = memory.readbyte(pointer)
	if (bit.band(status, 0x7) ~= 0) then
		return "SLP" --bit.band(status, 0x7)
	elseif (bit.band(status, 0x08) ~= 0) then
		return "PSN"
	elseif (bit.band(status, 0x10) ~= 0) then
		return "BRN"
	elseif (bit.band(status, 0x20) ~= 0) then
		return "FRZ"
	elseif (bit.band(status, 0x40) ~= 0) then
		return "PRZ"
	else return "NONE"
	end
end

function calcGender(dvs, species)
	-- Reproduce gender calculation from Pokemon Crystal
	if species == 0 then return "None" end
	baseGender = GRVal[species]
	if (baseGender == 255) then return " " end
	if (baseGender == 0)   then return "M" end
	if (baseGender == 254) then return "F" end
	attPlusSpeed = dvs["atk"] * 16 + dvs["spd"]
	if (baseGender < attPlusSpeed) then return "M" else return "F" end
end

function getMonType(pointer)
	type1 = memory.readbyte(pointer)
	type2 = memory.readbyte(pointer + 1)
	if (type1 == type2) then
		return typeTable[type1+1]
	else
		return string.format("%s / %s", typeTable[type1+1], typeTable[type2+1])
	end
end

function handleBugCatchingContest()
	local contest_struct = {}
	if (bit.band(memory.readbyte(0xd84d), 0x04) ~= 0) then
		contest_struct["balls"] = memory.readbyte(0xdc79)
		contest_struct["caught mon"] = readPartyStruct(0xdf9c)
		contest_struct["time left"] = string.format("%d:%02d", memory.readbyte(0xd46c), memory.readbyte(0xd46d))
	end
	return contest_struct
end

function getDVs(pointer)
	local dvs = {}
	dvs["atk"] = bit.band(memory.readbyte(pointer),0xf0) / 16
	dvs["def"] = memory.readbyte(pointer) % 16
	dvs["spd"] = bit.band(memory.readbyte(pointer + 1),0xf0) / 16
	dvs["spc"] = memory.readbyte(pointer + 1) % 16
	dvs["hp"] = bit.band(dvs["atk"], 1) * 8 + bit.band(dvs["def"], 1) * 4 + bit.band(dvs["spd"], 1) * 2 + bit.band(dvs["spc"], 1)
	return dvs
end

function getMonBattleState(pointer)
    -- vba.print("POINTER:", string.format("%02x", pointer))
	-- init
	local mon = {}
	local stats = {}
	-- read
	species_idx = memory.readbyte(pointer + 0)
	if species_idx == 0 then return end
	mon["species"] = speciesTable[species_idx]
	mon["item"] = itemTable[memory.readbyte(pointer + 1) + 1]
    --vba.print(1)
	mon["moves"] = getMoves(pointer + 2, pointer + 8)
	mon["dvs"] = getDVs(pointer + 6)
	mon["happiness"] = memory.readbyte(pointer + 12)
	mon["level"] = memory.readbyte(pointer + 13)
	mon["status"] = getMonStatus(pointer + 14)
	mon["hp"] = getBigDW(pointer + 16)
	mon["gender"] = calcGender(mon["dvs"], species_idx)
	stats["maxhp"] = getBigDW(pointer + 18)
	stats["attack"] = getBigDW(pointer + 20)
	stats["defense"] = getBigDW(pointer + 22)
	stats["speed"] = getBigDW(pointer + 24)
	stats["spatk"] = getBigDW(pointer + 26)
	stats["spdef"] = getBigDW(pointer + 28)
	mon["stats"] = stats
	mon["type"] = getMonType(pointer + 30)
	return mon
end

function getSubstatus(flags, counts, subhp, lockedmove, disablecount)
	local subStatus = {}
	substatus1 = memory.readbyte(flags + 0)
	substatus2 = memory.readbyte(flags + 1)
	substatus3 = memory.readbyte(flags + 2)
	substatus4 = memory.readbyte(flags + 3)
	substatus5 = memory.readbyte(flags + 4)

	-- substatus1
	if (bit.band(substatus1, 0x01) ~= 0) then table.insert(subStatus, "nightmare") end
	if (bit.band(substatus1, 0x02) ~= 0) then table.insert(subStatus, "curse") end
	-- if (bit.band(substatus1, 0x04) ~= 0) then subStatus["protect"] = memory.readbyte(counts + 7) end
	if (memory.readbyte(counts + 7) ~= 0) then subStatus["protect"] = memory.readbyte(counts + 7) end
	if (bit.band(substatus1, 0x08) ~= 0) then table.insert(subStatus, "identified") end
	if (bit.band(substatus1, 0x10) ~= 0) then subStatus["perish song"] = memory.readbyte(counts + 5) end
	-- if (bit.band(substatus1, 0x20) ~= 0) then table.insert(subStatus, "endure") end
	if (bit.band(substatus1, 0x40) ~= 0) then subStatus["rollout"] = memory.readbyte(counts + 0) end
	if (bit.band(substatus1, 0x80) ~= 0) then table.insert(subStatus, "attract") end

	-- substatus2
	if (bit.band(substatus2, 0x01) ~= 0) then table.insert(subStatus, "curled") end

	-- substatus3
	if (bit.band(substatus3, 0x01) ~= 0) then table.insert(subStatus, "bide") end
	if (bit.band(substatus3, 0x02) ~= 0) then table.insert(subStatus, "rampage") end
	if (bit.band(substatus3, 0x04) ~= 0) then table.insert(subStatus, "multihit") end
	if (bit.band(substatus3, 0x08) ~= 0) then table.insert(subStatus, "flinch") end
	if (bit.band(substatus3, 0x10) ~= 0) then table.insert(subStatus, "charged") end
	if (bit.band(substatus3, 0x20) ~= 0) then table.insert(subStatus, "underground") end
	if (bit.band(substatus3, 0x40) ~= 0) then table.insert(subStatus, "flying") end
	if (bit.band(substatus3, 0x80) ~= 0) then subStatus["confused"] = memory.readbyte(counts + 1) end

	-- substatus4
	if (bit.band(substatus4, 0x01) ~= 0) then table.insert(subStatus, "x accuracy") end
	if (bit.band(substatus4, 0x02) ~= 0) then table.insert(subStatus, "mist") end
	if (bit.band(substatus4, 0x04) ~= 0) then table.insert(subStatus, "pumped") end
	if (bit.band(substatus4, 0x10) ~= 0) then subStatus["substitute"] = memory.readbyte(subhp) end
	if (bit.band(substatus4, 0x20) ~= 0) then table.insert(subStatus, "recharge") end
	if (bit.band(substatus4, 0x40) ~= 0) then table.insert(subStatus, "using rage") end
	if (bit.band(substatus4, 0x80) ~= 0) then table.insert(subStatus, "seeded") end

	-- substatus5
	if (bit.band(substatus5, 0x01) ~= 0) then subStatus["toxic"] = memory.readbyte(counts + 2) end
	if (bit.band(substatus5, 0x04) ~= 0) then table.insert(subStatus, "transformed") end
	if (bit.band(substatus5, 0x10) ~= 0) then
		local encore = {}
		encore["count"] = memory.readbyte(counts + 4)
		encore["move idx"] = memory.readbyte(lockedmove)
		subStatus["encore"] = encore
	end
	if (bit.band(substatus5, 0x20) ~= 0) then table.insert(subStatus, "lock on") end
	if (bit.band(substatus5, 0x40) ~= 0) then table.insert(subStatus, "destiny bond") end
	if (bit.band(substatus5, 0x80) ~= 0) then table.insert(subStatus, "trapped") end

	disableCount = memory.readbyte(disablecount)
	if disableCount ~= 0 then
		Disabled = {}
		Disabled["count"] = bit.band(disableCount, 0x0f)
		Disabled["move idx"] = bit.band(disableCount, 0xf0) / 0x10
		subStatus["disabled"] = Disabled
	end
	subStatus["raging"] = memory.readbyte(counts + 6)
	return subStatus
end

function getWeather()
	weather = memory.readbyte(0xc70a)
	outWeather = {}
	if weather >= 4 then
		outWeather[weatherTable[weather - 2]] = 0
	elseif weather == 0 then
		table.insert(outWeather, "Clear")
	else
		outWeather[weatherTable[weather + 1]] = memory.readbyte(0xc70b)
	end
	return outWeather
end

function getScreens(flags, counts)
	local screens = {}
	screenflags = memory.readbyte(flags)
	if (bit.band(screenflags, 0x03) ~= 0) then
		screens["spikes"] = bit.band(screenflags, 0x03)
	end
	if (bit.band(screenflags, 0x04) ~= 0) then
		screens["safeguard"] = memory.readbyte(counts + 0)
	end
	if (bit.band(screenflags, 0x08) ~= 0) then
		screens["light screen"] = memory.readbyte(counts + 1)
	end
	if (bit.band(screenflags, 0x10) ~= 0) then
		screens["reflect"] = memory.readbyte(counts + 2)
	end
	return screens
end

function getStatLevels(pointer)
	local statLevels = {}
	statLevels["atk"] = memory.readbyte(pointer + 0) - 7
	statLevels["def"] = memory.readbyte(pointer + 1) - 7
	statLevels["spd"] = memory.readbyte(pointer + 2) - 7
	statLevels["satk"] = memory.readbyte(pointer + 3) - 7
	statLevels["sdef"] = memory.readbyte(pointer + 4) - 7
	statLevels["acc"] = memory.readbyte(pointer + 5) - 7
	statLevels["eva"] = memory.readbyte(pointer + 6) - 7
	return statLevels
end

function getPlayerPokemonData()
    -- vba.print(BattleMonSpecies)
	playerMon = getMonBattleState(BattleMonSpecies)
	if playerMon == nil then return end
	playerMon["subStatus"] = getSubstatus(PlayerSubStatus1, PlayerRolloutCount, PlayerSubstituteHP, LastPlayerMove, PlayerDisableCount)
	playerMon["screens"] = getScreens(PlayerScreens, PlayerSafeguardCount)
	playerMon["turns"] = memory.readbyte(PlayerTurnsTaken)
	playerMon["stat levels"] = getStatLevels(PlayerAtkLevel)
	lastMove = memory.readbyte(LastPlayerMove)
	if lastMove == 0 then
		playerMon["last used"] = "None"
	else
		playerMon["last used"] = moveTable[lastMove + 1]
	end
	playerMon["party idx"] = memory.readbyte(0xd0d4)
	local futureSight = {}
	futureSight["count"] = memory.readbyte(wPlayerFutureSightCount)
	futureSight["damage"] = getBigDW(wPlayerFutureSightDamage)
	playerMon["future sight"] = futureSight
	playerMon["rage counter"] = memory.readbyte(wPlayerRageCounter)
	playerMon["trapping move"] = memory.readbyte(wPlayerTrappingMove)
	playerMon["wrap count"] = memory.readbyte(wPlayerWrapCount)
	playerMon["charging"] = memory.readbyte(wPlayerCharging)
	return playerMon
end

function getEnemyPokemonData()
    -- vba.print(EnemyMonSpecies)
	enemyMon = getMonBattleState(EnemyMonSpecies)
	if enemyMon == nil then return end
	enemyMon["subStatus"] = getSubstatus(EnemySubStatus1, EnemyRolloutCount, EnemySubstituteHP, LastEnemyMove, EnemyDisableCount)
	enemyMon["screens"] = getScreens(EnemyScreens, PlayerLightScreenCount)
	enemyMon["turns"] = memory.readbyte(EnemyTurnsTaken)
	enemyMon["stat levels"] = getStatLevels(EnemyAtkLevel)
	lastMove = memory.readbyte(LastEnemyMove)
	if lastMove == 0 then
		enemyMon["last used"] = "None"
	else
		enemyMon["last used"] = moveTable[lastMove + 1]
	end
	if memory.readbyte(wBattleMode) == 2 then enemyMon["party idx"] = memory.readbyte(0xc663) end
	local futureSight = {}
	futureSight["count"] = memory.readbyte(wEnemyFutureSightCount)
	futureSight["damage"] = getBigDW(wEnemyFutureSightDamage)
	enemyMon["future sight"] = futureSight
	enemyMon["rage counter"] = memory.readbyte(wEnemyRageCounter)
	enemyMon["trapping move"] = memory.readbyte(wEnemyTrappingMove)
	enemyMon["wrap count"] = memory.readbyte(wEnemyWrapCount)
	enemyMon["charging"] = memory.readbyte(wEnemyCharging)
	return enemyMon
end

function getTrainerClass()
	return trainerClassTable[memory.readbyte(OtherTrainerClass)]
end

function getTrainerItems()
	local trainerItems = {}
	trainerItems["item1"] = itemTable[memory.readbyte(wEnemyTrainerItem1)+1]
	trainerItems["item2"] = itemTable[memory.readbyte(wEnemyTrainerItem2)+1]
	return trainerItems
end

function readPartyStruct(struct_addr)
	local curr_mon = {}
	species_idx = memory.readbyte(mon_pointer + 0)
	curr_mon["species"] = speciesTable[species_idx]
	curr_mon["item"] = itemTable[memory.readbyte(mon_pointer + 1) + 1]
    --vba.print(1)
	curr_mon["moves"] = getMoves(mon_pointer + 2, mon_pointer + 23) --what?
	curr_mon["id"] = getBigDW(mon_pointer + 6)
	curr_mon["exp"] = memory.readbyte(mon_pointer + 8) * 0x10000 + memory.readbyte(mon_pointer + 9) * 0x100 + memory.readbyte(mon_pointer + 10)
	local statexp = {}
	statexp["hp"] = getBigDW(mon_pointer + 11)
	statexp["atk"] = getBigDW(mon_pointer + 13)
	statexp["def"] = getBigDW(mon_pointer + 15)
	statexp["spd"] = getBigDW(mon_pointer + 17)
	statexp["spc"] = getBigDW(mon_pointer + 19)
	curr_mon["statexp"] = statexp
	curr_mon["dvs"] = getDVs(mon_pointer + 21)
	curr_mon["happiness"] = memory.readbyte(mon_pointer + 27)
	local pokerus = {}
	pkrs_byte = memory.readbyte(mon_pointer + 28)
	if pkrs_byte == 0 then
		pokerus["strain"] = "None"
		pokerus["count"] = "Uninfected"
	else
		pokerus["strain"] = bit.band(pkrs_byte, 0xf0) / 16
		if bit.band(pkrs_byte, 0xf) == 0 then
			pokerus["count"] = "Immune"
		else
			pokerus["count"] = bit.band(pkrs_byte, 0xf)
		end
	end
	curr_mon["pokerus"] = pokerus
	curr_mon["level"] = memory.readbyte(mon_pointer + 31)
	curr_mon["gender"] = calcGender(curr_mon["dvs"], species_idx)
	curr_mon["status"] = getMonStatus(mon_pointer + 32)
	curr_mon["hp"] = getBigDW(mon_pointer + 34)
	local stats = {}
	stats["maxhp"] = getBigDW(mon_pointer + 36)
	stats["attack"] = getBigDW(mon_pointer + 38)
	stats["defense"] = getBigDW(mon_pointer + 40)
	stats["speed"] = getBigDW(mon_pointer + 42)
	stats["spatk"] = getBigDW(mon_pointer + 44)
	stats["spdef"] = getBigDW(mon_pointer + 46)
	curr_mon["stats"] = stats
	return curr_mon
end

function getTrainerParty(partycount_addr)
	local trainerParty = {}
    -- vba.print(string.format("%02x", partycount_addr))
	trainerParty["length"] = memory.readbyte(partycount_addr)
	local mons = {}
	local party = {}
	for i = 1, trainerParty["length"] do
		table.insert(mons, speciesTable[memory.readbyte(partycount_addr + i)])
		mon_pointer = partycount_addr + 8 + 48 * (i - 1)
		curr_mon = readPartyStruct(mon_pointer)
		curr_mon["nickname"] = parseString(partycount_addr + 8 + 48 * 6 + 11 * 6 + 11 * (i - 1), 11)
		table.insert(party, curr_mon)
	end
	trainerParty["mons"] = mons
	trainerParty["party"] = party
	return trainerParty
end

function readPlayerPack()
	local pack = {}
	local items = {}
	local balls = {}
	local key = {}
	local tmhm = {}
	numItems = memory.readbyte(NumItems)
	for i = 1, numItems do
		items[itemTable[memory.readbyte(Items + 2 * (i-1)) + 1]] = memory.readbyte(Items + 2 * (i-1) + 1)
	end
	numBalls = memory.readbyte(NumBalls)
	for i = 1, numBalls do
		balls[itemTable[memory.readbyte(Balls + 2 * (i-1)) + 1]] = memory.readbyte(Balls + 2 * (i-1) + 1)
	end
	numKeys = memory.readbyte(NumKeyItems)
	for i = 1, numKeys do
		table.insert(key, itemTable[memory.readbyte(KeyItems + (i-1)) + 1])
	end
	for i = 1, 50 do
		if memory.readbyte(TMsHMs + (i-1)) ~= 0 then
			table.insert(tmhm, string.format("TM%02d", i))
		end
	end
	for i = 1, 7 do
		if memory.readbyte(TMsHMs + (i+50-1)) ~= 0 then
			table.insert(tmhm, string.format("HM%02d", i))
		end
	end
	pack["items"] = items
	pack["balls"] = balls
	pack["key"] = key
	pack["tmhm"] = tmhm
	return pack
end

function readBattlestate(req) --read this ONLY when LUA Serial is called
	battleState = {}
    output_table = readPlayerstate()
	battleState["requested action"] = req
	battlemode = memory.readbyte(wBattleMode)
	svbk = bit.band(memory.readbyte(rSVBK), 0x07)
	if svbk == 1 then
		local output_table = {}
		playerParty = getTrainerParty(0xDCD7)
		--vba.print("Player Party:")
		--vba.print(playerParty)
		pack = readPlayerPack()
		--vba.print("Player Pack:")
		--vba.print(pack)
		output_table["playerParty"] = playerParty
		output_table["pack"] = pack
		if battlemode == 0 then
			-- vba.print("Not in battle")
			memory.writebyte(wMilitaryMode, military_mode)
			-- if (ignore_serial ~= 1) and (lastBattleState ~= 0) then
				--transferStateToAIAndWait("Battle ended")
			-- end
		else
			if battlemode == 2 then
				battleState["enemy type"] = "TRAINER"
				battleState["trainer class"] = getTrainerClass()
				battleState["trainer items"] = getTrainerItems()
				enemyParty = getTrainerParty(OTPartyCount)
				-- vba.print("Enemy Party:")
				-- vba.print(enemyParty)
				output_table["enemyParty"] = enemyParty
			elseif battlemode == 1 then 
				battleState["enemy type"] = "WILD"
			end
			battleState["weather"] = getWeather()
			battleState["playerpokemon"] = getPlayerPokemonData()
			battleState["enemypokemon"] = getEnemyPokemonData()
			--vba.print("Battle State:")
			--vba.print(battleState)
			output_table["battleState"] = battleState
			-- if (ignore_serial ~= 1) and (lastBattleState == 0) then
				--transferStateToAIAndWait("Battle started")
			-- end
		end
		output_table["bug contest"] = handleBugCatchingContest()
		local raw_json = JSON:encode(output_table)
        return raw_json
            
        else
        return -1
	end
    return -1
end

function readPlayerstate() --loop read this for the overlay
	svbk = bit.band(memory.readbyte(rSVBK), 0x07)
	local output_table = {}
	-- vba.print("WRAM bank: ", svbk)
	if svbk == 1 then
        -- vba.print(string.format("%02x", PlaPartyCount))
		playerParty = getTrainerParty(PlaPartyCount)
		-- vba.print("Player Party:")
		-- vba.print(playerParty)
		pack = readPlayerPack()
		-- vba.print("Player Pack:")
		-- vba.print(pack)
		output_table["playerParty"] = playerParty
		output_table["pack"] = pack
        return output_table
    else
		return -1
    end
end
