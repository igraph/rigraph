# Graph motifs

**\[deprecated\]**

`graph.motifs.no()` was renamed to
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md) to
create a more consistent API.

## Usage

``` r
graph.motifs.no(graph, size = 3, cut.prob = rep(0, size))
```

## Arguments

- graph:

  Graph object, the input graph.

- size:

  The size of the motif.

- cut.prob:

  Numeric vector giving the probabilities that the search graph is cut
  at a certain level. Its length should be the same as the size of the
  motif (the `size` argument). If `NULL`, the default, no cuts are made.
