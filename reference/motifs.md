# Graph motifs

Graph motifs are small connected induced subgraphs with a well-defined
structure. These functions search a graph for various motifs.

## Usage

``` r
motifs(graph, size = 3, cut.prob = NULL, callback = NULL)
```

## Arguments

- graph:

  Graph object, the input graph.

- size:

  The size of the motif, currently sizes 3 and 4 are supported in
  directed graphs and sizes 3 to 6 in undirected graphs.

- cut.prob:

  Numeric vector giving the probabilities that the search graph is cut
  at a certain level. Its length should be the same as the size of the
  motif (the `size` argument). If `NULL`, the default, no cuts are made.

- callback:

  Optional callback function to call for each motif found. The function
  should accept two arguments: `vids` (integer vector of vertex IDs in
  the motif) and `isoclass` (the isomorphism class of the motif). The
  function should return `FALSE` to continue the search or `TRUE` to
  stop it. If `NULL` (the default), motif counts are returned as a
  numeric vector.

  **Important limitation:** Callback functions must NOT call any igraph
  functions (including simple queries like
  [`vcount()`](https://r.igraph.org/reference/gorder.md) or
  [`ecount()`](https://r.igraph.org/reference/gsize.md)). Doing so will
  cause R to crash due to reentrancy issues. Extract any needed graph
  information before calling the function with a callback, or use
  collector mode (the default) and process results afterward.

## Value

When `callback` is `NULL`, `motifs()` returns a numeric vector, the
number of occurrences of each motif in the graph. The motifs are ordered
by their isomorphism classes. Note that for unconnected subgraphs, which
are not considered to be motifs, the result will be `NA`.

When `callback` is provided, the function returns `NULL` invisibly and
calls the callback function for each motif found.

## Details

`motifs()` searches a graph for motifs of a given size and returns a
numeric vector containing the number of different motifs. The order of
the motifs is defined by their isomorphism class, see
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md).

## Related documentation in the C library

[`motifs_randesu()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_motifs_randesu),
[`motifs_randesu_callback_closure()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_motifs_randesu_callback)

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
#>  [1]  NA  NA 266  NA  80   0   0   0   0   0   0   0   0   0   0   0
count_motifs(g, 3)
#> [1] 346
sample_motifs(g, 3)
#> [1] 60

# Using callback to stop search after finding 5 motifs
count <- 0
motifs(g, 3, callback = function(vids, isoclass) {
  count <<- count + 1
  count < 5  # stop after 5 motifs
})
```
