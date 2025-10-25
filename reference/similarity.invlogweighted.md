# Similarity measures of two vertices (inverse log-weighted)

**\[deprecated\]**

Please use
[`similarity()`](https://r.igraph.org/reference/similarity.md) with
`method = "invlogweighted"` instead.

## Usage

``` r
similarity.invlogweighted(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total")
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
