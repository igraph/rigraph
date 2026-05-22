# rSpectral modularity() now auto-uses the "weight" edge attribute

## Issue
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

## Reproducible Example

```r
library(igraph)
g <- make_ring(5)
E(g)$weight <- c(1, 2, 3, 4, 5)
membership <- c(1, 1, 2, 2, 2)

# Old behaviour (ignored $weight unless passed explicitly)
modularity(g, membership, weights = rep(1, ecount(g)))
# New behaviour (auto-detects $weight)
modularity(g, membership)
# The two now differ.
```

## Root Cause
Around igraph 2.2.1.9004, `modularity()` was changed to use the `"weight"` edge attribute automatically when present:
```r
if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
  weights <- E(graph)$weight
}
```
rSpectral's stored test graphs carry a `"weight"` attribute that was not intended to be consumed by `modularity()`.

## Assessment
Behavioural change in igraph. Inadvertent semantics shift for callers that did not intend to use weights. No clean `weights = NA` opt-out currently exists.

## Recommendation
**For igraph** (action required before notifying rSpectral): provide a clean opt-out — e.g. accept `weights = NA` to disable auto-detection — and document the contract change in `NEWS.md`.

**For rSpectral** (once an opt-out exists, or after igraph adjusts):
1. Determine whether the stored graphs were intended to carry `$weight`.
2. If not: `g <- igraph::delete_edge_attr(g, "weight")` before `modularity()`, and run `igraph::upgrade_graph()` on the stored graph objects.
3. If yes: update the expected modularity baselines.

A hacky workaround that happens to disable auto-detection today is `modularity(g, membership, weights = numeric())`, but this relies on internal implementation detail and **must not** be recommended to downstream maintainers.
