# igraph data structure versions

igraph's internal data representation changes sometimes between
versions. This means that it is not possible to use igraph objects that
were created (and possibly saved to a file) with an older igraph
version.

## Usage

``` r
upgrade_graph(graph)
```

## Arguments

- graph:

  The input graph.

## Value

The graph in the current format.

## Details

[`graph_version()`](https://r.igraph.org/reference/graph_version.md)
queries the current data format, or the data format of a possibly older
igraph graph.

`upgrade_graph()` can convert an older data format to the current one.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

graph_version to check the current data format version or the version of
a graph.

Other versions:
[`graph_version()`](https://r.igraph.org/reference/graph_version.md)
