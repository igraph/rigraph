# List all (s,t)-cuts of a graph

**\[deprecated\]**

`stCuts()` was renamed to
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md) to create a
more consistent API.

## Usage

``` r
stCuts(graph, source, target)
```

## Arguments

- graph:

  The input graph. It must be directed.

- source:

  The source vertex.

- target:

  The target vertex.

## Related documentation in the C library

[`all_st_cuts()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_all_st_cuts),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
