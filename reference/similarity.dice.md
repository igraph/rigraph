# Similarity measures of two vertices (Dice)

**\[deprecated\]**

Please use
[`similarity()`](https://r.igraph.org/reference/similarity.md) with
`method = "dice"` instead.

## Usage

``` r
similarity.dice(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = FALSE
)
```

## Arguments

- graph:

  The input graph.

- vids:

  The vertex ids for which the similarity is calculated.

- mode:

  The type of neighboring vertices to use for the calculation, possible
  values: ‘`out`’, ‘`in`’, ‘`all`’.

- loops:

  Whether to include vertices themselves in the neighbor sets.
