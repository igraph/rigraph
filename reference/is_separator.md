# Check whether removing this set of vertices would disconnect the graph.

`is_separator()` determines whether the supplied vertex set is a vertex
separator: A vertex set \\S\\ is a separator if there are vertices \\u\\
and \\v\\ in the graph such that all paths between \\u\\ and \\v\\ pass
through some vertices in \\S\\.

## Usage

``` r
is_separator(graph, candidate)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

- candidate:

  A numeric vector giving the vertex ids of the candidate separator.

## Value

A logical scalar, whether the supplied vertex set is a (minimal) vertex
separator or not. lists all vertex separator of minimum size.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Related documentation in the C library

[`is_separator()`](https://igraph.org/c/html/latest/igraph-Separators.html#igraph_is_separator).

## Examples

``` r
ring <- make_ring(4)
min_st_separators(ring)
#> [[1]]
#> + 2/4 vertices, from 202a3f5:
#> [1] 2 4
#> 
#> [[2]]
#> + 2/4 vertices, from 202a3f5:
#> [1] 1 3
#> 
is_separator(ring, 1)
#> [1] FALSE
is_separator(ring, c(1, 3))
#> [1] TRUE
is_separator(ring, c(2, 4))
#> [1] TRUE
is_separator(ring, c(2, 3))
#> [1] FALSE
```
