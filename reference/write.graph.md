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
