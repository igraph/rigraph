# htna — empty argument in `...` (igraph regression, fixed)

## Issue
htna's tests call `tna::estimate_cs()`, which reaches
`tna:::as.igraph.matrix()` → `igraph::graph_from_adjacency_matrix()`. That call
ends in a trailing comma, so an empty argument lands in `...`. During the
ellipsis-move refactoring it reached `migrate_recover_args()` and errored with
`argument is missing, with no default`.

**This is an igraph bug, not an htna or tna one, and it is already fixed** —
the example below runs clean on igraph 2.3.3.9029. It is kept as the regression
reproducer.

## Reproducible Example

``` r
library(igraph)

m <- matrix(c(0, 1, 1, 0), 2, dimnames = list(c("a", "b"), c("a", "b")))

# tna:::as.igraph.matrix(), reduced -- note the trailing comma
tna_shape <- function(x, mode = "directed", ...) {
  igraph::graph_from_adjacency_matrix(
    adjmatrix = x,
    mode = mode,
    weighted = TRUE,
  )
}
tna_shape(m)
#> ── <igraph> ───────────────────────────────────────────────────────── cb5ccda ──
#> ℹ directed · named · weighted
#> ℹ 2 vertices · 2 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → vertex: name <chr>
#> → edge:   weight <dbl>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#> [1] a → b  b → a

# The other form from the same class of failure: a skipped positional slot
graph_from_data_frame(data.frame(from = "a", to = "b"), , directed = FALSE)
#> ── <igraph> ───────────────────────────────────────────────────────── d5e4d69 ──
#> ℹ undirected · named
#> ℹ 2 vertices · 1 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → vertex: name <chr>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#> [1] a ─ b
```

## Root Cause
Moving the optional arguments behind `...` made every call carrying an empty
argument reach the migration handler, where forcing `dots[[k]]` errored. The
handler now skips missing dots, and both forms above work again.

## Assessment
Ours, not theirs. Same root cause as tna, lagdynamics, modelbpp and NetSci in
[#2646](https://github.com/igraph/rigraph/issues/2646), all tagged
`[IGRAPH BUG]`.

## Recommendation
Nothing to send upstream. Re-check htna and tna against the current development
version to confirm they are green again — a trailing comma is legal R and
igraph has to accept it.
