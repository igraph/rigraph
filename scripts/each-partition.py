#!/usr/bin/env python3
"""Partition a commit range into contiguous, cost-balanced `each-rcc` shards.

Reads `<sha> <invalidated-objects>` lines, oldest first -- what
`scripts/each-cost.py batch` produces -- and writes the shard list
`scripts/each-plan.sh` turns into a matrix.

Two passes, and they optimise different things.

**Pass 1, greedy fill** minimises the number of legs subject to the leg
deadline. Shards must be contiguous, because that is what makes consecutive
checkouts cheap, so this is not bin packing: partitioning a sequence into the
fewest contiguous parts under a fixed budget is solved exactly by one
left-to-right pass. Fewest legs is near enough to cheapest in runner-minutes to
serve as the cost baseline, and for a small batch it is also about the slowest
plan there is in wall clock -- 25 commits fit in two 300-minute legs, so the
branch tip waits five hours for a verdict it could have had in one.

**Pass 2, rebalancing** buys that wall clock back, by running pass 1 again at
*shorter* deadlines and keeping the plan that finishes first. Pass 1 at deadline
`B` is a one-parameter family of complete plans -- the lower `B`, the more legs,
the more cold builds -- so pass 2 only has to pick a `B`, and every plan it can
pick is by construction contiguous, balanced, and within the real deadline.

It has to evaluate the whole family rather than walk it in one direction,
because neither axis is monotone in `B`:

  * **Wall clock** falls with more legs only until the matrix runs out of slots.
    At `P` slots, `P` legs finish in one wave and `P + 1` legs take two, so one
    extra leg can nearly *double* the wall clock. Plans are therefore ranked by
    `makespan()`, which models that throttling, and not by their longest leg.
  * **Runner cost** usually rises with more legs, but not always: a commit that
    invalidates the whole unity build already pays `FULL`, so a cut placed just
    before one is free but for the job setup. More legs can genuinely be cheaper
    than fewer, and a plan rejected on cost says nothing about the next one.

Two limits bound the search:

  * `--split-factor` -- the plan may cost at most this multiple of the pass-1
    plan's runner-minutes; `1.0` disables the pass;
  * `--max-shards`, and the commit count: one commit cannot be cut in half.

Among plans that tie on wall clock, the cheapest wins: an extra leg costs a cold
build plus a job setup, so it has to buy real time to be worth it.
`--split-factor` is the dial on that trade.

The cost model per leg:

    build_minutes    = FULL + sum(min(FLOOR + OBJECT_SECONDS * objects, FULL))
                                                        over all but the first
    estimate_minutes = SETUP + build_minutes

The first commit of a leg pays FULL rather than its own weight: it starts on an
empty ccache, so it rebuilds all of `sources.mk` no matter how little it
changed. `build_minutes` is what `scripts/each-shard.sh` measures itself
against (its deadline starts after setup); `estimate_minutes` is the job's wall
clock.
"""

import argparse
import json
import sys


def parse_args(argv):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--budget", type=float, default=300.0,
                   help="leg deadline in minutes, excluding job setup")
    p.add_argument("--setup", type=float, default=5.0,
                   help="per-leg checkout, R and dependency install")
    p.add_argument("--full", type=float, default=40.0,
                   help="a build on an empty ccache -- all of sources.mk")
    p.add_argument("--floor", type=float, default=6.0,
                   help="per-commit link, install, check and gates")
    p.add_argument("--object-seconds", type=float, default=9.7,
                   help="marginal cost of recompiling one unity object")
    p.add_argument("--max-shards", type=int, default=250)
    p.add_argument("--max-parallel", type=int, default=20)
    p.add_argument("--split-factor", type=float, default=1.5,
                   help="runner-minutes the rebalanced plan may cost, as a "
                        "multiple of the fewest-legs plan; 1.0 disables pass 2")
    return p.parse_args(argv)


# Wall clock a rebalance has to beat by, in minutes, before it is worth the
# cold builds it buys: a leg costs SETUP + FULL, so shaving seconds is not.
WORTH_IT_MINUTES = 1.0

# Deadlines pass 2 tries, spread over `(0, --budget]`. Neighbouring deadlines
# usually cut in the same places and collapse to one plan, so this is a
# resolution knob and not a work multiplier: on the 300-minute default it steps
# by ~0.6 min, well under the ~6 min the cheapest single commit weighs.
DEADLINE_SAMPLES = 512


def read_items(stream):
    items = []
    for line in stream:
        fields = line.split()
        if len(fields) >= 2:
            items.append((fields[0], int(fields[1])))
    return items


class Model:
    def __init__(self, args):
        self.setup = args.setup
        self.full = args.full
        self.floor = args.floor
        self.objsec = args.object_seconds

    def warm(self, objects):
        """A commit built on the ccache its predecessor in the leg left behind."""
        return min(self.floor + objects * self.objsec / 60.0, self.full)

    def weights(self, shard):
        """Marginal minutes per commit, in leg order. The first pays a cold build."""
        return [self.full if i == 0 else self.warm(objects)
                for i, (_sha, objects) in enumerate(shard)]

    def build_minutes(self, shard):
        return sum(self.weights(shard))

    def estimate_minutes(self, shard):
        return self.setup + self.build_minutes(shard) if shard else 0.0


def greedy(items, model, budget):
    """Fewest contiguous shards whose build time stays under the deadline.

    A single commit heavier than the budget still gets its own shard rather
    than being dropped; the leg's own deadline handles the overrun.
    """
    shards, current, used = [], [], 0.0
    for item in items:
        weight = model.warm(item[1]) if current else model.full
        if current and used + weight > budget:
            shards.append(current)
            current, used, weight = [], 0.0, model.full
        current.append(item)
        used += weight
    if current:
        shards.append(current)
    return shards


def makespan(shards, model, parallel):
    """Wall clock of the whole matrix, oldest shard submitted first."""
    if not shards:
        return 0.0
    slots = [0.0] * max(1, min(parallel, len(shards)))
    for shard in shards:
        i = min(range(len(slots)), key=lambda j: slots[j])
        slots[i] += model.estimate_minutes(shard)
    return max(slots)


def runner_minutes(shards, model):
    return sum(model.estimate_minutes(s) for s in shards)


def rebalance(items, shards, model, parallel, factor, budget, max_shards):
    """Re-run pass 1 at shorter deadlines; keep the plan that finishes first.

    `shards` is pass 1 itself, at deadline `budget`, and is always in the
    running: it is the cheapest plan available and the fallback when nothing
    faster is affordable.
    """
    affordable = factor * runner_minutes(shards, model)
    if factor <= 1.0 or len(shards) >= min(max_shards, len(items)):
        return shards

    # Keyed by leg sizes, which pin the cut positions of a contiguous plan: two
    # deadlines that cut in the same places are one candidate, not two.
    family = {tuple(len(s) for s in shards): shards}
    for i in range(1, DEADLINE_SAMPLES):
        plan = greedy(items, model, budget * i / DEADLINE_SAMPLES)
        family.setdefault(tuple(len(s) for s in plan), plan)

    scored = []
    for plan in family.values():
        cost = runner_minutes(plan, model)
        if cost <= affordable and len(plan) <= max_shards:
            scored.append((makespan(plan, model, parallel), cost, plan))

    # Fastest wall clock, and among plans that effectively tie on it, the one
    # that buys the fewest cold builds.
    good = min(span for span, _cost, _plan in scored) + WORTH_IT_MINUTES
    return min((p for p in scored if p[0] <= good), key=lambda p: p[1])[2]


def main(argv):
    args = parse_args(argv)
    model = Model(args)
    items = read_items(sys.stdin)

    parallel = min(args.max_parallel, args.max_shards)
    shards = greedy(items, model, args.budget)
    before = {
        "shards": len(shards),
        "makespan_minutes": round(makespan(shards, model, parallel), 1),
        "runner_minutes": round(runner_minutes(shards, model), 1),
    }

    factor = max(1.0, args.split_factor)
    shards = rebalance(items, shards, model, parallel, factor,
                       args.budget, args.max_shards)

    # Capping drops the *oldest* shards; the next run replans them.
    deferred = 0
    if len(shards) > args.max_shards:
        dropped = shards[:len(shards) - args.max_shards]
        deferred = sum(len(s) for s in dropped)
        shards = shards[len(shards) - args.max_shards:]

    out = {
        "shards": [
            {
                "commits": [
                    {"sha": sha, "objects": objects,
                     "weight_minutes": round(weight, 2)}
                    for (sha, objects), weight in zip(shard, model.weights(shard))
                ],
                "build_minutes": round(model.build_minutes(shard), 1),
                "estimate_minutes": round(model.estimate_minutes(shard), 1),
            }
            for shard in shards
        ],
        "deferred": deferred,
        "split": {
            "factor": factor,
            "splits": len(shards) - before["shards"],
            "before": before,
            "after": {
                "shards": len(shards),
                "makespan_minutes": round(makespan(shards, model, parallel), 1),
                "runner_minutes": round(runner_minutes(shards, model), 1),
            },
        },
    }
    json.dump(out, sys.stdout, indent=2)
    sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
