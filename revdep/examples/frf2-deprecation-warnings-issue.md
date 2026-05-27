# FrF2 deprecation warnings leak into .Rout.save

## Issue
`checking tests ... NOTE` — FrF2's `godolphintest.Rout` diverges from `godolphintest.Rout.save` because multiple igraph deprecation warnings appear in the new output.

```
< 4: `clique.number()` was deprecated in igraph 2.0.0.
< ℹ Please use `clique_num()` instead.
< 1: `graph.empty()` was deprecated in igraph 2.1.0.
< 2: `add.edges()` was deprecated in igraph 2.0.0.
< 3: `independence.number()` was deprecated in igraph 2.0.0.
```

## Reproducible Example

```r
library(igraph)

# All emit deprecation warnings on current dev igraph
g1 <- graph.empty(n = 5, directed = FALSE)
#> Warning: `graph.empty()` was deprecated in igraph 2.1.0. ...
g2 <- add.edges(g1, c(1, 2, 2, 3))
#> Warning: `add.edges()` was deprecated in igraph 2.0.0. ...
independence.number(g2)
#> Warning: `independence.number()` was deprecated in igraph 2.0.0. ...
clique.number(g2)
#> Warning: `clique.number()` was deprecated in igraph 2.0.0. ...

# Working replacements (no warnings)
g1b <- make_empty_graph(n = 5, directed = FALSE)
g2b <- add_edges(g1b, c(1, 2, 2, 3))
ivs_size(g2b)
clique_num(g2b)
```

## Root Cause
None of these functions are defunct yet — they emit warnings. FrF2's tests diff `.Rout` output against a checked-in `.Rout.save`; any extra warning lines surface as a NOTE.

## Assessment
Bug in FrF2 — uses long-deprecated function names; will hard-fail when any of these is promoted to defunct in a future lifecycle pass.

## Recommendation
**For FrF2**:

| Deprecated | Replacement |
|---|---|
| `graph.empty()` | `make_empty_graph()` |
| `add.edges()` | `add_edges()` |
| `independence.number()` | `ivs_size()` |
| `clique.number()` | `clique_num()` |

Then regenerate `godolphintest.Rout.save` (and any other `.Rout.save` files affected).
