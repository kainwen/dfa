#!/usr/bin/env python3
#-*- coding: utf-8 -*-


from io import StringIO
from copy import deepcopy
import os
import jinja2
from random import randint


TEMPLATE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                             "dfa.jinja2")


def render(context):
    path, filename = os.path.split(TEMPLATE_PATH)
    return jinja2.Environment(
        loader=jinja2.FileSystemLoader(path)
    ).get_template(filename).render(context)

def load_delta_from_file(path):
    graph = {}
    with open(path) as f:
        for line in f:
            from_s, input_symbol, to_s = line.strip().split(",")
            graph[(from_s, int(input_symbol))] =  to_s
    def _delta(s, i):
        return graph.get((s, i))
    return _delta


class DfaError(Exception):

    def __init__(self, value):
        self.value = value
 
    def __str__(self):
        return(repr(self.value))


class DFA:

    def __init__(self, module, states, start_state, accept_states, alphabet, delta):
        self.module = module
        self.states = self.parse_states(states)
        self.start_state = start_state
        self.accept_states = self.parse_states(accept_states)
        self.alphabet = self.parse_alphabet(alphabet)
        self.delta = delta

    def parse_states(self, states):
        if not isinstance(states, dict):
            raise DfaError("parse states error")
        if states.get("type") == "fix":
            return deepcopy(states.get("content"))
        if states.get("type") == "range":
            a, b = map(int, states.get("content").strip().split())
            return range(a, b+1)
        raise DfaError("states type not supported")

    def parse_alphabet(self, alphabet):
        if alphabet == "binary":
            return [0, 1]
        raise DfaError("alphabet type not supported")

    def get_start_state(self):
        return self.get_fn_from_state(self.start_state)

    def get_fn_from_state(self, state):
        return "state_" + str(state)

    def get_state_functions(self):
        return [self.get_fn_from_state(st) for st in self.states]

    def export_state_functions(self):
        fns = ",".join(["{fn}/3".format(fn=fn)
                        for fn in self.get_state_functions()])
        return "-export([{fns}]).".format(fns=fns)

    def state_functions_code(self):
        code = StringIO()
        for fn_name, state in zip(self.get_state_functions(), self.states):
            print(self.gen_st_code(fn_name, state), file=code)
            print(file=code)
        return code.getvalue()

    def gen_st_code(self, fn_name, state):
        """
        fn_name({call, From}, Input, Data) ->
            {next_state, State, Data, [{reply, From, ok}].
        """
        code = StringIO()
        for i, c in enumerate(self.alphabet):
            delim = "." if i == len(self.alphabet) - 1 else ";"
            print("%s({call, From}, %s, Data) ->" % (fn_name, i), file=code)
            print("    {next_state, %s, Data, [{reply, From, ok}]}%s"
                  % (self.get_fn_from_state(self.delta(state, c)), delim),
                  file=code)
        return code.getvalue()

    def get_ac_state(self):
        return ",".join([self.get_fn_from_state(st)
                         for st in self.accept_states])

    def extend_delta(self, input_list):
        q = self.start_state
        for i in input_list:
            q = self.delta(q, i)
        return q

    def gen_erl_statem(self):
        code = render({"dfa": self})
        return code

