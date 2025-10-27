# Similarity measures of two vertices

These functions calculates similarity scores for vertices based on their
connection patterns.

## Usage

``` r
similarity(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = FALSE,
  method = c("jaccard", "dice", "invlogweighted")
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

- method:

  The method to use.

## Value

A `length(vids)` by `length(vids)` numeric matrix containing the
similarity scores. This argument is ignored by the `invlogweighted`
method.

## Details

The Jaccard similarity coefficient of two vertices is the number of
common neighbors divided by the number of vertices that are neighbors of
at least one of the two vertices being considered. The `jaccard` method
calculates the pairwise Jaccard similarities for some (or all) of the
vertices.

The Dice similarity coefficient of two vertices is twice the number of
common neighbors divided by the sum of the degrees of the vertices.
Methof `dice` calculates the pairwise Dice similarities for some (or
all) of the vertices.

The inverse log-weighted similarity of two vertices is the number of
their common neighbors, weighted by the inverse logarithm of their
degrees. It is based on the assumption that two vertices should be
considered more similar if they share a low-degree common neighbor,
since high-degree common neighbors are more likely to appear even by
pure chance. Isolated vertices will have zero similarity to any other
vertex. Self-similarities are not calculated. See the following paper
for more details: Lada A. Adamic and Eytan Adar: Friends and neighbors
on the Web. Social Networks, 25(3):211-230, 2003.

## References

Lada A. Adamic and Eytan Adar: Friends and neighbors on the Web. *Social
Networks*, 25(3):211-230, 2003.

## See also

Other cocitation:
[`cocitation()`](https://r.igraph.org/reference/cocitation.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com> for the manual page.

## Related documentation in the C library

[`similarity_jaccard()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_similarity_jaccard),
[`similarity_dice()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_similarity_dice),
[`similarity_inverse_log_weighted()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_similarity_inverse_log_weighted).

## Examples

``` r
g <- make_ring(5)
similarity(g, method = "dice")
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]  1.0  0.0  0.5  0.5  0.0
#> [2,]  0.0  1.0  0.0  0.5  0.5
#> [3,]  0.5  0.0  1.0  0.0  0.5
#> [4,]  0.5  0.5  0.0  1.0  0.0
#> [5,]  0.0  0.5  0.5  0.0  1.0
similarity(g, method = "jaccard")
#>           [,1]      [,2]      [,3]      [,4]      [,5]
#> [1,] 1.0000000 0.0000000 0.3333333 0.3333333 0.0000000
#> [2,] 0.0000000 1.0000000 0.0000000 0.3333333 0.3333333
#> [3,] 0.3333333 0.0000000 1.0000000 0.0000000 0.3333333
#> [4,] 0.3333333 0.3333333 0.0000000 1.0000000 0.0000000
#> [5,] 0.0000000 0.3333333 0.3333333 0.0000000 1.0000000
```
