# Check biconnectedness

**\[experimental\]**

Tests whether a graph is biconnected.

## Usage

``` r
is_biconnected(graph)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

## Value

Logical, `TRUE` if the graph is biconnected.

## Details

A graph is biconnected if the removal of any single vertex (and its
adjacent edges) does not disconnect it.

igraph does not consider single-vertex graphs biconnected.

Note that some authors do not consider the graph consisting of two
connected vertices as biconnected, however, igraph does.

## Related documentation in the C library

[`is_biconnected`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_biconnected)

## See also

[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`is_connected()`](https://r.igraph.org/reference/components.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

Connected components
[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`count_reachable()`](https://r.igraph.org/reference/count_reachable.md),
[`decompose()`](https://r.igraph.org/reference/decompose.md)

## Examples

``` r
is_biconnected(make_graph("bull"))
#> [1] FALSE
is_biconnected(make_graph("dodecahedron"))
#> [1] TRUE
is_biconnected(make_full_graph(1))
#> [1] FALSE
is_biconnected(make_full_graph(2))
#> [1] TRUE
```
