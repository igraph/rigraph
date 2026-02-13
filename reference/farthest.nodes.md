# Diameter of a graph

**\[deprecated\]**

`farthest.nodes()` was renamed to
[`farthest_vertices()`](https://r.igraph.org/reference/diameter.md) to
create a more consistent API.

## Usage

``` r
farthest.nodes(graph, directed = TRUE, unconnected = TRUE, weights = NULL)
```

## Arguments

- graph:

  The graph to analyze.

- directed:

  Logical, whether directed or undirected paths are to be considered.
  This is ignored for undirected graphs.

- unconnected:

  Logical, what to do if the graph is unconnected. If FALSE, the
  function will return a number that is one larger the largest possible
  diameter, which is always the number of vertices. If TRUE, the
  diameters of the connected components will be calculated and the
  largest one will be returned.

- weights:

  Optional positive weight vector for calculating weighted distances. If
  the graph has a `weight` edge attribute, then this is used by default.

## Related documentation in the C library

[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
