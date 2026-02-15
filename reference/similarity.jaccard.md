# Similarity measures of two vertices (Jaccard)

**\[deprecated\]**

Please use
[`similarity()`](https://r.igraph.org/reference/similarity.md) with
`method = "jaccard"` instead.

## Usage

``` r
similarity.jaccard(
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

## Related documentation in the C library

[`similarity_dice`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_similarity_dice),
[`similarity_inverse_log_weighted`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_similarity_inverse_log_weighted),
[`similarity_jaccard`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_similarity_jaccard),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
