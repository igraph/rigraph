# Load a graph from the graph database for testing graph isomorphism.

This function downloads a graph from a database created for the
evaluation of graph isomorphism testing algorithms.

## Usage

``` r
graph_from_graphdb(
  url = NULL,
  prefix = "iso",
  type = "r001",
  nodes = NULL,
  pair = "A",
  which = 0,
  base = "https://github.com/igraph/graphsdb/raw/refs/heads/main",
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

## Value

A new graph object.

## Details

`graph_from_graphdb()` reads a graph from the graph database from an FTP
or HTTP server or from a local copy. It has two modes of operation:

If the `url` argument is specified then it should the complete path to a
local or remote graph database file. In this case we simply call
[`read_graph()`](https://r.igraph.org/reference/read_graph.md) with the
proper arguments to read the file.

If `url` is `NULL`, and this is the default, then the filename is
assembled from the `base`, `prefix`, `type`, `nodes`, `pair` and `which`
arguments.

Unfortunately the original graph database homepage is now defunct, but
see its old version at
<https://web.archive.org/web/20090215182331/http://amalfi.dis.unina.it/graph/db/doc/graphdbat.html>
for the actual format of a graph database file and other information.

## Related documentation in the C library

[`read_graph_graphdb()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphdb)

## References

M. De Santo, P. Foggia, C. Sansone, M. Vento: A large database of graphs
and its use for benchmarking graph isomorphism algorithms, *Pattern
Recognition Letters*, Volume 24, Issue 8 (May 2003)

## See also

[`read_graph()`](https://r.igraph.org/reference/read_graph.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md)

Foreign format readers
[`read_graph()`](https://r.igraph.org/reference/read_graph.md),
[`write_graph()`](https://r.igraph.org/reference/write_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
