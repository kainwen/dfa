#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import sys
sys.path.append("..")
import os
from dfa import DFA, load_delta_from_file


fn, ext = __file__.split(".")

MiMod = [2, 4, 3, 1]
STATES = [(i, j) for i in MiMod for j in range(5)]
STATES_MAP = dict([(t, i) for i, t in enumerate(STATES)])

module = fn
states = {"type": "fix",
          "content": ["q_s"] + list(range(20))}
start_state = "q_s"
accept_states = {"type": "fix",
                 "content": [i for i, s in enumerate(STATES) if s[1] == 0]}
alphabet = "binary"



def mi_next(mi):
    if mi == 2: return 4
    if mi == 4: return 3
    if mi == 3: return 1
    if mi == 1: return 2

def delta(n, i):
    if n == "q_s":
        if i == 0:
            t = (1, 0)
            return STATES_MAP.get(t)
        else:
            t = (1, 1)
            return STATES_MAP.get(t)
    else:
        mi, mod = STATES[n]
        mi = mi_next(mi)
        mod = (mod + i * mi) % 5
        return STATES_MAP.get((mi, mod))


dfa = DFA(module, states, start_state, accept_states, alphabet, delta)
with open(fn+".erl", "w") as f:
    print(dfa.gen_erl_statem(), file=f)
