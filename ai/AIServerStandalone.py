"""
Script for starting a http server that proxies AI response requests to the ai and returns the result.
Does the same as AiServer.py, but uses standard python only, no Flask.
"""

from http.server import BaseHTTPRequestHandler
import socketserver
import json
import logging
import threading
import random
import AI

show_move = 0 # set to 1 if you're a dirty rotten cheater
PORT = 5001
logger = logging.getLogger("AIServer")

# global ai result variable.
# set by worker thread "calculate_next_move",
# read by ai_retrieve requests.
# initialize to something that is a valid backup input in most cases,
# so eventual ai-retrieve-deadlocks can be resolved with a restart of this server.
ai_result = None
# global handle to actual AI
Artificial = AI.AI()
LastActions = []


def get_backup_move(battle_state):
    try:
        if battle_state["battleState"]["requested action"] & 0x40:
            try:
                return "switch%d" % random.randint(1, len(battle_state["battleState"]["enemyParty"]["party"]))
            except KeyError:
                return "switch%d" % random.randint(1, 6)
        else:
            try:
                return "move%d" % random.randint(1, len(battle_state["battleState"]["enemypokemon"]["moves"]))
            except KeyError:
                return "move%d" % random.randint(1, 4)
    except KeyError:
        # the whole battle_state is fucked
        return "move%d" % random.randint(1, 4)

def calculate_next_move(battle_state):
    global ai_result, Artificial, LastActions
    # invoke AI.
    # catch exceptions and provide a fallback to not get the whole game stuck waiting on a move
    try:
        if not (battle_state["battleState"]["requested action"] & 0x04):
            LastActions = []
        battle_state["battleState"]["history"] = LastActions
        next_move = Artificial.MainBattle(battle_state)
    except Exception:
        logger.exception("The AI threw an exception with the following input: %s" % battle_state)
        # uh-oh! better fall back to "default ai"
        next_move = get_backup_move(battle_state)

    if show_move == 1:
        logger.info("next move: %s" % next_move)
    else:
        logger.info("AI move received")
    LastActions.append(next_move)
    
    # set global ai result variable. do this always last to avoid race-conditions.
    ai_result = next_move

class AIServer(BaseHTTPRequestHandler):
    def get_json(self):
        content_len = int(self.headers.get('content-length', 0))
        content = self.rfile.read(content_len)
        return json.loads(content.decode())
    
    def ai_invoke(self):
        global ai_result
        self.send_response(200)
        self.end_headers()
        
        try:
            battle_state = json.loads(self.get_json())
        except ValueError:
            logger.exception("ai_invoke got called with nothing, or something not json-decodable.")
            battle_state = {}
        logger.info("invoking AI... submitted JSON: %s" % battle_state)
        
        # reset global ai result variable and asynchronously invoke the ai.
        # Doesn't have to be a thread, could also be a greenlet or something,
        # But a thread is easy, in the stdlib and works fine here.
        ai_result = None
        threading.Thread(target=calculate_next_move, args=(battle_state,)).start()

    def do_POST(self):
        if self.path != "/ai_invoke":
            self.send_response(404)
            self.end_headers()
            return
        self.ai_invoke()

    def do_GET(self):
        if self.path == "/ai_retrieve":
            self.send_response(200)
            self.end_headers()
            if ai_result is not None:
                self.wfile.write(ai_result.encode())
        elif self.path == "/ai_invoke":
            self.ai_invoke()
        else:
            self.send_response(404)
            self.end_headers()
            return

if __name__ == "__main__":
    httpd = socketserver.TCPServer(("localhost", PORT), AIServer)
    print("Serving on port {}".format(PORT))
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("Shutting down...")
