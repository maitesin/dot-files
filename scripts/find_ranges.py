#!/usr/bin/env python3

import sys
import os

def main(folder):
    values = read_values_from_folder(folder)
    values.sort()
    print(values)
    ranges = find_ranges(values, 3)
    print(ranges)

def find_ranges(elements, depth):
    if depth == 0:
        print(len(elements))
        return [(elements[0], elements[-1])]

    l = len(elements) // 2
    lrs = find_ranges(elements[:l], depth - 1)
    rrs = find_ranges(elements[l:], depth - 1)
    return lrs + rrs

def read_values_from_folder(folder):
    values = []
    for root, _, files in os.walk(folder):
        for name in files:
            with open(os.path.join(root, name)) as f:
                values += [ float(x.strip()) for x in f.readlines() ]
    return values

if __name__ == '__main__':
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        sys.stderr.write('Error, invalid number of parameters\n')
