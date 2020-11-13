#!/usr/bin/env python3

###############################################
################ Ping Parser ##################
###############################################
# * Parses the output of the `ping -D <host>` #
###############################################

import sys
import pytz
from datetime import datetime


class Line:
    def __init__(self, line):
        self._time = int(line[1:11])


def main(filename):
    with open(filename) as f:
        lines = []
        for line in f.readlines()[1:]:
            lines += [Line(line)]
        verify(lines)


def verify(lines):
    if len(lines) >= 2:
        p = lines[0]._time
        for line in lines[1:]:
            c = line._time
            if (c - p) > 2:
                p_ts = datetime.fromtimestamp(p, tz=pytz.timezone("Europe/Madrid"))
                c_ts = datetime.fromtimestamp(c, tz=pytz.timezone("Europe/Madrid"))
                print(f"Missing ping(s) between: {p_ts} and {c_ts}")
            p = c


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        sys.stderr.write("Error, invalid number of parameters\n")
