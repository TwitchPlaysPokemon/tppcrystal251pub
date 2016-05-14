# Program to compute one round of AI so it can be timed

import AI
import os
import json

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
JSON_FILE_PATH = os.path.join(SCRIPT_DIR, "battlestate.json")

battle_state = json.loads(open(JSON_FILE_PATH).read(), encoding="utf-8")

Artificial = AI.AI()
print(Artificial.MainBattle(battle_state))
