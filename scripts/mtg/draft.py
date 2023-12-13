#!/usr/bin/env python3

from itertools import product
import random

colors = ['red', 'green', 'blue', 'yellow', 'orange']
numbers = [i for i in range(1, 15)]
packs = []

for r in product(colors, numbers):
    packs.append(f'{r[0]} {r[1]}')

drafters = [f'Player {i}' for i in range(1,9)]

for drafter in drafters:
    print(f'{drafter}:')
    picks = random.sample(packs, 3)
    for pick in picks:
        print(f'\t{pick}')
        packs.remove(pick)

