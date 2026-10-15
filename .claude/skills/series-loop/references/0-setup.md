# Stage 0: setup

*Reference for stage 0 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

**Every branch, whole history, with tags.**
A firing reads across all of them, and a narrowed clone fails quietly
rather than loudly:

```sh
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
if [ "$(git rev-parse --is-shallow-repository)" = true ]; then
  git fetch --unshallow origin
fi
git fetch --prune --tags origin
git fetch -q upstream main
```

**Both repositories, because `main` is one of them.**
The series refs live in the fork and `main` belongs to the canonical
repository, which the fork mirrors on the Pull app's six-hour cycle
([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).
Every read of `main` a firing makes takes the canonical ref:
stage 4's port and its tooling sync,
and the flavor declaration stage 7 reports on.
A checkout that cannot reach it falls back to whatever the mirror last copied,
and the scripts say so when they do.
`upstream` is the remote name, the same one `--canonical` takes everywhere;
add it where a checkout has none.

`--depth` implies `--single-branch`, and a checkout made that way
sees no `*-build` refs at all —
so a firing on one enumerates zero series
and reports a clean pass over nothing.
Depth costs more subtly:
`vendored_sha()` walks 20 subjects deep,
`series-port.sh` needs a merge base with `main`
and patch-ids to dedupe against,
stage 3 asks whether green is an ancestor of dev,
and every one of those meets the graft boundary
and answers wrong or refuses.
Tags are not optional either:
`vendor-one.sh` reads `git describe --tags` for the version it stamps.
A clone that cannot reach a versioning tag used to stamp `v0.0.0`
and vendor on without a word,
which reaches CI as a test failure looking like the engine's —
every extension download 404s on `extensions.duckdb.org/v0.0.0/`.
The script now refuses such a clone before it vendors anything;
treat that refusal as the answer and fetch the tags.

**Establish how this firing reads results, once.**
Verdicts and logs come from the `each-rcc` runs that produced them (stage 2),
which needs Actions read access to the repository those runs live in.
Probe it here rather than per commit:
list the most recent `each-rcc` runs.
If that answers, the firing is on the run path for every stage below.
If it does not — no such access from this session at all —
the firing falls back to the `rcc2` store,
which still works, inside its 180-day window,
but is now an **emergency route** rather than a warm copy:
the sweep that filled its gaps is no longer a workflow at all
(duckdb/duckdb-r#2815),
so a firing that needs the store complete cannot get it, and says so ([`report.md`](report.md)).
Record which one served: the store exists to work around a log access
problem that may have passed, and retiring it waits on firings
that report they never had to open it.

**Read the open PRs, and use judgement about them.**
List the ones touching `.github/`, `scripts/` or `.claude/` —
the paths stage 4 ports —
and read the ones that change vendoring logic:
`vendor-one.sh`, the `series-*` scripts, `each*`, `rcc*`, these skills.
Earlier firings opened them, and an open PR is tooling
the series does **not** have:
stage 4 ports what `main` carries,
and `main` carries only what merged.

So each one is context for this firing, not an instruction to it.
A PR that documents a bug says a workaround is still to be paid,
and saves re-diagnosing from scratch what a previous firing wrote up.
A PR that is *changing* a behaviour says something else:
what looks like a fresh bug may be the thing already being fixed,
and repairing against the old behaviour wastes the repair.
Neither is a reason to wait for review,
and none of them is applied early —
the series gets a tooling change when it merges and stage 4 ports it,
never before.

**The handbook owns the code; this skill owns ref motion.**
Any change to code, tests or patches is bound by
[`handbook/`](/handbook/README.md)'s page for that area,
which this skill neither repeats nor overrides.
Read the page before changing anything it owns.
