# Graph motifs

Graph motifs are small connected induced subgraphs with a well-defined
structure. These functions search a graph for various motifs.

## Usage

``` r
motifs(graph, size = 3, cut.prob = NULL)
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
  motif (the `size` argument). If `NULL`, the default, no cuts are made.

## Value

`motifs()` returns a numeric vector, the number of occurrences of each
motif in the graph. The motifs are ordered by their isomorphism classes.
Note that for unconnected subgraphs, which are not considered to be
motifs, the result will be `NA`.

## Details

`motifs()` searches a graph for motifs of a given size and returns a
numeric vector containing the number of different motifs. The order of
the motifs is defined by their isomorphism class, see
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md).

## See also

[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md)

Other graph motifs:
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md),
[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md),
[`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md)

## Examples

``` r
g <- sample_pa(100)
motifs(g, 3)
#>  [1]  NA  NA 504  NA  83   0   0   0   0   0   0   0   0   0   0   0
count_motifs(g, 3)
#> [1] 587
sample_motifs(g, 3)
#> [1] 0
```
