# Analysis of Reverse Dependency Problems

This document provides analysis and recommended fixes for the packages flagged as **newly broken** in the most recent `revdepcheck` run against the development version of igraph.

Source data: [`problems.md`](problems.md), [`failures.md`](failures.md), [`cran.md`](cran.md), [`README.md`](README.md). Runnable reproducers and reprex-style outputs for each issue are in [`examples/`](examples/).

## Summary

22 CRAN packages have live issues against the dev version of igraph. Two igraph changes account for almost all of them:

- [#2634](https://github.com/igraph/rigraph/pull/2634) — **lifecycle advancement** of many already-deprecated functions/arguments from `deprecate_warn` to `deprecate_stop` (a hard error). Accounts for groups A–E.
- [#2615](https://github.com/igraph/rigraph/pull/2615) — **`tkplot()` removal**: the interactive plotter advanced to `deprecate_stop("3.0.0", "tkplot()")`. Accounts for group F.

A small group G collects two pre-existing API-tightening / behavioural changes that surfaced again in this revdep run independently of the two PRs above.

| # | Group | Packages |
|---|---|---|
| A | `bfs/dfs(father = )` argument defunct in 2.2.0 | tidygraph, nat, dci, ggraph, scistreer |
| B | Defunct top-level functions (rename in caller) | comato, ECoL, vkR |
| C | Defunct argument values / behaviors on retained functions | cranly, qgraph, GoodFitSBM |
| D | Deprecation warnings surfacing as NOTE/WARNING | FrF2, R6causal, migraph |
| E | Indirect path through a defunct fallback | degreenet |
| F | `tkplot()` defunct (igraph 3.0.0) | Boptbd, c3net, ggm, optbdmaeAT, optrcdmaeAT |
| G | API tightening / behavioural changes | jewel, rSpectral |

(9 additional packages are listed under "failed to check" in [`README.md`](README.md); these are install-time failures unrelated to igraph and are out of scope for this analysis.)

---

## Group A — `bfs/dfs(father = )` argument defunct (igraph 2.2.0)

The `father` argument of `bfs()` and `dfs()` was renamed to `parent` in igraph 2.2.0 (deprecation warning then) and is now defunct (hard error). Affected packages call either function directly, or via `tidygraph::map_bfs*` / `map_dfs*`.

### 1. tidygraph (1.3.1)

#### Issue
```
! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
  now defunct.
ℹ Please use the `parent` argument instead.
```
Triggered from `tidygraph:::bfs_df()`, which calls `igraph::bfs(..., father = ...)`. Breaks examples and tests.

#### Root cause
Lifecycle advancement of the `father` argument from `deprecate_warn` to `deprecate_stop`.

#### Assessment
**Intentional API rename in igraph.** tidygraph is the root of the visible cascade — dci, ggraph, and scistreer all funnel through tidygraph's `map_bfs*` family.

#### Recommendation
**For tidygraph**: rename `father` → `parent` in every call to `igraph::bfs()` and `igraph::dfs()`.

**Severity**: High — package broken; blocks several downstream packages.

---

### 2. nat (1.8.25)

#### Issue
Same defunct-argument error as tidygraph, but from a direct call:
```r
igraph::dfs(x, root = origin, father = TRUE, mode = "all")
```
in `nat:::as.seglist.igraph()`. Breaks examples, 38 test failures, vignette `neurons-intro.Rmd`.

#### Root cause
Same as tidygraph — `father=` is defunct.

#### Assessment
**Intentional API rename in igraph.** Direct caller; not a cascade.

#### Recommendation
**For nat**: change to `igraph::dfs(x, root = origin, parent = TRUE, mode = "all")` (and update any downstream code that consumes the returned `father` element to read `parent` instead).

**Severity**: High.

---

### 3. dci (1.0.3)

#### Issue
Same error message; reached via `tidygraph::map_bfs()` in `dci:::node_labeling()`. Breaks examples, 3 tests, and the `user_guide.Rmd` vignette.

#### Root cause
Cascade through tidygraph.

#### Assessment
**Cascading failure** — will be resolved automatically once tidygraph updates.

#### Recommendation
No direct fix needed in dci. Bump the minimum tidygraph version once tidygraph ships a fix.

**Severity**: High (broken), but resolved on tidygraph release.

---

### 4. ggraph (2.2.2)

#### Issue
Same error; via `tidygraph::map_bfs_chr()` / `map_bfs_back_chr()` used inside ggraph's examples and `Edges.Rmd` vignette.

#### Root cause
Cascade through tidygraph.

#### Assessment
**Cascading failure**.

#### Recommendation
No direct fix needed in ggraph. Will be resolved by the tidygraph release.

**Severity**: High (broken), but resolved on tidygraph release.

---

### 5. scistreer (1.2.1)

#### Issue
Same error; via `tidygraph::map_bfs()` inside `scistreer::annotate_tree() → mut_to_tree()`. Breaks examples.

#### Root cause
Cascade through tidygraph.

#### Assessment
**Cascading failure**.

#### Recommendation
No direct fix needed in scistreer. Will be resolved by the tidygraph release.

**Severity**: High (broken), but resolved on tidygraph release.

---

## Group B — Defunct top-level functions

### 6. comato (1.1)

#### Issue
```
! `layout.spring()` was deprecated in igraph 2.1.0 and is now defunct.
ℹ Please use `layout_with_fr()` instead.
```
Triggered from `comato:::plot.conceptmaps()` which passes `layout = "spring"` to `plot()`, which dispatches to `igraph::layout.spring()`. Also still emits a deprecation warning for `graph.union()`.

#### Root cause
`layout.spring()` advanced to defunct (also `layout.svd()` and `layout.fruchterman.reingold.grid()` in the same lifecycle pass).

#### Assessment
**Bug in comato** — references a layout function that has been deprecated since igraph 2.1.0.

#### Recommendation
**For comato**: replace `layout.spring()` with `layout_with_fr()` (and address the `graph.union()` → `union()` warning at the same time).

**Severity**: High — example error.

---

### 7. ECoL (0.3.0)

#### Issue
```
! `hub.score()` was deprecated in igraph 2.0.0 and is now defunct.
ℹ Please use `hits_scores()` instead.
```
Triggered from `ECoL:::c.Hubs()` → `igraph::hub.score(graph)`. Breaks examples and 3 tests.

#### Root cause
`hub.score()` and `authority.score()` both advanced from deprecated to defunct; both replaced by `hits_scores()`.

#### Assessment
**Bug in ECoL** — uses a function name deprecated since igraph 2.0.0.

#### Recommendation
**For ECoL**: replace `igraph::hub.score(graph)` with `igraph::hits_scores(graph)$hub`. (And if `authority.score()` is also used elsewhere, replace with `hits_scores(graph)$authority`.)

**Severity**: High — example and test errors.

---

### 8. vkR (0.2)

#### Issue
```
checking dependencies in R code ... WARNING
  Missing or unexported object: 'igraph::get.edge'
```

#### Root cause
`get.edge()` was hard-deprecated and then removed from igraph (NEWS: "`get.edge()` has been removed"). The replacement is `ends()`.

#### Assessment
**Bug in vkR** — references a function that no longer exists.

#### Recommendation
**For vkR**: replace `igraph::get.edge(graph, e)` with `igraph::ends(graph, e)` (note the call signature changed — see `?ends`).

**Severity**: Medium — R CMD check WARNING; will become an error if/when the affected code path is exercised.

---

## Group C — Defunct argument values / behaviors on retained functions

### 9. cranly (0.6.0)

#### Issue
```
The `scale` argument of `eigen_centrality()` always as if TRUE as of
igraph 2.1.1.
ℹ Normalization is always performed
```
Triggered from `summary.cranly_network()` via `igraph::eigen_centrality(cranly_graph, scale = FALSE)`. Breaks the `cranly.Rmd` vignette re-build.

#### Root cause
`eigen_centrality(scale = )` was deprecated in igraph 2.1.1 (#1543) and is now defunct: normalization is now mandatory.

#### Assessment
**Bug in cranly** — relies on an argument whose effect has been removed.

#### Recommendation
**For cranly**: drop the `scale = FALSE` argument: `igraph::eigen_centrality(cranly_graph)`. If un-normalized values are genuinely needed downstream, scale them manually afterwards.

**Severity**: High — vignette error.

---

### 10. qgraph (1.9.8)

#### Issue
```
! The `method` argument of `sample_degseq()` must be fast.heur.simple
  instead of simple.no.multiple as of igraph 2.1.0.
```
Triggered from `qgraph::smallworldness()` via the deprecated alias `igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple")`.

#### Root cause
`sample_degseq()` had three legacy method values (`"simple"`, `"simple.no.multiple"`, `"simple.no.multiple.uniform"`) which were renamed in 2.1.0 and have now been advanced to defunct (`deprecate_stop`).

#### Assessment
**Bug in qgraph** — pinned to an obsolete method name.

#### Recommendation
**For qgraph**: replace `method = "simple.no.multiple"` with `method = "fast.heur.simple"`. While there, replace the deprecated alias `degree.sequence.game()` itself with `sample_degseq()` to silence the upstream warnings (`watts.strogatz.game`, `average.path.length`, `degree.sequence.game`).

**Severity**: High — example error.

---

### 11. GoodFitSBM (0.0.1)

#### Issue
```
! The `vp` argument of `get_edge_ids()` supplied as a matrix should be a
  n times 2 matrix, not 2 times n as of igraph 2.1.5.
ℹ either transpose the matrix with t() or convert it to a data.frame with two
  columns.
```
Triggered from `GoodFitSBM:::Get.Induced.Subgraph()` via `igraph::get.edge.ids(g, pairs)`.

#### Root cause
The matrix-form `vp` argument's orientation was corrected in igraph 2.1.5 (previously 2×n, now n×2). The behavior was deprecation-warning at first; this lifecycle pass advanced it to defunct.

#### Assessment
**Bug in GoodFitSBM** — passes the matrix in the old, no-longer-accepted orientation.

#### Recommendation
**For GoodFitSBM**: transpose the matrix before the call (`t(pairs)`), or convert to a 2-column data frame, or pass a flat vertex-pair vector. Also rename the deprecated alias `get.edge.ids()` → `get_edge_ids()`.

**Severity**: High — example error.

---

## Group D — Deprecation warnings surfacing as NOTE/WARNING

These packages do not yet hard-error against the dev igraph; their checks fail because deprecation warnings leak into output where none are expected.

### 12. FrF2 (2.3-4)

#### Issue
`checking tests ... NOTE` — multiple igraph deprecation warnings (`graph.empty()`, `add.edges()`, `independence.number()`, `clique.number()`) appear in `godolphintest.Rout` and diverge from `godolphintest.Rout.save`.

#### Root cause
None of those functions are defunct yet; they emit warnings. The `.Rout.save` comparison treats any new output as a check failure.

#### Assessment
**Bug in FrF2** — uses long-deprecated function names; will hard-fail when the next lifecycle pass advances any of these to defunct.

#### Recommendation
**For FrF2**: rename to the current API:
- `graph.empty()` → `make_empty_graph()`
- `add.edges()` → `add_edges()`
- `independence.number()` → `ivs_size()`
- `clique.number()` → `clique_num()`

Then regenerate the `.Rout.save` files.

**Severity**: Low (NOTE only), but pre-emptive: these functions are queued for defunct.

---

### 13. R6causal (0.8.3)

#### Issue
`checking whether package ‘R6causal’ can be installed ... WARNING` — significant install-time deprecation warnings:
```
Warning: `set.edge.attribute()` was deprecated in igraph 2.0.0.
Warning: `induced.subgraph()` was deprecated in igraph 2.0.0.
Warning: `get.vertex.attribute()` was deprecated in igraph 2.0.0.
```

#### Root cause
Deprecated alias names still being called at package load / `.onLoad` time.

#### Assessment
**Bug in R6causal** — replace with current names; will hard-fail on the next lifecycle pass.

#### Recommendation
**For R6causal**:
- `set.edge.attribute()` → `set_edge_attr()`
- `induced.subgraph()` → `induced_subgraph()`
- `get.vertex.attribute()` → `vertex_attr()`

**Severity**: Medium — install WARNING (and pre-emptive).

---

### 14. migraph (1.6.2) — failure surface; **upstream owner is [manynet](https://github.com/stocnet/manynet)**

#### Issue
```
── Failure ('test-tutorials_migraph.R:12:5'): migraph tutorial code runs without warnings or errors ──
Expected `w` to be NULL.
...
Warning in expression 17 : rg <- create_ring(32, width = 2)
```
A migraph tutorial test asserts that none of its code expressions emit warnings; the tutorial line `rg <- create_ring(32, width = 2)` emits a deprecation warning that bubbles up through migraph's no-warning assertion.

#### Where the call actually lives
`create_ring()` is **not** a migraph function — it's defined in [`manynet`](https://github.com/stocnet/manynet/blob/main/R/make_create.R) (which migraph `Depends` on). The `width = 2` branch goes:
```
manynet::create_ring(32, width = 2)
  └─ igraph::make_ring(32, directed = FALSE)
  └─ manynet::as_matrix(...)        # uses igraph::as_adjacency_matrix()
  └─ igraph::graph_from_adjacency_matrix(out, "undirected")
```
The deprecation warning originates somewhere inside this chain on dev igraph; the revdep backtrace stops at testthat's `quasi_label()` so the exact igraph function is not surfaced in the log.

#### Status (preliminary)
Against the latest CRAN versions (manynet 2.0.1 + igraph 2.3.1) the call runs cleanly with no warning. **Cannot be reproduced against dev igraph from this environment** (we'd need to build dev locally to confirm), so it's unclear whether the warning still fires. manynet had a major 2.0.0 release that reworked `as_matrix.igraph()` for multiplex networks; it's plausible the relevant deprecated call has already been removed there.

#### Assessment
**Bug in manynet** if the warning still fires against dev igraph. migraph is just the failure surface — its tutorial's strict no-warning assertion happens to expose whatever manynet emits.

#### Recommendation
**For us**: re-confirm against dev igraph on the next revdep run. If the warning still fires, identify the specific call from manynet's `as_matrix.igraph()` / `graph_from_adjacency_matrix()` path that triggers it.

**For manynet**: address whichever specific igraph call is producing the deprecation. No action needed in migraph itself — the tutorial line is canonical usage.

**Severity**: Low — one test failure, possibly already resolved in manynet 2.0.1.

---

## Group E — Indirect path through a defunct fallback

### 15. degreenet (1.3-6)

#### Issue
```
> simr <- reedmolloy(s4)
Error in reedmolloy(s4) :
  The reedmolloy function failed to form a valid network from the passed degree sequence.
```
No `lifecycle::deprecate_stop` trace is visible in the revdep log because `degreenet::reedmolloy()` wraps its inner `igraph` calls in `.catchToList()`, which converts the error into a retry loop. After `maxit = 10` failed retries the function emits its own error.

#### Reproduction (confirmed)
```r
library(degreenet)
set.seed(2)
s4 <- simpln(n = 100, v = c(-1, 1))
reedmolloy(s4)
```

#### Root cause
`reedmolloy` first calls `igraph::degree.sequence.game(deg, method = "vl")` and falls back to `method = "simple.no.multiple"` inside a jitter+retry loop if the first call errors.

What's actually happening:

1. The VL call **deterministically fails** on this degree sequence (`s4` has 65 vertices of degree 1, which often does not admit a connected graph — VL only produces connected graphs). Verified against CRAN igraph 2.3.1: VL errored 50/50 times in a small experiment. So this is **not** a behavioural change in the VL method; it has always failed for this input.
2. Against CRAN 2.3.1 the fallback `method = "simple.no.multiple"` produces an igraph object with a deprecation warning, so `reedmolloy(s4)` succeeds.
3. Against dev igraph the fallback now hard-errors (`deprecate_stop`), `.catchToList` swallows it, the loop reaches `maxit`, and `reedmolloy` emits its own error.

The root cause is therefore purely the lifecycle promotion of `sample_degseq(method = "simple.no.multiple")` from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

#### Assessment
**Bug in degreenet** — it depends on the `"simple.no.multiple"` fallback name being available, which has been a documented deprecation since igraph 2.1.0.

#### Recommendation
**For degreenet**:
- Replace `degree.sequence.game(deg, method = "simple.no.multiple")` in the fallback path with `sample_degseq(deg, method = "fast.heur.simple")`.
- While there, also replace the deprecated alias `degree.sequence.game()` itself with `sample_degseq()`, and `get.edgelist()` with `as_edgelist()`.

**Severity**: High — example error; clear fix on degreenet's side.

---

## Group F — `tkplot()` defunct (igraph 3.0.0)

The interactive Tk-based plotter `tkplot()` (and its companions `tk_*` functions) was advanced to `deprecate_stop("3.0.0", "tkplot()")` in [#2615](https://github.com/igraph/rigraph/pull/2615). All five packages in this group are pure direct-caller failures — each one calls `igraph::tkplot()` from an example, and the example now hard-errors with an identical message.

### 16. Boptbd (1.0.7) · 17. c3net (1.1.1.1) · 18. ggm (2.5.2) · 19. optbdmaeAT (1.0.2) · 20. optrcdmaeAT (1.0.1)

#### Issue (identical across all five)
```
! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.
```
Triggered from:

| Package | Caller |
|---|---|
| Boptbd | `Boptbd::graphoptBbd()` |
| c3net | `c3net::netplot()` (used by `c3net::c3net(..., network = TRUE)`) |
| ggm | `ggm::AG(..., plot = TRUE)` |
| optbdmaeAT | `optbdmaeAT::graphoptbd.mae()` |
| optrcdmaeAT | `optrcdmaeAT::graphoptrcd.mae()` |

#### Root cause
`tkplot()` advanced from `deprecate_warn` to `deprecate_stop` in [#2615](https://github.com/igraph/rigraph/pull/2615). The interactive Tk plotter is no longer available; non-interactive `plot()` is the replacement.

#### Assessment
**Intentional removal in igraph.** All five packages are direct callers — no cascading.

#### Recommendation
**For each affected package**: replace `igraph::tkplot(g, ...)` with `igraph::plot.igraph(g, ...)` (or the bare `plot(g, ...)`). The Tk-specific tuning arguments (`tkplot.canvas`, `tkplot.setcoords`, etc., which are themselves deprecated) have no direct replacement; if interactive editing was the goal, packages should adopt one of the modern JavaScript-based plotters (e.g. `visNetwork`, `htmlwidgets`-based viewers) instead.

**Severity**: High across the board — examples error.

---

## Group G — API tightening / behavioural changes

These two packages were broken by earlier-than-#2634 changes in igraph that resurfaced in this revdep run: stricter argument validation and a behavioural change in `modularity()`.

### 21. jewel (2.0.2)

#### Issue
```
Error in rewire_impl(rewire = graph, n = niter, mode = mode) :
  The value 2.4500000000000002 is not representable as an integer. Invalid value
Source: rinterface_extra.c:83
```

#### Root cause
igraph's C interface now strictly validates that numeric arguments are exactly representable as integers; previously, fractional values were silently truncated. `jewel`'s `constructWeights()` example flows through `generateData_rewire()` → `igraph::rewire()`, where `niter` is computed as `p * 0.05` (e.g. `49 * 0.05 = 2.45`) and is no longer accepted as-is.

#### Assessment
**Bug in jewel** — `niter` should always be an integer (it's a number of iterations).

#### Recommendation
**For jewel**: integer-round the value before the `rewire()` call:
```r
niter <- as.integer(ceiling(p * 0.05))   # or floor(), or round()
```

**For igraph** (optional defensive measure): consider adding `as.integer()` on the R side in `rewire_keeping_degseq()` before passing to `rewire_impl()` — but the strict C-side check is the correct contract.

**Severity**: High — example error.

---

### 22. rSpectral (1.0.0.14)

#### Issue
Two test failures: modularity values diverge from the expected baselines.
```
── Failure ('test-igraph.R:19:3'): membership fix_neig=0 is correct ────────────
Expected `c$modularity` to equal `exp_mod10`.
  `actual`: 0.432
`expected`: 0.408

── Failure ('test-igraph.R:26:3'): membership fix_neig=1 is correct ────────────
  `actual`: 0.3758
`expected`: 0.3776
```

#### Root cause
igraph's `modularity()` was changed (around 2.2.1.9004) to automatically use the `"weight"` edge attribute when present, instead of requiring the caller to pass `weights = E(g)$weight`. rSpectral's stored test graphs do carry a `"weight"` attribute, so the computed modularity now differs from the un-weighted baseline that the test expected. The fly-conversion message in the log (`This graph was created by an old(er) igraph version. i Call igraph::upgrade_graph()...`) is incidental.

#### Assessment
**Behavioural change in igraph.** Inadvertent semantics shift for callers that did not intend to use weights. We are reconsidering the auto-detection of `weight`; in the meantime there is no clean `weights = NA` opt-out.

#### Recommendation
**For igraph** (action required before notifying rSpectral): provide a clean opt-out for the auto-`weight` mechanism — for example accept `weights = NA` to explicitly disable weight detection — and document the contract change in `NEWS.md`.

**For rSpectral** (once a clean opt-out exists or after igraph adjusts):
1. Decide whether the stored graphs were *intended* to carry a `weight` attribute.
2. If not: `g <- igraph::delete_edge_attr(g, "weight")` before calling `modularity()`, then run `igraph::upgrade_graph()` on the stored graph objects.
3. If yes: update the expected modularity baselines to reflect the weighted computation.

**Severity**: Medium — tests fail; awaiting igraph-side clarification.

---

## Conclusion

| Package | Issue type | Root cause | Severity | Action |
|---|---|---|---|---|
| tidygraph | Defunct argument | `bfs(father=)` → `parent=` | High | tidygraph to rename argument |
| nat | Defunct argument | `dfs(father=)` → `parent=` | High | nat to rename argument |
| dci | Cascading | tidygraph failure | High | Resolved when tidygraph updates |
| ggraph | Cascading | tidygraph failure | High | Resolved when tidygraph updates |
| scistreer | Cascading | tidygraph failure | High | Resolved when tidygraph updates |
| comato | Defunct function | `layout.spring()` → `layout_with_fr()` | High | comato to rename |
| ECoL | Defunct function | `hub.score()` → `hits_scores()` | High | ECoL to rename |
| vkR | Removed function | `get.edge()` removed | Medium | vkR to switch to `ends()` |
| cranly | Defunct argument value | `eigen_centrality(scale=)` always TRUE | High | cranly to drop the argument |
| qgraph | Defunct argument value | `sample_degseq(method=)` value renamed | High | qgraph to switch method value |
| GoodFitSBM | Defunct call form | `get_edge_ids(vp=)` matrix orientation | High | GoodFitSBM to transpose matrix |
| FrF2 | Deprecation warnings → NOTE | Multiple deprecated names | Low | FrF2 to rename pre-emptively |
| R6causal | Install-time WARNING | Deprecated attribute getters/setters | Medium | R6causal to rename pre-emptively |
| migraph | Strict no-warning test | manynet's `create_ring(width = 2)` chain triggers an igraph deprecation | Low | manynet to clean up the offending call (possibly already done in 2.0.1) |
| degreenet | Defunct argument value | `sample_degseq(method = "simple.no.multiple")` defunct in fallback path | High | degreenet to switch the fallback method value |
| Boptbd | Defunct function | `tkplot()` removed | High | Boptbd to switch to `plot()` |
| c3net | Defunct function | `tkplot()` removed | High | c3net to switch to `plot()` |
| ggm | Defunct function | `tkplot()` removed | High | ggm to switch to `plot()` |
| optbdmaeAT | Defunct function | `tkplot()` removed | High | optbdmaeAT to switch to `plot()` |
| optrcdmaeAT | Defunct function | `tkplot()` removed | High | optrcdmaeAT to switch to `plot()` |
| jewel | API tightening | Stricter integer validation in `rewire_impl()` | High | jewel to integer-round `niter` |
| rSpectral | Behavioural change | `modularity()` auto-uses `"weight"` attribute | Medium | igraph to provide clean opt-out; rSpectral to update tests |

### Overall assessment

The 22 live failures partition cleanly into three causes:

- **Twenty failures (groups A–F)** are direct consequences of two lifecycle PRs that landed in this dev cycle: [#2634](https://github.com/igraph/rigraph/pull/2634) (15 packages: deprecation → defunct for many functions/arguments) and [#2615](https://github.com/igraph/rigraph/pull/2615) (5 packages: `tkplot()` removal). Every one of these has a straightforward downstream fix; three of the five Group A packages are pure cascades through tidygraph. The degreenet case is unusual only in that the defunct call is wrapped in `tryCatch`-style logic that converted a clear lifecycle error into a generic "failed to form a valid network" message — the underlying cause is the same.

- **One failure (jewel)** is a pre-existing API-tightening change (stricter integer validation) from earlier in the 2.x series. Clean downstream fix: integer-round `niter` before the `rewire()` call.

- **One failure (rSpectral)** is a behavioural change in `modularity()` (auto-use of the `"weight"` attribute) that needs an igraph-side opt-out before clear guidance can be given to the downstream maintainer.
