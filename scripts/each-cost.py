#!/usr/bin/env python3
"""Estimate how many unity objects a change invalidates.

The vendored DuckDB build is a *unity build*: `src/include/sources.mk` lists
341 objects, 138 of which are `ub_*.o` groups that `#include` dozens of `.cpp`
files each. Compilation cost is therefore not proportional to the number of
changed files but to the number of *objects* those files reach -- and header
reach is bimodal: a narrow header pulls in a couple of dozen objects, a widely
included one more than half the build (measured in
`plan/history/vendoring-loop.md`, Appendix A.2).

`scripts/each-plan.sh` uses this to weigh commits before partitioning them into
matrix shards, so that a wide-header commit is isolated instead of being packed
next to nineteen cheap ones.

Two subcommands, because the map is expensive (seconds) and the lookup is not:

    each-cost.py map [--root .] > cost-map.json
    git diff --name-only A B | each-cost.py estimate cost-map.json

`map` walks `src/duckdb/**`, resolves every `#include "..."` edge, and does one
BFS per object. Each file gets a bitmask of the objects that transitively
include it, hex-encoded. `estimate` ORs the masks of the changed paths and
prints the population count -- the number of objects the change invalidates.

Resolution is deliberately an over-approximation: an include target is matched
against a path-suffix index, so an ambiguous `#include "types.hpp"` counts for
every `types.hpp` in the tree. This is a cost model, not a build system; over-
estimating a header's reach isolates a commit that did not need isolating,
which costs a little parallelism and no correctness.

The map is computed from one checkout (the branch tip) and reused for the whole
range. Reach drifts as the vendored tree evolves, but only slowly, and a stale
weight only mis-balances a shard.
"""

import json
import os
import re
import sys
from collections import deque

# `#include "duckdb/common/types.hpp"` -- quoted includes only. Angle-bracket
# includes reach system headers, which no commit in this repository changes.
INCLUDE_RE = re.compile(rb'^\s*#\s*include\s*"([^"]+)"', re.MULTILINE)

SOURCE_SUFFIXES = (".cpp", ".cc", ".c")
SCANNED_SUFFIXES = SOURCE_SUFFIXES + (".hpp", ".h", ".hh", ".ipp", ".inc")

VENDOR_DIR = os.path.join("src", "duckdb")
SOURCES_MK = os.path.join("src", "include", "sources.mk")


def read_objects(root):
    """Object list from sources.mk, as paths relative to `src/`."""
    with open(os.path.join(root, SOURCES_MK), "rb") as f:
        text = f.read().decode("utf-8", "replace")
    _, _, rhs = text.partition("=")
    return [tok for tok in rhs.split() if tok.endswith(".o")]


def scan_tree(root):
    """Map every scannable file under src/duckdb to its quoted include targets.

    Returns (edges, suffix_index): `edges[path]` is the list of raw include
    targets found in `path`; `suffix_index[suffix]` is the list of paths whose
    trailing components equal `suffix`. Paths are relative to `root`.
    """
    edges = {}
    suffix_index = {}
    base = os.path.join(root, VENDOR_DIR)

    for dirpath, _dirnames, filenames in os.walk(base):
        for name in filenames:
            if not name.endswith(SCANNED_SUFFIXES):
                continue
            abs_path = os.path.join(dirpath, name)
            rel = os.path.relpath(abs_path, root)
            try:
                with open(abs_path, "rb") as f:
                    blob = f.read()
            except OSError:
                continue
            edges[rel] = [m.decode("utf-8", "replace") for m in INCLUDE_RE.findall(blob)]

            # Register every path suffix so that an include written against any
            # of DuckDB's include roots resolves without hard-coding the roots.
            parts = rel.split(os.sep)
            for i in range(len(parts)):
                suffix_index.setdefault("/".join(parts[i:]), []).append(rel)

    return edges, suffix_index


def object_translation_unit(obj, edges):
    """The `.cpp` that compiles into `obj`, or None if it cannot be located.

    `duckdb/ub_src_execution.o` comes from `src/duckdb/ub_src_execution.cpp`;
    `duckdb/src/common/crypto/md5.o` from the same path with a source suffix.
    """
    stem = os.path.join("src", obj[: -len(".o")])
    for suffix in SOURCE_SUFFIXES:
        candidate = stem + suffix
        if candidate in edges:
            return candidate
    return None


def build_map(root):
    """Bitmask per file of the objects that transitively include it."""
    objects = read_objects(root)
    edges, suffix_index = scan_tree(root)

    masks = {}
    missing = []

    for index, obj in enumerate(objects):
        tu = object_translation_unit(obj, edges)
        if tu is None:
            missing.append(obj)
            continue

        bit = 1 << index
        seen = {tu}
        queue = deque([tu])
        while queue:
            current = queue.popleft()
            masks[current] = masks.get(current, 0) | bit
            for target in edges.get(current, ()):
                # Longest-suffix match first: a fully qualified target resolves
                # to exactly one file, a bare filename to every file with that
                # name.
                for path in suffix_index.get(target, ()):
                    if path not in seen:
                        seen.add(path)
                        queue.append(path)

    return {
        "objects": len(objects),
        "unresolved_objects": missing,
        "masks": {path: format(mask, "x") for path, mask in masks.items()},
    }


def estimate(cost_map, paths):
    """Number of objects invalidated by changing `paths`."""
    masks = cost_map["masks"]
    combined = 0
    for path in paths:
        mask = masks.get(path)
        if mask is not None:
            combined |= int(mask, 16)
    return bin(combined).count("1")


def main(argv):
    if len(argv) < 2:
        sys.stderr.write(__doc__)
        return 2

    command = argv[1]

    if command == "map":
        root = argv[2] if len(argv) > 2 else "."
        result = build_map(root)
        if result["unresolved_objects"]:
            sys.stderr.write(
                "warning: no translation unit found for %d object(s): %s\n"
                % (
                    len(result["unresolved_objects"]),
                    " ".join(result["unresolved_objects"][:5]),
                )
            )
        json.dump(result, sys.stdout, separators=(",", ":"))
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
        # One line of output per commit: "<sha> <objects>". Keeps the planner
        # to a single Python start-up for a range of thousands of commits.
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
