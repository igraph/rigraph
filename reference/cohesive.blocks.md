# Calculate Cohesive Blocks

**\[deprecated\]**

`cohesive.blocks()` was renamed to
[`cohesive_blocks()`](https://r.igraph.org/reference/cohesive_blocks.md)
to create a more consistent API.

## Usage

``` r
cohesive.blocks(graph, labels = TRUE)
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

- labels:

  Logical scalar, whether to add the vertex labels to the result object.
  These labels can be then used when reporting and plotting the cohesive
  blocks.
