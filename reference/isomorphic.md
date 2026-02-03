# Decide if two graphs are isomorphic

Decide if two graphs are isomorphic

## Usage

``` r
isomorphic(graph1, graph2, method = c("auto", "direct", "vf2", "bliss"), ...)

is_isomorphic_to(
  graph1,
  graph2,
  method = c("auto", "direct", "vf2", "bliss"),
  ...
)
```

## Arguments

- graph1:

  The first graph.

- graph2:

  The second graph.

- method:

  The method to use. Possible values: ‘auto’, ‘direct’, ‘vf2’, ‘bliss’.
  See their details below.

- ...:

  Additional arguments, passed to the various methods.

## Value

Logical scalar, `TRUE` if the graphs are isomorphic.

## ‘auto’ method

It tries to select the appropriate method based on the two graphs. This
is the algorithm it uses:

1.  If the two graphs do not agree on their order and size (i.e. number
    of vertices and edges), then return `FALSE`.

2.  If the graphs have three or four vertices, then the ‘direct’ method
    is used.

3.  If the graphs are directed, then the ‘vf2’ method is used.

4.  Otherwise the ‘bliss’ method is used.

## ‘direct’ method

This method only works on graphs with three or four vertices, and it is
based on a pre-calculated and stored table. It does not have any extra
arguments.

## ‘vf2’ method

This method uses the VF2 algorithm by Cordella, Foggia et al., see
references below. It supports vertex and edge colors and have the
following extra arguments:

- vertex.color1, vertex.color2:

  Optional integer vectors giving the colors of the vertices for colored
  graph isomorphism. If they are not given, but the graph has a “color”
  vertex attribute, then it will be used. If you want to ignore these
  attributes, then supply `NULL` for both of these arguments. See also
  examples below.

- edge.color1, edge.color2:

  Optional integer vectors giving the colors of the edges for
  edge-colored (sub)graph isomorphism. If they are not given, but the
  graph has a “color” edge attribute, then it will be used. If you want
  to ignore these attributes, then supply `NULL` for both of these
  arguments.

## ‘bliss’ method

Uses the BLISS algorithm by Junttila and Kaski, and it works for
undirected graphs. For both graphs the
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
and then the [`permute()`](https://r.igraph.org/reference/permute.md)
function is called to transfer them into canonical form; finally the
canonical forms are compared. Extra arguments:

- sh:

  Character constant, the heuristics to use in the BLISS algorithm for
  `graph1` and `graph2`. See the `sh` argument of
  [`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
  for possible values.

`sh` defaults to ‘fm’.

## Related documentation in the C library

[`isomorphic()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_isomorphic),
[`isomorphic_bliss()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_isomorphic_bliss),
[`isomorphic_vf2()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_isomorphic_vf2),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## References

Tommi Junttila and Petteri Kaski: Engineering an Efficient Canonical
Labeling Tool for Large and Sparse Graphs, *Proceedings of the Ninth
Workshop on Algorithm Engineering and Experiments and the Fourth
Workshop on Analytic Algorithms and Combinatorics.* 2007.

LP Cordella, P Foggia, C Sansone, and M Vento: An improved algorithm for
matching large graphs, *Proc. of the 3rd IAPR TC-15 Workshop on
Graphbased Representations in Pattern Recognition*, 149–159, 2001.

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)

## Examples

``` r
# create some non-isomorphic graphs
g1 <- graph_from_isomorphism_class(3, 10)
g2 <- graph_from_isomorphism_class(3, 11)
isomorphic(g1, g2)
#> [1] FALSE

# create two isomorphic graphs, by permuting the vertices of the first
g1 <- sample_pa(30, m = 2, directed = FALSE)
g2 <- permute(g1, sample(vcount(g1)))
# should be TRUE
isomorphic(g1, g2)
#> [1] TRUE
isomorphic(g1, g2, method = "bliss")
#> [1] TRUE
isomorphic(g1, g2, method = "vf2")
#> [1] TRUE

# colored graph isomorphism
g1 <- make_ring(10)
g2 <- make_ring(10)
isomorphic(g1, g2)
#> [1] TRUE

V(g1)$color <- rep(1:2, length = vcount(g1))
V(g2)$color <- rep(2:1, length = vcount(g2))
# consider colors by default
count_isomorphisms(g1, g2)
#> [1] 10
# ignore colors
count_isomorphisms(g1, g2,
  vertex.color1 = NULL,
  vertex.color2 = NULL
)
#> [1] 20
```
