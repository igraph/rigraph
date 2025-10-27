# Number of automorphisms

Calculate the number of automorphisms of a graph, i.e. the number of
isomorphisms to itself.

## Usage

``` r
count_automorphisms(
  graph,
  colors = NULL,
  sh = c("fm", "f", "fs", "fl", "flm", "fsm")
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

## Value

A named list with the following members:

- group_size:

  The size of the automorphism group of the input graph, as a string.
  This number is exact if igraph was compiled with the GMP library, and
  approximate otherwise.

- nof_nodes:

  The number of nodes in the search tree.

- nof_leaf_nodes:

  The number of leaf nodes in the search tree.

- nof_bad_nodes:

  Number of bad nodes.

- nof_canupdates:

  Number of canrep updates.

- max_level:

  Maximum level.

## Details

An automorphism of a graph is a permutation of its vertices which brings
the graph into itself.

This function calculates the number of automorphism of a graph using the
BLISS algorithm. See also the BLISS homepage at
[http://www.tcs.hut.fi/Software/bliss/index.html](http://www.tcs.hut.fi/Software/bliss/index.md).
If you need the automorphisms themselves, use
[`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)
to obtain a compact representation of the automorphism group.

## References

Tommi Junttila and Petteri Kaski: Engineering an Efficient Canonical
Labeling Tool for Large and Sparse Graphs, *Proceedings of the Ninth
Workshop on Algorithm Engineering and Experiments and the Fourth
Workshop on Analytic Algorithms and Combinatorics.* 2007.

## See also

[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`permute()`](https://r.igraph.org/reference/permute.md), and
[`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)
for a compact representation of all automorphisms

Other graph automorphism:
[`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)

## Author

Tommi Junttila (<https://users.ics.aalto.fi/tjunttil/>) for BLISS and
Gabor Csardi <csardi.gabor@gmail.com> for the igraph glue code and this
manual page.

## Related documentation in the C library

[`count_automorphisms()`](https://igraph.org/c/html/latest/igraph-Isomorphism.html#igraph_count_automorphisms).

## Examples

``` r
## A ring has n*2 automorphisms, you can "turn" it by 0-9 vertices
## and each of these graphs can be "flipped"
g <- make_ring(10)
count_automorphisms(g)
#> $nof_nodes
#> [1] 6
#> 
#> $nof_leaf_nodes
#> [1] 4
#> 
#> $nof_bad_nodes
#> [1] 0
#> 
#> $nof_canupdates
#> [1] 1
#> 
#> $max_level
#> [1] 2
#> 
#> $group_size
#> [1] "20"
#> 

## A full graph has n! automorphisms; however, we restrict the vertex
## matching by colors, leading to only 4 automorphisms
g <- make_full_graph(4)
count_automorphisms(g, colors = c(1, 2, 1, 2))
#> $nof_nodes
#> [1] 5
#> 
#> $nof_leaf_nodes
#> [1] 3
#> 
#> $nof_bad_nodes
#> [1] 0
#> 
#> $nof_canupdates
#> [1] 1
#> 
#> $max_level
#> [1] 2
#> 
#> $group_size
#> [1] "4"
#> 
```
