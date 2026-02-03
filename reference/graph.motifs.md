# Graph motifs

**\[deprecated\]**

`graph.motifs()` was renamed to
[`motifs()`](https://r.igraph.org/reference/motifs.md) to create a more
consistent API.

## Usage

``` r
graph.motifs(graph, size = 3, cut.prob = rep(0, size))
```

## Arguments

- graph:

  Graph object, the input graph.

- size:

  The size of the motif, currently sizes 3 and 4 are supported in
  directed graphs and sizes 3-6 in undirected graphs.

- cut.prob:

  Numeric vector giving the probabilities that the search graph is cut
  at a certain level. Its length should be the same as the size of the
  motif (the `size` argument). If `rep(0, size))`, the default, no cuts
  are made.

## Related documentation in the C library

[`motifs_randesu()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_motifs_randesu)
