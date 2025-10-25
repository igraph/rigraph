# Create a star graph, a tree with n vertices and n - 1 leaves

`star()` creates a star graph, in this every single vertex is connected
to the center vertex and nobody else.

## Usage

``` r
make_star(n, mode = c("in", "out", "mutual", "undirected"), center = 1)

star(...)
```

## Arguments

- n:

  Number of vertices.

- mode:

  It defines the direction of the edges, `in`: the edges point *to* the
  center, `out`: the edges point *from* the center, `mutual`: a directed
  star is created with mutual edges, `undirected`: the edges are
  undirected.

- center:

  ID of the center vertex.

- ...:

  Passed to `make_star()`.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md)

## Examples

``` r
make_star(10, mode = "out")
#> IGRAPH 6f9f81e D--- 10 9 -- Out-star
#> + attr: name (g/c), mode (g/c), center (g/n)
#> + edges from 6f9f81e:
#> [1] 1-> 2 1-> 3 1-> 4 1-> 5 1-> 6 1-> 7 1-> 8 1-> 9 1->10
make_star(5, mode = "undirected")
#> IGRAPH 0c34a7f U--- 5 4 -- Star
#> + attr: name (g/c), mode (g/c), center (g/n)
#> + edges from 0c34a7f:
#> [1] 1--2 1--3 1--4 1--5
```
