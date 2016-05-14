-- Revo's really hacky as shit battlestate JSON reader WIP v0.6

JSON = (loadfile "JSON.lua")()

battleState = memory.readbyte(0xD22D)
rSVBK = memory.readbyte(0xFF70)

charTable = {" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "(", ")", ":", ";", "[", "]", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", " ", " ", " ", " ", " ", "A", "O", "U", "a", "o", "u", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "d", "l", "m", "r", "s", "t", "v", " ", " ", " ", " ", " ", " ", " ", " ", "<", "'", "Pk", "Mn", "-", " ", " ", "?", "!", ".", "&", "e", ">", ">", ">", "V", "M", "$", "x", ".", "/", ",", "F", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

itemTable = {"NO_ITEM", "MASTER_BALL", "ULTRA_BALL", "BRIGHTPOWDER", "GREAT_BALL", "POKE_BALL", "LAPTOP", "BICYCLE", "MOON_STONE", "ANTIDOTE", "BURN_HEAL", "ICE_HEAL", "AWAKENING", "PARALYZE_HEAL", "FULL_RESTORE", "MAX_POTION", "HYPER_POTION", "SUPER_POTION", "POTION", "ESCAPE_ROPE", "REPEL", "MAX_ELIXER", "FIRE_STONE", "THUNDERSTONE", "WATER_STONE", "POISON_GUARD", "HP_UP", "PROTEIN", "IRON", "CARBOS", "LUCKY_PUNCH", "CALCIUM", "RARE_CANDY", "X_ACCURACY", "LEAF_STONE", "METAL_POWDER", "NUGGET", "POKE_DOLL", "FULL_HEAL", "REVIVE", "MAX_REVIVE", "GUARD_SPEC", "SUPER_REPEL", "MAX_REPEL", "DIRE_HIT", "BURN_GUARD", "FRESH_WATER", "SODA_POP", "LEMONADE", "X_ATTACK", "FREEZE_GUARD", "X_DEFEND", "X_SPEED", "X_SPECIAL", "COIN_CASE", "ITEMFINDER", "POKE_FLUTE", "EXP_SPARE", "OLD_ROD", "GOOD_ROD", "SILVER_LEAF", "SUPER_ROD", "PP_UP", "ETHER", "MAX_ETHER", "ELIXER", "RED_SCALE", "SECRETPOTION", "S_S_TICKET", "MYSTERY_EGG", "CLEAR_BELL", "SILVER_WING", "MOOMOO_MILK", "QUICK_CLAW", "PSNCUREBERRY", "GOLD_LEAF", "SOFT_SAND", "SHARP_BEAK", "PRZCUREBERRY", "BURNT_BERRY", "ICE_BERRY", "POISON_BARB", "KINGS_ROCK", "BITTER_BERRY", "MINT_BERRY", "RED_APRICORN", "TINYMUSHROOM", "BIG_MUSHROOM", "SILVERPOWDER", "BLU_APRICORN", "SLEEP_GUARD", "AMULET_COIN", "YLW_APRICORN", "GRN_APRICORN", "CLEANSE_TAG", "MYSTIC_WATER", "WHT_APRICORN", "BLACKBELT", "BLK_APRICORN", "PARLYZ_GUARD", "PNK_APRICORN", "BLACKGLASSES", "SLOWPOKETAIL", "PINK_BOW", "STICK", "SMOKE_BALL", "NEVERMELTICE", "MAGNET", "MIRACLEBERRY", "PEARL", "BIG_PEARL", "EVERSTONE", "SPELL_TAG", "RAGECANDYBAR", "GS_BALL", "BLUE_CARD", "MIRACLE_SEED", "THICK_CLUB", "FOCUS_BAND", "CONFUSEGUARD", "ENERGYPOWDER", "ENERGY_ROOT", "HEAL_POWDER", "REVIVAL_HERB", "HARD_STONE", "LUCKY_EGG", "CARD_KEY", "MACHINE_PART", "EGG_TICKET", "LOST_ITEM", "STARDUST", "STAR_PIECE", "BASEMENT_KEY", "PASS", "HELIX_FOSSIL", "DOME_FOSSIL", "OLD_AMBER", "CHARCOAL", "BERRY_JUICE", "SCOPE_LENS", "OAKS_PARCEL", "ITEM_8E", "METAL_COAT", "DRAGON_FANG", "ITEM_91", "LEFTOVERS", "ITEM_93", "ITEM_94", "ITEM_95", "MYSTERYBERRY", "DRAGON_SCALE", "BERSERK_GENE", "ITEM_99", "X_SPDEF", "ITEM_9B", "SACRED_ASH", "HEAVY_BALL", "FLOWER_MAIL", "LEVEL_BALL", "LURE_BALL", "FAST_BALL", "ITEM_A2", "LIGHT_BALL", "FRIEND_BALL", "MOON_BALL", "LOVE_BALL", "NORMAL_BOX", "GORGEOUS_BOX", "SUN_STONE", "POLKADOT_BOW", "ITEM_AB", "UP_GRADE", "BERRY", "GOLD_BERRY", "SQUIRTBOTTLE", "ITEM_B0", "PARK_BALL", "RAINBOW_WING", "ITEM_B3", "BRICK_PIECE", "SURF_MAIL", "LITEBLUEMAIL", "PORTRAITMAIL", "LOVELY_MAIL", "EON_MAIL", "MORPH_MAIL", "BLUESKY_MAIL", "MUSIC_MAIL", "MIRAGE_MAIL", "ITEM_BE", "TM01", "TM02", "TM03", "TM04", "ITEM_C3", "TM05", "TM06", "TM07", "TM08", "TM09", "TM10", "TM11", "TM12", "TM13", "TM14", "TM15", "TM16", "TM17", "TM18", "TM19", "TM20", "TM21", "TM22", "TM23", "TM24", "TM25", "TM26", "TM27", "TM28", "ITEM_DC", "TM29", "TM30", "TM31", "TM32", "TM33", "TM34", "TM35", "TM36", "TM37", "TM38", "TM39", "TM40", "TM41", "TM42", "TM43", "TM44", "TM45", "TM46", "TM47", "TM48", "TM49", "TM50", "HM01", "HM02", "HM03", "HM04", "HM05", "HM06", "HM07", "HM08"}

moveTable = {"NO_MOVE", "POUND", "KARATE_CHOP", "DOUBLESLAP", "GUNK_SHOT", "ZEN_HEADBUTT", "PAY_DAY", "FIRE_PUNCH", "ICE_PUNCH", "THUNDERPUNCH", "SCRATCH", "FAIRY_WIND", "FOCUS_BLAST", "IRON_DEFENSE", "SWORDS_DANCE", "CUT", "GUST", "WING_ATTACK", "WHIRLWIND", "FLY", "BUG_BUZZ", "SLAM", "VINE_WHIP", "STOMP", "DOUBLE_KICK", "MEGA_KICK", "FLARE_BLITZ", "ROLLING_KICK", "SAND_ATTACK", "HEADBUTT", "HORN_ATTACK", "FURY_ATTACK", "HORN_DRILL", "TACKLE", "BODY_SLAM", "WRAP", "TAKE_DOWN", "THRASH", "DOUBLE_EDGE", "TAIL_WHIP", "POISON_STING", "TWINEEDLE", "PIN_MISSILE", "LEER", "BITE", "GROWL", "ROAR", "SING", "SUPERSONIC", "SONICBOOM", "DISABLE", "ACID", "EMBER", "FLAMETHROWER", "MIST", "WATER_GUN", "HYDRO_PUMP", "SURF", "ICE_BEAM", "BLIZZARD", "PSYBEAM", "BUBBLEBEAM", "AURORA_BEAM", "HYPER_BEAM", "PECK", "DRILL_PECK", "SUBMISSION", "HEAT_WAVE", "COUNTER", "SEISMIC_TOSS", "STRENGTH", "ABSORB", "MEGA_DRAIN", "LEECH_SEED", "GROWTH", "RAZOR_LEAF", "SOLARBEAM", "POISONPOWDER", "STUN_SPORE", "SLEEP_POWDER", "PETAL_DANCE", "STRING_SHOT", "DRAGON_RAGE", "FIRE_SPIN", "THUNDERSHOCK", "THUNDERBOLT", "THUNDER_WAVE", "THUNDER", "ROCK_THROW", "EARTHQUAKE", "FISSURE", "DIG", "TOXIC", "CONFUSION", "PSYCHIC_M", "HYPNOSIS", "MEDITATE", "AGILITY", "QUICK_ATTACK", "RAGE", "TELEPORT", "NIGHT_SHADE", "MIMIC", "SCREECH", "DOUBLE_TEAM", "RECOVER", "HARDEN", "MINIMIZE", "SMOKESCREEN", "CONFUSE_RAY", "WITHDRAW", "DEFENSE_CURL", "BARRIER", "LIGHT_SCREEN", "HAZE", "REFLECT", "FOCUS_ENERGY", "BIDE", "METRONOME", "MIRROR_MOVE", "SELFDESTRUCT", "METAL_SOUND", "LICK", "DRAGON_PULSE", "SLUDGE", "BONE_CLUB", "FIRE_BLAST", "WATERFALL", "CLAMP", "SWIFT", "AQUA_JET", "SPIKE_CANNON", "FLASH_CANNON", "AMNESIA", "WILLOWISP", "SOFTBOILED", "HI_JUMP_KICK", "GLARE", "DREAM_EATER", "ROCK_POLISH", "SEED_BOMB", "LEECH_LIFE", "LOVELY_KISS", "SKY_ATTACK", "TRANSFORM", "BUBBLE", "DIZZY_PUNCH", "SPORE", "FLASH", "PSYWAVE", "SPLASH", "ACID_ARMOR", "CRABHAMMER", "EXPLOSION", "POISON_JAB", "BONEMERANG", "REST", "ROCK_SLIDE", "HYPER_FANG", "SHARPEN", "CONVERSION", "TRI_ATTACK", "SUPER_FANG", "SLASH", "SUBSTITUTE", "STRUGGLE", "SKETCH", "WILD_CHARGE", "THIEF", "X_SCISSOR", "MIND_READER", "NIGHTMARE", "FLAME_WHEEL", "IRON_HEAD", "CURSE", "FLAIL", "CONVERSION2", "AEROBLAST", "COTTON_SPORE", "REVERSAL", "SPITE", "POWDER_SNOW", "PROTECT", "MACH_PUNCH", "SCARY_FACE", "FAINT_ATTACK", "SWEET_KISS", "BELLY_DRUM", "SLUDGE_BOMB", "MUD_SLAP", "OCTAZOOKA", "SPIKES", "ZAP_CANNON", "FORESIGHT", "DESTINY_BOND", "PERISH_SONG", "ICY_WIND", "AIR_SLASH", "DARK_PULSE", "EARTH_POWER", "OUTRAGE", "SANDSTORM", "GIGA_DRAIN", "ENDURE", "CHARM", "ROLLOUT", "FALSE_SWIPE", "SWAGGER", "MILK_DRINK", "SPARK", "FURY_CUTTER", "STEEL_WING", "MEAN_LOOK", "ATTRACT", "SLEEP_TALK", "HEAL_BELL", "RETURN", "PRESENT", "DAZZLINGLEAM", "SAFEGUARD", "PAIN_SPLIT", "SACRED_FIRE", "MAGNITUDE", "DYNAMICPUNCH", "MEGAHORN", "DRAGONBREATH", "BATON_PASS", "ENCORE", "PURSUIT", "RAPID_SPIN", "NASTY_PLOT", "IRON_TAIL", "METAL_CLAW", "VITAL_THROW", "MORNING_SUN", "SYNTHESIS", "MOONLIGHT", "HIDDEN_POWER", "CROSS_CHOP", "TWISTER", "RAIN_DANCE", "SUNNY_DAY", "CRUNCH", "MIRROR_COAT", "SHADOW_CLAW", "EXTREMESPEED", "ANCIENTPOWER", "SHADOW_BALL", "FUTURE_SIGHT", "ROCK_SMASH", "WHIRLPOOL", "DRILL_RUN", "MOONBLAST", "PLAY_ROUGH", "SHEER_COLD"}

typeTable = {"NORMAL", "FIGHTING", "FLYING", "POISON", "GROUND", "ROCK", "BIRD", "BUG", "GHOST", "STEEL", "---", "---", "---", "---", "---", "---", "---", "---", "---", "???", "FIRE", "WATER", "GRASS", "ELECTRIC", "PSYCHIC", "ICE", "DRAGON", "DARK", "FAIRY"}

function refreshinterval(seconds)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

function getTrainerClass() --class sequence is unused for now
    local OTClassName = memory.readbyterange(0xc656, 11)
    tickVar = 1
    returnClass = ""
    
    while OTClassName[tickVar] do
        if tickVar > 11 or OTClassName[tickVar] == 80 then break end
                returnClass = returnClass .. charTable[OTClassName[tickVar] - 126]
                tickVar = tickVar + 1
    end

    return returnClass
end

function getTrainerName()
    local OTClassName = memory.readbyterange(0xc656, 11)
    return "dummy"
end

function getBattleType()
    vba.print("dummy")
end

function getItems()
local itemArray = {}

local wEnemyTrainerItem1 = memory.readbyte(0xc650) -- 1 byte
local wEnemyTrainerItem2 = memory.readbyte(0xc651) -- 1 byte

itemArray["item1"] = checkItem(wEnemyTrainerItem1 + 1)
itemArray["item2"] = checkItem(wEnemyTrainerItem2 + 1)

return itemArray
end

function checkItem(value)
local returnedItem = itemTable[value]
return returnedItem
end

function getPlayerScreens()
local playerScreensArray = {}
local PlayerScreens = memory.readbyte(0xc6ff)

if(AND(PlayerScreens,1)==1) then
    table.insert(playerScreensArray,"SPIKES")
end

if(AND(PlayerScreens,4)==4) then
    table.insert(playerScreensArray,"SAFEGUARD")
end

if(AND(PlayerScreens,8)==8) then
    table.insert(playerScreensArray,"LIGHT SCREEN")
end

if(AND(PlayerScreens,16)==16) then
    table.insert(playerScreensArray,"REFLECT")
end

return playerScreensArray
end

function getEnemyScreens()
local enemyScreensArray = {}
local EnemyScreens = memory.readbyte(0xc700)

if(AND(EnemyScreens,1)==1) then
    table.insert(enemyScreensArray,"SPIKES")
end

if(AND(EnemyScreens,4)==4) then
    table.insert(enemyScreensArray,"SAFEGUARD")
end

if(AND(EnemyScreens,8)==8) then
    table.insert(enemyScreensArray,"LIGHT SCREEN")
end

if(AND(EnemyScreens,16)==16) then
    table.insert(enemyScreensArray,"REFLECT")
end

return enemyScreensArray
end

function getWildMon()
local wWildMon = memory.readbyte(0xD22E) -- 1 byte
return wWildMon
end

function getTurns()
local PlayerTurnsTaken = memory.readbyte(0xc6dd) -- 1 byte
PlayerTurnsTaken = PlayerTurnsTaken + 1
return PlayerTurnsTaken
end

function getWeather()
local arenaWeather = {}
local Weather = memory.readbyte(0xc70a)
local WeatherTurnsLeft = memory.readbyte(0xc70b)

if Weather == 1 then
    arenaWeather["RAIN"] = WeatherTurnsLeft
elseif Weather == 2 then
    arenaWeather["SUN"] = WeatherTurnsLeft
elseif Weather == 3 then
    arenaWeather["SANDSTORM"] = WeatherTurnsLeft
else
    arenaWeather["NONE"] = 0
end

return arenaWeather
end

function getPlayerPokemonData()
end

function getEnemyPokemonData()
end

function getWildPokemonData()
local wildPokemon = {}
local wildStats = memory.readbyterange(0xc6c1, 10)
local wildMaxHP = memory.readbyterange(0xd218, 2)
local wildStats = {}
local types = {}
local moves = {}
local move1 = {}
local move2 = {}
local move3 = {}
local move4 = {}
local status = {}
local substatus = {}

move1["move"] = moveTable[memory.readbyte(0xC735) + 1]
move1["pp"] = memory.readbyte(0xc739)
moves["move1"] = move1

if memory.readbyte(0xC736) ~= 0x00 then
    move2["move"] = moveTable[memory.readbyte(0xC736) + 1]
    move2["pp"] = memory.readbyte(0xc73A)
    moves["move2"] = move2
end
if memory.readbyte(0xC737) ~= 0x00 then
    move3["move"] = moveTable[memory.readbyte(0xC737) + 1]
    move3["pp"] = memory.readbyte(0xc73B)
    moves["move3"] = move3
end
if memory.readbyte(0xC738) ~= 0x00 then
    move4["move"] = moveTable[memory.readbyte(0xC738) + 1]
    move4["pp"] = memory.readbyte(0xc73C)
    moves["move4"] = move4
end

wildStats["hp"] = memory.readbyte(0xd219) + (memory.readbyte(0xd218) * 255)
wildStats["atk"] = memory.readbyte(0xc6c2) + (memory.readbyte(0xC6C1) * 255)
wildStats["def"] = memory.readbyte(0xc6c4) + (memory.readbyte(0xC6C3) * 255)
wildStats["spatk"] = memory.readbyte(0xc6c8) + (memory.readbyte(0xC6C7) * 255)
wildStats["spdef"] = memory.readbyte(0xc6D0) + (memory.readbyte(0xC6C9) * 255)
wildStats["spd"] = memory.readbyte(0xc6c6) + (memory.readbyte(0xC6C5) * 255)

if memory.readbyte(0xD224) == memory.readbyte(0xD225) then
    types["1"] = typeTable[memory.readbyte(0xD224) + 1]
else
    types["1"] = typeTable[memory.readbyte(0xD224) + 1]
    types["2"] = typeTable[memory.readbyte(0xD225) + 1]
end

--substatus

wildPokemon["dexNumber"] = getWildMon()
wildPokemon["gender"] = checkGender(memory.readbyte(0xC4BD))
wildPokemon["item"] = checkItem(memory.readbyte(0xD207))
wildPokemon["moves"] = moves
wildPokemon["stats"] = wildStats
wildPokemon["types"] = types
wildPokemon["currenthp"] = memory.readbyte(0xD217) + (memory.readbyte(0xd216) * 255)
wildPokemon["level"] = memory.readbyte(0xd213)
wildPokemon["substatus"] = calculateSubstatus(memory.readbyte(0xc66d), memory.readbyte(0xc66e), memory.readbyte(0xc66f), memory.readbyte(0xc670), memory.readbyte(0xc671), memory.readbyterange(0xc67a, 8))
wildPokemon["status"] = "DUMMY"

wildStatus = memory.readbyte(0xd214)

if (AND(memory.readbyte(0xd214), 8) ~= 0) then
    wildPokemon["status"] = "PSN"
elseif (AND(memory.readbyte(0xd214), 16) ~= 0) then
    wildPokemon["status"] = "BRN"
elseif (AND(memory.readbyte(0xd214), 32) ~= 0) then
    wildPokemon["status"] = "FRZ"
elseif (AND(memory.readbyte(0xd214), 64) ~= 0) then
    wildPokemon["status"] = "PAR"
elseif (AND(memory.readbyte(0xd214), 7) ~= 0) then
    sleepCounter = 0
        if(AND(memory.readbyte(0xd214),1)~=0) then
            sleepCounter = sleepCounter + 1
        end
        if(AND(memory.readbyte(0xd214),2)~=0) then
            sleepCounter = sleepCounter + 2
        end
    status["SLP"] = sleepCounter
    wildPokemon["status"] = status
else
    wildPokemon["status"] = "NONE"
end

return wildPokemon
end

function checkGender(value)
gender = ""

if value == 245 then
    gender = "F"
elseif value == 239 then
    gender = "M"
else
    gender = "I"
end

return gender
end

function calculateSubstatus(byte1, byte2, byte3, byte4, byte5, countRange)
substatus = {}
vba.print(byte1, byte2, byte3, byte4, byte5)
vba.print(countRange)

if (AND(byte1, 1) == 1) then
    substatus["nightmare"] = 
    vba.print("nightmare")
end
if (AND(byte1, 2) == 2) then
    vba.print("curse")
end
if (AND(byte1, 4) == 4) then
    vba.print("protect")
end
if (AND(byte1, 8) == 8) then
    vba.print("identified")
end
if (AND(byte1, 16) == 16) then
    vba.print("perish song")
end
if (AND(byte1, 32) == 32) then
    vba.print("endure")
end
if (AND(byte1, 64) == 64) then
    vba.print("encore")
end
if (AND(byte1, 128) == 128) then
    vba.print("attract")
end

return "DUMMY"
end

repeat
    battleState = {}
    wBattleMode = memory.readbyte(0xD22D)
    rSVBK = memory.readbyte(0xFF70)
    
    vba.print("rSVBK: ", rSVBK)

    if wBattleMode == 2 and rSVBK == 1 then 
        battleState["wBattleMode"] = wBattleMode
        battleState["class"] = getTrainerClass()
        battleState["turn"] = getTurns()
        battleState["items"] = getItems()
        battleState["enemyscreens"] = getEnemyScreens()
        battleState["playerscreens"] = getPlayerScreens()
        battleState["weather"] = getWeather()
        vba.print(battleState)
    elseif wBattleMode == 1 and rSVBK == 1 then 
        battleState["wBattleMode"] = wBattleMode
        battleState["turn"] = getTurns()
        battleState["enemyscreens"] = getEnemyScreens()
        battleState["playerscreens"] = getPlayerScreens()
        battleState["weather"] = getWeather()
        battleState["wildpokemon"] = getWildPokemonData()
        vba.print(battleState)
    elseif wBattleMode == 0 and rSVBK == 1 then 
        vba.print("Not in battle.")
    else 
        vba.print("Invalid data, ignoring.")
    end
until not refreshinterval(0.100)
