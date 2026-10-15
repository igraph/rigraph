# Stage 5: extend `<S>-dev`

*Reference for stage 5 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

Append the next ≤ 100 commits from `<S>-build` and push,
**whether or not the commits already in flight have reported**.
A commit that has not been judged yet is not a reason to hold the buffer:
the budget is 100 and the buffer is rarely near it,
so waiting for a full CI cycle before topping it up
costs a cycle per firing and buys nothing —
`each.yaml` plans every commit in `<S>-green..tip` without a verdict,
so a longer tip is simply more work planned in the same pass.

A **known failure** does stop the stage.
Once a commit in `<S>-green..<S>-dev` has reported `failure`,
stage 2 is going to fold a fix into it and replay everything above,
so anything appended now is work minted only to be re-minted.
Extend on pending, never on red.
While `-dev` sits on `-build`'s line this is a plain ref move;
after a repair it is a replay of the buffer commits
onto the repaired tip —
which is where the version counter is lost:
the `ours-version` merge driver keeps green's `Version:`
through every replayed commit,
so **restamp the fifth component before pushing**
(the playbook's invariants) —
`series-advance.sh` does both,
anchoring on the `-build` commit equivalent to
`-dev`'s newest **vendor** commit.
Not its tip: `-dev` also carries commits that vendor nothing —
tooling cherry-picked from `main`,
the adaptations folded in during repair,
and the patch-stack fixes that edit `src/duckdb/` in place
without vendoring anything —
and the anchor is about how much of the buffer has been consumed,
which only vendor commits record.

**A live forward counterpart is not an exception, and used to be.**
A series being replaced kept consuming nothing:
its refs stayed where the forward went live,
and the loop verified only what was already in flight.
That froze the one branch a cutover is measured against.
A forward is the same series rebuilt on a newer `main`,
so what makes the swap safe is that the two `-dev` branches
carry the same package (stage 6) —
and a frozen base can be compared only at the commit it stopped on,
which is the single point the two are already known to agree.
It also starved the carry below:
past the base's frontier there is no twin to match by vendored SHA,
so every fix the base had proved
was rediscovered on the forward as a red,
costing a repair and a replay of everything above it.
So a base series consumes its buffer like any other.
The cost is real — CI on a lineage about to be retired, twice over —
and it buys the only thing that makes retiring it a check
rather than a hope.

**On a forward series, the base's fixes are folded in here, where the buffer lacks them.**
`<S>-fwd-build` is replayed out of `<S>-dev` up to the commit the base had reached,
fixes folded in, and out of `<S>-build` above it
([`series-forward`](/.claude/skills/series-forward/SKILL.md)).
`-build` holds what the code needs to **compile** —
that being what the vendor gate checks at every commit —
and nothing of what CI demanded after that.
Those live on the base `<S>-dev`,
folded into the commit for the same upstream SHA,
and without this every one of them would be rediscovered
as a red commit costing a repair
and a replay of everything above it.
So as each buffer commit is consumed,
`series-advance.sh` looks its base twin up by vendored SHA
and folds into the same commit
whatever that twin's tree holds and its own `-build` commit's does not,
short of a test it would stop,
with the twin's message and a `Carried from` trailer.
A buffer commit replayed from the twin itself holds the fix already,
under a blob `main`'s drift may have moved on;
the stage recognises it by the twin's change reverse-applying there, and carries nothing twice.

**A carry never stops a test the forward runs.**
A twin folded at a rewind may have deleted a test or skipped one for good,
and the base's restore of it, where it made one, is a commit of its own that no twin lookup finds.
So a path under `tests/` whose carry would take a test away keeps what the forward has,
and the commit message names it under `Not carried`.
CI then judges the commit, and a red there is gated as stage 2 says.
An engine gate carries like any fix, because it re-arms its test by itself.

**The carry is a difference, not a list of directories,
and `src/` is not compile-only territory.**
The buffer already compiles,
so glue the `-dev` twin has *on top* of it
was demanded by something later than the compiler —
a test, a check, a platform r-universe reached and the gate never did —
and holding it back would strand exactly the fixes this exists to move.
The difference is also what stops the glue the buffer already carries
from being applied twice.

**The difference is by content, and a filename is not content.**
A file the buffer commit touched is still a file the twin may have
taken further, and skipping it because the name appears on both sides
drops that further work without saying so.
The vendor gate only syntax-checks the glue,
so a declaration carried without its definition compiles
and fails at the link, one whole CI cycle later
(duckdb/duckdb-r#2657).
Where the two genuinely diverge the three-way apply conflicts
and the stage stops, which is the attended path below —
a stop is the cost of the carry being complete.
Two kinds stay behind, neither of them a judgement about the fix:
the buffer's own strand — `src/duckdb/` and `patch/`,
since a forward regenerates the tree from its own patches —
and what vendoring regenerates:
`R/version.R`, `src/include/sources.mk`, the Makevars, the logos,
which differ between any two vendor runs of the same SHA
and are noise wearing the shape of a fix.

Carried glue is **named as it goes**.
Glue the base `<S>-dev` has and the base `<S>-build` lacks
is buffer drift: a fix folded during a repair
and never mirrored onto the buffer,
so the next tree regenerated there still wants it.
The carry unblocks the forward; mirroring it onto `<S>-build`
is the repair the line is asking for.

**A conflicting carry stops the stage, and it is meant to.**
The commit is picked and the fix will not apply,
because this series has moved the code out from under it —
which is judgement, and guessing costs a wrong commit
on a chain CI is about to judge.
The worktree is kept with the conflict in it, no ref is written, and:

```sh
cd <the worktree it names>          # resolve, then git add
scripts/series-advance.sh <S> --continue     # or --abort to discard
```

`--continue` finishes that commit with the twin's message
and completes the rest of the chunk;
`--abort` throws the worktree away and leaves every ref untouched,
so the next firing simply reaches the same stop.
Starting a fresh run beside a stopped one is refused,
because it would replay over a resolution somebody made.

**A carry into the glue that applies cleanly is compiled before it is kept.**
The three-way merge keeps both the twin's hunk and the buffer's own version of the same adaptation
when their context differs, which duplicates code rather than conflicting.
So `series-advance.sh` syntax-checks the glue after such a carry
and stops the same way, with the carry staged and the failing files named.

**A resolution that comes out empty is a resolution.**
The buffer commit's content reached `-dev` by another route —
a buffer whose flavor rename still names the path a port has since moved,
most plainly — so resolving toward what `-dev` already has
leaves nothing to commit.
`--continue` drops that pick and finishes the chunk,
which is what `--empty=drop` does for the same commit
when it merges cleanly (duckdb/duckdb-r#2734).
The push triggers one `each-rcc` run for the commits it added,
and every verdict that run reaches is readable from it
as soon as the leg has written it —
there is nothing to wait for a harvest for.
The store's own writer (the leg's publish;
`rcc-logs.sh` only when an operator runs it)
just fills the fallback copy behind it.

**Realign the rc strand, last.**
A series with an `<S>-rc-dev` gets `scripts/series-rc.sh <S> --push`
after every write this firing made to `<S>-dev`, here or in stages 2 and 4,
so the unflavored strand never lags the one it mirrors
([`series-rc/SKILL.md`](/.claude/skills/series-rc/SKILL.md)).
Its own reds are not repaired on the rc strand:
a fix goes to `<S>`, and the next realignment carries it.

**Then realign the alpha strand.**
A series with an `<S>-alpha` gets `scripts/series-alpha.sh <S> --push` on every firing, after its rc strand,
because it moves when upstream publishes an alpha as well as when `<S>-green` does
([`series-alpha/SKILL.md`](/.claude/skills/series-alpha/SKILL.md)).
An alpha whose commit green has not vendored yet writes nothing, and one with a gap in its extensions stops the script;
both go into the report, and neither is repaired here.
