# The series loop

The routine that walks the vendored igraph C library forward one upstream commit at a time, has CI judge every commit,
and publishes the verified prefix as `igraph.dev`: why it exists, what a firing does and never does, and when it runs.
How to run it is the playbook's, the skills listed under [the playbook](#the-playbook), and this page links them rather than restating them.

**Why a routine.**
The vendored copy advances one upstream commit at a time, every commit of `main-dev` building and passing on its own.
The replay of igraph 0.10.17 to 1.0.1 alone is several hundred upstream commits, each wanting a build, a verdict, and maybe a fix.
The walk is mechanical except where CI is red, so the loop does the walking and the repairs;
the moves that cannot be undone, opening the series and landing it on `main`, stay a person's.

**One series, `main`.**
It tracks upstream `main` and is published as `igraph.dev` from `main-green` ([`branches/flavors/`](/handbook/branches/flavors/README.md));
what each of its refs means and how far it may move is [`branches/model/`](/handbook/branches/model/README.md)'s.
All of them live in the fork, `krlmlr/rigraph`, and the loop writes these:

* `main-vendor`, `main-build`, `main-dev`, `main-green` and `main-build-base`, the series itself;
* `retry-main-dev`, at a commit whose run failed for reasons the commit had no part in;
* `main-rc-dev`, realigned after every write to `main-dev`, once a planned landing has cut it.

The `rcc2` verdict store belongs to the per-commit CI, which judges `main-green..main-dev`, and the loop only reads it
([`ci/per-commit/`](/handbook/operations/ci/per-commit/README.md)).
`main-land-*` belong to a landing in flight, and `main` is never the loop's to write.

**The line crosses its seam by itself.**
The walk follows the replay of igraph 0.10.17 to 1.0.1, rebuilt in `krlmlr/igraph`, then igraph/igraph's `main`,
joined at one vendor commit of tag 1.0.1, the seam ([`model/`](/handbook/operations/vendoring/model/README.md)).
Nothing changes by hand there, because the vendor run reads which stretch a branch is on from its newest vendored commit.
Every firing reports where the buffer stands, on the replay, at the seam or past it,
and once `main-green` vendors the seam, every firing reports that the first landing has become possible.

**The replay needs R-side work early.**
A dry run of the vendor stage on 2026-10-15 met broken glue at the sixth vendor commit past tag 0.11.0, which drops `igraph_multiple_t`,
and with the glue check off, a Stimulus failure at the fiftieth, which merges the weighted diameter and path-length functions
into their base functions ([`experiments/2026-10-15-series-dry-run/`](/experiments/2026-10-15-series-dry-run/README.md)).
So the first firings stop in the vendor stage for R-side work long before the seam, which is the walk working, not a fault.

## One firing

Setup always runs, so that every read below sees whole histories with every branch and tag;
each stage after it is skipped when it has nothing to do, and they run in this order:

* **Vendor onto `main-vendor`, then pick onto `main-build`.**
  Each upstream commit is vendored once, onto the strand, as what upstream and `patch/` alone determine;
  the pick onto the buffer regenerates the R side, stamps the version and checks that the glue compiles,
  and a fix that check or the generator asks for rides in the buffer commit that needs it ([`pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).
  CI never builds the buffer, so vendoring runs ahead of verification and red never blocks it.
* **Repair the oldest red on `main-dev`.**
  Each commit's verdict and log come from the run that decided it, and a failure is classified by what its log contains.
  The tree's fault is folded into the offending commit and the tail replayed,
  by the rules of [`adaptation/`](/handbook/operations/vendoring/adaptation/README.md);
  the infrastructure's is judged once more on `retry-main-dev`, and a commit that fails its retry is the tree's.
* **Advance `main-green`** over the commits with a successful verdict, fast-forward only, and mirror it into igraph/rigraph.
  Then read what r-universe built from the previous green, on the platforms the per-commit gate never covers;
  a red there never rewinds green, and is recorded in the message of the next `main-dev` commit.
* **Port `main`**, so that `.github/`, `scripts/` and `.claude/` on `main-dev` are byte-identical to `main`'s,
  and sync the buffer's tooling too, because a workflow fires from the branch it sits on.
* **Extend `main-dev`** from the buffer while verdicts are pending, but never above a red.
  A firing takes at most one chunk, the `chunk:` [`scripts/series.yaml`](/scripts/series.yaml) declares for the series, 10 for `main`,
  kept small while the series adapts to a new engine, because a fold low in the window rewrites everything above it,
  and then realigns `main-rc-dev` where it exists.
* **Open a pull request** against igraph/rigraph's `main` for whatever the tooling got wrong and the firing had to work around.

**A test a vendor commit stops would reach `main`.**
The adaptation rules say a series stops no test `main` runs but one whose function upstream removed, and the loop is where that binds:
a landing replays vendor commits only, so a deletion or a skip folded into one travels to `main`,
while a restore made later as a commit of its own travels with nothing.
That is why a test changes only inside the vendor commit whose engine asks for the change, never behind a check of the engine's version.

When a stage stops, the cause is told apart in [`troubleshooting/`](/handbook/operations/vendoring/troubleshooting/README.md).

## What it never does

* **Land.**
  It reports that a landing has become possible, and a person runs it with `series-land`.
* **Open the series.**
  It serves the refs it finds, and seeding them is a person's, once, with `series-open`.
* **Write outside the fork**, but for two things that rewrite nothing:
  `main-green`'s copy in igraph/rigraph, a plain push that is never forced ([`branches/mirrors/`](/handbook/branches/mirrors/README.md)),
  and the tooling pull requests it opens against `main`, which it never merges.
* **Move `main-green` backwards**, or over a commit without a completed, successful verdict.

**What is not ported.**
duckdb-r runs the same loop over several series, and what it needs for more than one line is not ported:
forwarding a series onto a newer `main`, release-branch series, and the alpha strand.
The `series-loop` skill's *Not ported yet* names the trigger for each.
The first landing is one of them, because `main` then carries the series' vendor commits under other SHAs,
and rebuilding the series on that `main` is a forward.

## When it runs

A firing is an agent session that follows the playbook; nothing under `.github/` starts one.
The loop is meant to fire on a schedule, from a routine whose schedule lives with the routine rather than in this tree.
No routine exists yet: creating one waits on the maintainer's agreement, so until then a firing happens only when someone starts one.

## The playbook

The skills carry the commands, the verdicts and the stop rules; this page carries why, and what the loop may touch.

* [`series-loop`](/.claude/skills/series-loop/SKILL.md): one firing, stage by stage, with a reference per stage beside it.
* [`series-open`](/.claude/skills/series-open/SKILL.md): seeding the series.
* [`series-rc`](/.claude/skills/series-rc/SKILL.md): the unflavored strand a landing rests on,
  cut only when a landing is planned, because CI then judges every commit twice.
* [`series-land`](/.claude/skills/series-land/SKILL.md): landing the series on `main`.

The skills and the scripts they drive are ported from duckdb-r ([`meta/local/`](/handbook/meta/local/README.md)).

## The scripts' shared arguments

Every `scripts/series-*.sh` takes the same options, so that one name is never passed where another belongs:

* positional is only what the script names: a series, or the two refs `series-forward-build.sh` and `series-tests.sh` compare;
* `--remote <name>`, the remote carrying the series refs: `$SERIES_REMOTE`, then `origin`;
* `--canonical <name>`, the remote of igraph/rigraph, where `main` lives and `main-green`'s copy goes:
  `$SERIES_CANONICAL`, then `upstream`; an empty `SERIES_CANONICAL` turns the mirror off, and an unset one does not;
* `--upstream <path>`, an igraph/igraph checkout on disk, read by `series-check.sh` alone: `$UPSTREAM_CLONE`;
* `-h` and `--help` print the usage on stdout and exit 0 before the script touches git;
* any other option, an option missing its value, or a positional the script does not name prints the usage on stderr and exits 2,
  so a caller can tell a wrong invocation from a wrong answer.

[`scripts/series-args-test.sh`](/scripts/series-args-test.sh) checks the contract across every one of them, offline.
