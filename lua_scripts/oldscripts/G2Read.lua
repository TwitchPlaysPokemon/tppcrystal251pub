--G2Read Script v1.02--

dofile("mainscript.lua")

debug_mode = 0

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
local MapID
local Pokedexdata = {}
local LastCaptured
local LastCaptured2
local PPVal = { 35, 25, 10, 15, 20, 20, 15, 15, 15, 35, 30, 5, 10, 30, 30, 35, 35, 20, 15, 20, 20, 10, 20, 30, 5, 25, 15, 15, 15, 25, 20, 5, 35, 15, 20, 20, 20, 15, 30, 35, 20, 20, 30, 25, 40, 20, 15, 20, 20, 20, 30, 25, 15, 30, 25, 5, 15, 10, 5, 20, 20, 20, 5, 35, 20, 25, 20, 20, 20, 15, 20, 10, 10, 40, 25, 10, 35, 30, 15, 20, 40, 10, 15, 30, 15, 20, 10, 15, 10, 5, 10, 10, 25, 10, 20, 40, 30, 30, 20, 20, 15, 10, 40, 15, 20, 30, 20, 20, 10, 40, 40, 30, 30, 30, 20, 30, 10, 10, 20, 5, 10, 30, 20, 20, 20, 5, 15, 10, 20, 15, 15, 35, 20, 15, 10, 20, 30, 15, 40, 20, 15, 10, 5, 10, 30, 10, 15, 20, 15, 40, 40, 10, 5, 15, 10, 10, 10, 15, 30, 30, 10, 10, 20, 10, 1, 1, 10 ,10 ,10, 5, 15, 25, 15, 10, 15, 30, 5, 40, 15, 10, 25, 10, 30, 10, 20, 10, 10, 10, 10, 10, 20, 5, 40, 5, 5, 15, 5, 10, 5, 15, 10, 5, 10, 20, 20, 40, 15, 10, 20, 20, 25, 5, 15, 10, 5, 20, 15, 20, 25, 20, 5, 30, 5, 10, 20, 40, 5, 20, 40, 20, 15, 35, 10, 5, 5, 5, 15, 5, 20, 5, 5, 15, 20, 10, 5, 5, 15, 15, 15, 15, 10 }
local GRVal = { 31, 31, 31, 31, 31, 31, 31, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 254, 254, 254, 0, 0, 0, 191, 191, 191, 191, 191, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 63, 63, 127, 127, 127, 63, 63, 63, 63, 63, 63, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 255, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 255, 127, 127, 127, 127, 0, 0, 127, 127, 127, 127, 127, 254, 127, 254, 127, 127, 127, 127, 255, 255, 127, 127, 254, 63, 63, 127, 0, 127, 127, 127, 255, 31, 31, 31, 31, 255, 31, 31, 31, 31, 31, 31, 255, 255, 255, 127, 127, 127, 255, 255, 31, 31, 31, 31, 31, 31, 31, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 191, 191, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 31, 31, 127, 127, 127, 255, 127, 127, 127, 127, 127, 127, 127, 191, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 127, 127, 0, 0, 254, 63, 63, 254, 254, 255, 255, 255, 127, 127, 127, 255, 255, 255 };

function ReadSeen(offset)
	Seen = 0
	for i = 1, 0x20, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			Seen = Seen + 1
		end
		
		offset = offset + 1
	end	
end

function ReadOwn(offset)
	Own = 0
	for i = 1, 0x20, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			Own = Own + 1
		end
		
		offset = offset + 1
	end
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
	end

	PartyCount = memory.readbyte(offset)

	if PartyCount > 0 then
		for CurrentPokemon = 1, PartyCount, 1 do
			ID[CurrentPokemon] = memory.readbyte(offset + 0x08 + ((CurrentPokemon - 1) * 0x30))
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
	end
end

function ReadMoney(offset)
	MoneyHigh = memory.readbyte(offset)
	MoneyMid = memory.readbyte(offset + 0x01)
	MoneyLow = memory.readbyte(offset + 0x02)
	
	Money = MoneyLow + (MoneyMid * 256) + (MoneyHigh * 65536)
end

function ReadBadge1(offset)
	badge = memory.readbyte(offset)
	if bit.band(badge, 0x01) == 0x01 then
		BadgeData1[1] = 0x01
	else
		BadgeData1[1] = 0x00
	end

	if bit.band(badge, 0x02) == 0x02 then
		BadgeData1[2] = 0x01
	else
		BadgeData1[2] = 0x00
	end

	if bit.band(badge, 0x04) == 0x04 then
		BadgeData1[3] = 0x01
	else
		BadgeData1[3] = 0x00
	end

	if bit.band(badge, 0x08) == 0x08 then
		BadgeData1[4] = 0x01
	else
		BadgeData1[4] = 0x00
	end

	if bit.band(badge, 0x10) == 0x10 then
		BadgeData1[5] = 0x01
	else
		BadgeData1[5] = 0x00
	end

	if bit.band(badge, 0x20) == 0x20 then
		BadgeData1[6] = 0x01
	else
		BadgeData1[6] = 0x00
	end

	if bit.band(badge, 0x40) == 0x40 then
		BadgeData1[7] = 0x01
	else
		BadgeData1[7] = 0x00
	end

	if bit.band(badge, 0x80) == 0x80 then
		BadgeData1[8] = 0x01
	else
		BadgeData1[8] = 0x00
	end
end

function ReadBadge2(offset)
	badge = memory.readbyte(offset)
	if bit.band(badge, 0x01) == 0x01 then
		BadgeData2[1] = 0x01
	else
		BadgeData2[1] = 0x00
	end

	if bit.band(badge, 0x02) == 0x02 then
		BadgeData2[2] = 0x01
	else
		BadgeData2[2] = 0x00
	end

	if bit.band(badge, 0x04) == 0x04 then
		BadgeData2[3] = 0x01
	else
		BadgeData2[3] = 0x00
	end

	if bit.band(badge, 0x08) == 0x08 then
		BadgeData2[4] = 0x01
	else
		BadgeData2[4] = 0x00
	end

	if bit.band(badge, 0x10) == 0x10 then
		BadgeData2[5] = 0x01
	else
		BadgeData2[5] = 0x00
	end

	if bit.band(badge, 0x20) == 0x20 then
		BadgeData2[6] = 0x01
	else
		BadgeData2[6] = 0x00
	end

	if bit.band(badge, 0x40) == 0x40 then
		BadgeData2[7] = 0x01
	else
		BadgeData2[7] = 0x00
	end

	if bit.band(badge, 0x80) == 0x80 then
		BadgeData2[8] = 0x01
	else
		BadgeData2[8] = 0x00
	end
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
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			if Pokedexdata[((i - 1) * 8) + 1] == 0 then
				Pokedexdata[((i - 1) * 8) + 1] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			if Pokedexdata[((i - 1) * 8) + 1 + 1] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 1] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 1
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			if Pokedexdata[((i - 1) * 8) + 1 + 2] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 2] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 2
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			if Pokedexdata[((i - 1) * 8) + 1 + 3] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 3] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 3
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			if Pokedexdata[((i - 1) * 8) + 1 + 4] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 4] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 4
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			if Pokedexdata[((i - 1) * 8) + 1 + 5] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 5] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 5
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			if Pokedexdata[((i - 1) * 8) + 1 + 6] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 6] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 6
				end
			end
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			if Pokedexdata[((i - 1) * 8) + 1 + 7] == 0 then
				Pokedexdata[((i - 1) * 8) + 1 + 7] = 1
				if MapID ~= 0 then
					LastCaptured = ((i - 1) * 8) + 1 + 7
				end
			end
		end
		
		offset = offset + 1
	end
end

function on_pokemon_capture(PokemonID)
	--PokemonID is the ID of the newly acquired Pokemon
	print(string.format("WE JUST GOT %d!", PokemonID))
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

while true do
	if emu.framecount() % 30 == 1 then
    if memory.readbyte(0xFF70) == 1 then
        bank_wait = 0
        value = memory.readbyte(0xD849)
        is_military_on = (value % 2 == 1) -- just in case you need to know the current status
        newvalue = bit.band(value, 254) + military_mode
        memory.writebyte(0xD849, newvalue)
        -- do player state reading here
        
        
        
        
        -- player state reading here
        if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
            lua_wait = 0
            if (AND(memory.readbyte(rLSB), 0x02) ~= 0) then
                battlestate = readBattlestate(memory.readbyte(rLSB))
                if debug_mode == 1 then
                    vba.print("[DEBUG] STATUS: ", string.format("%02x", memory.readbyte(rLSB)))  
                    vba.print("[DEBUG] BATTLESTATE:", battlestate)
                end
                vba.print("Waiting on AI...")
                airesponse = transferStateToAIAndWait(battlestate)
                vba.print("AI RESPONSE:", airesponse)
            else
                vba.print("No AI request found.")
            end  
            if military_mode == 1 and (AND(memory.readbyte(rLSB), 0x01) ~= 0) then
                vba.print("Waiting on player...")
                --outplayer = UseRandomMove(BattleMonMoves, BattleMonPP, PlayerDisableCount)
                playerresponse = get_next_player_command()
                if debug_mode == 1 then
                    vba.print("[DEBUG] PLAYER RESPONSE:", playerresponse)
                end  
            else
                if military_mode ~= 1 and debug_mode == 1 then
                    vba.print("[DEBUG] INFO: Military mode not enabled.")
                elseif (AND(memory.readbyte(rLSB), 0x01) == 0) and military_mode == 1 then
                    vba.print("ERROR: Invalid rLSB configuration.")
                end
            end
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
                    vba.print("Waiting for LUA serial...")
                    lua_wait = 1
                end
        end
    else
        if bank_wait == 0 then
            vba.print("Waiting for valid bank, bank is currently", memory.readbyte(rSVBK))
            bank_wait = 1
        end
		if memory.readdword(0x013C) == 0x54524F42 and memory.readbyte(0xFF70) == 1 then --BORT
			ReadParty(0xDCD7)
			ReadSeen(0xDEB9)
			ReadOwn(0xDE99)
			CheckDex(0xDE99)
			ReadMoney(0xD84E)
			ReadBadge1(0xD857)
			ReadBadge2(0xD858)
			ReadTitle(0xC3C9)
			ReadDiploma(0x9902)
			MapID = (memory.readbyte(0xDCB5) * 256) + memory.readbyte(0xDCB6)

			if LastCaptured ~= LastCaptured2 then
				on_pokemon_capture(LastCaptured)
				LastCaptured2 = LastCaptured
			end
		end
        end
        
        if debug_mode == 1 then
            print(string.format("Diploma = %d", Diploma))
            print(string.format("Title = %d", Title))
            print(string.format("MapID = %d", MapID))
            for i = 1, 8, 1 do
                print(string.format("JBadge%d = %d", i, BadgeData1[i]))
            end
            for i = 1, 8, 1 do
                print(string.format("KBadge%d = %d", i, BadgeData2[i]))
            end
            print(string.format("Seen = %d", Seen))
            print(string.format("Own = %d", Own))
            print(string.format("LastCaptured = %d", LastCaptured))
            print(string.format("Money = %d", Money))
            for i = 1, 6, 1 do
                print(string.format("PKM%d = %d,  HP = %d, MAXHP = %d, Lvl = %d, Status = %d, Gender = %d", i, ID[i], HP[i], MAXHP[i], Lvl[i], Status[i], Gender[i]))
                print(string.format("Move1 = %d %d/%d, Move2 = %d %d/%d, Move3 = %d %d/%d, Move4 = %d %d/%d", Move1[i], PP1[i], MAXPP1[i], Move2[i], PP2[i], MAXPP2[i], Move3[i], PP3[i], MAXPP3[i], Move4[i], PP4[i], MAXPP4[i]))
            end
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
	end
	emu.frameadvance()
end
