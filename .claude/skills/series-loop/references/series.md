# The four branches of a series, and what is and is not one

*Reference for [`series-loop`](../SKILL.md)'s branch model, read on a first firing and whenever a ref looks wrong;
the handbook leaf is [`branches/model/`](/handbook/branches/model/README.md).*

Equivalence between `-build` and `-dev` commits is by the
`duckdb/duckdb@<sha>` reference in the commit subject —
the subject is machine-readable state,
which is also how `vendor-one.sh` finds its base.
The `(tag …)` marker beside it counts too:
a tag upstream pushes after its commit was vendored is re-stamped
as a second vendor commit for the same SHA
([`scripts/VENDORING.md`](/scripts/VENDORING.md#a-tag-upstream-pushed-late)).

**The subject is what decides, never the path.**
`src/duckdb/` is not a proxy for "vendored here":
the patch stack is applied to the vendored tree in place,
so every CRAN and compiler-warning fix lands under `src/duckdb/`
carrying no upstream SHA —
89 such commits on `main` today.
A pathspec narrows the walk and nothing more;
a reader of this state looks *past* such commits,
and `vendored_sha()` does so 20 deep —
far more than a series stacks above its buffer,
and bounded so the walk ends by itself.
Reading the newest commit that merely *touched* the directory
answers with a commit that vendored nothing,
which is how `scripts/series-advance.sh` came to refuse
branches that had vendored perfectly well.
Should 20 ever not be enough, the helper says so on stderr
rather than answering wrongly; raise it then.

**A series is discovered, not configured**:
each firing lists `refs/heads/*-build`,
and every `<X>-build` with a sibling `<X>-dev` is a series it serves —
base and forward (`<S>-fwd-*`, see `series-forward/SKILL.md`) alike,
in one pass over all of them.
A forward's `<S>-fwd-vendor` is no series and gets no stage:
it is the vendor strand the forward wrote once, read by a human and nothing else
([`branches/model/`](/handbook/branches/model/README.md)).
Ignore a forward series
whose green is an ancestor of its base series' green;
that is cutover litter pending deletion
(the base moves on after cutover, so equality cannot be the test).
`<S>-rc-dev` has no `-build` beside it and is not a series of its own:
it is the unflavored mirror of `<S>-dev`, derived commit for commit
([`series-rc/SKILL.md`](/.claude/skills/series-rc/SKILL.md)).
Nor are `<S>-alpha` and `<S>-rc-alpha`, each one stamp commit on a green commit or its rc twin
([`series-alpha/SKILL.md`](/.claude/skills/series-alpha/SKILL.md)).
Nor is `<L>-land-dev` with its `<L>-land-green`, a line on its way onto `main`
([`series-land/SKILL.md`](/.claude/skills/series-land/SKILL.md)).

**All four refs exist from day one, and green starts below the flavor
commits.**
A forward is bootstrapped with three refs at the seed tip,
"after flavoring", before any vendor commit,
and green at the commit the seed sits on;
an opening cuts the build pair and the dev pair from the parent's strands instead, each at its own cut,
below its reflavor
([`series-open/SKILL.md`](/.claude/skills/series-open/SKILL.md)):

    <S>-build-base = <S>-build = <S>-dev = the seed tip
    <S>-green = the seed's base, below the flavor commits

Stage 1 then populates `-build`;
the other three advance as the loop consumes and verifies,
and the first commits green crosses are the flavor commits,
once CI has judged them
([`branches/model/`](/handbook/branches/model/README.md)).
What `-green` serves is the series' *flavored* package,
so the seed contains the flavor pair, never just the unflavored base,
topped by a separate `chore: Add fifth version component` commit
stamping the `.0` — the vendor counter's zero,
so every commit on the series is orderable by version.
The fifth component belongs to dev branches only:
`flavor.sh` never stamps it,
and regular LTS flavors keep their four-component version.
There is never a "no green yet" state:
every walk below is bounded by `<S>-green`, from the first firing on.
