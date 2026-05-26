# Reverse Dependency Problem Examples

This directory contains minimal reproducible examples for packages flagged as newly broken in the latest `revdepcheck` run against the development version of igraph. See [`../problems-analysis.md`](../problems-analysis.md) for the corresponding analysis and recommended fixes.

## Files

Each issue has two files:
- `*.R` — runnable R script with the minimal reproduction
- `*.md` — markdown documentation with reprex-style output

### Issues

#### Group A — `bfs/dfs(father = )` argument defunct (igraph 2.2.0)
1. **tidygraph-bfs-father-issue** — `bfs(father = )` defunct (root of the dci/ggraph/scistreer cascade)
2. **nat-dfs-father-issue** — `dfs(father = )` defunct (direct caller)

#### Group B — Defunct top-level functions
3. **comato-layout-spring-issue** — `layout.spring()` defunct
4. **ecol-hub-score-issue** — `hub.score()` defunct
5. **vkr-get-edge-missing-issue** — `igraph::get.edge` removed

#### Group C — Defunct argument values / behaviors on retained functions
6. **cranly-eigen-centrality-scale-issue** — `eigen_centrality(scale = FALSE)` defunct
7. **qgraph-sample-degseq-method-issue** — `sample_degseq(method = "simple.no.multiple")` defunct
8. **goodfitsbm-get-edge-ids-issue** — `get_edge_ids(vp = <2xn matrix>)` orientation defunct

#### Group D — Deprecation warnings surfacing as NOTE/WARNING
9. **frf2-deprecation-warnings-issue** — multiple deprecation warnings → NOTE
10. **r6causal-attribute-deprecations-issue** — install-time attribute getter/setter warnings
11. **migraph-create-ring-width-issue** — `manynet::create_ring(32, width = 2)` chain triggers an igraph deprecation; migraph's no-warning tutorial test surfaces it. Upstream owner is [manynet](https://github.com/stocnet/manynet), not migraph.

#### Group E — Indirect path through a defunct fallback
12. **degreenet-reedmolloy-issue** — defunct `sample_degseq(method = "simple.no.multiple")` fallback inside `reedmolloy()`'s retry loop

#### Group F — `tkplot()` defunct (igraph 3.0.0)
13. **tkplot-defunct-issue** — shared reproducer for Boptbd, c3net, ggm, optbdmaeAT, optrcdmaeAT (all direct callers of `igraph::tkplot()`)

Three packages from the failure set (dci, ggraph, scistreer) are pure cascades through tidygraph and have no separate reproducer — see `tidygraph-bfs-father-issue` for the root cause.

## Running the Examples

Each R script can be run with:

```r
source("revdep/examples/tidygraph-bfs-father-issue.R")
```

Or from the command line:

```bash
Rscript revdep/examples/tidygraph-bfs-father-issue.R
```

The scripts are designed to be run against the **development version** of igraph (the version produced by `R CMD INSTALL .` from the repo root). Against the CRAN release of igraph many of them will not yet hard-error — they will only emit deprecation warnings.

## Format

The examples follow a simplified format:
- No `cat()` statements for output (use comments instead)
- No `tryCatch()` blocks (commented-out error cases)
- Clean, runnable code that can be used with `reprex::reprex()`
- Corresponding `.md` files show the expected output

## Summary of Issues

| Package | Issue | Severity | Type |
|---|---|---|---|
| tidygraph | `bfs(father=)` defunct | High | API rename (root of cascade) |
| nat | `dfs(father=)` defunct | High | API rename |
| dci | Cascades through tidygraph | High | Cascading |
| ggraph | Cascades through tidygraph | High | Cascading |
| scistreer | Cascades through tidygraph | High | Cascading |
| comato | `layout.spring()` defunct | High | Defunct function |
| ECoL | `hub.score()` defunct | High | Defunct function |
| vkR | `get.edge` removed | Medium | Removed function |
| cranly | `eigen_centrality(scale=)` defunct | High | Defunct argument value |
| qgraph | `sample_degseq(method=)` value defunct | High | Defunct argument value |
| GoodFitSBM | `get_edge_ids()` matrix orientation defunct | High | Defunct call form |
| FrF2 | Deprecation warnings → NOTE | Low | Pre-emptive rename needed |
| R6causal | Install-time deprecation warnings | Medium | Pre-emptive rename needed |
| migraph | `manynet::create_ring(width=)` warning → test failure | Low | Upstream owner is manynet, not migraph |
| degreenet | Defunct fallback `sample_degseq(method=)` value | High | Defunct argument value (indirect) |
| Boptbd | `tkplot()` defunct | High | Removed function (PR #2615) |
| c3net | `tkplot()` defunct | High | Removed function (PR #2615) |
| ggm | `tkplot()` defunct | High | Removed function (PR #2615) |
| optbdmaeAT | `tkplot()` defunct | High | Removed function (PR #2615) |
| optrcdmaeAT | `tkplot()` defunct | High | Removed function (PR #2615) |

See [`../problems-analysis.md`](../problems-analysis.md) for detailed analysis and recommendations.
