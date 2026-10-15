#!/usr/bin/env python3
"""Weigh a commit for the `each-rcc` planner: the same weight for every commit.

`scripts/each-plan.sh` weighs every commit before partitioning the range into
matrix shards, and `scripts/each-partition.py` turns a weight in *objects* into
minutes: a commit built on a warm ccache costs

    min(FLOOR + objects * OBJECT_SECONDS / 60, FULL)

The duckdb-r original derives `objects` per commit from DuckDB's unity build,
whose include graph makes a commit's cost bimodal: a narrow header reaches a
couple of dozen unity objects and a wide one half the build.
rigraph has no unity build and nothing that bimodal to isolate.
Its ~420 translation units (the vendored igraph C library and the glue)
are small: a cold build of all of them adds about a minute to a commit
whose gates take 25, and what a warm commit recompiles is seconds.
So every commit gets the same weight, and the constant below is that weight.

The command line is the original's, so the planner and the partitioner run
unchanged:

    each-cost.py map [<root>] > cost-map.json
    git diff --name-only A B | each-cost.py estimate cost-map.json
    each-cost.py batch cost-map.json < lines    # "<sha> <path> <path> ..."

`map` writes the constant into the map rather than scanning anything, and
`estimate` and `batch` report it for every commit, whatever the commit changed.
Reading the weight from the map rather than from this file keeps a plan
consistent with the map it was built from.
"""

import json
import sys

# Translation units a commit recompiles on a warm ccache, on average.
#
# Measured on the 300 newest first-parent commits of igraph/igraph
# (October 2026), the stream a series vendors one commit at a time,
# counting a changed header by the units that include it transitively.
# 56% change nothing rigraph compiles.
# Of the rest, half reach two units or fewer and one in ten reaches fifty or more;
# 9 of the 300 reach a hundred or more.
# The mean over all 300 is 9.7.
COMMIT_OBJECTS = 10

# The translation units of a full build, for scale: 406 igraph and 11 glue,
# from `src/sources-*.mk`.
# The vendored GLPK's 177 come on top only where configure finds no system GLPK,
# and pak installs one from DESCRIPTION's SystemRequirements.
# Not used in the weight: it is what COMMIT_OBJECTS is a fraction of,
# and what FULL_BUILD_MINUTES in scripts/each-plan.sh compiles.
TOTAL_OBJECTS = 417


def build_map(_root):
    """The cost map: the constant, recorded so a plan can be traced to it."""
    return {
        "model": "constant",
        "objects": TOTAL_OBJECTS,
        "commit_objects": COMMIT_OBJECTS,
    }


def estimate(cost_map, _paths):
    """Objects a commit invalidates: the same for every commit."""
    return int(cost_map.get("commit_objects", COMMIT_OBJECTS))


def main(argv):
    if len(argv) < 2:
        sys.stderr.write(__doc__)
        return 2

    command = argv[1]

    if command == "map":
        root = argv[2] if len(argv) > 2 else "."
        json.dump(build_map(root), sys.stdout, separators=(",", ":"))
        sys.stdout.write("\n")
        return 0

    if command == "estimate":
        if len(argv) < 3:
            sys.stderr.write("usage: each-cost.py estimate <cost-map.json> [< paths]\n")
            return 2
        with open(argv[2], "r") as f:
            cost_map = json.load(f)
        paths = [line.strip() for line in sys.stdin if line.strip()]
        print(estimate(cost_map, paths))
        return 0

    if command == "batch":
        # One line of input per commit: "<sha> <path> <path> ...".
        # One line of output per commit: "<sha> <objects>".
        if len(argv) < 3:
            sys.stderr.write("usage: each-cost.py batch <cost-map.json> [< lines]\n")
            return 2
        with open(argv[2], "r") as f:
            cost_map = json.load(f)
        for line in sys.stdin:
            fields = line.split()
            if not fields:
                continue
            print("%s %d" % (fields[0], estimate(cost_map, fields[1:])))
        return 0

    sys.stderr.write("unknown command: %s\n" % command)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
