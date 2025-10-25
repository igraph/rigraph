# igraph data structure versions

igraph's internal data representation changes sometimes between
versions. This means that it is not always possible to use igraph
objects that were created (and possibly saved to a file) with an older
igraph version.

## Usage

``` r
graph_version(graph)
```

## Arguments

- graph:

  The input graph. If it is missing, then the version number of the
  current data format is returned.

## Value

An integer scalar.

## Details

`graph_version()` queries the current data format, or the data format of
a possibly older igraph graph.

[`upgrade_graph()`](https://r.igraph.org/reference/upgrade_graph.md) can
convert an older data format to the current one.

## See also

upgrade_graph to convert the data format of a graph.

Other versions:
[`upgrade_graph()`](https://r.igraph.org/reference/upgrade_graph.md)
