#!/usr/bin/env python3

from itertools import product
import random

colors = ['red', 'green', 'blue', 'yellow', 'orange']
numbers = [1, 2, 3, 4, 5, 6, 7]
packs = []

for r in product(colors, numbers):
    packs.append(f'{r[0]} {r[1]}')

drafters = ['Player 1', 'Player 2', 'Player 3', 'Player 4', 'Player 5', 'Player 6', 'Player 7', 'Player8']

for drafter in drafters:
    print(f'{drafter}:')
    picks = random.sample(packs, 3)
    for pick in picks:
        print(f'\t{pick}')
        packs.remove(pick)

