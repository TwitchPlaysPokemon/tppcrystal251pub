dofile("mainscript.lua")
-- dofile("readstates.lua")

local Title
local Diploma
local ID = {}
local HP = {}
local MAXHP = {}
local Lvl = {}
local Move1 = {}
local Move2 = {}
local Move3 = {}
local Move4 = {}
local PP1 = {}
local PP2 = {}
local PP3 = {}
local PP4 = {}
local PPUp1 = {}
local PPUp2 = {}
local PPUp3 = {}
local PPUp4 = {}
local MAXPP1 = {}
local MAXPP2 = {}
local MAXPP3 = {}
local MAXPP4 = {}
local Status = {}
local Gender = {}
local Seen
local Own
local Money
local BadgeData1 = {}
local BadgeData2 = {}
local GymRematches1 = {}
local GymRematches2 = {}
local MapID
local Pokedexdata = {}
local LastCaptured
local LastCaptured2
local Nickname = {}
local PartyCount = 0

OverlayFrameDelay = 0

function ReadFlags(offset, nbytes)
	local output = {}
	for curbyteidx = 0, (nbytes - 1) do
		cur_byte = memory.readbyte(offset + curbyteidx)
		for curbit = 0, 7 do
			if bit.band(cur_byte, bit.lshift(1, curbit)) ~= 0 then
				output[curbyteidx * 8 + curbit + 1] = 1
			else
				output[curbyteidx * 8 + curbit + 1] = 0
			end
		end
	end
	return output
end

function CountFlags(offset, nbytes)
	local total = 0
	for curbyteidx = 0, (nbytes - 1) do
		cur_byte = memory.readbyte(offset + curbyteidx)
		for curbit = 0, 7 do
			if bit.band(cur_byte, bit.lshift(1, curbit)) ~= 0 then
				total = total + 1
			end
		end
	end
	return total
end

function ReadSeen(offset)
	Seen = CountFlags(offset, 0x20)
end

function ReadOwn(offset)
	Own = CountFlags(offset, 0x20)
end

function ReadParty(offset)
	for i = 1, 6, 1 do
		ID[i] = 0
		HP[i] = 0
		MAXHP[i] = 0
		Lvl[i] = 0
		Move1[i] = 0
		Move2[i] = 0
		Move3[i] = 0
		Move4[i] = 0
		PP1[i] = 0
		PP2[i] = 0
		PP3[i] = 0
		PP4[i] = 0
		PPUp1[i] = 0
		PPUp2[i] = 0
		PPUp3[i] = 0
		PPUp4[i] = 0
		MAXPP1[i] = 0
		MAXPP2[i] = 0
		MAXPP3[i] = 0
		MAXPP4[i] = 0
		Status[i] = 0
		Gender[i] = 0
		Nickname[i] = ""
	end

	PartyCount = memory.readbyte(offset)

	if PartyCount > 0 then
		for CurrentPokemon = 1, PartyCount, 1 do
			ID[CurrentPokemon] = memory.readbyte(offset + CurrentPokemon)
			-- ID[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30))
			if ID[CurrentPokemon] ~= 0xFD then -- it's not an egg
				Move1[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x02)
				Move2[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x03)
				Move3[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x04)
				Move4[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x05)
				PP1[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x17)
				PP2[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x18)
				PP3[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x19)
				PP4[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x1A)
				PPUp1[CurrentPokemon] = bit.rshift(bit.band(PP1[CurrentPokemon], 0xC0), 0x06)
				PPUp2[CurrentPokemon] = bit.rshift(bit.band(PP2[CurrentPokemon], 0xC0), 0x06)
				PPUp3[CurrentPokemon] = bit.rshift(bit.band(PP3[CurrentPokemon], 0xC0), 0x06)
				PPUp4[CurrentPokemon] = bit.rshift(bit.band(PP4[CurrentPokemon], 0xC0), 0x06)
				PP1[CurrentPokemon] = bit.band(PP1[CurrentPokemon], 0x3F)
				PP2[CurrentPokemon] = bit.band(PP2[CurrentPokemon], 0x3F)
				PP3[CurrentPokemon] = bit.band(PP3[CurrentPokemon], 0x3F)
				PP4[CurrentPokemon] = bit.band(PP4[CurrentPokemon], 0x3F)
				if PPVal[Move1[CurrentPokemon]] ~= nil then 
					MAXPP1[CurrentPokemon] = PPVal[Move1[CurrentPokemon]] * (1.0 + (PPUp1[CurrentPokemon] * 0.2))
				else
					MAXPP1[CurrentPokemon] = 0
				end
				if PPVal[Move2[CurrentPokemon]] ~= nil then 
					MAXPP2[CurrentPokemon] = PPVal[Move2[CurrentPokemon]] * (1.0 + (PPUp2[CurrentPokemon] * 0.2))
				else
					MAXPP2[CurrentPokemon] = 0
				end
				if PPVal[Move3[CurrentPokemon]] ~= nil then 
					MAXPP3[CurrentPokemon] = PPVal[Move3[CurrentPokemon]] * (1.0 + (PPUp3[CurrentPokemon] * 0.2))
				else
					MAXPP3[CurrentPokemon] = 0
				end
				if PPVal[Move4[CurrentPokemon]] ~= nil then 
					MAXPP4[CurrentPokemon] = PPVal[Move4[CurrentPokemon]] * (1.0 + (PPUp4[CurrentPokemon] * 0.2))
				else
					MAXPP4[CurrentPokemon] = 0
				end
				Lvl[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x1F)
				HP[CurrentPokemon] = (memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x22) * 256) + memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x23)
				MAXHP[CurrentPokemon] = (memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x24) * 256) + memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x25)
				Status[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x20)
				
				if ID[CurrentPokemon] ~= 0x00 then
					Gender[CurrentPokemon] = bit.rshift(memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30) + 0x15), 0x04)
					if GRVal[ID[CurrentPokemon]] == 0 then
						Gender[CurrentPokemon] = 0
					elseif GRVal[ID[CurrentPokemon]] == 31 then
						if Gender[CurrentPokemon] <= 1 then
							Gender[CurrentPokemon] = 1
						else
							Gender[CurrentPokemon] = 0
						end
					elseif GRVal[ID[CurrentPokemon]] == 63 then
						if Gender[CurrentPokemon] <= 4 then
							Gender[CurrentPokemon] = 1
						else
							Gender[CurrentPokemon] = 0
						end
					elseif GRVal[ID[CurrentPokemon]] == 127 then
						if Gender[CurrentPokemon] <= 6 then
							Gender[CurrentPokemon] = 1
						else
							Gender[CurrentPokemon] = 0
						end
					elseif GRVal[ID[CurrentPokemon]] == 191 then
						if Gender[CurrentPokemon] <= 11 then
							Gender[CurrentPokemon] = 1
						else
							Gender[CurrentPokemon] = 0
						end
					elseif GRVal[ID[CurrentPokemon]] == 254 then
						Gender[CurrentPokemon] = 1
					elseif GRVal[ID[CurrentPokemon]] == 255 then
						Gender[CurrentPokemon] = 2
					end
				else
					Gender[CurrentPokemon] = 0
				end
			end
			Nickname[CurrentPokemon] = parseString(offset + 0x08 + (0x3b * 6) + (0x0b * (CurrentPokemon - 1)), 0x0b)
		end
	end
end

function ReadMoney(offset)
	MoneyHigh = memory.readbyte(offset)
	MoneyMid = memory.readbyte(offset + 0x01)
	MoneyLow = memory.readbyte(offset + 0x02)
	
	Money = MoneyLow + (MoneyMid * 256) + (MoneyHigh * 65536)
end

function ReadBadge1(offset)
	BadgeData1 = ReadFlags(offset, 1)
end

function ReadBadge2(offset)
	BadgeData2 = ReadFlags(offset, 1)
end

function ReadRematch1(offset)
	GymRematches1 = ReadFlags(offset, 1)
end

function ReadRematch2(offset)
	GymRematches2 = ReadFlags(offset, 1)
end

function ReadTitle(offset)
	if memory.readdword(offset) == 0x8D8E82ED then
		Title = 1
	else
		Title = 0
	end
end

function ReadDiploma(offset)
	if memory.readdword(offset) == 0xB2A8A793 then
		Diploma = 1
	else
		Diploma = 0
	end
end

function CheckDex(offset)
	for i = 1, 0x20, 1 do
		cur_byte = memory.readbyte(offset + i - 1)
		for cur_bit = 0, 7 do
			if bit.band(cur_byte, bit.lshift(1, cur_bit)) ~= 0 then
				if Pokedexdata[((i - 1) * 8 + 1 + cur_bit)] == 0 then
					Pokedexdata[((i - 1) * 8 + 1 + cur_bit)] = 1
					if MapID ~= 0 then
						LastCaptured = ((i - 1) * 8) + 1 + cur_bit
					end
				end
			end
		end
	end
end

function on_pokemon_capture(PokemonID)
	--PokemonID is the ID of the newly acquired Pokemon
	print(string.format("WE JUST GOT %s!", speciesTable[PokemonID]))
end


Own = 0
Seen = 0
Money = 0
MapID = 0
Title = 0
Diploma = 0
LastCaptured = 0
LastCaptured2 = 0
BadgeData1[1] = 0
BadgeData1[2] = 0
BadgeData1[3] = 0
BadgeData1[4] = 0
BadgeData1[5] = 0
BadgeData1[6] = 0
BadgeData1[7] = 0
BadgeData1[8] = 0
BadgeData2[1] = 0
BadgeData2[2] = 0
BadgeData2[3] = 0
BadgeData2[4] = 0
BadgeData2[5] = 0
BadgeData2[6] = 0
BadgeData2[7] = 0
BadgeData2[8] = 0
GymRematches1[1] = 0
GymRematches1[2] = 0
GymRematches1[3] = 0
GymRematches1[4] = 0
GymRematches1[5] = 0
GymRematches1[6] = 0
GymRematches1[7] = 0
GymRematches1[8] = 0
GymRematches2[1] = 0
GymRematches2[2] = 0
GymRematches2[3] = 0
GymRematches2[4] = 0
GymRematches2[5] = 0
GymRematches2[6] = 0
GymRematches2[7] = 0
GymRematches2[8] = 0
for i = 1, 6, 1 do
	ID[i] = 0
	HP[i] = 0
	MAXHP[i] = 0
	Lvl[i] = 0
	Move1[i] = 0
	Move2[i] = 0
	Move3[i] = 0
	Move4[i] = 0
	PP1[i] = 0
	PP2[i] = 0
	PP3[i] = 0
	PP4[i] = 0
	PPUp1[i] = 0
	PPUp2[i] = 0
	PPUp3[i] = 0
	PPUp4[i] = 0
	MAXPP1[i] = 0
	MAXPP2[i] = 0
	MAXPP3[i] = 0
	MAXPP4[i] = 0
	Status[i] = 0
	Gender[i] = 0
end

for i = 1, 251, 1 do
	Pokedexdata[i] = 0
end


local http = require("socket.http")
http.TIMEOUT = 0.01
JSON = (loadfile "JSON.lua")()

function read_new_playerstate()
    if memory.readdword(0x013C) == 0x41444C47 or memory.readdword(0x013C) == 0x41564C53 then --GS
		ReadParty(0xDA22)
		ReadSeen(0xDC04)
		ReadOwn(0xDBE4)
		CheckDex(0xDBE4)
		ReadMoney(0xD573)
		ReadBadge1(0xD57C)
		ReadBadge2(0xD57D)
		ReadTitle(0xC3C9)
		ReadDiploma(0x9902)
		MapID = (memory.readbyte(0xDA00) * 256) + memory.readbyte(0xDA01)

		if LastCaptured ~= LastCaptured2 then
			on_pokemon_capture(LastCaptured)
			LastCaptured2 = LastCaptured
		end
	elseif memory.readdword(0x013C) == 0x42004C41 then --C
		ReadParty(0xDCD7)
		ReadSeen(0xDEB9)
		ReadOwn(0xDE99)
		CheckDex(0xDE99)
		ReadMoney(0xD84E)
		ReadBadge1(0xD857)
		ReadBadge2(0xD858)
		ReadTitle(0xC3C9)
		ReadDiploma(0x9902)
		ReadRematch1(0xDB34)
		ReadRematch2(0xDB35)
		MapID = (memory.readbyte(0xDCB5) * 256) + memory.readbyte(0xDCB6)

		if LastCaptured ~= LastCaptured2 then
			on_pokemon_capture(LastCaptured)
			LastCaptured2 = LastCaptured
		end
	end
	local json = {}

	for i = 1, 8, 1 do
		json[string.format("badge_j_%d", i)] = BadgeData1[i]
		json[string.format("badge_k_%d", i)] = BadgeData2[i]
		json[string.format("rematch_j_%d", i)] = GymRematches1[i]
		json[string.format("rematch_k_%d", i)] = GymRematches2[i]
	end

	json["seen_pokemon"] = Seen
	json["own_pokemon"] = Own
	json["money"] = Money
	json["last_captured"] = LastCaptured
	json["pokemon"] = {}
	json["partycount"] = PartyCount
	json["map_id"] = MapID

	for i = 1, 6, 1 do
		json["pokemon"][i] = {}
		--print(string.format("PKM%d = %d,  HP = %d, MAXHP = %d, Lvl = %d, Status = %d", i, ID[i], HP[i], MAXHP[i], Lvl[i], Status[i]))
		json["pokemon"][i]["id"] = ID[i]
		json["pokemon"][i]["hp"] = HP[i]
		json["pokemon"][i]["maxhp"] = MAXHP[i]
		json["pokemon"][i]["lvl"] = Lvl[i]
		json["pokemon"][i]["status"] = Status[i]
		json["pokemon"][i]["gender"] = Gender[i]
		--print(string.format("Move1 = %d %d/%d, Move2 = %d %d/%d, Move3 = %d %d/%d, Move4 = %d %d/%d", Move1[i], PP1[i], MAXPP1[i], Move2[i], PP2[i], MAXPP2[i], Move3[i], PP3[i], MAXPP3[i], Move4[i], PP4[i], MAXPP4[i]))
		json["pokemon"][i]["move_1"] = {}
		json["pokemon"][i]["move_2"] = {}
		json["pokemon"][i]["move_3"] = {}
		json["pokemon"][i]["move_4"] = {}
		json["pokemon"][i]["move_1"]["id"] = Move1[i]
		json["pokemon"][i]["move_2"]["id"] = Move2[i]
		json["pokemon"][i]["move_3"]["id"] = Move3[i]
		json["pokemon"][i]["move_4"]["id"] = Move4[i]
		json["pokemon"][i]["move_1"]["pp"] = PP1[i]
		json["pokemon"][i]["move_2"]["pp"] = PP2[i]
		json["pokemon"][i]["move_3"]["pp"] = PP3[i]
		json["pokemon"][i]["move_4"]["pp"] = PP4[i]
		json["pokemon"][i]["move_1"]["maxpp"] = MAXPP1[i]
		json["pokemon"][i]["move_2"]["maxpp"] = MAXPP2[i]
		json["pokemon"][i]["move_3"]["maxpp"] = MAXPP3[i]
		json["pokemon"][i]["move_4"]["maxpp"] = MAXPP4[i]
		json["pokemon"][i]["nickname"] = Nickname[i]
	end
	return json
end

function refreshinterval(seconds)
	-- Revo's function (liar, it's Timmy's function)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

function update_overlay(json)
    http.request("http://127.0.0.1:5000/gen2_game_update", tostring(JSON:encode(json)))
end

		--Gender
		--0x00 = Male
		--0x01 = Female
		--0x02 = Genderless

		--Status
		--0x00 = Healthy
		--0x01 to 0x07 Sleeping, each turn it is reduced by 1. when it is 0x01 it means it will wake that turn.
		--0x08 = Poisoned
		--0x10 = Burned
		--0x20 = Frozen
		--0x40 = Paralyzed

while true do
	if memory.readbyte(0xFF70) == 1 then
		bank_wait = 0
		-- Update the overlay
		OverlayFrameDelay = OverlayFrameDelay + 1
		if OverlayFrameDelay % 60 == 0 then
			json = read_new_playerstate()
			-- vba.print("JSON:", json)
			update_overlay(json)
		end

		-- Military mode switch (incomplete)
		value = memory.readbyte(0xD849)
		is_military_on = (value % 2 == 1) -- just in case you need to know the current status
		-- here we can update global variable military_mode
		newvalue = bit.band(value, 254) + military_mode
		memory.writebyte(0xD849, newvalue)

		-- Military and AI command polling (player state is not updated during these frame delays)
		if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
			lua_wait = 0
			airesponse, playerresponse = GetCommandTables()
			byte1, byte2, byte3 = tablestobytes(airesponse, playerresponse)
			if debug_mode == 1 then
				vba.print("[DEBUG] BYTES:", byte1, byte2, byte3)
			end
			memory.writebyte(0xDFF8, byte1)
			memory.writebyte(0xDFF9, byte2)
			memory.writebyte(0xDFFA, byte3)
			memory.writebyte(rLSC, BEESAFREE_LSC_COMPLETED)
		else
			if lua_wait == 0 then
				if debug_mode == 1 then vba.print("Waiting for LUA serial...") end
				lua_wait = 1
			end
		end
    else
        if bank_wait == 0 then
            if debug_mode == 1 then vba.print("Waiting for valid bank") end
            bank_wait = 1
        end
	end
	-- RTC and Joypad
	updateclock()
	ReceiveButtonInput()
	-- vba.print(joypad.get(1))
end
