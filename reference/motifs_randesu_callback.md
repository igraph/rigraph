# Find motifs with a callback function

This function searches for motifs in a graph and calls a user-provided
callback function for each motif found.

## Usage

``` r
motifs_randesu_callback(graph, size = 3, cut_prob = NULL, callback)
```

## Arguments

- graph:

  Graph object, the input graph.

- size:

  The size of the motif, currently sizes 3 and 4 are supported in
  directed graphs and sizes 3-6 in undirected graphs.

- cut_prob:

  Numeric vector giving the probabilities that the search graph is cut
  at a certain level. Its length should be the same as the size of the
  motif (the `size` argument). If `NULL`, the default, no cuts are made.

- callback:

  A function to call for each motif found. The function should accept
  two arguments: `vids` (integer vector of vertex IDs in the motif,
  1-based indexing) and `isoclass` (the isomorphism class of the motif,
  1-based). The function should return `TRUE` to continue the search or
  `FALSE` to stop it.

## Value

`NULL`, invisibly. This function is called for its side effects (calling
the callback function for each motif).

## See also

[`motifs()`](https://r.igraph.org/reference/motifs.md),
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md)

Other graph motifs:
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md),
[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md),
[`motifs()`](https://r.igraph.org/reference/motifs.md),
[`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md)

## Examples

``` r
g <- sample_pa(100)
count <- 0
motifs_randesu_callback(g, 3, callback = function(vids, isoclass) {
  count <<- count + 1
  TRUE  # continue search
})
cat("Found", count, "motifs\n")
#> Found 393 motifs
```
