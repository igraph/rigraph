# Decide if a graph is subgraph isomorphic to another one

Decide if a graph is subgraph isomorphic to another one

## Usage

``` r
subgraph_isomorphic(pattern, target, method = c("auto", "lad", "vf2"), ...)

is_subgraph_isomorphic_to(
  pattern,
  target,
  method = c("auto", "lad", "vf2"),
  ...
)
```

## Arguments

- pattern:

  The smaller graph, it might be directed or undirected. Undirected
  graphs are treated as directed graphs with mutual edges.

- target:

  The bigger graph, it might be directed or undirected. Undirected
  graphs are treated as directed graphs with mutual edges.

- method:

  The method to use. Possible values: ‘auto’, ‘lad’, ‘vf2’. See their
  details below.

- ...:

  Additional arguments, passed to the various methods.

## Value

Logical scalar, `TRUE` if the `pattern` is isomorphic to a (possibly
induced) subgraph of `target`.

## ‘auto’ method

This method currently selects ‘lad’, always, as it seems to be superior
on most graphs.

## ‘lad’ method

This is the LAD algorithm by Solnon, see the reference below. It has the
following extra arguments:

- domains:

  If not `NULL`, then it specifies matching restrictions. It must be a
  list of `target` vertex sets, given as numeric vertex ids or symbolic
  vertex names. The length of the list must be `vcount(pattern)` and for
  each vertex in `pattern` it gives the allowed matching vertices in
  `target`. Defaults to `NULL`.

- induced:

  Logical scalar, whether to search for an induced subgraph. It is
  `FALSE` by default.

- time.limit:

  The processor time limit for the computation, in seconds. It defaults
  to `Inf`, which means no limit.

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

## References

LP Cordella, P Foggia, C Sansone, and M Vento: An improved algorithm for
matching large graphs, *Proc. of the 3rd IAPR TC-15 Workshop on
Graphbased Representations in Pattern Recognition*, 149–159, 2001.

C. Solnon: AllDifferent-based Filtering for Subgraph Isomorphism,
*Artificial Intelligence* 174(12-13):850–864, 2010.

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)

## Examples

``` r
# A LAD example
pattern <- make_graph(
  ~ 1:2:3:4:5,
  1 - 2:5, 2 - 1:5:3, 3 - 2:4, 4 - 3:5, 5 - 4:2:1
)
target <- make_graph(
  ~ 1:2:3:4:5:6:7:8:9,
  1 - 2:5:7, 2 - 1:5:3, 3 - 2:4, 4 - 3:5:6:8:9,
  5 - 1:2:4:6:7, 6 - 7:5:4:9, 7 - 1:5:6,
  8 - 4:9, 9 - 6:4:8
)
domains <- list(
  `1` = c(1, 3, 9), `2` = c(5, 6, 7, 8), `3` = c(2, 4, 6, 7, 8, 9),
  `4` = c(1, 3, 9), `5` = c(2, 4, 8, 9)
)
subgraph_isomorphisms(pattern, target)
#> [[1]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 2 1 7 6 5
#> 
#> [[2]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 2 3 4 5
#> 
#> [[3]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 4 3 2 5
#> 
#> [[4]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 8 4 5 6 9
#> 
#> [[5]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 5 4 8 9 6
#> 
#> [[6]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 9 4 5 7 6
#> 
#> [[7]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 5 4 6 7
#> 
#> [[8]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 5 4 3 2
#> 
#> [[9]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 4 5 1 7 6
#> 
#> [[10]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 7 5 4 9 6
#> 
#> [[11]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 5 2 3 4
#> 
#> [[12]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 5 2 1 7
#> 
#> [[13]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 2 5 6 7 1
#> 
#> [[14]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 9 6 7 5 4
#> 
#> [[15]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 5 6 9 8 4
#> 
#> [[16]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 4 6 7 1 5
#> 
#> [[17]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 7 6 9 4 5
#> 
#> [[18]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 7 6 4 5
#> 
#> [[19]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 7 1 2 5
#> 
#> [[20]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 8 9 6 5 4
#> 
subgraph_isomorphisms(pattern, target, induced = TRUE)
#> [[1]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 2 3 4 5
#> 
#> [[2]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 4 3 2 5
#> 
#> [[3]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 6 5 2 3 4
#> 
#> [[4]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 5 4 3 2
#> 
subgraph_isomorphisms(pattern, target, domains = domains)
#> [[1]]
#> + 5/9 vertices, named, from 1c0fddc:
#> [1] 1 5 4 3 2
#> 

# Directed LAD example
pattern <- make_graph(~ 1:2:3, 1 -+ 2:3)
dring <- make_ring(10, directed = TRUE)
subgraph_isomorphic(pattern, dring)
#> [1] FALSE
```
