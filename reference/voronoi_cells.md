# Voronoi partitioning of a graph

**\[experimental\]**

This function partitions the vertices of a graph based on a set of
generator vertices. Each vertex is assigned to the generator vertex from
(or to) which it is closest.

[`groups()`](https://r.igraph.org/reference/groups.md) may be used on
the output of this function.

## Usage

``` r
voronoi_cells(
  graph,
  generators,
  ...,
  weights = NULL,
  mode = c("out", "in", "all", "total"),
  tiebreaker = c("random", "first", "last")
)
```

## Arguments

- graph:

  The graph to partition into Voronoi cells.

- generators:

  The generator vertices of the Voronoi cells.

- ...:

  These dots are for future extensions and must be empty.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- mode:

  Character string. In directed graphs, whether to compute distances
  from generator vertices to other vertices (`"out"`), to generator
  vertices from other vertices (`"in"`), or ignore edge directions
  entirely (`"all"`). Ignored in undirected graphs.

- tiebreaker:

  Character string that specifies what to do when a vertex is at the
  same distance from multiple generators. `"random"` assigns a
  minimal-distance generator randomly, `"first"` takes the first one,
  and `"last"` takes the last one.

## Value

A named list with two components:

- membership:

  numeric vector giving the cluster id to which each vertex belongs.

- distances:

  numeric vector giving the distance of each vertex from its generator

## Related documentation in the C library

[`voronoi()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_voronoi),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

[`distances()`](https://r.igraph.org/reference/distances.md)

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
[`groups()`](https://r.igraph.org/reference/groups.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md)

## Examples

``` r
g <- make_lattice(c(10, 10))
clu <- voronoi_cells(g, c(25, 43, 67))
groups(clu)
#> $`0`
#>  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 24 25 26
#> [26] 27 28 29 30 34 35 36 38 39
#> 
#> $`1`
#>  [1] 23 31 32 33 41 42 43 44 45 51 52 53 54 55 61 62 63 64 71 72 73 74 81 82 83
#> [26] 84 91 92 93 94
#> 
#> $`2`
#>  [1]  37  40  46  47  48  49  50  56  57  58  59  60  65  66  67  68  69  70  75
#> [20]  76  77  78  79  80  85  86  87  88  89  90  95  96  97  98  99 100
#> 
plot(g, vertex.color = clu$membership)

```
