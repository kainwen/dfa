#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import sys
sys.path.append("..")
import os
from dfa import DFA, load_delta_from_file


fn, ext = __file__.split(".")

module = fn
states = {"type": "fix",
          "content": ["q_s", "q_e", 0, 1, 2, 3, 4]}
start_state = "q_s"
accept_states = {"type": "fix", "content": [0]}
alphabet = "binary"


def delta(n, i):
    if n == "q_s":
        if i == 0: return "q_e"
        if i == 1: return 1
    if n == "q_e":
        return "q_e"
    return (n*2+i) % 5


dfa = DFA(module, states, start_state, accept_states, alphabet, delta)
with open(fn+".erl", "w") as f:
    print(dfa.gen_erl_statem(), file=f)
