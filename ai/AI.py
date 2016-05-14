# TPP Crystal 251 AI v1.41 by Beesafree

from __future__ import division
import math
import random
import json
import os
import sys
import copy

# the program will give a response when called to from 0 to 11
# 0-3 relate to move commands, 1 means use second move on json list (1 being it's index)
# 4-9 relate to a change pokemon command, a 6 will mean switch to third pokemon (third pokemon's index = 6 - 4)
# 10 and 11 relate to using an item, 10 is first item, 11 is second item

if sys.version_info[0] == 2:
		raise ValueError("""You are using Python 2 instead of Python 3.
This program only works in Python 3.""")

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
JSON_FILE_PATH = os.path.join(SCRIPT_DIR, "battlestate.json")
MOVES_FILE_PATH = os.path.join(SCRIPT_DIR, "AiMoves.txt")

#0 is off, 1 is ALL debug, 2 is core debug, 3 is minimal debug
Debug_Code = 0

def sign(x):
    if x == 0:
        return 0
    else:
        return 1 if x > 0 else -1

class Combogenerator:
    def __init__(self,turnsToLookAhead=4, numMoves=4):
        self.arrlen = turnsToLookAhead
        self.numMoves = numMoves
        self.currplace = [0 for x in range(self.arrlen)]
        self.currplace[-1] = -1 # to counter the initial increment
    def __iter__(self):
        return self
    def __next__(self):
        return self.next(self.arrlen-1)
    def next(self, placevalue):
        self.currplace[placevalue] += 1
        if self.currplace[placevalue] >= self.numMoves:
            if placevalue == 0:
                raise StopIteration()
            else:
                self.currplace[placevalue] = 0
                self.next(placevalue-1)
        return self.currplace[:]

class AI(object):
    def __init__(self):
        self._Types = {"normal": 0, "fire": 1, "water": 2, "electric": 3, "grass": 4,
                      "ice": 5, "fighting": 6, "poison": 7, "ground": 8, "flying": 9,
                      "psychic": 10, "bug": 11, "rock": 12, "ghost": 13, "dragon": 14,
                      "dark": 15, "steel": 16, "fairy": 17, "none": 18}

        self._tableTypeEffs = [                            # Fe1k's Design
                        #                                     Defenders
                        #NOR FIR WAT ELE GRA ICE FIG POI GRO FLY PSY BUG ROC GHO DRA DAR STE FAR
                        [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 0.5,  0,  1,  1, 0.5,  1], # NOR
                        [1, 0.5, 0.5,  1,  2,  2,  1,  1,  1,  1,  1,  2, 0.5,  1, 0.5,  1,  2,  1], # FIR
                        [1,  2, 0.5,  1, 0.5,  1,  1,  1,  2,  1,  1,  1,  2,  1, 0.5,  1,  1,  1], # WAT
                        [1,  1,  2, 0.5, 0.5,  1,  1,  1,  0,  2,  1,  1,  1,  1, 0.5,  1,  1,  1], # ELE
                        [1, 0.5,  2,  1, 0.5,  1,  1, 0.5,  2, 0.5,  1, 0.5,  2,  1, 0.5,  1, 0.5,  1], # GRA
                        [1, 0.5, 0.5,  1,  2, 0.5,  1,  1,  2,  2,  1,  1,  1,  1,  2,  1, 0.5,  1], # ICE
                        [2,  1,  1,  1,  1,  2,  1, 0.5,  1, 0.5, 0.5, 0.5,  2,  0,  1,  2,  2, 0.5], # FIG
                        [1,  1,  1,  1,  2,  1,  1, 0.5, 0.5,  1,  1,  1, 0.5, 0.5,  1,  1,  0,  2], # POI
                        [1,  2,  1,  2, 0.5,  1,  1,  2,  1,  0,  1, 0.5,  2,  1,  1,  1,  2,  1], # GRO  Attackers
                        [1,  1,  1, 0.5,  2,  1,  2,  1,  1,  1,  1,  2, 0.5,  1,  1,  1, 0.5,  1], # FLY
                        [1,  1,  1,  1,  1,  1,  2,  2,  1,  1, 0.5,  1,  1,  1,  1,  0, 0.5,  1], # PSY
                        [1, 0.5,  1,  1,  2,  1, 0.5, 0.5,  1, 0.5,  2,  1,  1, 0.5,  1,  2, 0.5, 0.5], # BUG
                        [1,  2,  1,  1,  1,  2, 0.5,  1, 0.5,  2,  1,  2,  1,  1,  1,  1, 0.5,  1], # ROC
                        [0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1,  1,  2,  1, 0.5,  1,  1], # GHO
                        [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  1, 0.5,  0], # DRA
                        [1,  1,  1,  1,  1,  1, 0.5,  1,  1,  1,  2,  1,  1,  2,  1, 0.5,  1, 0.5], # DAR
                        [1, 0.5, 0.5, 0.5,  1,  2,  1,  1,  1,  1,  1,  1,  2,  1,  1,  1, 0.5,  2], # STE
                        [1, 0.5,  1,  1,  1,  1,  2, 0.5,  1,  1,  1,  1,  1,  1,  2,  2, 0.5,  1], # FAR
                        [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1], # U
                        ]

        self._HPTypes = ["fighting", "flying", "poison", "ground", "rock", "bug", "ghost", "steel", "fire", "water", "grass", "electric", "psychic", "ice", "dragon", "dark"]

        self._PokemonTypes = {"bulbasaur": ("grass", "poison"), "ivysaur": ("grass", "poison"), "venusaur": ("grass", "poison"), "charmander": ("fire", "none"), "charmeleon": ("fire", "none"), "charizard": ("fire", "flying"), "squirtle": ("water", "none"), "wartortle": ("water", "none"), "blastoise": ("water", "none"), "caterpie": ("bug", "none"), "metapod": ("bug", "none"), "butterfree": ("bug", "flying"), "weedle": ("bug", "poison"), "kakuna": ("bug", "poison"), "beedrill": ("bug", "poison"), "pidgey": ("normal", "flying"), "pidgeotto": ("normal", "flying"), "pidgeot": ("normal", "flying"), "rattata": ("normal", "none"), "raticate": ("normal", "none"), "spearow": ("normal", "flying"), "fearow": ("normal", "flying"), "ekans": ("poison", "none"), "arbok": ("poison", "none"), "pikachu": ("electric", "none"), "raichu": ("electric", "none"), "sandshrew": ("ground", "none"), "sandslash": ("ground", "none"), "nidoranf": ("poison", "none"), "nidorina": ("poison", "none"), "nidoqueen": ("poison", "ground"), "nidoranm": ("poison", "none"), "nidorino": ("poison", "none"), "nidoking": ("poison", "ground"), "clefairy": ("fairy", "none"), "clefable": ("fairy", "none"), "vulpix": ("fire", "none"), "ninetales": ("fire", "none"), "jigglypuff": ("normal", "fairy"), "wigglytuff": ("normal", "fairy"), "zubat": ("poison", "flying"), "golbat": ("poison", "flying"), "oddish": ("grass", "poison"), "gloom": ("grass", "poison"), "vileplume": ("grass", "poison"), "paras": ("bug", "grass"), "parasect": ("bug", "grass"), "venonat": ("bug", "poison"), "venomoth": ("bug", "poison"), "diglett": ("ground", "none"), "dugtrio": ("ground", "none"), "meowth": ("normal", "none"), "persian": ("normal", "none"), "psyduck": ("water", "none"), "golduck": ("water", "none"), "mankey": ("fighting", "none"), "primeape": ("fighting", "none"), "growlithe": ("fire", "none"), "arcanine": ("fire", "none"), "poliwag": ("water", "none"), "poliwhirl": ("water", "none"), "poliwrath": ("water", "fighting"), "abra": ("psychic", "none"), "kadabra": ("psychic", "none"), "alakazam": ("psychic", "none"), "machop": ("fighting", "none"), "machoke": ("fighting", "none"), "machamp": ("fighting", "none"), "bellsprout": ("grass", "poison"), "weepinbell": ("grass", "poison"), "victreebel": ("grass", "poison"), "tentacool": ("water", "poison"), "tentacruel": ("water", "poison"), "geodude": ("rock", "ground"), "graveler": ("rock", "ground"), "golem": ("rock", "ground"), "ponyta": ("fire", "none"), "rapidash": ("fire", "none"), "slowpoke": ("water", "psychic"), "slowbro": ("water", "psychic"), "magnemite": ("electric", "steel"), "magneton": ("electric", "steel"), "farfetch'd": ("normal", "flying"), "doduo": ("normal", "flying"), "dodrio": ("normal", "flying"), "seel": ("water", "none"), "dewgong": ("water", "ice"), "grimer": ("poison", "none"), "muk": ("poison", "none"), "shellder": ("water", "none"), "cloyster": ("water", "ice"), "gastly": ("ghost", "poison"), "haunter": ("ghost", "poison"), "gengar": ("ghost", "poison"), "onix": ("rock", "ground"), "drowzee": ("psychic", "none"), "hypno": ("psychic", "none"), "krabby": ("water", "none"), "kingler": ("water", "none"), "voltorb": ("electric", "none"), "electrode": ("electric", "none"), "exeggcute": ("grass", "psychic"), "exeggutor": ("grass", "psychic"), "cubone": ("ground", "none"), "marowak": ("ground", "none"), "hitmonlee": ("fighting", "none"), "hitmonchan": ("fighting", "none"), "lickitung": ("normal", "none"), "koffing": ("poison", "none"), "weezing": ("poison", "none"), "rhyhorn": ("ground", "rock"), "rhydon": ("ground", "rock"), "chansey": ("normal", "none"), "tangela": ("grass", "none"), "kangaskhan": ("normal", "none"), "horsea": ("water", "none"), "seadra": ("water", "none"), "goldeen": ("water", "none"), "seaking": ("water", "none"), "staryu": ("water", "none"), "starmie": ("water", "psychic"), "mr.mime": ("psychic", "fairy"), "scyther": ("bug", "flying"), "jynx": ("ice", "psychic"), "electabuzz": ("electric", "none"), "magmar": ("fire", "none"), "pinsir": ("bug", "none"), "tauros": ("normal", "none"), "magikarp": ("water", "none"), "gyarados": ("water", "flying"), "lapras": ("water", "ice"), "ditto": ("normal", "none"), "eevee": ("normal", "none"), "vaporeon": ("water", "none"), "jolteon": ("electric", "none"), "flareon": ("fire", "none"), "porygon": ("normal", "none"), "omanyte": ("rock", "water"), "omastar": ("rock", "water"), "kabuto": ("rock", "water"), "kabutops": ("rock", "water"), "aerodactyl": ("rock", "flying"), "snorlax": ("normal", "none"), "articuno": ("ice", "flying"), "zapdos": ("electric", "flying"), "moltres": ("fire", "flying"), "dratini": ("dragon", "none"), "dragonair": ("dragon", "none"), "dragonite": ("dragon", "flying"), "mewtwo": ("psychic", "none"), "mew": ("psychic", "none"), "chikorita": ("grass", "none"), "bayleef": ("grass", "none"), "meganium": ("grass", "none"), "cyndaquil": ("fire", "none"), "quilava": ("fire", "none"), "typhlosion": ("fire", "none"), "totodile": ("water", "none"), "croconaw": ("water", "none"), "feraligatr": ("water", "none"), "sentret": ("normal", "none"), "furret": ("normal", "none"), "hoothoot": ("normal", "flying"), "noctowl": ("normal", "flying"), "ledyba": ("bug", "flying"), "ledian": ("bug", "flying"), "spinarak": ("bug", "poison"), "ariados": ("bug", "poison"), "crobat": ("poison", "flying"), "chinchou": ("water", "electric"), "lanturn": ("water", "electric"), "pichu": ("electric", "none"), "cleffa": ("fairy", "none"), "igglybuff": ("normal", "fairy"), "togepi": ("fairy", "none"), "togetic": ("fairy", "flying"), "natu": ("psychic", "flying"), "xatu": ("psychic", "flying"), "mareep": ("electric", "none"), "flaaffy": ("electric", "none"), "ampharos": ("electric", "none"), "bellossom": ("grass", "none"), "marill": ("water", "fairy"), "azumarill": ("water", "fairy"), "sudowoodo": ("rock", "none"), "politoed": ("water", "none"), "hoppip": ("grass", "flying"), "skiploom": ("grass", "flying"), "jumpluff": ("grass", "flying"), "aipom": ("normal", "none"), "sunkern": ("grass", "none"), "sunflora": ("grass", "none"), "yanma": ("bug", "flying"), "wooper": ("water", "ground"), "quagsire": ("water", "ground"), "espeon": ("psychic", "none"), "umbreon": ("dark", "none"), "murkrow": ("dark", "flying"), "slowking": ("water", "psychic"), "misdreavus": ("ghost", "none"), "unown": ("psychic", "none"), "wobbuffet": ("psychic", "none"), "girafarig": ("normal", "psychic"), "pineco": ("bug", "none"), "forretress": ("bug", "steel"), "dunsparce": ("normal", "none"), "gligar": ("ground", "flying"), "steelix": ("steel", "ground"), "snubbull": ("fairy", "none"), "granbull": ("fairy", "none"), "qwilfish": ("water", "poison"), "scizor": ("bug", "steel"), "shuckle": ("bug", "rock"), "heracross": ("bug", "fighting"), "sneasel": ("dark", "ice"), "teddiursa": ("normal", "none"), "ursaring": ("normal", "none"), "slugma": ("fire", "none"), "magcargo": ("fire", "rock"), "swinub": ("ice", "ground"), "piloswine": ("ice", "ground"), "corsola": ("water", "rock"), "remoraid": ("water", "none"), "octillery": ("water", "none"), "delibird": ("ice", "flying"), "mantine": ("water", "flying"), "skarmory": ("steel", "flying"), "houndour": ("dark", "fire"), "houndoom": ("dark", "fire"), "kingdra": ("water", "dragon"), "phanpy": ("ground", "none"), "donphan": ("ground", "none"), "porygon2": ("normal", "none"), "stantler": ("normal", "none"), "smeargle": ("normal", "none"), "tyrogue": ("fighting", "none"), "hitmontop": ("fighting", "none"), "smoochum": ("ice", "psychic"), "elekid": ("electric", "none"), "magby": ("fire", "none"), "miltank": ("normal", "none"), "blissey": ("normal", "none"), "raikou": ("electric", "none"), "entei": ("fire", "none"), "suicune": ("water", "none"), "larvitar": ("rock", "ground"), "pupitar": ("rock", "ground"), "tyranitar": ("rock", "dark"), "lugia": ("psychic", "flying"), "ho-oh": ("fire", "flying"), "celebi": ("psychic", "grass") }
        self._statsmultipliers = [25, 28, 33, 40, 50, 66, 100, 150, 200, 250, 300, 350, 400]
        self._accuracymultipliers = [33, 36, 43, 50, 60, 75, 100, 133, 166, 200, 233, 266, 300]
        self._critmultipliers = [0.0625, 0.125, 0.5, 1, 1, 1, 1]
        self._actualAction= {'0': 'move1', '1': 'move2', '2': 'move3', '3': 'move4', '4': 'switch1', '5': 'switch2', '6': 'switch3', '7': 'switch4', '8': 'switch5', '9': 'switch6', '10': 'useitem1', '11': 'useitem2'}

        with open(MOVES_FILE_PATH, 'r') as tempX:
            self._moves = tempX.read().split(' ')

        self.statNames = ["atk","def","satk","sdef","spd","eva","acc"]

    def parseMondataFromJsonlist (self):
        if isinstance(self.jsonlist['battleState']['weather'], dict):
            if "Rain" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'rain'
            elif "Sun" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'sun'
            elif "Sandstorm" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'sandstorm'
        else:
            self.MonData['weather'] = 'clear'

        self.MonData['enemypokemon'] = {}
        self.MonData['playerpokemon'] = {}
        self.MonData['myitems'] = {}
        self.MonData['enemypokemon']['screens'] = {}
        self.MonData['playerpokemon']['screens'] = {}
        self.MonData['enemypokemon']['substatus'] = copy.deepcopy(self.jsonlist['battleState']['enemypokemon']['subStatus'])
        self.MonData['playerpokemon']['substatus'] = copy.deepcopy(self.jsonlist['battleState']['playerpokemon']['subStatus'])
        self.MonData['enemypokemon']['screens'] = copy.deepcopy(self.jsonlist['battleState']['enemypokemon']['screens'])
        self.MonData['playerpokemon']['screens'] = copy.deepcopy(self.jsonlist['battleState']['playerpokemon']['screens'])
        self.MonData['enemypokemon']['bound'] = copy.deepcopy(int(self.jsonlist['battleState']['enemypokemon']['wrap count']))
        self.MonData['playerpokemon']['bound'] = copy.deepcopy(int(self.jsonlist['battleState']['playerpokemon']['wrap count']))

        for allmons in range(0, 12):
            if (allmons <= 5):
                templocation = 'enemyParty'
                temptext = 'enemypokemon'
                tempx = allmons
            else:
                templocation = 'playerParty'
                temptext = 'playerpokemon'
                tempx = allmons - 6
            if (allmons+1 <= self.myparty) or ((allmons-5 <= self.trainparty) and (allmons > 5)):
                self.MonData[allmons] = {}
                self.MonData[allmons]['type'] = {}
                self.MonData[allmons]['stats'] = {}
                self.MonData[allmons]['stats']['happy'] = int(self.jsonlist[templocation]['party'][tempx]['happiness'])
                self.MonData[allmons]['stats']['curhp'] = copy.deepcopy(int(self.jsonlist[templocation]['party'][tempx]['hp']))
                #Since party members can't have stat boosts, no need to undo the calculations
                self.MonData[allmons]['stats']['maxhp'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['maxhp'])
                self.MonData[allmons]['stats']['atk'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['attack'])
                self.MonData[allmons]['stats']['def'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['defense'])
                self.MonData[allmons]['stats']['satk'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['spatk'])
                self.MonData[allmons]['stats']['sdef'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['spdef'])
                self.MonData[allmons]['stats']['spd'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['speed'])
                self.MonData[allmons]['status'] = self.jsonlist[templocation]['party'][tempx]['status'].lower()
                self.MonData[allmons]['level'] = int(self.jsonlist[templocation]['party'][tempx]['level'])
                self.MonData[allmons]['item'] = self.jsonlist[templocation]['party'][tempx]['item'].lower().replace(' ', '').replace('-', '')
                self.MonData[allmons]['gender'] = self.jsonlist[templocation]['party'][tempx]['gender'].lower()
                self.MonData[allmons]['species'] = self.jsonlist[templocation]['party'][tempx]['species'].lower().replace(u"\2642", "m").replace(u"\2640", "f").replace(' ', '')
                self.MonData[allmons]['type'][1] = self._PokemonTypes[self.MonData[allmons]['species']][0]
                self.MonData[allmons]['type'][2] = self._PokemonTypes[self.MonData[allmons]['species']][1]
                self.MonData[allmons]['moves'] = {}
                for moveset in range(0, len(self.jsonlist[templocation]['party'][tempx]['moves'])):
                    self.MonData[allmons]['moves'][moveset] = {}
                    temptext1 = self.jsonlist[templocation]['party'][tempx]['moves'][moveset]['name'].replace(' ', '').lower().replace('-', '')
                    for movelist in range(0, len(self._moves)):
                        templist = self._moves[movelist].split(',')
                        temptext2 = templist[0]
                        if temptext2 == temptext1:
                            self.MonData[allmons]['moves'][moveset]['name'] = templist[0]
                            self.MonData[allmons]['moves'][moveset]['effect'] = templist[1]
                            self.MonData[allmons]['moves'][moveset]['bp'] = int(templist[2])
                            self.MonData[allmons]['moves'][moveset]['category'] = templist[3]
                            self.MonData[allmons]['moves'][moveset]['type'] = templist[4]
                            self.MonData[allmons]['moves'][moveset]['acc'] = int(templist[5])
                            self.MonData[allmons]['moves'][moveset]['curpp'] = int(self.jsonlist[templocation]['party'][tempx]['moves'][moveset]['curpp'])
                            self.MonData[allmons]['moves'][moveset]['pp'] = int(templist[6])
                            self.MonData[allmons]['moves'][moveset]['effectchance'] = int(templist[7])
                            break
                if self.jsonlist['battleState'][temptext]['party idx'] == allmons:
                    self.hp[allmons] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
                    self.MonData[allmons] = {}
                    self.MonData[allmons]['type'] = {}
                    self.MonData[allmons]['stats'] = {}
                    self.MonData[allmons]['stats']['happy'] = int(self.jsonlist['battleState']['enemypokemon']['happiness'])
                    self.MonData[allmons]['stats']['curhp'] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
                    self.MonData[allmons]['stats']['maxhp'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['maxhp'])

                    #compute base stats
                    #stats in the JSON has each stat multiplier already multiplied, so we divide them to get the base stats
                    fullStatNames = {'atk':'attack','def':'defense','satk':'spatk','sdef':'spdef','spd':'speed'}
                    for stat in self.statNames[:-2]: #don't use eva and acc
                        self.MonData[allmons]['stats'][stat] = int(
                            self.jsonlist['battleState']['enemypokemon']['stats'][fullStatNames[stat]] /
                            (self._statsmultipliers[self.jsonlist['battleState']['enemypokemon']['stat levels'][stat]+6]/100) )

                    self.MonData[allmons]['status'] = self.jsonlist['battleState']['enemypokemon']['status'].lower()
                    self.MonData[allmons]['level'] = int(self.jsonlist['battleState']['enemypokemon']['level'])
                    self.MonData[allmons]['item'] = self.jsonlist['battleState']['enemypokemon']['item'].lower().replace(' ', '').replace('-', '')
                    self.MonData[allmons]['gender'] = self.jsonlist['battleState']['enemypokemon']['gender'].lower()
                    self.MonData[allmons]['species'] = self.jsonlist['battleState']['enemypokemon']['species'].lower().replace(u"\2642", "m").replace(u"\2640", "f").replace(' ', '')
                    self.MonData[allmons]['type'][1] = self._PokemonTypes[self.MonData[allmons]['species']][0]
                    self.MonData[allmons]['type'][2] = self._PokemonTypes[self.MonData[allmons]['species']][1]
                    self.MonData[allmons]['moves'] = {}
                    for moveset in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                        self.MonData[allmons]['moves'][moveset] = {}
                        temptext1 = self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['name'].replace(' ', '').lower().replace('-', '')
                        for movelist in range(0, len(self._moves)):
                            templist = self._moves[movelist].split(',')
                            temptext2 = templist[0]
                            if temptext2 == temptext1:
                                self.MonData[allmons]['moves'][moveset]['name'] = templist[0]
                                self.MonData[allmons]['moves'][moveset]['effect'] = templist[1]
                                self.MonData[allmons]['moves'][moveset]['bp'] = int(templist[2])
                                self.MonData[allmons]['moves'][moveset]['category'] = templist[3]
                                self.MonData[allmons]['moves'][moveset]['type'] = templist[4]
                                self.MonData[allmons]['moves'][moveset]['acc'] = int(templist[5])
                                self.MonData[allmons]['moves'][moveset]['curpp'] = int(self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['curpp'])
                                self.MonData[allmons]['moves'][moveset]['pp'] = int(templist[6])
                                self.MonData[allmons]['moves'][moveset]['effectchance'] = int(templist[7])
                                break

        if self.jsonlist['battleState']['enemy type'] == 'WILD':
            self.hp[0] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
            self.MonData[0] = {}
            self.MonData[0]['type'] = {}
            self.MonData[0]['stats'] = {}
            self.MonData[0]['stats']['happy'] = int(self.jsonlist['battleState']['enemypokemon']['happiness'])
            self.MonData[0]['stats']['curhp'] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
            self.MonData[0]['stats']['maxhp'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['maxhp'])
            #compute base stats
            #stats in the JSON has each stat multiplier already multiplied, so we divide them to get the base stats
            fullStatNames = {'atk':'attack','def':'defense','satk':'spatk','sdef':'spdef','spd':'speed'}
            for stat in self.statNames[:-2]: #don't use eva and acc
                self.MonData[0]['stats'][stat] = int(
                    self.jsonlist['battleState']['enemypokemon']['stats'][fullStatNames[stat]] /
                    (self._statsmultipliers[self.jsonlist['battleState']['enemypokemon']['stat levels'][stat]+6]/100) )

            self.MonData[0]['status'] = self.jsonlist['battleState']['enemypokemon']['status'].lower()
            self.MonData[0]['level'] = int(self.jsonlist['battleState']['enemypokemon']['level'])
            self.MonData[0]['item'] = self.jsonlist['battleState']['enemypokemon']['item'].lower().replace(' ', '').replace('-', '')
            self.MonData[0]['gender'] = self.jsonlist['battleState']['enemypokemon']['gender'].lower()
            self.MonData[0]['species'] = self.jsonlist['battleState']['enemypokemon']['species'].lower().replace(u"\2642", "m").replace(u"\2640", "f").replace(' ', '')
            self.MonData[0]['type'][1] = self._PokemonTypes[self.MonData[0]['species']][0]
            self.MonData[0]['type'][2] = self._PokemonTypes[self.MonData[0]['species']][1]
            self.MonData[0]['moves'] = {}
            for moveset in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                self.MonData[0]['moves'][moveset] = {}
                temptext1 = self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['name'].replace(' ', '').lower().replace('-', '')
                for movelist in range(0, len(self._moves)):
                    templist = self._moves[movelist].split(',')
                    temptext2 = templist[0]
                    if temptext2 == temptext1:
                        self.MonData[0]['moves'][moveset]['name'] = templist[0]
                        self.MonData[0]['moves'][moveset]['effect'] = templist[1]
                        self.MonData[0]['moves'][moveset]['bp'] = int(templist[2])
                        self.MonData[0]['moves'][moveset]['category'] = templist[3]
                        self.MonData[0]['moves'][moveset]['type'] = templist[4]
                        self.MonData[0]['moves'][moveset]['acc'] = int(templist[5])
                        self.MonData[0]['moves'][moveset]['curpp'] = int(self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['curpp'])
                        self.MonData[0]['moves'][moveset]['pp'] = int(templist[6])
                        self.MonData[0]['moves'][moveset]['effectchance'] = int(templist[7])
                        break
        self.PermMonData = copy.deepcopy(self.MonData)
        for tempx in range(6, self.trainparty+6):
            self.opponenthp[tempx] = self.PermMonData[tempx]['stats']['curhp']
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            for tempx in range(0, self.myparty):
                self.hp[tempx] = self.PermMonData[tempx]['stats']['curhp']

        #Treat disabled moves as 0 pp
        if self.jsonlist['battleState']['enemy type'] == 'WILD':
            if 'disabled' in self.MonData['enemypokemon']['substatus']:
                self.MonData[0]['moves'][int(self.MonData['enemypokemon']['substatus']['disabled']['move idx']-1)]['curpp'] = 0
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            if 'disabled' in self.MonData['enemypokemon']['substatus']:
                self.MonData[self.jsonlist['battleState']['enemypokemon']['party idx']]['moves'][int(self.MonData['enemypokemon']['substatus']['disabled']['move idx']-1)]['curpp'] = 0
        if 'disabled' in self.MonData['playerpokemon']['substatus']:
                self.MonData[self.jsonlist['battleState']['playerpokemon']['party idx']+6]['moves'][int(self.MonData['playerpokemon']['substatus']['disabled']['move idx']-1)]['curpp'] = 0
        return

    #type1name = attacker, type2name = defender
    def getEff(self, type1name, type2name, defenderindex):
        if (type2name == 'none') or (type1name == 'curset') or (type1name == 'u') or (type1name == 'none') or (type1name == ''):
            return 1

        type1 = self._Types[type1name]
        type2 = self._Types[type2name]
        tempx = self._tableTypeEffs[type1][type2]

        identified = (('identified' in self.MonData[defenderindex]['substatus'] or (isinstance(self.MonData[defenderindex]['substatus'], dict) and 'identified' in self.MonData[defenderindex]['substatus'].values())) or (self.MonData['identified'] == True and defenderindex == 'playerpokemon'))
        if identified and type2name == 'ghost' and (type1name == 'fighting' or type1name == 'normal'):
            tempx = 1
        return tempx

    def DamageDealt(self, attacker, defender, moveused):
        damage = 0
        #attacker is temptext2
        if attacker >= 6:
            temptext = 'enemypokemon'
            temptext2 = 'playerpokemon'
        if attacker <= 5:
            temptext2 = 'enemypokemon'
            temptext = 'playerpokemon'

        if Debug_Code == 1:
            print(moveused)
        move_used = self.MonData[attacker]['moves'][moveused]
        move_used_effect = move_used['effect']

        if Debug_Code == 1 and attacker < 6:
            print(move_used['name'])

        #sleeptalk workaround
        if move_used_effect == 'sleeptalk' and self.MonData[attacker]['status'] in ('slp', 'slp1', 'slp2', 'slp3'):
            tempx = 0
            for tempmove in range(0, len(self.MonData[attacker]['moves'])):
                if self.MonData[attacker]['moves'][tempmove]['bp'] > tempx:
                    tempy = tempmove
                    tempx = self.MonData[attacker]['moves'][tempmove]['bp']
            for dataPoint in ["effect","bp","effectchance","category","type"]:
                move_used[dataPoint] = self.MonData[attacker]['moves'][tempmove][dataPoint]

        #Multihit
        multiplier = 1
        if move_used_effect == 'multihit':
            multiplier = 3
        elif move_used_effect in ('doublehit', 'twineedle'):
            multiplier = 2

        #Raw Damage modifiers
        atkmodifier = 1
        satkmodifier = 1
        if self.MonData[attacker]['item'] == 'lightball' and self.MonData[attacker]['species'] == 'pikachu':
            atkmodifier = atkmodifier * 2
            satkmodifier *= 2
        elif self.MonData[attacker]['item'] == 'thickclub' and (self.MonData[attacker]['species'] == 'cubone' or self.MonData[attacker]['species'] == 'marowak'):
            atkmodifier *= 2

        #Raw damage
        #basebp change
        basebp = move_used['bp']
        if move_used_effect == 'return':
            basebp = self.MonData[attacker]['stats']['happy'] / 2.5
        if move_used_effect == 'furycutter':
            if 'raging' in self.MonData[temptext2]['substatus']:
                if attacker < 6:
                    self.MonData[temptext2]['substatus']['raging'] = self.MonData[temptext2]['substatus']['raging'] + 1
                basebp = (basebp / 2) * ( 2 ** self.MonData[temptext2]['substatus']['raging'])
            else:
                if attacker < 6:
                    if type(self.MonData[temptext2]['substatus']) == list:
                        self.MonData[temptext2]['substatus'] = {str(i+1): x for i, x in enumerate(self.MonData[temptext2]['substatus'])}
                    self.MonData[temptext2]['substatus']['raging'] = 1
            if basebp > 160:
                basebp = 160
        if move_used_effect == 'reversal':
            if self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] > 0.71:
                basebp = 20
            elif self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] < 0.71:
                basebp = 40
            elif self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] < 0.35:
                basebp = 80
            elif self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] < 0.20:
                basebp = 100
            elif self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] < 0.10:
                basebp = 150
            elif self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp'] < 0.04:
                basebp = 200

        if move_used_effect == 'hiddenpower':
            #actual basebp code
            '''basebp = math.floor(((5 * (math.floor(self.jsonlist['battleState'][temptext2]['dvs']['spc']/8) + math.floor(self.jsonlist['battleState'][temptext2]['dvs']['spd']/8) * 2 + math.floor(self.jsonlist['battleState'][temptext2]['dvs']['def']/8) * 4 + math.floor(self.jsonlist['battleState'][temptext2]['dvs']['atk']/8) * 8) + (self.jsonlist['battleState'][temptext2]['dvs']['spc'] % 4)) / 2) + 31)'''
            #override bp code
            basebp = 70
            tempx = 4 * (self.jsonlist['battleState'][temptext2]['dvs']['atk'] % 4) + (self.jsonlist['battleState'][temptext2]['dvs']['def'] % 4)
            move_used['type'] = self._HPTypes[tempx]

        #stab
        if self.MonData[attacker]['type'][1].lower() == move_used['type'].lower():
            basebp = basebp*1.5
        elif self.MonData[attacker]['type'][2].lower() == move_used['type'].lower():
            basebp = basebp*1.5
        #category and boosts
        if move_used['category'] == 'status':
            damage = 0

        #alright, compute the damage!
        elif move_used['category'] == "special":
            satkmodifier *= self._statsmultipliers[self.MonData[attacker]['boosts']['satk']+6]/100
            defmultiplier = self._statsmultipliers[self.MonData[defender]['boosts']['sdef']+6]/100
            attack = min(self.MonData[attacker]['stats']['satk'] * satkmodifier, 999)
            defense = min(self.MonData[defender]['stats']['sdef'] * defmultiplier, 999)
            #gen IV: rock-types' spdef goes up in sandstorm
            if self.MonData['weather'] == 'sandstorm' and (self.MonData[defender]['type'][1].lower() == 'rock' or self.MonData[defender]['type'][2].lower() == 'rock'):
                defense = defense * 1.5
            #compute damage
            damage = ((((((2 * self.MonData[attacker]['level'] + 10) / 250) * (attack / defense) * basebp)+2) * 0.85)) * multiplier
            if ('lightscreen', 'light screen') in self.MonData[temptext]['screens'] or (attacker > 5 and self.MonData['lightscreen']):
                damage /= 2
        elif move_used['category'] == "physical":
            atkmodifier *= self._statsmultipliers[self.MonData[attacker]['boosts']['atk']+6]/100
            defmultiplier = self._statsmultipliers[self.MonData[defender]['boosts']['def']+6]/100
            attack = min(self.MonData[attacker]['stats']['atk'] * satkmodifier, 999)
            defense = min(self.MonData[defender]['stats']['def'] * defmultiplier, 999)
            damage = ((((((2 * self.MonData[attacker]['level'] + 10) / 250) * (attack / defense) * basebp)+2) * 0.85)) * multiplier
            if 'reflect' in self.MonData[temptext]['screens'] or (attacker > 5 and self.MonData['reflect']):
                damage /= 2
            #burn reduces physical damage
            if self.MonData[attacker]['status'] == 'brn':
                damage /= 2
        #Effectivity
        if Debug_Code == 1:
            print('move used type: '+move_used['type'].lower()+' enemy types: '+ self.MonData[defender]['type'][1].lower()+' / '+ self.MonData[defender]['type'][2].lower())

        #compute 1.2x move-boosting items
        type_boost_item_dict = {'blackbelt':'fighting','blackglasses':'dark','charcoal':'fire','dragonfang':'dragon','hardstone':'rock','dragonfang':'dragon','hardstone':'rock','magnet':'electric','metalcoat':'steel','miracleseed':'grass','mysticwater':'water','nevermeltice':'ice','poisonbarb':'poison','sharpbeak':'flying','silkscarf':'normal','silverpowder':'bug','softsand':'ground','spelltag':'ghost','pinkbow':'fairy'}
        if self.MonData[attacker]['item'] in type_boost_item_dict:
            if move_used['type'] == type_boost_item_dict[self.MonData[attacker]['item']]:
                damage *= 1.20

        elif self.MonData[attacker]['item'] == 'twistedspoon' and move_used['type'] == 'psychic' and move_used_effect != "futuresight":
            #special case: twistedspoon doesn't affect futuresight
            damage *= 1.20

        #multiple future sights won't work
        if move_used_effect == "futuresight":
            if int(self.jsonlist['battleState'][temptext2]['future sight']['count']) != 0:
                damage = 0

        #weather
        tempaccuracy=0
        if self.MonData['weather'] == 'sun':
            if move_used['type'].lower() == 'fire':
                damage *= 1.5
            if move_used['type'].lower() == 'water':
                damage *= 0.5
            #thunder's accuracy goes down in sun
            if move_used['name'].lower() == 'thunder':
                tempaccuracy = 50

        elif self.MonData['weather'] == 'rain':
            if move_used['type'].lower() == 'fire':
                damage *= 0.5
            if move_used['type'].lower() == 'water':
                damage *= 1.5
            #thunder's accuracy is 100% in rain
            if move_used['name'].lower() == 'thunder':
                tempaccuracy = 100

        #Static Damage
        if move_used['effect'] in ('psywave', 'leveldamage'):
            damage = self.MonData[attacker]['level']
        elif move_used['name'] == 'dragonrage':
            damage = 40
        elif move_used['name'] == 'sonicboom':
            damage = 20
        elif move_used['name'] == 'superfang':
            damage = self.MonData[defender]['stats']['curhp'] / 2

        #Special cases
        elif move_used_effect == 'falseswipe':
            if damage > self.MonData[defender]['stats']['curhp']:
                damage = self.MonData[defender]['stats']['curhp'] - 1

        if move_used_effect == 'rollout':
            curled = ((self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'curled' in self.MonData[temptext2]['substatus'].values())) or ((self.MonData['defensecurlused'] == True) and (attacker < 6)))
            if curled:
                damage *= 2
            if 'rollout' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'rollout' in self.MonData[temptext2]['substatus'].values()):
                damage *= (2 ** (self.MonData[temptext2]['substatus']['rollout']))
        else:
            curled = False
        if Debug_Code == 1 and attacker < 6:
            print('Damage before accuracy and after special cases '+str(damage))

        #Accuracy checks
        totalacc = 1
        accmodifier = 1
        if move_used_effect != 'alwayshit':
            if self.MonData[defender]['item'] == 'brightpowder':
                accmodifier = accmodifier * 90.9090
            tempx = self._accuracymultipliers[self.MonData[attacker]['boosts']['acc']+6]/100
            tempy = self.MonData[defender]['boosts']['eva'] * -1
            tempy = self._accuracymultipliers[tempy+6]/100
            if tempaccuracy == 0:
                totalacc = tempx * accmodifier * (move_used['acc']/100) * tempy
            elif tempaccuracy > 0:
                totalacc = tempx * accmodifier * (tempaccuracy/100) * tempy

        effmulti = self.getEff(self.MonData[attacker]['moves'][moveused]['type'].lower(), self.MonData[defender]['type'][1].lower(), 'playerpokemon') * self.getEff(self.MonData[attacker]['moves'][moveused]['type'].lower(), self.MonData[defender]['type'][2].lower(), 'playerpokemon')
        if move_used_effect == 'ohko':
            if effmulti > 0:
                if self.MonData[attacker]['level'] >= self.MonData[defender]['level']:
                    totalacc = ((self.MonData[attacker]['level'] - self.MonData[defender]['level']) + 30)/100
                    damage = self.MonData[defender]['stats']['curhp']
                else:
                    damage = 0

        locked = ("lock on" in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and "lock on" in self.MonData[temptext]['substatus'].values())) or (self.MonData['lockon'] == True and attacker < 6)
        if locked:
            totalacc = 1

        accmodifier = 1
        if self.MonData[attacker]['status'] == 'par':
            accmodifier = accmodifier * 0.75
        if move_used_effect in ('hyperbeam', 'skyattack', 'solarbeam', 'fly'):
            if self.MonData[attacker]['status'] == 'par':
                accmodifier = accmodifier * 0.75 #not redundant; two-turn move means two rolls for PRZ
            if ('confused' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'confused' in self.MonData[temptext2]['substatus'].values())) or (attacker > 5 and self.MonData['confused'] == True):
                accmodifier = accmodifier * 0.5
            if ('attract' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'attract' in self.MonData[temptext2]['substatus'].values())) or (attacker > 5 and self.MonData['attract'] == True):
                accmodifier = accmodifier * 0.5
        if 'confused' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'confused' in self.MonData[temptext2]['substatus'].values()) or (attacker > 5 and self.MonData['confused'] == True):
            accmodifier = accmodifier * 0.5
            if temptext2 == 'playerpokemon':
                self.MonData['confused'] = False
        if 'attract' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'attract' in self.MonData[temptext2]['substatus'].values()) or (attacker > 5 and self.MonData['attract'] == True):
            accmodifier = accmodifier * 0.5
            if temptext2 == 'playerpokemon':
                self.MonData['attract'] = False

        damage *= accmodifier * totalacc

        #0% chance of hitting
        tempx = min(self.MonData[attacker]['stats']['spd'] * self._statsmultipliers[self.MonData[attacker]['boosts']['spd']+6]/100, 999)
        tempy = min(self.MonData[defender]['stats']['spd'] * self._statsmultipliers[self.MonData[defender]['boosts']['spd']+6]/100, 999)

        if self.MonData[attacker]['status'] == 'par':
            tempx = tempx * 0.25
        if self.MonData[defender]['status'] == 'par':
            tempy = tempy * 0.25
        if tempx > tempy:
            if 'underground' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'underground' in self.MonData[temptext]['substatus'].values()):
                if move_used['name'].lower() not in ('earthquake', 'magnitude', 'fissure'):
                    damage = 0
                else:
                    damage = damage * 2
            if 'flying' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'flying' in self.MonData[temptext]['substatus'].values()):
                if move_used['name'].lower() not in ('thunder', 'twister', 'gust'):
                    damage = 0
                else:
                    damage = damage * 2
        else:
            if self.enemybest in ('dig', 'fly'):
                if 'underground' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'underground' in self.MonData[temptext]['substatus'].values()):
                    if move_used['name'].lower() not in ('earthquake', 'magnitude', 'fissure'):
                        damage = 0
                    else:
                        damage = damage * 2
                if 'flying' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'flying' in self.MonData[temptext]['substatus'].values()):
                    if move_used['name'].lower() not in ('thunder', 'twister', 'gust'):
                        damage = 0
                    else:
                        damage = damage * 2
        if (self.MonData[attacker]['status'] == 'frz') and (move_used['name'].lower() not in ('flamewheel', 'sacredfire', 'flareblitz')):
            damage *= 0.2
            if attacker > 5:
                damage *= 0.01
        elif (self.MonData[attacker]['status'] == 'slp') and (move_used['name'].lower() not in ('snore', 'sleeptalk')):
            damage *= 0.33
            if attacker > 5:
                damage *= 0.01
        elif (self.MonData[attacker]['status'] in ('slp2', 'slp1')) and (move_used['name'].lower() not in ('snore', 'sleeptalk')):
            damage *= 0.01
        if (move_used_effect == 'dreameater') and (self.MonData[defender]['status'] != 'slp'):
            damage = 0
        if (self.MonData[attacker]['status'] not in ('slp', 'slp2', 'slp1')) and (move_used['name'].lower() in ('snore', 'sleeptalk')):
            damage = 0


        movelist = [self.MonData[defender]['moves'][move]['name'].lower() for move in self.MonData[defender]['moves']]
        #Dig and Fly aversion
        if move_used['name'].lower() == 'dig':
            if 'earthquake' in movelist or 'magnitude' in movelist or 'fissure' in movelist:
                damage /= 4
        elif move_used['name'].lower() == 'fly' and 'thunder' in movelist:
            damage = damage / 4
        elif move_used['name'].lower() == 'fly':
            if 'twister' in movelist or 'gust' in movelist:
                damage = damage / 2

        if Debug_Code == 1 and attacker < 6:
            print('Damage before crit and after accuracy '+str(damage))

        #Crit modifiers
        critmodifier = 0
        pumped = (('pumped' in self.MonData[temptext2]['substatus'] or (isinstance(self.MonData[temptext2]['substatus'], dict) and 'pumped' in self.MonData[temptext2]['substatus'].values())) or ((self.MonData['focusenergyused'] == True) and (attacker < 6)))
        if self.MonData[attacker]['item'] == 'scopelens':
            critmodifier = 1
        elif self.MonData[attacker]['item'] == 'luckypunch' and self.MonData[attacker]['species'] == 'chansey':
            critmodifier = 2
        elif self.MonData[attacker]['item'] == 'stick' and self.MonData[attacker]['species'] == "farfetch'd":
            critmodifier = 2
        if pumped:
            critmodifier += 2
        if move_used['name'].lower() in ('aeroblast', 'crabhammer', 'crosschop', 'drillrun', 'karatechop', 'razorleaf', 'shadowclaw', 'slash', 'skyattack'):
            critmodifier += 2
        damage = (damage * ( 1 - self._critmultipliers[critmodifier])) + (damage * 1.5 * self._critmultipliers[critmodifier])
        damage = (damage * ( 1 - self._critmultipliers[critmodifier])) + (damage * 1.5 * self._critmultipliers[critmodifier])

        #type effectiveness
        damage *= self.getEff(move_used['type'].lower(), self.MonData[defender]['type'][1].lower(), temptext) * self.getEff(move_used['type'].lower(), self.MonData[defender]['type'][2].lower(), temptext)
        if Debug_Code == 1 and attacker < 6:
            print('Damage after calc '+str(damage))

        self.Damage[attacker][defender][moveused]['selfdamage'] = 0

        #special considerations for the ai's pokemon only
        if attacker < 6:
            if (move_used_effect == 'thief') and (self.MonData[defender]['item'] != 'noitem') and (self.MonData[attacker]['item'] == 'noitem'):
                damage *= 2
                self.MonData[attacker]['item'] = self.MonData[defender]['item']
                self.MonData[defender]['item'] = 'noitem'
            elif (move_used_effect == 'pursuit'):
                if damage * 2 > self.MonData[defender]['stats']['curhp']:
                    damage *= 2
            elif move_used['name'] == 'destinybond':
                damage = self.MonData[defender]['stats']['curhp'] * (1 - (self.MonData[attacker]['stats']['curhp'] / self.MonData[attacker]['stats']['maxhp']))
            elif (move_used_effect == 'recoilhit'):
                self.Damage[attacker][defender][moveused]['selfdamage'] = damage * 0.25
            elif (move_used_effect == 'leechhit'):
                self.Damage[attacker][defender][moveused]['selfdamage'] = damage * -0.25
                healing = True
            if move_used['name'].lower() == 'solarbeam':
                if self.MonData['weather'] != 'sun':
                    damage /= 2
                else:
                    damage += 1
            if self.enemybest in ('hyperbeam', 'skyattack', 'solarbeam'):
                damage *= 2

        if Debug_Code == 1 and attacker < 6:
            print('Damage after crit'+str(damage))
        if move_used_effect == 'jumpkick':
            self.Damage[attacker][defender][moveused]['selfdamage'] = damage / 2
        elif move_used_effect == 'explosion':
            self.Damage[attacker][defender][moveused]['selfdamage'] = self.MonData[attacker]['stats']['curhp'] * 1.5
            if damage > self.MonData[defender]['stats']['curhp']:
                damage = self.MonData[attacker]['stats']['curhp'] + 3
            if attacker > 5 and damage > self.MonData[defender]['stats']['curhp']:
                damage = self.MonData[defender]['stats']['curhp'] / 2
        elif move_used_effect == 'dreameater':
            self.Damage[attacker][defender][moveused]['selfdamage'] = damage / -2
        self.Damage[attacker][defender][moveused]['damage'] = damage

        if self.FinalChance and move_used_effect in ('hyperbeam', 'skyattack', 'solarbeam', 'futuresight', 'metronome'):
            self.Damage[attacker][defender][moveused]['damage'] = 0

        if effmulti < 0.125:
            self.Damage[attacker][defender][moveused]['damage'] = -500

        return 1

    #enemy's highest damage
    def TrainerDamage(self, traincurrent, mycurrent):

        if Debug_Code == 1:
            print ('inside TrainerDamage, variables in play - traincurrent: '+str(traincurrent)+' mycurrent: '+str(mycurrent))
            print('length of moves for this mon: '+str( len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])))
        statusMultiplier = 1
        statusAdditive = 0
        for moveset in range(0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
            if self.MonData[mycurrent]['status'] == 'none' and self.MonData[mycurrent]['item'] != 'sleepguard':
                if ((self.MonData[mycurrent]['type'][1] not in ('grass')) and (self.MonData[mycurrent]['type'][2]  not in ('grass'))):
                    if self.MonData[traincurrent]['moves'][moveset]['name'] == 'spore':
                        statusMultiplier = 1.25
                    if self.MonData[traincurrent]['moves'][moveset]['name'] == 'sleeppowder':
                        statusMultiplier = 1.18
                if self.MonData[traincurrent]['moves'][moveset]['effect'] == 'sleep' and self.MonData[traincurrent]['moves'][moveset]['name'] not in ('spore', 'sleeppowder'):
                    statusMultiplier = (0.25 * self.MonData[traincurrent]['moves'][moveset]['acc']) + 1
            if self.MonData[traincurrent]['moves'][moveset]['effect'] == 'toxic' and self.MonData[mycurrent]['item'] != 'poisonguard' and ((self.MonData[mycurrent]['type'][1] not in ('poison', 'steel')) and (self.MonData[mycurrent]['type'][2] not in ('poison', 'steel'))):
                statusAdditive = self.MonData[mycurrent]['stats']['maxhp'] * 0.16
        for moveset in range(len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
            if self.MonData[traincurrent]['moves'][moveset]['curpp'] > 0:
                self.DamageDealt(traincurrent, mycurrent, moveset)
                self.Damage[traincurrent][mycurrent][moveset]['damage'] *= statusMultiplier
                self.Damage[traincurrent][mycurrent][moveset]['damage'] += statusAdditive
            else:
                self.Damage[traincurrent][mycurrent][moveset]['damage'] = -1
        tempx = -3000
        self.enemybest = ''
        self.enemynumber = -1
        for moveset in range(0, len(self.MonData[traincurrent]['moves'])):
            if self.Damage[traincurrent][mycurrent][moveset]['damage'] > tempx:
                tempx = self.Damage[traincurrent][mycurrent][moveset]['damage']
                self.enemybest = self.MonData[traincurrent]['moves'][moveset]['name'].lower()
                self.enemynumber = moveset

    def Mychoice (self, traincurrent, mycurrent, moveused):

        if Debug_Code == 1:
            print(self.MonData[mycurrent]['moves'][moveused]['name'])
        healing = False
        if self.MonData[mycurrent]['moves'][moveused]['curpp'] > 0:
            if self.MonData[mycurrent]['moves'][moveused]['effect'] in ('normalhit', 'priorityhit', 'leveldamage', 'sleeptalk', 'metronome', 'bind', 'rollout', 'falseswipe', 'rampage', 'rapidspin', 'destinybond', 'hiddenpower', 'rage', 'return', 'superfang', 'triattack', 'pursuit', 'twister', 'thief', 'reversal', 'dreameater', 'extremespeed', 'furycutter', 'explosion' 'jumpkick', 'present', 'ohko', 'thunder', 'metalclaw', 'earthquake', 'hyperbeam', 'solarbeam', 'magnitude', 'fly', 'multihit', 'gust' 'doublehit', 'poisonhit', 'freezehit', 'skyattack', 'parlyzehit', 'payday', 'stomp', 'flinchhit', 'burnhit', 'recoilhit', 'twinneedle', 'spdefdownhit', 'confusehit', 'speeddownhit', 'attackdownhit', 'leechhit', 'psywave', 'alwayshit', 'accuracydownhit', 'steelwing', 'flamewheel', 'sacredfire', 'defensedownhit', 'ancientpower'):
                self.DamageDealt(mycurrent, traincurrent, moveused)
            else:
                if Debug_Code == 1:
                    print('Not an attack, setting to defaults')
                self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
            if self.MonData[mycurrent]['status'] not in ('slp', 'frz', 'slp1', 'slp2', 'slp3'):
                effmulti = self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][1].lower(), 'playerpokemon') * self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][2].lower(), 'playerpokemon')
                if effmulti > 0:
                    if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'bide':
                        if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 3 < self.MonData[mycurrent]['stats']['curhp']:
                            self.Damage[mycurrent][traincurrent][moveused]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 0.75

                    #rage
                    elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'rage':
                        self.MonData[mycurrent]['boosts']['atk'] = self.MonData[mycurrent]['boosts']['atk'] + 1

                    #Counter coat (otherwise known as a move that has way too much code and probably be never used anyways and cause far too many headaches)
                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'counter' or self.MonData[mycurrent]['moves'][moveused]['effect'] == 'mirrorcoat'):
                        tempx = 0
                        tempdamage = 0.00
                        for x1 in range(0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
                            if self.MonData[traincurrent]['moves'][x1]['category'] == 'physical':
                                tempx = tempx + 1
                                tempdamage = tempdamage + self.Damage[traincurrent][mycurrent][x1]['damage']
                        self.countercoat['physical']['number of'] = tempx
                        self.countercoat['physical']['damage'] = tempdamage
                        tempx = 0
                        tempdamage = 0.00
                        for x1 in range(0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
                            if self.MonData[traincurrent]['moves'][x1]['category'] == 'special':
                                tempx = tempx + 1
                                tempdamage = tempdamage + self.Damage[traincurrent][mycurrent][x1]['damage']
                        self.countercoat['special']['number of'] = tempx
                        self.countercoat['special']['damage'] = tempdamage
                        if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'counter':
                            self.Damage[mycurrent][traincurrent][moveused]['damage'] = 2 * (self.countercoat['physical']['damage'] * (self.countercoat['physical']['number of']/(self.countercoat['physical']['number of']+self.countercoat['special']['number of'])))
                            if self.jsonlist['battleState']['playerpokemon']['last used'].replace(' ', '').lower().replace('-', '') == 'hyperbeam':
                                self.Damage[mycurrent][traincurrent][moveused]['damage'] = 0
                            tempx = -1
                            for tempmove in range(0, len(self.MonData[mycurrent]['moves'])):
                                if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('mirrorcoat'):
                                    tempx = tempmove
                            if tempx == -1 and self.countercoat['special']['number of'] > 0:
                                if random.randint(0, 100) > 50:
                                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = 0
                        if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'mirrorcoat':
                            self.Damage[mycurrent][traincurrent][moveused]['damage'] = 2 * (self.countercoat['special']['damage'] * (self.countercoat['special']['number of']/(self.countercoat['physical']['number of']+self.countercoat['special']['number of'])))
                            if self.jsonlist['battleState']['playerpokemon']['last used'].replace(' ', '').lower().replace('-', '') == 'hyperbeam':
                                self.Damage[mycurrent][traincurrent][moveused]['damage'] = 0
                            tempx = -1
                            for tempmove in range(0, len(self.MonData[mycurrent]['moves'])):
                                if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('counter'):
                                    tempx = tempmove
                            if tempx == -1 and self.countercoat['physical']['number of'] > 0:
                                if random.randint(0, 100) > 50:
                                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = 0

                if self.MonData[mycurrent]['moves'][moveused]['type'] == 'fire' and self.MonData[traincurrent]['status'] == 'frz':
                    self.MonData[traincurrent]['status'] = 'none'

                #stats up
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'defenseup2':
                    self.MonData[mycurrent]['boosts']['def'] += 2
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'attackup2':
                    self.MonData[mycurrent]['boosts']['atk'] += 2
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'evasionup2':
                    self.MonData[mycurrent]['boosts']['eva'] += 2
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'speedup2':
                    self.MonData[mycurrent]['boosts']['spd'] += 2
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spatkup2':
                    self.MonData[mycurrent]['boosts']['satk'] += 2
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spdefup2':
                    self.MonData[mycurrent]['boosts']['sdef'] += 2

                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spatkup':
                    self.MonData[mycurrent]['boosts']['satk'] += 1
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'attackup':
                    self.MonData[mycurrent]['boosts']['atk'] += 1
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'evasionup':
                    self.MonData[mycurrent]['boosts']['eva'] += 1

                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'growth':
                    self.MonData[mycurrent]['boosts']['satk'] += 1
                    self.MonData[mycurrent]['boosts']['atk'] += 1
                    if self.MonData['weather'] == 'sun':
                        self.MonData[mycurrent]['boosts']['satk'] += 1
                        self.MonData[mycurrent]['boosts']['atk'] += 1

                # stats down
                misted = ('mist' in self.MonData['playerpokemon']['substatus'] or (isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'mist' in self.MonData['playerpokemon']['substatus'].values()))
                if not misted:
                    if (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'accuracydown'):
                        self.MonData[traincurrent]['boosts']['acc'] = self.MonData[traincurrent]['boosts']['acc'] - 1
                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'defensedown'):
                        self.MonData[traincurrent]['boosts']['def'] = self.MonData[traincurrent]['boosts']['def'] - 1
                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'attackdown'):
                        self.MonData[traincurrent]['boosts']['atk'] = self.MonData[traincurrent]['boosts']['atk'] - 1

                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'speeddown2'):
                        self.MonData[traincurrent]['boosts']['spd'] = self.MonData[traincurrent]['boosts']['spd'] - 2
                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'defensedown2'):
                        self.MonData[traincurrent]['boosts']['def'] = self.MonData[traincurrent]['boosts']['def'] - 2
                    elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spdefdown2'):
                        self.MonData[traincurrent]['boosts']['sdef'] = self.MonData[traincurrent]['boosts']['sdef'] - 2

                #healing
                if (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'heal'):
                    healing = True
                    if (self.MonData[mycurrent]['moves'][moveused]['name'] == 'rest'):
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / -1
                        self.MonData[mycurrent]['status'] = 'slp3'
                    else:
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / -2
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('moonlight', 'synthesis', 'morningsun')):
                    healing = True
                    if (self.MonData['weather'] == 'clear'):
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / -4
                    elif (self.MonData['weather'] == 'sun'):
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / -2
                    else: #rain, sandstorm
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / -8

                #if heal doesnt matter
                if healing and self.MonData[mycurrent]['stats']['curhp'] > self.MonData[mycurrent]['stats']['maxhp'] * 0.75:
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 2 > self.MonData[mycurrent]['stats']['curhp']:
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 1.25 > -1 * self.Damage[mycurrent][traincurrent][moveused]['selfdamage']:
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0


                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'painsplit':
                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = self.MonData[traincurrent]['stats']['curhp'] - (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['curhp'] - (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2

                #whirlwind
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'whirlwind':
                    for stat in self.statNames:
                        self.MonData[traincurrent]['boosts'][stat] = 0
                    self.MonData['playerpokemon']['substatus'] = {}

                #Guard
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'protect' and self.jsonlist['battleState']['enemypokemon']['last used'].replace(' ', '').lower().replace('-', '') not in ('protect', 'endure'):
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * -1
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'endure' and self.jsonlist['battleState']['enemypokemon']['last used'].replace(' ', '').lower().replace('-', '') not in ('protect', 'endure'):
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * -1

                #curse
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'curse':
                    if ((self.MonData[mycurrent]['type'][1] != 'ghost') and (self.MonData[mycurrent]['type'][2] != 'ghost')):
                        self.MonData[mycurrent]['boosts']['atk'] = self.MonData[mycurrent]['boosts']['atk'] + 1
                        self.MonData[mycurrent]['boosts']['def'] = self.MonData[mycurrent]['boosts']['def'] + 1
                        self.MonData[mycurrent]['boosts']['spd'] = self.MonData[mycurrent]['boosts']['spd'] - 1
                    else:
                        self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / 2
                        self.MonData['cursed'] = True

                #foresight
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'foresight':
                    self.MonData[traincurrent]['boosts']['eva'] = 0
                    self.MonData['identified'] = True

                #Place Weather
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'sunnyday':
                    self.MonData['weather'] = 'sun'
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'raindance':
                    self.MonData['weather'] = 'rain'
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'sandstorm':
                    self.MonData['weather'] = 'sandstorm'

                #Screens
                if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                    if 'spikes' not in self.MonData['enemypokemon']['screens'] or 'spikes2' not in self.MonData['enemypokemon']['screens']:
                        if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spikes':
                            tempy = 0
                            for tempx in range(6, self.trainparty):
                                if (self.MonData[tempx]['type'][1] != 'flying') and (self.MonData[tempx]['type'][2] != 'flying'):
                                    if 'spikes' in self.MonData['enemypokemon']['screens'] and 'spikes2' in self.MonData['enemypokemon']['screens']:
                                        pass
                                    elif 'spikes' in self.MonData['enemypokemon']['screens'] :
                                        tempy = tempy + (self.MonData[tempx]['stats']['maxhp'] * 0.0416)
                                        self.MonData['spikes'] = 1
                                    elif 'spikes2' in self.MonData['enemypokemon']['screens']:
                                        tempy = tempy + (self.MonData[tempx]['stats']['maxhp'] * 0.084)
                                        self.MonData['spikes'] = 2
                                    elif self.MonData['spikes'] == 1:
                                        tempy = tempy + (self.MonData[tempx]['stats']['maxhp'] * 0.0416)
                                    elif self.MonData['spikes'] == 2:
                                        tempy = tempy + (self.MonData[tempx]['stats']['maxhp'] * 0.084)
                                    else:
                                        tempy = tempy + (self.MonData[tempx]['stats']['maxhp'] * 0.125)
                            self.Damage[mycurrent][traincurrent][moveused]['damage'] = tempy
                            self.MonData['spikes'] += 1
                if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'reflect':
                    self.MonData['reflect'] = True
                    if 'reflect' in self.MonData['enemypokemon']['screens']:
                        self.Damage[mycurrent][traincurrent][moveused]['damage'] = -500
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'lightscreen':
                    self.MonData['lightscreen'] = True
                    if ('lightscreen', 'light screen') in self.MonData['enemypokemon']['screens']:
                        self.Damage[mycurrent][traincurrent][moveused]['damage'] = -500

                #sub status
                if (self.MonData[mycurrent]['moves'][moveused]['name'] == 'confuseray') and self.MonData[traincurrent]['item'] != 'confuseguard':
                    self.MonData['confused'] = True
                elif (self.MonData[mycurrent]['moves'][moveused]['name'] == 'swagger') and self.MonData[traincurrent]['item'] != 'confuseguard':
                    self.MonData['confused'] = True
                    self.MonData[traincurrent]['boosts']['atk'] = self.MonData[traincurrent]['boosts']['atk'] + 2
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'attract') and (self.MonData[mycurrent]['gender'] != self.MonData[traincurrent]['gender']) and self.MonData[traincurrent]['gender'] != '':
                    self.MonData['attract'] = True
                elif (self.MonData[mycurrent]['moves'][moveused]['name'] == 'lockon'):
                    self.MonData['lockon'] = True
                    if self.jsonlist['battleState']['enemypokemon']['last used'].replace(' ', '').lower().replace('-', '') == 'mindreader':
                        self.MonData['lockon'] = False
                        self.Damage[mycurrent][traincurrent][moveused]['damage'] = -500

                #end of turn shit
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'bind':
                    self.MonData['playerpokemon']['bound'] = 5
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'nightmare') and (self.MonData[traincurrent]['status'] == 'slp'):
                    self.MonData['nightmare'] = True
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'perishsong':
                    if self.MonData['myperishsong'] == 0:
                        self.MonData['myperishsong'] = 4
                    if self.MonData['trainperishsong'] == 0:
                        self.MonData['trainperishsong'] = 4
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'leechseed':
                    if (self.MonData[traincurrent]['type'][1] != 'grass') and (self.MonData[traincurrent]['type'][2] != 'grass'):
                        self.MonData['leechseedused'] = True

                #other special effects
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'bellydrum':
                    self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.MonData[mycurrent]['stats']['maxhp'] / 2
                    self.MonData[mycurrent]['boosts']['atk'] = 6
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'healbell'):
                    for pkmNo in range(6):
                        try:
                            self.MonData[pkmNo]['status'] = 'none'
                        except KeyError:
                            pass
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'focusenergy':
                    self.MonData['focusenergyused'] = True
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'defensecurl':
                    self.MonData['defensecurlused'] = True
                    self.MonData[mycurrent]['boosts']['def'] = self.MonData[mycurrent]['boosts']['def'] + 1
                elif self.MonData[mycurrent]['moves'][moveused]['effect'] == 'haze':
                    for stat in self.statNames:
                        self.MonData[mycurrent]['boosts'][stat] = 0
                        self.MonData[traincurrent]['boosts'][stat] = 0
                    self.MonData['leechseedused'] = False
                    self.MonData['focusenergyused'] = False
            else:
                if Debug_Code == 1:
                    print("I have a bad status, Can't do anything with that")
        else:
            if Debug_Code == 1:
                print("No pp, Can't do anything with that")
            self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
            self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
        #stats limiter
        for stat in self.statNames:
            curStat = self.MonData[mycurrent]['boosts'][stat]
            self.MonData[mycurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
            curStat = self.MonData[traincurrent]['boosts'][stat]
            self.MonData[traincurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
        return

    def specialeffect(self, traincurrent, mycurrent, moveused):
        #apply a status
        if self.MonData[mycurrent]['moves'][moveused]['curpp'] > 0 and self.MonData[mycurrent]['status'] not in ('slp', 'frz', 'slp1', 'slp2', 'slp3'):
            effmulti = self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][1].lower(), 'playerpokemon') * self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][2].lower(), 'playerpokemon')
            if 'safeguard' not in self.MonData['playerpokemon']['screens']:
                if effmulti > 0:
                    if self.MonData[traincurrent]['status'] == 'none':
                        if (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('paralyze', 'paralyzehit')) and self.MonData[traincurrent]['item'] != 'parlyzguard' and ((self.MonData[traincurrent]['type'][1] not in ('electric')) and (self.MonData[traincurrent]['type'][2] not in ('electric'))):
                            self.MonData[traincurrent]['status'] = 'par'
                            if self.MonData[traincurrent]['item'] == 'miracleberry' or self.MonData[traincurrent]['item'] != 'przcureberry':
                                self.MonData[traincurrent]['status'] = 'none'
                                self.MonData[traincurrent]['item'] = 'noitem'
                        elif (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('burn', 'burnhit')) and self.MonData[traincurrent]['item'] != 'burnguard' and ((self.MonData[traincurrent]['type'][1] not in ('fire')) and (self.MonData[traincurrent]['type'][2] not in ('fire'))):
                            self.MonData[traincurrent]['status'] = 'brn'
                            if self.MonData[traincurrent]['item'] == 'miracleberry' or self.MonData[traincurrent]['item'] != 'iceberry':
                                self.MonData[traincurrent]['status'] = 'none'
                                self.MonData[traincurrent]['item'] = 'noitem'
                        elif (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('poison', 'toxic', 'poisonhit', 'twineedle')) and self.MonData[traincurrent]['item'] != 'poisonguard' and ((self.MonData[traincurrent]['type'][1] not in ('poison', 'steel')) and (self.MonData[traincurrent]['type'][2] not in ('poison', 'steel'))):
                            self.MonData[traincurrent]['status'] = 'psn'
                            if self.MonData[mycurrent]['moves'][moveused]['effect'] == 'toxic':
                                if type(self.MonData['playerpokemon']['substatus']) == list:
                                    self.MonData['playerpokemon']['substatus'] = {str(i+1): x for i, x in enumerate(self.MonData['playerpokemon']['substatus'])}
                                self.MonData['playerpokemon']['substatus']['toxic'] = 1
                            if self.MonData[traincurrent]['item'] == 'miracleberry' or self.MonData[traincurrent]['item'] != 'psncureberry':
                                self.MonData[traincurrent]['status'] = 'none'
                                self.MonData[traincurrent]['item'] = 'noitem'
                        elif (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('sleep')) and self.MonData[traincurrent]['item'] != 'sleepguard':
                            self.MonData[traincurrent]['status'] = 'slp'
                            if self.MonData[traincurrent]['item'] == 'miracleberry' or self.MonData[traincurrent]['item'] != 'mintberry':
                                self.MonData[traincurrent]['status'] = 'none'
                                self.MonData[traincurrent]['item'] = 'noitem'
                        elif (self.MonData[mycurrent]['moves'][moveused]['effect'] in ('freezehit')) and self.MonData[traincurrent]['item'] != 'freezeguard' and self.MonData['weather'] != 'sun':
                            self.MonData[traincurrent]['status'] = 'frz'
                            if self.MonData[traincurrent]['item'] == 'miracleberry' or self.MonData[traincurrent]['item'] != 'burntberry':
                                self.MonData[traincurrent]['status'] = 'none'
                                self.MonData[traincurrent]['item'] = 'noitem'
                        elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'triattack'):
                            self.MonData[traincurrent]['status'] = 'par'

            if ((self.MonData[traincurrent]['type'][1] in ('grass')) or (self.MonData[traincurrent]['type'][2] in ('grass'))) and self.MonData[mycurrent]['moves'][moveused]['name'] in ('spore', 'poisonpowder', 'sleeppowder', 'stunspore'):
                self.MonData[traincurrent]['status'] = 'none'
                self.Damage[mycurrent][traincurrent][moveused]['damage'] = -500
            if (((self.MonData[traincurrent]['type'][1] in ('poison', 'steel')) and (self.MonData[traincurrent]['type'][2] in ('poison', 'steel'))) or self.MonData[traincurrent]['status'] != 'none') and self.MonData[mycurrent]['moves'][moveused]['name'] == 'toxic':
                self.Damage[mycurrent][traincurrent][moveused]['damage'] = -500

            #lower enemy stats
            misted = ('mist' in self.MonData['playerpokemon']['substatus'] or (isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'mist' in self.MonData['playerpokemon']['substatus'].values()))
            if not misted:
                effmulti = self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][1].lower(), 'playerpokemon') * self.getEff(self.MonData[mycurrent]['moves'][moveused]['type'].lower(), self.MonData[traincurrent]['type'][2].lower(), 'playerpokemon')
                if (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'spdefdownhit') and effmulti > 0:
                    self.MonData[traincurrent]['boosts']['sdef'] = self.MonData[traincurrent]['boosts']['sdef'] - 1
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'speeddownhit') and effmulti > 0:
                    self.MonData[traincurrent]['boosts']['spd'] = self.MonData[traincurrent]['boosts']['spd'] - 1
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'attackdownhit') and effmulti > 0:
                    self.MonData[traincurrent]['boosts']['atk'] = self.MonData[traincurrent]['boosts']['atk'] - 1
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'defensedownhit') and effmulti > 0:
                    self.MonData[traincurrent]['boosts']['def'] = self.MonData[traincurrent]['boosts']['def'] - 1
                elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'accuracydownhit') and effmulti > 0:
                    self.MonData[traincurrent]['boosts']['acc'] = self.MonData[traincurrent]['boosts']['acc'] - 1

            #raise own stats
            if (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'steelwing'):
                self.MonData[mycurrent]['boosts']['def'] = self.MonData[mycurrent]['boosts']['def'] + 1
            elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'ancientpower'):
                for stat in ["atk","def","satk","sdef","spd"]:
                    self.MonData[mycurrent]['boosts'][stat] += 1
            elif (self.MonData[mycurrent]['moves'][moveused]['effect'] == 'metalclaw'):
                self.MonData[mycurrent]['boosts']['atk'] = self.MonData[mycurrent]['boosts']['atk'] + 1

            #apply substatus
            self.MonData['confused'] = ((self.MonData[mycurrent]['moves'][moveused]['name'] in ('confusehit', 'confuse')) and self.MonData[traincurrent]['item'] != 'confuseguard')

            #stats limiter
            for stat in self.statNames:
                #constrain each stat to +- 6
                curStat = self.MonData[mycurrent]['boosts'][stat]
                self.MonData[mycurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
                curStat = self.MonData[traincurrent]['boosts'][stat]
                self.MonData[traincurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
        else:
            self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
            self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
        return

    def endofturn(self, traincurrent, mycurrent):
        #perish song
        if self.MonData['myperishsong'] == 1:
            self.MonData[mycurrent]['stats']['curhp'] = 0
        if self.MonData['trainperishsong'] == 1:
            self.MonData[traincurrent]['stats']['curhp'] = 0

        if self.MonData['myperishsong'] > 0:
            self.MonData['myperishsong'] = self.MonData['myperishsong'] - 1
        if self.MonData['trainperishsong'] > 0:
            self.MonData['trainperishsong'] = self.MonData['trainperishsong'] - 1

        if self.MonData[traincurrent]['status'] not in ('frz', 'slp'):
            statusMultiplier = 1
            if self.MonData[traincurrent]['status'] == 'prz':
                statusMultiplier = 0.75
            for moveset in range(0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
                if (self.MonData[traincurrent]['moves'][moveset]['effect'] == 'heal' and self.MonData[traincurrent]['moves'][moveset]['name'] != 'rest'):
                    self.MonData[traincurrent]['stats']['curhp'] = self.MonData[traincurrent]['stats']['curhp'] + (self.MonData[traincurrent]['stats']['maxhp'] * 0.25 * statusMultiplier)
                elif (self.MonData[traincurrent]['moves'][moveset]['effect'] in ('moonlight', 'synthesis', 'morningsun')):
                    if (self.MonData['weather'] == 'clear'):
                        self.MonData[traincurrent]['stats']['curhp'] = self.MonData[traincurrent]['stats']['curhp'] + (self.MonData[traincurrent]['stats']['maxhp'] * 0.125 * statusMultiplier)
                    elif (self.MonData['weather'] == 'sun'):
                        self.MonData[traincurrent]['stats']['curhp'] = self.MonData[traincurrent]['stats']['curhp'] + (self.MonData[traincurrent]['stats']['maxhp'] * 0.25 * statusMultiplier)
                    else: #rain, sandstorm
                        self.MonData[traincurrent]['stats']['curhp'] = self.MonData[traincurrent]['stats']['curhp'] + (self.MonData[traincurrent]['stats']['maxhp'] * 0.0625 * statusMultiplier)

        if self.MonData[traincurrent]['stats']['curhp'] > self.MonData[traincurrent]['stats']['maxhp']:
            self.MonData[traincurrent]['stats']['curhp'] = self.MonData[traincurrent]['stats']['maxhp']

        for temptext in ('enemypokemon', 'playerpokemon'):
            if temptext == 'enemypokemon':
                pkmindex = mycurrent
            else:
                pkmindex = traincurrent

            #Sandstorm
            if self.MonData['weather'] == 'sandstorm' and ((self.MonData[pkmindex]['type'][1] not in ('ground', 'rock', 'steel')) and (self.MonData[pkmindex]['type'][2] not in ('ground', 'rock', 'steel'))):
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['maxhp'] * 0.125)

            #status Damage
            if self.MonData[pkmindex]['status'] in ('brn', 'psn') and 'toxic' not in self.MonData[temptext]['substatus']:
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['maxhp'] * 0.125)
            if self.MonData[pkmindex]['status'] == 'psn' and 'toxic' in self.MonData[temptext]['substatus']:
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['maxhp'] * self.MonData[temptext]['substatus']['toxic'] * 0.0625)
                self.MonData[temptext]['substatus']['toxic'] = self.MonData[temptext]['substatus']['toxic'] + 1

            #held healing
            if (self.MonData[pkmindex]['item'] == 'berry') and (self.MonData[pkmindex]['stats']['curhp'] < self.MonData[pkmindex]['stats']['maxhp'] * 0.33):
                self.MonData[pkmindex]['stats']['curhp'] += 10
                self.MonData[pkmindex]['item'] = 'noitem'
            if (self.MonData[pkmindex]['item'] == 'goldberry') and (self.MonData[pkmindex]['stats']['curhp'] < self.MonData[pkmindex]['stats']['maxhp'] * 0.33):
                self.MonData[pkmindex]['stats']['curhp'] += (self.MonData[pkmindex]['stats']['maxhp'] * 0.25)
                self.MonData[pkmindex]['item'] = 'noitem'

            #leftovers
            if self.MonData[pkmindex]['item'] == 'leftovers':
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] + (self.MonData[pkmindex]['stats']['maxhp'] * 0.0625)

            #rest counter
            if self.MonData[pkmindex]['status'] == 'slp1':
                self.MonData[pkmindex]['status'] = 'none'
            elif self.MonData[pkmindex]['status'] == 'slp2':
                self.MonData[pkmindex]['status'] = 'slp1'
            elif self.MonData[pkmindex]['status'] == 'slp3':
                self.MonData[pkmindex]['status'] = 'slp2'

            #nightmare
            if self.MonData[pkmindex]['status'] in ('slp','slp1','slp2','slp3'):
                nightmared = (('nightmare' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'nightmare' in self.MonData[temptext]['substatus'].values())) or (self.MonData['nightmare'] == True and temptext == 'playerpokemon'))
                if nightmared:
                    self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['curhp'] * 0.25)

            #curse (damaging)
            cursed = (('curse' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'curse' in self.MonData[temptext]['substatus'].values())) or (self.MonData['cursed'] == True and temptext == 'playerpokemon'))
            if cursed:
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['curhp'] * 0.25)

            #bound
            if self.MonData[temptext]['bound'] > 0 and self.triggered != 1 and self.MonData[pkmindex]['stats']['curhp'] > 0:
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['maxhp'] * 0.125)
                self.MonData[temptext]['bound'] = self.MonData[temptext]['bound'] - 1

            #leechseed
            seeded = (('seeded' in self.MonData[temptext]['substatus'] or (isinstance(self.MonData[temptext]['substatus'], dict) and 'seeded' in self.MonData[temptext]['substatus'].values())) or (self.MonData['leechseedused'] == True and temptext == 'playerpokemon'))
            if seeded:
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] - (self.MonData[pkmindex]['stats']['maxhp'] * 0.125)
                self.MonData[pkmindex]['stats']['curhp'] = self.MonData[pkmindex]['stats']['curhp'] + (self.MonData[pkmindex]['stats']['maxhp'] * 0.125)

        self.MonData['painsplit'] = False
        self.MonData['lockon'] = False
        return

    def Reset(self, traincurrent, mycurrent):
        self.MonData['painsplit'] = False
        self.MonData['lockon'] = False
        self.MonData['focusenergyused'] = False
        self.MonData['defensecurlused'] = False
        self.MonData['leechseedused'] = False
        self.MonData['confused'] = False
        self.MonData['attract'] = False
        self.MonData['cursed'] = False
        self.MonData['nightmare'] = False
        self.MonData['identified'] = False
        self.MonData['myperishsong'] = 0
        self.MonData['trainperishsong'] = 0
        self.MonData['lightscreen'] = False
        self.MonData['spikes'] = 0
        self.MonData['reflect'] = False
        if 'perish song' in self.MonData['enemypokemon']['substatus']:
            self.MonData['myperishsong'] = copy.deepcopy(self.MonData['enemypokemon']['substatus']['perish song'])
        if 'perish song' in self.MonData['playerpokemon']['substatus']:
            self.MonData['trainperishsong'] = copy.deepcopy(self.MonData['playerpokemon']['substatus']['perish song'])

        #boosts
        if isinstance(self.jsonlist['battleState']['weather'], dict):
            if "Rain" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'rain'
            elif "Sun" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'sun'
            elif "Sandstorm" in self.jsonlist['battleState']['weather'] :
                self.MonData['weather'] = 'sandstorm'
        else:
            self.MonData['weather'] = 'clear'

        self.MonData['enemypokemon'] = {}
        self.MonData['playerpokemon'] = {}
        self.MonData['enemypokemon']['substatus'] = copy.deepcopy(self.jsonlist['battleState']['enemypokemon']['subStatus'])
        self.MonData['playerpokemon']['substatus'] = copy.deepcopy(self.jsonlist['battleState']['playerpokemon']['subStatus'])
        self.MonData['enemypokemon']['screens'] = copy.deepcopy(self.jsonlist['battleState']['enemypokemon']['screens'])
        self.MonData['playerpokemon']['screens'] = copy.deepcopy(self.jsonlist['battleState']['playerpokemon']['screens'])
        self.MonData['enemypokemon']['bound'] = int(self.jsonlist['battleState']['enemypokemon']['wrap count'])
        self.MonData['playerpokemon']['bound'] = int(self.jsonlist['battleState']['playerpokemon']['wrap count'])

        if self.triggered == 0:
            self.MonData[mycurrent]['boosts'] = {}
            for stat in self.statNames:
                self.MonData[mycurrent]['boosts'][stat] = self.jsonlist['battleState']['enemypokemon']['stat levels'][stat]
        if self.triggered > 0:
            self.MonData[mycurrent]['boosts'] = {}
            for stat in self.statNames:
                self.MonData[mycurrent]['boosts'][stat] = 0
            self.MonData['enemypokemon']['substatus'] = {}
            self.MonData['enemypokemon']['bound'] = 0
        self.MonData[traincurrent]['boosts'] = {}
        for stat in self.statNames:
            self.MonData[traincurrent]['boosts'][stat] = self.jsonlist['battleState']['playerpokemon']['stat levels'][stat]
        return

    def Fight(self, traincurrent, mycurrent, numberofturns):
        if Debug_Code == 1:
            print('start of self.Fight')
        #all possible move combos
        self.mybestmove[mycurrent] = 0
        self.mycurhp = self.hp[mycurrent]
        self.traincurhp = self.opponenthp[traincurrent]
        self.mybestmove[mycurrent] = random.randint(0, len(self.MonData[mycurrent]['moves']))
        #prevents an impossible case
        if self.mycurhp == 0:
            self.mycurhp = 1
        if self.traincurhp == 0:
            self.traincurhp = 1

        #len(self.MonData[mycurrent]['moves']) = the number of moves the mon has
        for x2, tempcombo in enumerate(Combogenerator(numberofturns, len(self.MonData[mycurrent]['moves']))):
            myhp = self.mycurhp
            trainhp = self.traincurhp
            self.MonData[mycurrent]['stats']['curhp'] = myhp
            self.MonData[traincurrent]['stats']['curhp'] = trainhp

            self.Reset(traincurrent, mycurrent)
            self.TrainerDamage(traincurrent, mycurrent)
            self.Damage[mycurrent][traincurrent][tempcombo[0]]['damage'] = 0

            if self.HitMe > 0:
                self.DamageDealt(traincurrent, mycurrent, self.enemynumber)
                myhp = myhp - (self.Damage[traincurrent][self.jsonlist['battleState']['enemypokemon']['party idx']][self.enemynumber]['damage'] * 1.2)
                self.MonData[mycurrent]['stats']['curhp'] = myhp
                self.MonData[traincurrent]['stats']['curhp'] = trainhp
                self.endofturn(traincurrent, mycurrent)
                myhp = self.MonData[mycurrent]['stats']['curhp']
                trainhp = self.MonData[traincurrent]['stats']['curhp']
                if myhp > self.MonData[mycurrent]['stats']['maxhp']:
                    myhp = self.MonData[mycurrent]['stats']['maxhp']
            #am i using an item?
            if self.useitem > 0:
                myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                if self.MonData['myitems'][self.useitem] == 'xspeed':
                    self.MonData[mycurrent]['boosts']['spd'] = self.MonData[mycurrent]['boosts']['spd'] + 1
                if self.MonData['myitems'][self.useitem] == 'xattack':
                    self.MonData[mycurrent]['boosts']['atk'] = self.MonData[mycurrent]['boosts']['atk'] + 1
                if self.MonData['myitems'][self.useitem] == 'xdefense':
                    self.MonData[mycurrent]['boosts']['def'] = self.MonData[mycurrent]['boosts']['def'] + 1
                if self.MonData['myitems'][self.useitem] == 'xspecial':
                    self.MonData[mycurrent]['boosts']['satk'] = self.MonData[mycurrent]['boosts']['satk'] + 1
                if self.MonData['myitems'][self.useitem] == 'xspdef':
                    self.MonData[mycurrent]['boosts']['sdef'] = self.MonData[mycurrent]['boosts']['sdef'] + 1
                if self.MonData['myitems'][self.useitem] == 'xaccuracy':
                    self.MonData[mycurrent]['boosts']['acc'] = self.MonData[mycurrent]['boosts']['acc'] + 1
                if self.MonData['myitems'][self.useitem] == 'direhit':
                    self.MonData['focusenergyused'] = True

                #stats limiter
                for stat in self.statNames:
                    curStat = self.MonData[mycurrent]['boosts'][stat]
                    self.MonData[mycurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
                    curStat = self.MonData[traincurrent]['boosts'][stat]
                    self.MonData[traincurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
                self.TrainerDamage(traincurrent, mycurrent)
                myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

            #figure out what happens if special effect doesnt work
            bonusmulti = 1
            for x1 in range(0, numberofturns):
                self.MonData['painsplit'] = False
                self.MonData['lockon'] = False
                if x1 == 2 and self.MonData[mycurrent]['status'] in ('frz', 'slp'):
                    self.MonData[mycurrent]['status'] = 'none'
                tempx = min(self.MonData[mycurrent]['stats']['spd'] * self._statsmultipliers[self.MonData[mycurrent]['boosts']['spd']+6]/100, 999)
                tempy = min(self.MonData[traincurrent]['stats']['spd'] * self._statsmultipliers[self.MonData[traincurrent]['boosts']['spd']+6]/100, 999)
                if self.MonData[mycurrent]['status'] == 'par':
                    tempx = tempx * 0.25
                if self.MonData[traincurrent]['status'] == 'par':
                    tempy = tempy * 0.25
                if (tempx > tempy) or (self.MonData[mycurrent]['moves'][int(tempcombo[x1])]['effect'] in ('extremespeed', 'priorityhit', 'endure', 'protect')):
                    if myhp > 0:
                        self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                        if self.MonData['painsplit']:
                            self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                            self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                            trainhp = self.MonData[traincurrent]['stats']['curhp']
                            myhp = self.MonData[traincurrent]['stats']['curhp']
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > self.MonData[mycurrent]['stats']['maxhp']:
                            myhp = self.MonData[mycurrent]['stats']['maxhp']
                    if trainhp > 0:
                        self.TrainerDamage(traincurrent, mycurrent)
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                if tempx < tempy:
                    if trainhp > 0:
                        self.TrainerDamage(traincurrent, mycurrent)
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                    if myhp > 0:
                        self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                        if self.MonData['painsplit']:
                            self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                            self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                            trainhp = self.MonData[traincurrent]['stats']['curhp']
                            myhp = self.MonData[traincurrent]['stats']['curhp']
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > self.MonData[mycurrent]['stats']['maxhp']:
                            myhp = self.MonData[mycurrent]['stats']['maxhp']

                if tempx == tempy:
                    speedtie = 0
                    if myhp > 0:
                        speedtie = 1
                        self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                        if self.MonData['painsplit']:
                            self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                            self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                            trainhp = self.MonData[traincurrent]['stats']['curhp']
                            myhp = self.MonData[traincurrent]['stats']['curhp']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > self.MonData[mycurrent]['stats']['maxhp']:
                            myhp = self.MonData[mycurrent]['stats']['maxhp']
                    if trainhp > 0:
                        self.TrainerDamage(traincurrent, mycurrent)
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                    if speedtie == 1:
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                self.MonData[mycurrent]['stats']['curhp'] = myhp
                self.MonData[traincurrent]['stats']['curhp'] = trainhp
                self.endofturn(traincurrent, mycurrent)
                myhp = self.MonData[mycurrent]['stats']['curhp']
                trainhp = self.MonData[traincurrent]['stats']['curhp']

                self.MonData[mycurrent]['stats']['curhp'] = myhp
                self.MonData[traincurrent]['stats']['curhp'] = trainhp
                if trainhp <= 0:
                    bonusmulti += 0.1
                    if x1 == 0:
                        self.ShouldISwitch = False

            #do extra effect on first move
            myhp1 = self.mycurhp
            trainhp1 = self.traincurhp
            self.MonData[mycurrent]['stats']['curhp'] = myhp1
            self.MonData[traincurrent]['stats']['curhp'] = trainhp1
            bonusmulti1 = 1
            if self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effectchance'] > 0 or self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effectchance']:
                self.Reset(traincurrent, mycurrent)
                self.TrainerDamage(traincurrent, mycurrent)

                if self.HitMe > 0:
                    self.DamageDealt(traincurrent, mycurrent, self.enemynumber)
                    myhp1 = myhp1 - (self.Damage[traincurrent][self.jsonlist['battleState']['enemypokemon']['party idx']][self.enemynumber]['damage'] * 1.2)
                    self.MonData[mycurrent]['stats']['curhp'] = myhp1
                    self.MonData[traincurrent]['stats']['curhp'] = trainhp1
                    self.endofturn(traincurrent, mycurrent)
                    myhp1 = self.MonData[mycurrent]['stats']['curhp']
                    trainhp1 = self.MonData[traincurrent]['stats']['curhp']
                #am i using an item?
                if self.useitem > 0:
                    if self.MonData['myitems'][self.useitem] == 'xspeed':
                        self.MonData[mycurrent]['boosts']['spd'] = self.MonData[mycurrent]['boosts']['spd'] + 1
                    if self.MonData['myitems'][self.useitem] == 'xattack':
                        self.MonData[mycurrent]['boosts']['atk'] = self.MonData[mycurrent]['boosts']['atk'] + 1
                    if self.MonData['myitems'][self.useitem] == 'xdefense':
                        self.MonData[mycurrent]['boosts']['def'] = self.MonData[mycurrent]['boosts']['def'] + 1
                    if self.MonData['myitems'][self.useitem] == 'xspecial':
                        self.MonData[mycurrent]['boosts']['satk'] = self.MonData[mycurrent]['boosts']['satk'] + 1
                    if self.MonData['myitems'][self.useitem] == 'direhit':
                        self.MonData['focusenergyused'] = True
                    #stats limiter
                    for stat in self.statNames:
                        curStat = self.MonData[mycurrent]['boosts'][stat]
                        self.MonData[mycurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
                        curStat = self.MonData[traincurrent]['boosts'][stat]
                        self.MonData[traincurrent]['boosts'][stat] = sign(curStat) * min(abs(curStat), 6)
                    self.TrainerDamage(traincurrent, mycurrent)
                    myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                for x1 in range(0, numberofturns):
                    self.MonData['painsplit'] = False
                    self.MonData['lockon'] = False
                    if x1 == 2 and self.MonData[mycurrent]['status'] in ('frz', 'slp'):
                        self.MonData[mycurrent]['status'] = 'none'
                    tempx = min(self.MonData[mycurrent]['stats']['spd'] * self._statsmultipliers[self.MonData[mycurrent]['boosts']['spd']+6]/100, 999)
                    tempy = min(self.MonData[traincurrent]['stats']['spd'] * self._statsmultipliers[self.MonData[traincurrent]['boosts']['spd']+6]/100, 999)
                    if self.MonData[mycurrent]['status'] == 'par':
                        tempx = tempx * 0.25
                    if self.MonData[traincurrent]['status'] == 'par':
                        tempy = tempy * 0.25
                    if (tempx > tempy) or (self.MonData[mycurrent]['moves'][int(tempcombo[x1])]['effect'] in ('extremespeed', 'priorityhit', 'endure', 'protect')):
                        if myhp1 > 0:
                            self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                self.specialeffect(traincurrent, mycurrent, int(tempcombo[x1]))
                            if self.MonData['painsplit']:
                                self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                                self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                                trainhp1 = self.MonData[traincurrent]['stats']['curhp']
                                myhp1 = self.MonData[traincurrent]['stats']['curhp']
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > self.MonData[mycurrent]['stats']['maxhp']:
                                myhp1 = self.MonData[mycurrent]['stats']['maxhp']
                        if trainhp1 > 0:
                            self.TrainerDamage(traincurrent, mycurrent)
                            if x1 == 0 and self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effect'] == 'flinchhit':
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = 0
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                    if tempx < tempy:
                        if trainhp1 > 0:
                            self.TrainerDamage(traincurrent, mycurrent)
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                        if myhp1 > 0:
                            self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                self.specialeffect(traincurrent, mycurrent, int(tempcombo[x1]))
                            if self.MonData['painsplit']:
                                self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                                self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                                trainhp1 = self.MonData[traincurrent]['stats']['curhp']
                                myhp1 = self.MonData[traincurrent]['stats']['curhp']
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > self.MonData[mycurrent]['stats']['maxhp']:
                                myhp1 = self.MonData[mycurrent]['stats']['maxhp']

                    if tempx == tempy:
                        speedtie = 0
                        if myhp1 > 0:
                            speedtie = 1
                            self.Mychoice(traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                self.specialeffect(traincurrent, mycurrent, int(tempcombo[x1]))
                            if self.MonData['painsplit']:
                                self.MonData[mycurrent]['stats']['curhp'] = (self.MonData[mycurrent]['stats']['curhp'] + self.MonData[traincurrent]['stats']['curhp'])/2
                                self.MonData[traincurrent]['stats']['curhp'] = self.MonData[mycurrent]['stats']['curhp']
                                trainhp1 = self.MonData[traincurrent]['stats']['curhp']
                                myhp1 = self.MonData[traincurrent]['stats']['curhp']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > self.MonData[mycurrent]['stats']['maxhp']:
                                myhp1 = self.MonData[mycurrent]['stats']['maxhp']
                        if trainhp1 > 0:
                            self.TrainerDamage(traincurrent, mycurrent)
                            if x1 == 0 and self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effect'] == 'flinchhit':
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                        if speedtie == 1:
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                    self.MonData[mycurrent]['stats']['curhp'] = myhp1
                    self.MonData[traincurrent]['stats']['curhp'] = trainhp1
                    self.endofturn(traincurrent, mycurrent)
                    myhp1 = self.MonData[mycurrent]['stats']['curhp']
                    trainhp1 = self.MonData[traincurrent]['stats']['curhp']
                    self.MonData[mycurrent]['stats']['curhp'] = myhp1
                    self.MonData[traincurrent]['stats']['curhp'] = trainhp1
                    if trainhp1 <= 0:
                        bonusmulti1 += 0.1
                        if x1 == 0:
                            self.ShouldISwitch = False
            tempy = (self.MonData[mycurrent]['moves'][int(tempcombo[0])]['acc'] / 100) * (self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effectchance'] / 100)
            if self.MonData[mycurrent]['moves'][int(tempcombo[0])]['effect'] == 'toxic' and ((self.MonData[mycurrent]['type'][1] == 'poison') or (self.MonData[mycurrent]['type'][2] == 'poison')):
                tempy = 1
            if tempy != 1:
                tempy /= 2
            if self.mycurhp != 0 and self.traincurhp != 0:
                tempx = (((((myhp / self.mycurhp) - (trainhp / self.traincurhp) * 2) * bonusmulti) * (1 - tempy)) + ((((myhp1 / self.mycurhp) - (trainhp1 / self.traincurhp) * 2) * tempy) * bonusmulti1)) + 2
            else:
                tempx = -5
            if Debug_Code == 1 or Debug_Code == 2:
                print("_".join([str(x) for x in tempcombo]))
                print('Enemy Boosts: '+str(self.MonData[mycurrent]['boosts']))
                print(self.Damage[mycurrent][traincurrent][tempcombo[0]]['damage'])
                print('Player Boosts: '+str(self.MonData[traincurrent]['boosts']))
                print(self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'])
                print('enemy hp '+str(myhp)+' enemy starting hp '+str(self.mycurhp)+' player hp '+str(trainhp)+' player starting hp '+str(self.traincurhp))
                print(tempx)
                print("mycurrent: {}\ntraincurrent: {}\nself.difference: {}".format(mycurrent, traincurrent, self.difference))
            if self.useitem == 0:
                if tempx > self.difference[mycurrent][traincurrent]:
                    self.difference[mycurrent][traincurrent] = tempx
                    self.mybestmove['bestleaf'] = "_".join([str(x) for x in tempcombo])
                    self.mybestmove[mycurrent] = int(tempcombo[0])
                    if self.FirstFight:
                        self.NoBetterChoice = False
                if self.difference[mycurrent][traincurrent] == -10:
                    if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                        self.mybestmove[mycurrent] = random.randint(0, (len(self.jsonlist['enemyParty']['party'][mycurrent]['moves'])))
                    else:
                        self.mybestmove[mycurrent] = random.randint(0, (len(self.jsonlist['battleState']['enemypokemon']['moves'])))
            if self.useitem > 0:
                if tempx >= self.differenceitems[mycurrent][self.useitem]:
                  self.differenceitems[mycurrent][self.useitem] = tempx
            if Debug_Code > 0:
                print('**********')
                print(self.mybestmove['bestleaf'])
                print(self.mybestmove[mycurrent])
                print(self.difference[mycurrent][traincurrent])
                print('**********')
        return(1)

    #compare all mons for best mon
    def checkIfUsingItem(self):
        mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        self.Reset(traincurrent, mycurrent)
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            self.MonData['myitems'][1] = self.jsonlist['battleState']['trainer items']['item1'].lower().replace(' ', '').replace('-', '').replace('.', '')
            self.MonData['myitems'][2] = self.jsonlist['battleState']['trainer items']['item2'].lower().replace(' ', '').replace('-', '').replace('.', '')
        if self.MonData['myitems'][1] != 'noitem' or self.MonData['myitems'][2] != 'noitem':
            for mymons in range(0, 6):
                self.difference[mymons] = {}
                for trainmons in range(6, 12):
                    self.difference[mymons][trainmons] = -10
            if Debug_Code == 1:
                print('I have an item! Checking items')
            self.HitMe = 0
            for mymons in range(0, self.myparty):
                for trainmons in range(6, self.trainparty+6):
                    self.triggered = 1
                    if mymons == self.jsonlist['battleState']['enemypokemon']['party idx']:
                        self.triggered = 0
                    if self.MonData[mymons]['stats']['curhp'] > 0:
                        self.Fight(trainmons, mymons, 4)
            battlerating = {}
            for mymons in range(0, self.myparty):
                tempx = 0
                for trainmons in range(6, self.trainparty+6):
                    tempx = tempx + self.difference[mymons][trainmons]
                battlerating[mymons] = tempx
            numberofviable = int(math.ceil(self.myparty / 2))
            bestmonsindex = {}
            for x1 in range(0, numberofviable):
                tempy = 0
                for mymons in range(0, self.myparty):
                    if battlerating[mymons] > tempy:
                        tempy = battlerating[mymons]
                        tempx = mymons
                bestmonsindex[x1] = tempx
                battlerating[tempx] = 0

            if self.theaction < 4:
                temp1 = self.jsonlist['battleState']['enemypokemon']['party idx']
            if self.theaction > 3:
                temp1 = self.theaction - 4
            self.TrainerDamage(traincurrent, mycurrent)
            self.triggered = 0
            for x1 in range(0, numberofviable):
                #if mon out is one of the best mons i have
                if self.jsonlist['battleState']['enemypokemon']['party idx'] == bestmonsindex[x1]:
                    tempaction = -1
                    for x2 in range(1, 3):
                        #and an item exists
                        if self.MonData['myitems'][x2] != 'noitem':
                            self.useitem = x2
                            if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 0.85 < self.jsonlist['battleState']['enemypokemon']['hp']:
                                if self.MonData['myitems'][x2] in ['xspeed', 'xattack', 'xdefense', 'xspecial', 'direhit']:
                                    self.Fight(traincurrent, mycurrent, 5)
                                    if self.differenceitems[mymons][self.useitem] > self.difference[temp1][traincurrent]:
                                        tempaction = x2 + 9
                                        self.difference[temp1][traincurrent] = self.differenceitems[mymons][self.useitem]
                                    if tempaction > -1:
                                        return(tempaction)

                            #and you are about to die
                            if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] > self.hp[bestmonsindex[x1]]:
                                #and im not at full hp
                                if self.hp[bestmonsindex[x1]]!= self.jsonlist['battleState']['enemypokemon']['stats']['maxhp']:
                                    #and the item is a.....
                                    healing_items = {"potion":20,"superpotion":50,"hyperpotion":200,"maxpotion":99999,"fullrestore":99999}
                                    item_name = self.MonData['myitems'][x2]
                                    if item_name in healing_items:
                                        #and healing would allow you to continue fighting (and not draw out the inevitable)
                                        if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 1.25 < min((self.jsonlist['battleState']['enemypokemon']['stats']['maxhp'] - self.jsonlist['battleState']['enemypokemon']['hp']), healing_items[item_name]):
                                            return x2 + 9
        return 20

    def OptionalSwitch(self, traincurrent):
        self.MonData['enemypokemon']['substatus'] = {}
        self.MonData['enemypokemon']['screens'] = {}
        potentialAction = 20
        trapped = ('trapped' in self.MonData['playerpokemon']['substatus']) or ((isinstance(self.MonData['playerpokemon']['substatus'], dict)) and 'trapped' in self.MonData['playerpokemon']['substatus'].values())
        if (int(self.jsonlist['battleState']['enemypokemon']['wrap count']) == 0 and not trapped) or (self.MonData[traincurrent]['type'][1].lower() == 'ghost' or self.MonData[traincurrent]['type'][2].lower() == 'ghost'):
            for switchindex in range(0, self.myparty):
                self.HitMe = 1
                if switchindex == self.jsonlist['battleState']['enemypokemon']['party idx']:
                    self.HitMe = 0
                mycurrent = switchindex
                if self.MonData[mycurrent]['stats']['curhp'] > 0:
                    self.difference[mycurrent][traincurrent] = 0
                    self.MonData[mycurrent]['boosts'] = {}
                    self.MonData[traincurrent]['boosts'] = {}
                    if 'attract' in self.MonData['playerpokemon']['substatus']:
                        self.MonData['playerpokemon']['substatus'].remove('attract')
                    if isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'attract' in self.MonData['playerpokemon']['substatus'].values():
                        for x1 in range(1, len(self.MonData['playerpokemon']['substatus'])):
                            if self.MonData['playerpokemon']['substatus'][str(x1)] == 'attract':
                                del self.MonData['playerpokemon']['substatus'][str(x1)]
                                break

                    for stat in self.statNames:
                        self.MonData[mycurrent]['boosts'][stat] = 0
                        self.MonData[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
                    self.Fight(traincurrent, mycurrent, 4)
                else:
                    self.mybestmove[mycurrent] = {}
                    self.difference[mycurrent] = {}
                    self.difference[mycurrent][traincurrent] = -10
                    self.mybestmove['bestleaf'] = '0_0_0_0_0'
                    self.mybestmove[mycurrent][traincurrent] = -10
            if self.difference[self.jsonlist['battleState']['enemypokemon']['party idx']][traincurrent] < 0:
                self.difference[self.jsonlist['battleState']['enemypokemon']['party idx']][traincurrent] = 0
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
            tempy = self.difference[mycurrent][traincurrent] + 2
            for tempx in range(0, self.myparty):
                if self.difference[tempx][traincurrent] > tempy:
                    tempy = self.difference[tempx][traincurrent]
                    if tempx != self.jsonlist['battleState']['enemypokemon']['party idx']:
                         potentialAction = tempx + 4
        return potentialAction

    def ForcedSwitch(self, traincurrent):
        self.triggered = 0
        self.MonData['enemypokemon']['substatus'] = {}
        self.MonData['enemypokemon']['screens'] = {}
        theaction = 20
        for switchindex in range(0, self.myparty):
            mycurrent = switchindex
            if self.MonData[mycurrent]['stats']['curhp'] > 0:
                self.difference[mycurrent][traincurrent] = -8
                self.MonData[mycurrent]['boosts'] = {}
                self.MonData[traincurrent]['boosts'] = {}
                for stat in self.statNames:
                    self.MonData[mycurrent]['boosts'][stat] = 0
                    self.MonData[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
                self.Fight(traincurrent, mycurrent, 5)
            else:
                self.difference[mycurrent] = {}
                self.mybestmove[mycurrent] = {}
                self.difference[mycurrent][traincurrent] = -10
                self.mybestmove['bestleaf'] = '0_0_0_0_0'
                self.mybestmove[mycurrent][traincurrent] = -10
        tempy = -9
        for tempx in range(0, self.myparty):
            if self.difference[tempx][traincurrent] > tempy and tempx != self.jsonlist['battleState']['enemypokemon']['party idx']:
                tempy = self.difference[tempx][traincurrent]
                theaction = tempx + 4
        return theaction

    def WildBattle(self, mycurrent, traincurrent):
        movepriority = {}
        movepriority[0] = 20
        movepriority[1] = 20
        movepriority[2] = 20
        movepriority[3] = 20
        self.Reset(traincurrent, mycurrent)
        self.TrainerDamage(traincurrent, mycurrent)
        for stat in self.statNames:
            self.MonData[mycurrent]['boosts'][stat] = int(self.jsonlist['battleState']['enemypokemon']['stat levels'][stat])
            self.MonData[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
        for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            effmulti = self.getEff(self.MonData[mycurrent]['moves'][tempmove]['type'].lower(), self.MonData[traincurrent]['type'][1].lower(), 'playerpokemon') * self.getEff(self.MonData[mycurrent]['moves'][tempmove]['type'].lower(), self.MonData[traincurrent]['type'][2].lower(), 'playerpokemon')
            self.DamageDealt(mycurrent, traincurrent, tempmove)
            if self.Damage[mycurrent][traincurrent][tempmove]['damage'] / self.MonData[traincurrent]['stats']['curhp'] > 0.5:
                movepriority[tempmove] = 0
                continue
            if self.MonData[traincurrent]['status'] == 'none' and effmulti > 0:
                if self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'toxic' and self.MonData[traincurrent]['item'] != 'poisonguard' and ((self.MonData[traincurrent]['type'][1] not in ('poison', 'steel')) and (self.MonData[traincurrent]['type'][2] not in ('poison', 'steel'))):
                    movepriority[tempmove] = 1
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'poison' and self.MonData[traincurrent]['item'] != 'poisonguard' and ((self.MonData[traincurrent]['type'][1] not in ('poison', 'steel')) and (self.MonData[traincurrent]['type'][2] not in ('poison', 'steel'))):
                    movepriority[tempmove] = 2
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('poisonhit', 'twineedle') and self.MonData[traincurrent]['item'] != 'poisonguard' and ((self.MonData[traincurrent]['type'][1] not in ('poison', 'steel')) and (self.MonData[traincurrent]['type'][2] not in ('poison', 'steel'))):
                    movepriority[tempmove] = 3
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'burn' and self.MonData[traincurrent]['item'] != 'burnguard' and ((self.MonData[traincurrent]['type'][1] !=('fire')) and (self.MonData[traincurrent]['type'][2] !=('fire'))):
                    movepriority[tempmove] = 4
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'burnhit' and self.MonData[traincurrent]['item'] != 'burnguard' and ((self.MonData[traincurrent]['type'][1] != ('fire')) and (self.MonData[traincurrent]['type'][2] != ('fire'))):
                    movepriority[tempmove] = 5
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('paralyze', 'triattack') and self.MonData[traincurrent]['item'] != 'parlyzguard' and ((self.MonData[traincurrent]['type'][1] != ('electric')) and (self.MonData[traincurrent]['type'][2] != ('electric'))):
                    movepriority[tempmove] = 6
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['name'] == 'zapcannon' and self.MonData[traincurrent]['item'] != 'parlyzguard' and ((self.MonData[traincurrent]['type'][1] != ('electric')) and (self.MonData[traincurrent]['type'][2] != ('electric'))):
                    movepriority[tempmove] = 7
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('paralyzehit', 'thunder') and self.MonData[traincurrent]['item'] != 'parlyzguard' and self.MonData[mycurrent]['moves'][tempmove]['effectchance'] == 30 and ((self.MonData[traincurrent]['type'][1] != ('electric')) and (self.MonData[traincurrent]['type'][2] != ('electric'))):
                    movepriority[tempmove] = 8
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'paralyzehit' and self.MonData[mycurrent]['moves'][tempmove]['effectchance'] == 10 and self.MonData[traincurrent]['item'] != 'parlyzguard' and ((self.MonData[traincurrent]['type'][1] != ('electric')) and (self.MonData[traincurrent]['type'][2] != ('electric'))):
                    movepriority[tempmove] = 9
                    continue
                elif self.MonData[mycurrent]['moves'][tempmove]['effect'] == 'freezehit' and self.MonData[traincurrent]['item'] != 'freezeguard' and self.MonData['weather'] != 'sun':
                    movepriority[tempmove] = 10
                    continue
            if self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('whirlwind', 'teleport'):
                movepriority[tempmove] = 11
                continue
        for tempmove in range(len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            if ((self.MonData[traincurrent]['type'][1] == 'grass') or (self.MonData[traincurrent]['type'][2] == 'grass')) and self.MonData[mycurrent]['moves'][tempmove]['name'] in ('spore', 'poisonpowder', 'sleeppowder', 'stunspore'):
                movepriority[tempmove] = 20
        theaction = 20
        for tempx in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            tempy = 20
            if movepriority[tempx] < tempy:
                tempy = movepriority[tempx]
                theaction = tempx
                self.NoBetterChoice = False

        if theaction == 20:
            self.Fight(traincurrent, mycurrent, 5)
            theaction = self.mybestmove[mycurrent]
        return theaction

    def LastMove(self):
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
        else:
            mycurrent = 0
        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        self.TrainerDamage(traincurrent, mycurrent)
        if Debug_Code > 0:
            print('checking if i will die')
            print('their damage: '+str(self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'])+' my hp: '+str(self.jsonlist['battleState']['enemypokemon']['hp']))
        x1 = -1
        if len(self.MonData[mycurrent]['moves']) > 1:
            if self.MonData[mycurrent]['moves'][self.theaction]['effect'] in ('moonlight', 'synthesis', 'morningsun', 'heal'):
                if self.Damage[mycurrent][traincurrent][self.theaction]['selfdamage'] * -1 > self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']:
                    x1 = 1
            if x1 == -1:
                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] > self.jsonlist['battleState']['enemypokemon']['hp']:
                    tempx = -1000
                    self.FinalChance = True
                    for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                        self.DamageDealt(mycurrent, traincurrent, tempmove)
                        if self.MonData[mycurrent]['moves'][tempmove]['curpp'] > 0:
                            if self.Damage[mycurrent][traincurrent][tempmove]['damage'] > tempx:
                                tempx = self.Damage[mycurrent][traincurrent][tempmove]['damage']
                                x1 = tempmove
                    tempx = self._statsmultipliers[self.MonData[mycurrent]['boosts']['spd']+6]/100
                    tempy = self._statsmultipliers[self.MonData[traincurrent]['boosts']['spd']+6]/100
                    for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                        if self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('priorityhit','extremespeed') and (self.MonData[mycurrent]['stats']['spd'] * tempx < self.MonData[traincurrent]['stats']['spd'] * tempy):
                            x1 = tempmove
                    if Debug_Code > 0:
                        print('about to die - i need to attack, i will use: '+str(x1))
                    if x1 == -1:
                        x1 = random.randint(0, len(self.MonData[mycurrent]['moves']))
                    self.NoBetterChoice = False
                    return x1
        return

    def ManualControl(self):
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
        else:
            mycurrent = 0
        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        self.Reset(traincurrent, mycurrent)
        self.TrainerDamage(traincurrent, mycurrent)

        if self.MonData['myperishsong'] == 1:
            potentialAction = self.ForcedSwitch(traincurrent)
            if potentialAction != 20:
                return potentialAction

        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            #baton pass
            statTotal = sum([int(self.jsonlist['battleState']['enemypokemon']['stat levels'][stat]) for stat in self.statNames])
            if statTotal > 0:
                tempx = -1
                for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('batonpass'):
                        tempx = tempmove
                if tempx != -1 :
                    potentialAction = self.OptionalSwitch(traincurrent)
                    if potentialAction != 20:
                        return potentialAction
                if Debug_Code == 1:
                    print('Checking Baton Pass')
            #prevent trainer from setting up on me
            #if it's not the first turn... see if the trainer has a set up move
            if self.jsonlist['battleState']['enemypokemon']['turns'] > 0:
                tempy = 0
                for tempmove in range(0, len(self.jsonlist['battleState']['playerpokemon']['moves'])):
                    if self.MonData[traincurrent]['moves'][tempmove]['effect'] in ('attackup2', 'evasionup2', 'speedup2', 'spatkup2', 'spdefup2', 'spatkup', 'attackup', 'evasionup', 'growth'):
                        tempy = 1
                #if trainer does have a set up move, can I deal damage to him? (do not include metronome, destiny bond and present as a source of damage)
                if tempy == 1:
                    tempx = 0
                    for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                        self.DamageDealt(traincurrent, mycurrent, tempmove)
                        if self.Damage[mycurrent][traincurrent][tempmove]['damage'] > 10 and self.MonData[mycurrent]['moves'][tempmove]['effect'] not in ('destinybond', 'present', 'metronome'):
                            tempx = 1
                            break
                    #if i CAN NOT deal damage, check if i have another mon to switch to
                    if tempx == 0:
                        for tempmove in range(0, self.myparty):
                            if self.MonData[mycurrent]['stats']['maxhp'] > 0:
                                tempx += 1
                        #if i have another mon i can switch to check if the enemy is setting up - if he is, switch
                        if tempx > 1:
                            statTotal = sum([int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat]) for stat in self.statNames])
                            if statTotal > 0:
                                tempx = self.ForcedSwitch(traincurrent)
                                if tempx != 20:
                                    return tempx


        #if we have protect and the enemy has a mon inside a two-turn move, protect yourself
        tempx = -1
        for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('protect'):
                tempx = tempmove
        if tempx != -1 and self.jsonlist['battleState']['enemypokemon']['last used'].replace(' ', '').lower().replace('-', '') not in ('protect', 'endure'):
            if 'underground' in self.MonData['playerpokemon']['substatus'] or (isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'underground' in self.MonData['playerpokemon']['substatus'].values()):
                return tempx
            if 'flying' in self.MonData['playerpokemon']['substatus'] or (isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'flying' in self.MonData['playerpokemon']['substatus'].values()):
                return tempx
            if 'charged' in self.MonData['playerpokemon']['substatus'] or (isinstance(self.MonData['playerpokemon']['substatus'], dict) and 'charged' in self.MonData['playerpokemon']['substatus'].values()):
                return tempx

        #if we chose to use either counter/mirrorcoat, and the mon has BOTH counter and mirrorcoat,
        #randomize the move used based on the effective damage of both
        if self.theaction < 4:
            x2 = -1
            temptext = 'none'
            for tempmove in range(0, len(self.jsonlist['battleState']['playerpokemon']['moves'])):
                if self.MonData[traincurrent]['moves'][tempmove]['name'] == self.jsonlist['battleState']['playerpokemon']['last used'].replace(' ', '').lower().replace('-', ''):
                    temptext = self.MonData[traincurrent]['moves'][tempmove]['category']
                    break
            if self.MonData[mycurrent]['moves'][self.theaction]['effect'] == 'counter':
                #using counter, but check if we also have mirrorcoat available
                tempx = -1
                for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('mirrorcoat'):
                        tempx = tempmove
                if tempx > -1:
                    x2 = self.Damage[mycurrent][traincurrent][self.theaction]['damage'] + self.Damage[mycurrent][traincurrent][tempx]['damage']
                    if x2 > 0:
                        x1 = math.ceil(self.Damage[mycurrent][traincurrent][self.theaction]['damage'] / x2) * 100
                        if temptext == 'special':
                            x1 -= 66
                        if temptext == 'none' and x1 != 100:
                            x1 = 50
                        if random.randint(0, 100) > x1:
                            return tempx

            elif self.MonData[mycurrent]['moves'][self.theaction]['effect'] == 'mirrorcoat':
                #check if we also have counter available
                tempx = -1
                for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('counter'):
                        tempx = tempmove
                if tempx > -1:
                    x2 = self.Damage[mycurrent][traincurrent][self.theaction]['damage'] + self.Damage[mycurrent][traincurrent][tempx]['damage']
                    if x2 > 0:
                        x1 = math.ceil(self.Damage[mycurrent][traincurrent][self.theaction]['damage'] / x2) * 100
                        if temptext == 'physical':
                            x1 -= 66
                        if temptext == 'none' and x1 != 100:
                            x1 = 50
                        if random.randint(0, 100) > x1:
                            return tempx

        templist = []
        templist2 = []
        #they are about to die can i save pp?
        if self.theaction < 4:
            if self.Damage[mycurrent][traincurrent][self.theaction]['damage'] > self.jsonlist['battleState']['playerpokemon']['hp'] * 1.1:
                for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    self.DamageDealt(mycurrent, traincurrent, tempmove)
                    if self.MonData[mycurrent]['moves'][tempmove]['curpp'] > 0:
                        if self.Damage[mycurrent][traincurrent][tempmove]['damage'] > self.jsonlist['battleState']['playerpokemon']['hp'] * 1.1:
                            templist.append(tempmove)
                if len(templist) > 0:
                    temp1 = -1
                    tempx = self._statsmultipliers[self.MonData[mycurrent]['boosts']['spd']+6]/100
                    tempy = self._statsmultipliers[self.MonData[traincurrent]['boosts']['spd']+6]/100
                    if self.MonData[mycurrent]['status'] == 'par':
                        tempx = tempx * 0.25
                    if self.MonData[traincurrent]['status'] == 'par':
                        tempy = tempy * 0.25
                    for tempmove in templist:
                        if self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('priorityhit','extremespeed') and (self.MonData[mycurrent]['stats']['spd'] * tempx < self.MonData[traincurrent]['stats']['spd'] * tempy):
                            x1 = tempmove
                            temp1 = 20
                    if temp1 == 20:
                        return x1
                    else:
                        x1 = -1
                        #find most accurate
                        for tempmove in templist:
                            if self.MonData[mycurrent]['moves'][tempmove]['acc'] > temp1:
                                temp1 = self.MonData[mycurrent]['moves'][tempmove]['acc']
                        #are there ties for most accurate?
                        for tempmove in templist:
                            if self.MonData[mycurrent]['moves'][tempmove]['acc'] == temp1:
                                templist2.append(tempmove)
                        temp1 = 0
                        #find the most accurate move with highest pp (prioritizing accuracy)
                        for tempmove in templist2:
                            if self.MonData[mycurrent]['moves'][tempmove]['curpp'] > temp1:
                                temp1 = self.MonData[mycurrent]['moves'][tempmove]['curpp']
                                x1 = tempmove
                        return x1

        #desitny bond override
        if self.theaction < 4:
            tempx = -1
            if self.FinalChance:
                for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if self.MonData[mycurrent]['moves'][tempmove]['effect'] == ('destinybond'):
                        tempx = tempmove
                if tempx != -1:
                    if self.MonData[mycurrent]['moves'][tempx]['curpp'] > 0:
                        return tempx

        return None

    def StatsDownPrevention(self):
        KillingBlow = False
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
        else:
            mycurrent = 0
        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        self.Reset(traincurrent, mycurrent)
        #if i can kill
        for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            self.DamageDealt(mycurrent, traincurrent, tempmove)
            if self.Damage[mycurrent][traincurrent][tempmove]['damage'] > self.jsonlist['battleState']['playerpokemon']['hp'] * 1.1:
                KillingBlow = True
        #then dont use stats down
        if KillingBlow:
            for tempmove in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                if self.MonData[mycurrent]['moves'][tempmove]['effect'] in ('accuracydown', 'defensedown', 'attackdown', 'speeddown2', 'defensedown2', 'spdefdown2'):
                    self.MonData[mycurrent]['moves'][tempmove]['curpp'] = 0
        return

    #figure out best action to do in current battle
    def MainBattle(self, jsonlist):

        self.jsonlist = jsonlist
        #setup everything
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            self.myparty = len(self.jsonlist['enemyParty']['party']) #ai's pokemon
        else:
            self.myparty = 0
        self.trainparty = len(self.jsonlist['playerParty']['party'])
        self.triggered = 0
        self.enemybestvcurrent = 0
        self.difference = {}
        for mymons in range(0, 6):
            self.difference[mymons] = {}
            for trainmons in range(6, 12):
                self.difference[mymons][trainmons] = -1000

        self.differenceitems = {}
        for mymons in range(0, 6):
            self.differenceitems[mymons] = {1:-1,2:-1}

        self.Damage = {}
        for x1 in range(0, 12):
            self.Damage[x1] = {}
            for x2 in range(0, 12):
                self.Damage[x1][x2] = {}
                for x3 in range(0, 4):
                    self.Damage[x1][x2][x3] = {}

        self.HitMe = 0
        self.mybestmove = {}
        self.PermMonData = {}
        self.enemybest = ''
        self.enemynumber = 0
        self.opponenthp = {}
        self.hp = {}
        self.useitem = 0
        self.theaction = 0
        self.countercoat = {}
        self.countercoat['physical'] = {}
        self.countercoat['special'] = {}
        self.MonData = {}
        self.FinalChance = True
        self.ShouldISwitch = True
        self.NoBetterChoice = True
        self.FirstFight = True

        #alright, start computing
        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        self.parseMondataFromJsonlist()

        self.StatsDownPrevention()

        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
            if ('requested action' not in self.jsonlist['battleState']) or not (int(self.jsonlist['battleState']['requested action']) & 0x40):
                self.Fight(traincurrent, mycurrent, 5)
                self.FirstFight = False
                self.theaction = self.mybestmove[mycurrent]
                self.triggered = 1
                self.TrainerDamage(traincurrent, mycurrent)
                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 1.25 > self.jsonlist['battleState']['enemypokemon']['hp']:
                    if self.jsonlist['battleState']['enemypokemon']['hp'] < self.jsonlist['battleState']['enemypokemon']['stats']['maxhp'] * 0.33:
                        self.ShouldISwitch = False
                if int(self.jsonlist['battleState']['playerpokemon']['turns']) > 0:
                    if 'toxic' not in self.MonData['enemypokemon']['substatus']:
                        self.ShouldISwitch = False
                if self.ShouldISwitch:
                    theaction2 = self.OptionalSwitch(traincurrent)
                    if theaction2 != 20:
                        self.theaction = theaction2
                potentialAction = self.LastMove()
                if potentialAction is not None:
                    self.theaction = potentialAction
                theaction2 = self.checkIfUsingItem()
                if theaction2 != 20:
                    self.theaction = theaction2
                self.triggered = 0
                potentialAction = self.ManualControl()
                if potentialAction is not None:
                    self.theaction = potentialAction
            else:
                self.theaction = self.ForcedSwitch(traincurrent)
        else:
            mycurrent = 0
            self.theaction = self.WildBattle(mycurrent, traincurrent)
            potentialAction = self.LastMove()
            if potentialAction is not None:
                self.theaction = potentialAction
            potentialAction = self.ManualControl()
            if potentialAction is not None:
                self.theaction = potentialAction

        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
        else:
            mycurrent = 0
        x1 = 0
        #PP = 0 code
        if self.theaction < 0:
            self.theaction = 0
        if self.theaction < 4:
            tempy = 0
            for tempx in range(0, len(self.MonData[mycurrent]['moves'])):
                if self.MonData[mycurrent]['moves'][tempx]['curpp'] == 0:
                    tempy = tempy + 1
            while True:
                try:
                    if self.MonData[mycurrent]['moves'][self.theaction]['curpp'] > 0:
                        break
                except KeyError:
                    x1 += 1
                print('Move had 0 pp? -ERROR- (either that or using struggle)')
                self.theaction = random.randint(0, (len(self.jsonlist['battleState']['enemypokemon']['moves'])))
                if tempy == len(self.MonData[mycurrent]['moves']):
                    break
                if x1 > 20:
                    print('key error x20, ending infinite loop')
                    self.theaction = 0
                    break

        #invalid action handling
        if (int(self.jsonlist['battleState']['requested action']) & 0x04):
            print('INVALID ACTION -ERROR-! Contact Beesafree with the logs')
            if self.theaction > 11:
                self.theaction = 0
            if self.theaction < 0:
                self.theaction = 0
            if self.theaction > 9:
                while True:
                    if self._actualAction[str(self.theaction)] not in self.jsonlist['battleState']['history']:
                        break
                    if self.theaction == 10:
                        tempx = 11
                    if self.theaction == 11:
                        tempx = 10
                    if 'useitem1' in self.jsonlist['battleState']['history'] and 'useitem2' in self.jsonlist['battleState']['history']:
                        self.theaction = 0
                        break
                    self.theaction = tempx
            if self.theaction < 4:
                while True:
                    if self._actualAction[str(self.theaction)] not in self.jsonlist['battleState']['history']:
                        break
                    self.theaction = random.randint(0, 4)
                    if 'move1' in self.jsonlist['battleState']['history'] and 'move2' in self.jsonlist['battleState']['history'] and 'move3' in self.jsonlist['battleState']['history'] and 'move4' in self.jsonlist['battleState']['history']:
                        self.theaction = 4
                        break
            if self.theaction < 10 and self.theaction > 3:
                while True:
                    if self._actualAction[str(self.theaction)] not in self.jsonlist['battleState']['history']:
                        break
                    self.theaction = random.randint(4, self.myparty + 6)

        if self.NoBetterChoice:
            print('random move used because of no better choice, this shouldnt happen -ERROR-')
        temptext = self._actualAction[str(self.theaction)]
        return temptext

def main():
    Artificial = AI()
    battle_state = json.loads(open(JSON_FILE_PATH).read(), encoding="utf-8")
    print(Artificial.MainBattle(battle_state))

    #    battle_state = Artificial.jsonlist
    #placeholder to prevent infinite looping
    #input('Action Above is best move (0-3 = moves, 4-9 = mon switch, 10-11 = use bag items) --- Press enter to continue')

if __name__ == '__main__':
    main()
