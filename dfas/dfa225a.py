#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import os
from dfa import DFA, load_delta_from_file


fn, ext = __file__.split(".")

module = fn
states = {"type": "range", "content": "1,63"}
start_state = 1
accept_states = {"type": "fix", "content": [i
                                            for i in range(32, 64)
                                            if bin(i)[2:].count('0') >= 2]}
alphabet = "binary"

def delta(s, i):
    if s <= 31:
        return 2*s + i
    if s <= 63:
        if bin(s)[2:].count('0') < 2:
            return s
        else:
            return (((s-32)*2 + i) % 32) + 32

dfa = DFA(module, states, start_state, accept_states, alphabet, delta)
with open(fn+".erl", "w") as f:
    print(dfa.gen_erl_statem(), file=f)
