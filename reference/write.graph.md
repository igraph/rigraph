# Writing the graph to a file in some format

**\[deprecated\]**

`write.graph()` was renamed to
[`write_graph()`](https://r.igraph.org/reference/write_graph.md) to
create a more consistent API.

## Usage

``` r
write.graph(
  graph,
  file,
  format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "gml", "dot",
    "leda"),
  ...
)
```

## Arguments

- graph:

  The graph to export.

- file:

  A connection or a string giving the file name to write the graph to.

- format:

  Character string giving the file format. Right now `pajek`, `graphml`,
  `dot`, `gml`, `edgelist`, `lgl`, `ncol`, `leda` and `dimacs` are
  implemented. As of igraph 0.4 this argument is case insensitive.

- ...:

  Other, format specific arguments, see below.

## Related documentation in the C library

[`write_graph_edgelist()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_edgelist),
[`write_graph_pajek()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_pajek),
[`write_graph_graphml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_graphml),
[`write_graph_gml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_gml),
[`write_graph_dot()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_dot),
[`write_graph_leda()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_leda),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
