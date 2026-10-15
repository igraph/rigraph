---
name: series-land
description: Land rigraph's series on `main`, so that `main` and CRAN's `igraph` take the engine the series has vendored and CI has proved. Freeze `main`, build `main-land-dev` from `main-rc-dev` as vendor commits only, let CI judge every commit, and fast-forward igraph/rigraph's `main` onto it. A rare, human-run move; the first is expected once the series reaches igraph 1.0.1. Use when asked to land, move or promote the series onto `main`, or when the loop reports that a landing has become possible.
---

# Landing the series on `main`

`main` of `igraph/rigraph` takes a newer engine by **fast-forwarding onto the series' vendor commits**:
every upstream commit the series vendored, with the R-side fix CI demanded folded into it,
replayed without the flavor onto `main` itself and judged by CI one by one.
Nothing else reaches `main`: no flavor, no seed, and no port, because everything a port carries is `main`'s already.
It is a human-run, rare move.
The first landing is expected once the line reaches igraph 1.0.1, the seam where the replay of 0.10.17 to 1.0.1 ends
([`series-loop`](/.claude/skills/series-loop/SKILL.md)), and the loop reports from then on that it has become possible.

The series is `main`, and the landing's refs are named for it, `main-land-*`.
The scripts take the series as `<S>` and name the refs for its line `<L>`; for rigraph both are `main`.

duckdb-r lands a release line that replaces the one `main` released before, and parks that older line on a baseline of its own.
rigraph has one line and releases only from `main`, so nothing parks, and the parking steps are notes below.

## The refs

```mermaid
flowchart LR
  F["frozen main"] --> B["base: main, or tests<br>pinned above it"]
  RC["main-rc-dev: the series<br>without its flavor"] -->|"replay vendor commits,<br>series-forward-build.sh"| LD["main-land-dev"]
  B --> LD
  LD -->|"CI judges each commit;<br>a fix is folded in with series-fold.sh"| LG["main-land-green"]
  LG -->|"READY: fast-forward"| M2["main, on the new engine"]
  LD -.->|"R side only,<br>--review"| R["main-land-review:<br>a draft pull request, never merged"]
```

* **`main-land-dev`**, in the fork: `main` plus the vendor commits, and nothing else.
  CI judges it like any `-dev` ([`scripts/each-plan.sh`](/scripts/each-plan.sh)).
* **`main-land-green`**, in the fork: where CI's judgement starts.
  It is pushed at the frozen `main` and advanced over the commits that passed;
  the landing is ready when it equals `main-land-dev`.
* **`main-land-review`**, in `igraph/rigraph`: the same landing without its engine,
  for a draft pull request that is read and never merged (step 4).

There is no `main-land-build`, so the loop never mistakes the pair for a series.
All three are deleted once `main` has taken the landing.

## Before you start

* **The rc strand exists and has been judged.**
  `main-rc-dev` is cut only when a landing is planned ([`series-rc`](/.claude/skills/series-rc/SKILL.md)),
  so cut it early enough that CI has judged it through before the build; the landing rests on those unflavored verdicts.
* **The series is current.**
  `main` has taken every port of `main`, and its rc strand is aligned;
  the build refuses an rc strand behind its source, and its tree check refuses a series that lacks something `main` has.
* **`main-green` vendors what is to land.**
  The landing replays the rc strand up to its tip, commits the series has not proved yet included.
  Land once the stretch to land is green on the series and judged on the rc strand.
* **Nothing parks.**
  duckdb-r declares the outgoing line parked in `scripts/series.yaml` first; rigraph has no outgoing line,
  and `igraph` keeps releasing from `main`.

## 1. Freeze `main`

Every commit of the landing stands on one `main` commit, so `main` must not move until it fast-forwards.
A ruleset with no bypass list stops every update, pull requests and admins included.
A human with admin rights on `igraph/rigraph` runs these, and reads each output before the next.

Inspect: the rulesets on `main`, and the commit it freezes at.

```sh
R=igraph/rigraph
gh api repos/$R/rulesets --jq '.[] | [.id, .name, .enforcement] | @tsv'
gh api repos/$R/commits/main --jq .sha
```

Freeze it:

```sh
gh api -X POST repos/igraph/rigraph/rulesets --input - <<'EOF'
{
  "name": "freeze main",
  "target": "branch",
  "enforcement": "active",
  "bypass_actors": [],
  "conditions": {"ref_name": {"include": ["refs/heads/main"], "exclude": []}},
  "rules": [
    {"type": "update", "parameters": {"update_allows_fetch_and_merge": false}},
    {"type": "deletion"},
    {"type": "non_fast_forward"}
  ]
}
EOF
```

Verify: an `update` row from the new ruleset, and `never`.

```sh
gh api repos/igraph/rigraph/rules/branches/main --jq '.[] | [.type, .ruleset_id] | @tsv'
id=$(gh api repos/igraph/rigraph/rulesets --jq '.[] | select(.name == "freeze main") | .id')
gh api repos/igraph/rigraph/rulesets/$id --jq .current_user_can_bypass
```

The loop keeps running: it reads `main` and writes no ref there.

## 2. Park the outgoing line: not in rigraph

duckdb-r moves the outgoing line's baseline to the frozen `main` here.
rigraph has none, so there is nothing to do.

## 3. Build the landing

```sh
scripts/series-land.sh main --remote origin --canonical upstream          # build and check
scripts/series-land.sh main --remote origin --canonical upstream --push   # and write both refs
```

**Tests that pin what `main` must keep go underneath, not into the series afterwards.**
A pull request of tests written on `main`'s engine, one commit on the frozen `main`,
is the landing's base: `--base <its branch>`.
Its commit lands with the vendor commits, CI judges it from `main` up,
and the tree check expects it merged into the series' package,
so the series has to carry it too before the landing can pass:
port it by name, `scripts/series-port.sh main --apply <sha>`, and realign the rc strand.

[`scripts/series-land.sh`](/scripts/series-land.sh) replays with
[`scripts/series-forward-build.sh`](/scripts/series-forward-build.sh) in a worktree it keeps,
so everything that script stops on stops here, and a rerun resumes:

* **a conflict**: resolve it in the kept worktree the way the series resolved it, `git add`, rerun.
  rerere records the resolution, and a rebuild that meets the same conflict continues on its own;
* **a commit that vendors nothing and is not `main`'s**: decide where its change belongs and pass `--placed <sha>`.
  Ports of commits `main` already has are placed by their `-x` trailer, and tooling syncs by their subject;
* **the glue gate**: fix the glue in the commit that broke it and rerun.

The build ends with the tree check:
the landing's tip must be the package the rc strand holds,
except for `NEWS.md` and the READMEs, which are `main`'s by construction.
`DESCRIPTION` is compared whole, version included.
Anything else is something `main` has and the series lacks, or the other way round.
Fix it on the series and realign its rc strand; a rerun follows the strand from where the build stands.
Nothing is pushed until the check passes.
Two things the check cannot see are reported beside it:

* **files the landing deletes from `main`** outside the vendored strand and the tests, which the series lacks too.
  Each is a file the series lost on the way; restore it on the series before pushing.
* **resolutions rerere replayed**, named when the check fails.
  A wrong one is replayed as faithfully as a right one:
  rebuild with `--abort` and then `--attended`, which stops at every conflict with rerere's answer unstaged,
  and drop the wrong one there with `git rerere forget <path>`.

**The tests are held to the base's, and the push waits for them.**
The tree check compares the landing with the series, so a test the series stopped running passes it.
[`scripts/series-tests.sh`](/scripts/series-tests.sh) compares the landing's tests with its base's,
the frozen `main` and any tests pinned above it,
and the build refuses to push while one is lost:
a deleted file, block or snapshot entry, a skip the base does not make, or an engine gate, live or expired.
Restore each on the series in the vendor commit that took it, or take a gate out at the commit whose engine it names,
then realign the rc strand and rerun.
What a test expects may differ, and the report lists every such path with the commits that moved it,
marking one that a rewind changed and nothing put back.
A test that `main`'s engine passes and the new one cannot is not the landing's to decide:
it is adapted in the base, written to hold on both engines, and ported to the series like any pinned test.

Committer dates are pinned to the frozen `main`'s, so a rebuild from the same inputs mints the same SHAs
and CI does not judge a commit twice.

## 4. Open the R side for review

The landing's own diff is the engine's, the whole of igraph from one version to the next.
What changes for `main`'s maintainers is the rest: the glue, the Stimulus definitions, R code and tests the series changed on the way.

```sh
scripts/series-land.sh main --remote origin --canonical upstream --review --push
gh pr create --repo igraph/rigraph --draft --base main --head main-land-review \
  --title "Review: the R side of the main landing"
```

The run prints the build's test report as well; it belongs in the pull request's description,
because it is the one place a reviewer reads every test change the landing makes at once.

`main-land-review` is the frozen `main`, one commit that removes every workflow,
and one commit for each landing commit that changes anything outside the vendored strand and what vendoring regenerates,
carrying that change alone under the upstream commit that asked for it.
Its checks could only fail, because the R side compiles against no engine there,
and without workflow files the pull request starts nothing that builds or tests it.
It is never merged: a finding is fixed on the series, the landing is rebuilt,
and `--review --push` rewrites the branch, which the pull request follows.

**Findings converge in iterations before the series takes them.**
An iteration is a landing branch of its own, `main-land-v<n>`, with no `-dev` suffix so nothing builds it,
made from the previous one by folding each fix into the landing commit that introduced the defect,
so that every commit from there on carries it and every intermediate commit passes;
nothing is stacked on top of the vendor commits.
A fix is written as a commit on the commit it folds into,
and [`scripts/series-fold.sh`](/scripts/series-fold.sh) folds it there and replays everything above,
adding a note to the folded commit's message.
It is checked by the glue gate at every commit it changed and by building its tip and running the suite.
Each gets a review pull request of its own,
`--review --landing main-land-v<n> --suffix -v<n>`,
read by a reviewer with a clean context;
the next iteration answers what that review found, until a review finds nothing.
The fixes then go onto the series, and the landing is built from it as above.

## 5. Let CI judge every commit

Pushing `main-land-dev` starts the per-commit build over `main-land-green..main-land-dev`.
Read and advance it with

```sh
scripts/series-land.sh main --status --push
```

which moves `main-land-green` over the commits that passed and names the first that has not.
A red is repaired as the loop's stage 2 repairs one ([`series-loop`](/.claude/skills/series-loop/SKILL.md)):

* **the infrastructure's fault**: push `retry-main-land-dev` at the commit, once;
* **the tree's fault**: fix it on the series, as stage 2 would, and realign its rc strand.
  In the kept worktree, `git reset --hard` to the parent of the red commit,
  then rerun the build: it follows the realigned strand and replays from there,
  so the landing never carries a fix the series does not.

## 6. Fast-forward `main`

When `--status` prints `READY`, every commit has passed and `main` is still the commit the landing stands on.
Push the SHA that line names, not whatever the branch holds by then,
so a repair pushed in between cannot reach `main` unjudged.
Lift the freeze, push, and put it back until the step below is done:

```sh
sha=<the SHA the READY line names>
id=$(gh api repos/igraph/rigraph/rulesets --jq '.[] | select(.name == "freeze main") | .id')
gh api -X PUT repos/igraph/rigraph/rulesets/$id -f enforcement=disabled
git push upstream $sha:refs/heads/main
gh api -X PUT repos/igraph/rigraph/rulesets/$id -f enforcement=active
git ls-remote upstream refs/heads/main
```

The push is a plain one, so git refuses it unless it is a fast-forward.
It needs whatever bypass `main`'s own protection grants an admin, because it is not a pull request.

## 7. After the landing

Delete the freeze, so that `main` takes pull requests again:

```sh
id=$(gh api repos/igraph/rigraph/rulesets --jq '.[] | select(.name == "freeze main") | .id')
gh api -X DELETE repos/igraph/rigraph/rulesets/$id
```

The fledge workflow may open its version pull request first, against a version it does not expect;
close it in favour of the one below.

**`main`'s version.**
The landing ends on the series' version, the seed's four components and a vendor counter, `<a.b.c.d>.<n>`.
`main`'s own counter is the fourth component, so the first bump sets it explicitly,
`fledge::bump_version("<a.b.c.(d+1)>")`, which also drops the vendor counter;
pick a fourth component above any `main` carried before the landing.

**Then the series.**
`main` now carries the series' vendor commits under other SHAs, so every port lists them as VENDOR and never picks them,
and the series stands on a `main` older than the one that carries its own work.
Rebuilding it on the new `main` is a forward, which is not ported: this landing is the trigger to port it
(duckdb-r's `series-forward` skill with `scripts/series-forward-build.sh`).
Until then the loop keeps serving the series as it stands.

**Delete the landing**: `main-land-dev` and `main-land-green` on the fork,
`main-land-review` in `igraph/rigraph` with its draft pull request closed,
and the kept worktree with `scripts/series-land.sh main --abort`.
Keep `main-rc-dev` aligned while another landing is planned, or delete it until one is.
