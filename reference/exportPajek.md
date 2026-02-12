# Calculate Cohesive Blocks

**\[deprecated\]**

`exportPajek()` was renamed to
[`export_pajek()`](https://r.igraph.org/reference/cohesive_blocks.md) to
create a more consistent API.

## Usage

``` r
exportPajek(blocks, graph, file, project.file = TRUE)
```

## Arguments

- graph:

  For
  [`cohesive_blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  a graph object of class `igraph`. It must be undirected and simple.
  (See [`is_simple()`](https://r.igraph.org/reference/simplify.md).)

  For
  [`graphs_from_cohesive_blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  and
  [`export_pajek()`](https://r.igraph.org/reference/cohesive_blocks.md)
  the same graph must be supplied whose cohesive block structure is
  given in the
  [`blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
  argument.

- file:

  Defines the file (or connection) the Pajek file is written to.

  If the `project.file` argument is `TRUE`, then it can be a filename
  (with extension), a file object, or in general any king of connection
  object. The file/connection will be opened if it wasn't already.

  If the `project.file` argument is `FALSE`, then several files are
  created and `file` must be a character scalar containing the base name
  of the files, without extension. (But it can contain the path to the
  files.)

  See also details below.

- project.file:

  Logical scalar, whether to create a single Pajek project file
  containing all the data, or to create separated files for each item.
  See details below.
