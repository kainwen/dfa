#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import os
from dfa import DFA, load_delta_from_file


fn, ext = __file__.split(".")

module = fn
states = {"type": "range", "content": "0,14"}
start_state = 0
accept_states = {"type": "fix", "content": [0]}
alphabet = "binary"


STATE_TPS = [(i, j) for i in range(3) for j in range(5)]
STATE_MAP = dict([(t, i) for i, t in enumerate(STATE_TPS)])

def delta(n, i):
    (n1, n0) = STATE_TPS[n]
    if i == 1: n1 = (n1 + 1) % 3
    if i == 0: n0 = (n0 + 1) % 5
    return STATE_MAP.get((n1, n0))


dfa = DFA(module, states, start_state, accept_states, alphabet, delta)
with open(fn+".erl", "w") as f:
    print(dfa.gen_erl_statem(), file=f)
