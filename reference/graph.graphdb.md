# Load a graph from the graph database for testing graph isomorphism.

**\[deprecated\]**

`graph.graphdb()` was renamed to
[`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md)
to create a more consistent API.

## Usage

``` r
graph.graphdb(
  url = NULL,
  prefix = "iso",
  type = "r001",
  nodes = NULL,
  pair = "A",
  which = 0,
  base = "http://cneurocvs.rmki.kfki.hu/graphdb/gzip",
  compressed = TRUE,
  directed = TRUE
)
```

## Arguments

- url:

  If not `NULL` it is a complete URL with the file to import.

- prefix:

  Gives the prefix. See details below. Possible values: `iso`, `i2`,
  `si4`, `si6`, `mcs10`, `mcs30`, `mcs50`, `mcs70`, `mcs90`.

- type:

  Gives the graph type identifier. See details below. Possible values:
  `r001`, `r005`, `r01`, `r02`, `m2D`, `m2Dr2`, `m2Dr4`, `m2Dr6` `m3D`,
  `m3Dr2`, `m3Dr4`, `m3Dr6`, `m4D`, `m4Dr2`, `m4Dr4`, `m4Dr6`, `b03`,
  `b03m`, `b06`, `b06m`, `b09`, `b09m`.

- nodes:

  The number of vertices in the graph.

- pair:

  Specifies which graph of the pair to read. Possible values: `A` and
  `B`.

- which:

  Gives the number of the graph to read. For every graph type there are
  a number of actual graphs in the database. This argument specifies
  which one to read.

- base:

  The base address of the database. See details below.

- compressed:

  Logical constant, if TRUE than the file is expected to be compressed
  by gzip. If `url` is `NULL` then a ‘`.gz`’ suffix is added to the
  filename.

- directed:

  Logical constant, whether to create a directed graph.

## Related documentation in the C library

[`read_graph_graphdb`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphdb)
