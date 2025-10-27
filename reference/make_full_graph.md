# Create a full graph

Create a full graph

## Usage

``` r
make_full_graph(n, directed = FALSE, loops = FALSE)

full_graph(...)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether to create a directed graph.

- loops:

  Whether to add self-loops to the graph.

- ...:

  Passed to `make_full_graph()`.

## Value

An igraph graph

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md)

## Examples

``` r
make_full_graph(5)
#> IGRAPH 7f32a97 U--- 5 10 -- Full graph
#> + attr: name (g/c), loops (g/l)
#> + edges from 7f32a97:
#>  [1] 1--2 1--3 1--4 1--5 2--3 2--4 2--5 3--4 3--5 4--5
print_all(make_full_graph(4, directed = TRUE))
#> IGRAPH 04f725b D--- 4 12 -- Full graph
#> + attr: name (g/c), loops (g/l)
#> + graph attributes:
#> | + name:
#> |   [1] "Full graph"
#> | + loops:
#> |   [1] FALSE
#> + edges:
#> 1 -> 2 3 4   2 -> 1 3 4   3 -> 1 2 4   4 -> 1 2 3
```
