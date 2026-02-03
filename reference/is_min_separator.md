# Minimal vertex separators

Check whether a given set of vertices is a minimal vertex separator.

## Usage

``` r
is_min_separator(graph, candidate)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

- candidate:

  A numeric vector giving the vertex ids of the candidate separator.

## Value

A logical scalar, whether the supplied vertex set is a (minimal) vertex
separator or not.

## Details

`is_min_separator()` decides whether the supplied vertex set is a
minimal vertex separator. A minimal vertex separator is a vertex
separator, such that none of its proper subsets are a vertex separator.

## Related documentation in the C library

[`is_minimal_separator()`](https://igraph.org/c/html/0.10.17/igraph-Separators.html#igraph_is_minimal_separator),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Examples

``` r
# The graph from the Moody-White paper
mw <- graph_from_literal(
  1 - 2:3:4:5:6, 2 - 3:4:5:7, 3 - 4:6:7, 4 - 5:6:7,
  5 - 6:7:21, 6 - 7, 7 - 8:11:14:19, 8 - 9:11:14, 9 - 10,
  10 - 12:13, 11 - 12:14, 12 - 16, 13 - 16, 14 - 15, 15 - 16,
  17 - 18:19:20, 18 - 20:21, 19 - 20:22:23, 20 - 21,
  21 - 22:23, 22 - 23
)

# Cohesive subgraphs
mw1 <- induced_subgraph(mw, as.character(c(1:7, 17:23)))
mw2 <- induced_subgraph(mw, as.character(7:16))
mw3 <- induced_subgraph(mw, as.character(17:23))
mw4 <- induced_subgraph(mw, as.character(c(7, 8, 11, 14)))
mw5 <- induced_subgraph(mw, as.character(1:7))

check.sep <- function(G) {
  sep <- min_separators(G)
  sapply(sep, is_min_separator, graph = G)
}

check.sep(mw)
#> [1] TRUE
check.sep(mw1)
#> [1] TRUE TRUE TRUE TRUE
check.sep(mw2)
#> [1] TRUE TRUE TRUE
check.sep(mw3)
#> [1] TRUE
check.sep(mw4)
#> [1] FALSE FALSE FALSE FALSE
check.sep(mw5)
#> [1] TRUE TRUE TRUE
```
