# Stage 5: extend `main-dev`

*Reference for stage 5 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

[`scripts/series-advance.sh`](/scripts/series-advance.sh) appends the next chunk of `main-build` and pushes,
**whether or not the commits already in flight have reported**.
A commit that has not been judged yet is not a reason to hold the buffer:
waiting for a full CI cycle before topping it up costs a cycle per firing and buys nothing,
because `each.yaml` plans every commit in `main-green..tip` without a verdict,
so a longer tip is simply more work planned in the same pass.

A **known failure** does stop the stage.
Once a commit in `main-green..main-dev` has reported `failure`,
stage 2 is going to fold a fix into it and replay everything above,
so anything appended now is work minted only to be re-minted.
Extend on pending, never on red.
The stage-3 walk stops at the first commit without a verdict, so the script scans the whole range for a red here.

## The chunk starts small, and grows as rounds come back green

The chunk is the most buffer commits one run appends:
`--chunk` for that run, else the `chunk:` on the series' entry in [`scripts/series.yaml`](/scripts/series.yaml), read from `main`, else 100.

It bounds what a fold throws away.
A repair folds into the commit that needs it and replays everything above, so every commit above a red is minted and judged again,
and while a series adapts to a new engine most of them are red for a cause already being repaired below them.
On 2026-10-16 the first 100 commits of a fresh replay went to CI at once and 96 came back red for a handful of causes,
so each round, about two hours for 100 commits, mostly re-judged commits that inherited a cause the last fold had fixed.

So the declared chunk is the size for a series that is adapting, and it is where the window starts after a seed or a rewind of `main-dev`.
Once a round comes back mostly green, a firing passes a larger `--chunk`,
and the next red low in the window sends it back to the declared size.
Raising the declared chunk itself is a pull request against `main`, for a series that has stopped adapting.

## The anchor, and the replay

While `-dev` sits on `-build`'s line this is a plain ref move.
After a repair it is a replay of the buffer commits onto the repaired tip,
anchored on the `-build` commit equivalent to `-dev`'s newest **vendor** commit.
Not its tip: `-dev` also carries commits that vendor nothing,
tooling cherry-picked from `main`, the adaptations folded in during repair, patch-stack rebuilds,
and the anchor is about how much of the buffer has been consumed, which only vendor commits record.

The replay picks one commit at a time with `--empty=drop`,
so a buffer commit whose content reached `-dev` by another route replays to nothing and is dropped:
a `patch/` entry goes down both paths on purpose, the port carrying it onto `-dev` and the same fix picked onto `-build` from the strand.
A buffer tooling sync is skipped, never picked (stage 4).

**The counter is restamped.**
Every buffer commit moves `DESCRIPTION`'s `Version:`, so the `ours-version` merge driver decides it on each pick
([`scripts/merge-version.sh`](/scripts/merge-version.sh), registered by [`scripts/setup-git.sh`](/scripts/setup-git.sh)):
it takes the component-wise maximum when both sides carry the same `major.minor.patch`, and keeps our side verbatim when they do not,
which freezes the fifth component for the whole chain.
So the script bumps the fifth component on every replayed vendor commit that did not rise, from its parent's value,
and then asserts that every one rose before it pushes.

## A conflicting replay stops the stage, and it is meant to

A conflict means the repair and the buffer touch the same paths, which is judgement,
and guessing costs a wrong commit on a chain CI is about to judge.
The worktree is kept with the conflict in it, no ref is written, and the script prints where:

```sh
cd <the worktree it names>                     # resolve, then git add
scripts/series-advance.sh main --continue     # or --abort to discard
```

`--continue` finishes that commit and completes the rest of the same chunk.
`--abort` throws the worktree away and leaves every ref untouched, so the next firing simply reaches the same stop.
Starting a fresh run beside a stopped one is refused, because it would replay over a resolution somebody made.

**A resolution that comes out empty is a resolution.**
The buffer commit's content reached `-dev` by another route, so resolving toward what `-dev` already has leaves nothing to commit;
`--continue` drops that pick and finishes the chunk, which is what `--empty=drop` does for the same commit when it merges cleanly.

The script's carry of a base series' fixes into a forward, with its `Carried from` and `Not carried` trailers and its glue gate,
runs only on an `-fwd` series; rigraph has none.

## After the push

The push triggers one `each-rcc` run for the commits it added,
and every verdict that run reaches is readable from it as soon as the leg has written it.
The leg's own publish fills the store behind it.

**Mint without pushing when CI should judge the chunk folded, not as minted.**
When R-side fixes or a doc sweep wait for the commits a chunk adds, `--no-push-dev` leaves it in the local ref `refs/series/main-dev-next`.
The script prints the leased push to run once the folds are in, and its header says how `--continue` and `--abort` treat the option.

**Realign the rc strand, last.**
Once `main-rc-dev` exists, `scripts/series-rc.sh main --push` follows every write this firing made to `main-dev`,
here or in stages 2 and 4,
so the unflavored strand never lags the one it mirrors ([`series-rc`](/.claude/skills/series-rc/SKILL.md)).
Its own reds are not repaired on the rc strand: a fix goes to `main-dev`, and the next realignment carries it.
The strand is cut only when a landing is planned, because it doubles the commits CI judges;
until then there is nothing to realign.
