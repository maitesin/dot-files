#!/usr/bin/env python3

import sys

def seek(lines, skip=0):
    for line in lines:
        print(line[skip:-1])

if __name__ == '__main__':
    if len(sys.argv) == 3:
        with open(sys.argv[1], 'r') as f:
            skip = int(sys.argv[2])
            seek(f.readlines(), skip)
    else:
        sys.stderr.write(f'Bad number of parameters.\nUsage: {sys.argv[0]} <filename> <#characters>')
