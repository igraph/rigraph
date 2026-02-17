# Create a wheel graph

**\[experimental\]**

A wheel graph is created by connecting a center vertex to all vertices
of a cycle graph. A wheel graph on `n` vertices can be thought of as a
wheel with `n - 1` spokes. The cycle graph part makes up the rim, while
the star graph part adds the spokes.

Note that the two and three-vertex wheel graphs are non-simple: The
two-vertex wheel graph contains a self-loop, while the three-vertex
wheel graph contains parallel edges (a 1-cycle and a 2-cycle,
respectively).

## Usage

``` r
make_wheel(n, ..., mode = c("in", "out", "mutual", "undirected"), center = 1)

wheel(n, ..., mode = c("in", "out", "mutual", "undirected"), center = 1)
```

## Arguments

- n:

  Number of vertices.

- ...:

  These dots are for future extensions and must be empty.

- mode:

  It defines the direction of the edges. `in`: the edges point *to* the
  center, `out`: the edges point *from* the center, `mutual`: a directed
  wheel is created with mutual edges, `undirected`: the edges are
  undirected.

- center:

  ID of the center vertex.

## Value

An igraph graph.

## Related documentation in the C library

[`wheel`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_wheel)

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md)

## Examples

``` r
make_wheel(10, mode = "out")
#> IGRAPH 3fc2b64 D--- 10 18 -- Out-wheel
#> + attr: name (g/c), mode (g/c), center (g/n)
#> + edges from 3fc2b64:
#>  [1]  1-> 2  1-> 3  1-> 4  1-> 5  1-> 6  1-> 7  1-> 8  1-> 9  1->10  2-> 3
#> [11]  3-> 4  4-> 5  5-> 6  6-> 7  7-> 8  8-> 9  9->10 10-> 2
make_wheel(5, mode = "undirected")
#> IGRAPH b5769b1 U--- 5 8 -- Wheel
#> + attr: name (g/c), mode (g/c), center (g/n)
#> + edges from b5769b1:
#> [1] 1--2 1--3 1--4 1--5 2--3 3--4 4--5 2--5
```
