# Generating set of the automorphism group of a graph

Compute the generating set of the automorphism group of a graph.

## Usage

``` r
automorphism_group(
  graph,
  colors = NULL,
  sh = c("fm", "f", "fs", "fl", "flm", "fsm"),
  details = FALSE
)
```

## Arguments

- graph:

  The input graph, it is treated as undirected.

- colors:

  The colors of the individual vertices of the graph; only vertices
  having the same color are allowed to match each other in an
  automorphism. When omitted, igraph uses the `color` attribute of the
  vertices, or, if there is no such vertex attribute, it simply assumes
  that all vertices have the same color. Pass NULL explicitly if the
  graph has a `color` vertex attribute but you do not want to use it.

- sh:

  The splitting heuristics for the BLISS algorithm. Possible values are:
  ‘`f`’: first non-singleton cell, ‘`fl`’: first largest non-singleton
  cell, ‘`fs`’: first smallest non-singleton cell, ‘`fm`’: first
  maximally non-trivially connected non-singleton cell, ‘`flm`’: first
  largest maximally non-trivially connected non-singleton cell, ‘`fsm`’:
  first smallest maximally non-trivially connected non-singleton cell.

- details:

  Specifies whether to provide additional details about the BLISS
  internals in the result.

## Value

When `details` is `FALSE`, a list of vertex permutations that form a
generating set of the automorphism group of the input graph. When
`details` is `TRUE`, a named list with two members:

- generators:

  Returns the generators themselves

- info:

  Additional information about the BLISS internals. See
  [`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md)
  for more details.

## Details

An automorphism of a graph is a permutation of its vertices which brings
the graph into itself. The automorphisms of a graph form a group and
there exists a subset of this group (i.e. a set of permutations) such
that every other permutation can be expressed as a combination of these
permutations. These permutations are called the generating set of the
automorphism group.

This function calculates a possible generating set of the automorphism
of a graph using the BLISS algorithm. See also the BLISS homepage at
[http://www.tcs.hut.fi/Software/bliss/index.html](http://www.tcs.hut.fi/Software/bliss/index.md).
The calculated generating set is not necessarily minimal, and it may
depend on the splitting heuristics used by BLISS.

## References

Tommi Junttila and Petteri Kaski: Engineering an Efficient Canonical
Labeling Tool for Large and Sparse Graphs, *Proceedings of the Ninth
Workshop on Algorithm Engineering and Experiments and the Fourth
Workshop on Analytic Algorithms and Combinatorics.* 2007.

## See also

[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`permute()`](https://r.igraph.org/reference/permute.md),
[`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md)

Other graph automorphism:
[`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md)

## Author

Tommi Junttila (<https://users.ics.aalto.fi/tjunttil/>) for BLISS, Gabor
Csardi <csardi.gabor@gmail.com> for the igraph glue code and Tamas
Nepusz <ntamas@gmail.com> for this manual page.

## Related documentation in the C library

[`automorphism_group()`](https://igraph.org/c/html/latest/igraph-Isomorphism.html#igraph_automorphism_group).

## Examples

``` r
## A ring has n*2 automorphisms, and a possible generating set is one that
## "turns" the ring by one vertex to the left or right
g <- make_ring(10)
automorphism_group(g)
#> [[1]]
#> + 10/10 vertices, from a7ebad5:
#>  [1]  1 10  9  8  7  6  5  4  3  2
#> 
#> [[2]]
#> + 10/10 vertices, from a7ebad5:
#>  [1]  2  3  4  5  6  7  8  9 10  1
#> 
```
