# Minimum spanning tree

A *spanning tree* of a connected graph is a connected subgraph with the
smallest number of edges that includes all vertices of the graph. A
graph will have many spanning trees. Among these, the *minimum spanning
tree* will have the smallest sum of edge weights.

## Usage

``` r
mst(graph, weights = NULL, algorithm = NULL, ...)
```

## Arguments

- graph:

  The graph object to analyze.

- weights:

  Numeric vector giving the weights of the edges in the graph. The order
  is determined by the edge ids. This is ignored if the `unweighted`
  algorithm is chosen. Edge weights are interpreted as distances.

- algorithm:

  The algorithm to use for calculation. `unweighted` can be used for
  unweighted graphs, and `prim` runs Prim's algorithm for weighted
  graphs. If this is `NULL` then igraph will select the algorithm
  automatically: if the graph has an edge attribute called `weight` or
  the `weights` argument is not `NULL` then Prim's algorithm is chosen,
  otherwise the unweighted algorithm is used.

- ...:

  Additional arguments, unused.

## Value

A graph object with the minimum spanning forest. To check whether it is
a tree, check that the number of its edges is `vcount(graph)-1`. The
edge and vertex attributes of the original graph are preserved in the
result.

## Details

The *minimum spanning forest* of a disconnected graph is the collection
of minimum spanning trees of all of its components.

If the graph is not connected a minimum spanning forest is returned.

## Related documentation in the C library

[`minimum_spanning_tree_unweighted()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_minimum_spanning_tree_unweighted),
[`minimum_spanning_tree_prim()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_minimum_spanning_tree_prim),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Prim, R.C. 1957. Shortest connection networks and some generalizations
*Bell System Technical Journal*, 37 1389–1401.

## See also

[`components()`](https://r.igraph.org/reference/components.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnp(100, 3 / 100)
g_mst <- mst(g)
```
