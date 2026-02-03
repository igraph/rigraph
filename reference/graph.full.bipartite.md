# Create a full bipartite graph

**\[deprecated\]**

`graph.full.bipartite()` was renamed to
[`make_full_bipartite_graph()`](https://r.igraph.org/reference/make_full_bipartite_graph.md)
to create a more consistent API.

## Usage

``` r
graph.full.bipartite(n1, n2, directed = FALSE, mode = c("all", "out", "in"))
```

## Arguments

- n1:

  The number of vertices of the first kind.

- n2:

  The number of vertices of the second kind.

- directed:

  Logical scalar, whether the graphs is directed.

- mode:

  Scalar giving the kind of edges to create for directed graphs. If this
  is ‘`out`’ then all vertices of the first kind are connected to the
  others; ‘`in`’ specifies the opposite direction; ‘`all`’ creates
  mutual edges. This argument is ignored for undirected graphs.x

## Related documentation in the C library

[`full_bipartite()`](https://igraph.org/c/html/latest/igraph-Bipartite.html#igraph_full_bipartite),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
