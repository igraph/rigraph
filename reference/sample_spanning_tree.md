# Samples from the spanning trees of a graph randomly and uniformly

`sample_spanning_tree()` picks a spanning tree of an undirected graph
randomly and uniformly, using loop-erased random walks.

## Usage

``` r
sample_spanning_tree(graph, vid = 0)
```

## Arguments

- graph:

  The input graph to sample from. Edge directions are ignored if the
  graph is directed.

- vid:

  When the graph is disconnected, this argument specifies how to handle
  the situation. When the argument is zero (the default), the sampling
  will be performed component-wise, and the result will be a spanning
  forest. When the argument contains a vertex ID, only the component
  containing the given vertex will be processed, and the result will be
  a spanning tree of the component of the graph.

## Value

An edge sequence containing the edges of the spanning tree. Use
[`subgraph_from_edges()`](https://r.igraph.org/reference/subgraph.md) to
extract the corresponding subgraph.

## See also

[`subgraph_from_edges()`](https://r.igraph.org/reference/subgraph.md) to
extract the tree itself

Other trees:
[`is_forest()`](https://r.igraph.org/reference/is_forest.md),
[`is_tree()`](https://r.igraph.org/reference/is_tree.md),
[`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md),
[`to_prufer()`](https://r.igraph.org/reference/to_prufer.md)

## Related documentation in the C library

[`random_spanning_tree()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_random_spanning_tree).

## Examples

``` r
g <- make_full_graph(10) %du% make_full_graph(5)
edges <- sample_spanning_tree(g)
forest <- subgraph_from_edges(g, edges)
```
