# Reading foreign file formats

**\[deprecated\]**

`read.graph()` was renamed to
[`read_graph()`](https://r.igraph.org/reference/read_graph.md) to create
a more consistent API.

## Usage

``` r
read.graph(
  file,
  format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml",
    "dl"),
  ...
)
```

## Arguments

- file:

  The connection to read from. This can be a local file, or a `http` or
  `ftp` connection. It can also be a character string with the file name
  or URI.

- format:

  Character constant giving the file format. Right now `edgelist`,
  `pajek`, `ncol`, `lgl`, `graphml`, `dimacs`, `graphdb`, `gml` and `dl`
  are supported, the default is `edgelist`. As of igraph 0.4 this
  argument is case insensitive.

- ...:

  Additional arguments, see below.

## Related documentation in the C library

[`read_graph_pajek()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_pajek),
[`read_graph_graphml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphml),
[`read_graph_gml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_gml),
[`read_graph_dl()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_dl),
[`read_graph_graphdb()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphdb),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
