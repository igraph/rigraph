# Stage 0: setup

*Reference for stage 0 of [`series-loop`](../SKILL.md), read when the stage has work.*

**Every branch, whole history, with tags.**
A firing reads across all of them, and a narrowed clone fails quietly rather than loudly.
`--depth` implies `--single-branch`, and a checkout made that way sees no `*-build` refs at all,
so a firing on one enumerates zero series and reports a clean pass over nothing.
Depth costs more subtly too:
`vendored_sha()` walks 20 subjects deep,
`series-port.sh` needs a merge base with `main` and patch-ids to dedupe against,
stage 3 asks whether green is an ancestor of dev,
and every one of those meets the graft boundary and answers wrong or refuses.

**Both repositories, because `main` is one of them.**
The series refs live in the fork, and `main` belongs to the canonical repository,
which the fork mirrors on the Pull app's six-hour cycle ([`.github/pull.yml`](/.github/pull.yml)).
Every read of `main` a firing makes takes the canonical ref: stage 4's port and its tooling sync above all,
because a port against a stale mirror reverts onto the series whatever merged since.
A checkout that cannot reach it falls back to whatever the mirror last copied, and the scripts say so when they do.
`origin` is the fork and `upstream` the canonical repository,
the names `--remote` and `--canonical` default to in every `scripts/series-*.sh`;
where a session named them otherwise, pass those options rather than renaming.
[`scripts/setup-git.sh`](/scripts/setup-git.sh) registers the `ours-version` merge driver and rerere, which a fresh clone lacks;
`series-advance.sh` and `series-port.sh` also run it themselves.

## The upstream clone

**History and tags**, because igraph's CMake writes `git describe --tags` into `IGRAPH_VERSION`,
which every vendor commit carries and the engine gates of stage 2 compare against.
A shallow clone answers `describe` from what it can reach, and a tagless one cannot answer at all,
so `vendor-one.sh` refuses either with exit 6 before it vendors anything; fetch, do not work around it.
`vendor-one.sh` pins `core.abbrev` to 9 in its own clone, so the version header depends on the upstream commit alone.

**The replay as a branch under `refs/heads/`.**
`vendor-one.sh` makes its own clone of the clone it is given, in `igraph/` inside the buffer worktree, and only branches travel into it.
A replay held as a remote-tracking ref alone is left behind,
and the run stops with exit 1: the clone does not have the commit the branch last vendored.

**The replay's tags.**
A fetch into a local ref follows the tags pointing into what it fetched,
and `krlmlr/igraph` carries tags on the replay that igraph/igraph does not, `0.11.0` among them.
They decide the `IGRAPH_VERSION` every later replay commit vendors, and which replay commit is vendored as a tag,
so a clone without them vendors different trees from the same commits: never fetch the replay with `--no-tags`.

**HEAD on igraph/igraph's `main`**, because past the seam the clone's HEAD is the right-hand end of the walk (stage 1).

**Absolute paths.**
`vendor-one.sh` changes into `VENDOR_REPO` before it clones the clone, so a relative path is read against the buffer worktree.

**The tools a vendor run needs**, which a fresh session may lack:
R with the package's dependencies and `decor`, which `cpp11::cpp_register()` needs;
`cmake`, for the version header;
`flex` and `bison` on the PATH, which the scripts run with `DOCKER=` instead of the container `Makefile-cigraph` defaults to;
and `python3` with `venv`, for the Stimulus virtualenv `Makefile-cigraph` builds from `tools/build-requirements.txt`.

## How this firing reads results

Verdicts and logs come from the `each-rcc` runs that produced them (stage 2),
which needs Actions read access to `krlmlr/rigraph`, where those runs live.
Probe it here rather than per commit: list the most recent `each-rcc` runs.
If that answers, the firing is on the run path for every stage below.
If it does not, the firing falls back to the `rcc2` store, which still works inside its 180-day window,
but as an **emergency route** rather than a warm copy:
the sweep that filled its gaps is not ported,
so a firing that needs the store complete cannot get it, and says so ([`report.md`](report.md)).
Record which one served: the store exists to work around a log-access problem that may pass,
and retiring it waits on firings that report they never had to open it.

## The open pull requests

List those of `igraph/rigraph` touching `.github/`, `scripts/` or `.claude/`, the paths stage 4 ports,
and read the ones that change vendoring logic: `vendor-*.sh`, the `series-*` scripts, `each*`, `rcc*`, these skills.
Earlier firings opened them, and an open pull request is tooling the series does **not** have:
stage 4 ports what `main` carries, and `main` carries only what merged.

So each one is context for this firing, not an instruction to it.
One that documents a bug says a workaround is still to be paid,
and saves re-diagnosing from scratch what a previous firing wrote up.
One that is *changing* a behaviour says something else:
what looks like a fresh bug may be the thing already being fixed, and repairing against the old behaviour wastes the repair.
Neither is a reason to wait for review, and none of them is applied early:
the series gets a tooling change when it merges and stage 4 ports it, never before.

## The repository's rules own the code

Any change to code, tests or patches is bound by [`AGENTS.md`](/AGENTS.md)
and, for the generated interface, by [`tools/README.md`](/tools/README.md), which this skill neither repeats nor overrides.
What this skill adds are the rules for adapting the R side to a new engine (stage 2), and every ref move.
