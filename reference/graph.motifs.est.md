# Graph motifs

**\[deprecated\]**

`graph.motifs.est()` was renamed to
[`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md) to
create a more consistent API.

## Usage

``` r
graph.motifs.est(
  graph,
  size = 3,
  cut.prob = rep(0, size),
  sample.size = vcount(graph)/10,
  sample = NULL
)
```

## Arguments

- graph:

  Graph object, the input graph.

- size:

  The size of the motif, currently size 3 and 4 are supported in
  directed graphs and sizes 3-6 in undirected graphs.

- cut.prob:

  Numeric vector giving the probabilities that the search graph is cut
  at a certain level. Its length should be the same as the size of the
  motif (the `size` argument). If `rep(0, size))`, the default, no cuts
  are made.

- sample.size:

  The number of vertices to use as a starting point for finding motifs.
  Only used if the `sample` argument is `NULL`. The default is
  `ceiling(vcount(graph) / 10)` .

- sample:

  If not `NULL` then it specifies the vertices to use as a starting
  point for finding motifs.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`motifs_randesu_estimate`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_motifs_randesu_estimate)
