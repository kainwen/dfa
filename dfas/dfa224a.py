#!/usr/bin/env python3
#-*- coding: utf-8 -*-

import os
from dfa import DFA, load_delta_from_file


fn, ext = __file__.split(".")

module = fn
states = {"type": "fix", "content": ["A", "B", "C"]}
start_state = "A"
accept_states = {"type": "fix", "content": ["C"]}
alphabet = "binary"
delta = load_delta_from_file("224a")

dfa = DFA(module, states, start_state, accept_states, alphabet, delta)
with open(fn+".erl", "w") as f:
    print(dfa.gen_erl_statem(), file=f)
