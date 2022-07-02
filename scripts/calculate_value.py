#!/usr/bin/env python3

import csv
import sys

def main(rows):
    accum = 0
    for row in rows:
        accum += float(row["price"])*int(row["quantity"])
    print(accum)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Error: Bad number of parameters\nUsage: {sys.argv[0]} <file>")
    with open(sys.argv[1], "r") as f:
        main(csv.DictReader(f))
