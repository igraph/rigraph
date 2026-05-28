# Groups of a vertex partitioning

Create a list of vertex groups from some graph clustering or community
structure.

## Usage

``` r
groups(x)
```

## Arguments

- x:

  Some object that represents a grouping of the vertices. See details
  below.

## Value

A named list of numeric or character vectors. The names are just numbers
that refer to the groups. The vectors themselves are numeric or symbolic
vertex ids.

## Details

Currently two methods are defined for this function. The default method
works on the output of
[`components()`](https://r.igraph.org/reference/components.md). (In fact
it works on any object that is a list with an entry called
`membership`.)

The second method works on
[`communities()`](https://r.igraph.org/reference/communities.md)
objects.

## See also

[`components()`](https://r.igraph.org/reference/components.md) and the
various community finding functions.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`compare()`](https://r.igraph.org/reference/compare.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Examples

``` r
g <- make_graph("Zachary")
fgc <- cluster_fast_greedy(g)
groups(fgc)
#> $`1`
#> [1]  1  5  6  7 11 12 17 20
#> 
#> $`2`
#>  [1]  9 15 16 19 21 23 24 25 26 27 28 29 30 31 32 33 34
#> 
#> $`3`
#> [1]  2  3  4  8 10 13 14 18 22
#> 

g2 <- make_ring(10) + make_full_graph(5)
groups(components(g2))
#> $`1`
#>  [1]  1  2  3  4  5  6  7  8  9 10
#> 
#> $`2`
#> [1] 11 12 13 14 15
#> 
```
