# Invariants

What a series guarantees, and what would actually catch a violation.

* **Linearity**: the series' history is linear and merge-free, so it stays bisectable; ports are cherry-picks.
* **One upstream commit per vendor commit**, contiguous along the tracked line ([`operations/vendoring/model/`](/handbook/operations/vendoring/model/README.md)).
* **Green per commit**: a `-green` ref only ever fast-forwards, and only over commits with recorded successful runs, the seed's included.
* **Version**: each strand advances its own version component and freezes the other; the fifth rises with every vendor commit.
* **Source of truth**: R-side work is born on `main` and reaches a series by porting, never the reverse.
* **Flavor**: the names inside a branch agree with each other everywhere in the branch.
* **Tests**: a series stops no test `main` runs but one whose function upstream removed ([`operations/vendoring/adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).

**Most of these are enforced by nothing but the routine and review.**
[`scripts/series-advance.sh`](/scripts/series-advance.sh) checks two on every firing:
`-green` moves only where `git merge-base --is-ancestor` says the move is a fast-forward,
and a replay is kept only once every vendor commit in it carries a version strictly above its parent's.
The flavor family is checked per commit by the gate's `flavor` stage, and the tests family by [`scripts/series-tests.sh`](/scripts/series-tests.sh),
which `series-check.sh` and a landing run.
Linearity is checked by nothing at all.
