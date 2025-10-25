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
