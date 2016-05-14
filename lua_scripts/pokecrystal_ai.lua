--Crystal 251 Main Script v1.02--

dofile("readstates.lua")
dofile("battle_ram.lua")
dofile("constants.lua")

package.path = package.path..';./libs/lua/?.lua'
package.cpath = package.cpath..';./libs/?.dll'
local http = require("socket.http")
local ltn12 = require("ltn12")

EnemyDisableCount = 0xc67d
EnemyMonMoves	 = 0xd208
EnemyMonPP		= 0xd20e
PlayerDisableCount = 0xc675
BattleMonMoves	 = 0xc62e
BattleMonPP		= 0xc634
rLSB			  = 0xfff1
rLSC			  = 0xfff2

-- other stuff --

BEESAFREE_LSC_TRANSFERRING  = 0xff
BEESAFREE_LSC_COMPLETED	 = 0x00

BEESAFREE_SND_RESET		 = 0x00
BEESAFREE_SND_ASKMOVE	 = 0x01
BEESAFREE_SND_ASKITEM	 = 0x02

BEESAFREE_RES_RESET		 = 0x00

lastBattleState = 0
lua_wait = 0
bank_wait = 0
debug_mode = 0 --print EVERYTHING aside from basic info if 1, none if 0

function refreshinterval(seconds)
	--Revo's function (liar, it's Timmy's function)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

function FramesAdvance(nframes)
	for frame = 1, nframes do
		emu.frameadvance()
	end
end

function transferStateToAIAndWait(raw_json)
	next_move = nil
	-- 1st: Invoke the ai with JSON data.
	-- request-body must be a string, therefore encode
	http.request("http://127.0.0.1:5001/ai_invoke", JSON:encode(raw_json))
	-- 2nd: Wait until the ai finished.
	repeat
		-- request AI's response up to 4 times a second, to avoid emulator stutter
		next_move = http.request("http://127.0.0.1:5001/ai_retrieve")
		if (next_move == nil or next_move == "") then
			FramesAdvance(15)
		end
	-- this request returns either the next move,
	-- or an empty string if the result isn't set yet.
	until (next_move ~= nil and next_move ~= "")
	-- we got a result!
	return next_move
end

function GetCommandTables()
	LSB = memory.readbyte(rLSB)
	mil_ai_request = AND(LSB, 0x02)
	airesponse = "move1"
	if mil_ai_request ~= 0 then
		battlestate = readBattlestate(LSB)
		if AND(LSB, 0x04) ~= 0 then
			vba.print("Warning: The last move by the AI was not valid!")
		end
		if debug_mode == 1 then
			vba.print("[DEBUG] STATUS: ", string.format("%02x", memory.readbyte(rLSB)))
			vba.print("[DEBUG] BATTLESTATE:", battlestate)
			vba.print("Waiting on AI...")
		end
		airesponse = transferStateToAIAndWait(battlestate)
		if debug_mode == 1 then vba.print("AI RESPONSE:", airesponse) end
	end
	return airesponse
end

function tablestobytes(airesponse, playertable)
	local byte1 = 0x00
	local byte2 = 0x00
	local byte3 = 0x00

	if airesponse == "move1" then 
		byte1 = 0x00
	elseif airesponse == "move2" then
		byte1 = 0x10
	elseif airesponse == "move3" then
		byte1 = 0x20
	elseif airesponse == "move4" then
		byte1 = 0x30
	elseif airesponse == "switch1" then
		byte1 = 0x40
	elseif airesponse == "switch2" then
		byte1 = 0x50
	elseif airesponse == "switch3" then
		byte1 = 0x60
	elseif airesponse == "switch4" then
		byte1 = 0x70
	elseif airesponse == "switch5" then
		byte1 = 0x80
	elseif airesponse == "switch6" then
		byte1 = 0x90
	elseif airesponse == "useitem1" then
		byte1 = 0xD0
	elseif airesponse == "useitem2" then
		byte1 = 0xE0
	end
	return byte1, byte2, byte3
end

repeat
	if (math.random(47802)) == 1 then
		vba.print("Waiting for baba") -- ayy you found teh easter egg
	end
	if bit.band(memory.readbyte(rSVBK), 0x07) == 1 then
		bank_wait = 0

		-- AI command polling (player state is not updated during these frame delays)
		if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
			lua_wait = 0
            vba.print("Waiting on AI...")
			airesponse, playerresponse = GetCommandTables()
            if debug_mode == 1 then
                vba.print("AI response received, response is:", airesponse)
            else
                vba.print("AI response received")
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
            vba.print("Waiting for valid bank, current bank is: "..bit.band(memory.readbyte(rSVBK), 0x07))
            bank_wait = 1
        end
	end
until not refreshinterval(0.100)
