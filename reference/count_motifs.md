# Graph motifs

Graph motifs are small connected induced subgraphs with a well-defined
structure. These functions search a graph for various motifs.

## Usage

``` r
count_motifs(graph, size = 3, cut.prob = NULL)
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

## Value

`count_motifs()` returns a numeric scalar.

## Details

`count_motifs()` calculates the total number of motifs of a given size
in graph.

## Related documentation in the C library

[`motifs_randesu_no`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_motifs_randesu_no)

## See also

[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md)

Other graph motifs:
[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md),
[`motifs()`](https://r.igraph.org/reference/motifs.md),
[`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md)

## Examples

``` r
g <- sample_pa(100)
motifs(g, 3)
#>  [1]  NA  NA 474  NA  90   0   0   0   0   0   0   0   0   0   0   0
count_motifs(g, 3)
#> [1] 564
sample_motifs(g, 3)
#> [1] 400
```
