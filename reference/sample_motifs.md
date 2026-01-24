# Graph motifs

Graph motifs are small connected induced subgraphs with a well-defined
structure. These functions search a graph for various motifs.

## Usage

``` r
sample_motifs(
  graph,
  size = 3,
  cut.prob = rep(0, size),
  sample.size = NULL,
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
  motif (the `size` argument). If `NULL`, the default, no cuts are made.

- sample.size:

  The number of vertices to use as a starting point for finding motifs.
  Only used if the `sample` argument is `NULL`. The default is
  `ceiling(vcount(graph) / 10)` .

- sample:

  If not `NULL` then it specifies the vertices to use as a starting
  point for finding motifs.

## Value

A numeric scalar, an estimate for the total number of motifs in the
graph.

## Details

`sample_motifs()` estimates the total number of motifs of a given size
in a graph based on a sample.

## See also

[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md)

Other graph motifs:
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md),
[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md),
[`motifs()`](https://r.igraph.org/reference/motifs.md)

## Examples

``` r
g <- sample_pa(100)
motifs(g, 3)
#>  [1]  NA  NA 389  NA  94   0   0   0   0   0   0   0   0   0   0   0
count_motifs(g, 3)
#> [1] 483
sample_motifs(g, 3)
#> [1] 650
```
