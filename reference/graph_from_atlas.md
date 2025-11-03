# Create a graph from the Graph Atlas

`graph_from_atlas()` creates graphs from the book ‘An Atlas of Graphs’
by Roland C. Read and Robin J. Wilson. The atlas contains all undirected
graphs with up to seven vertices, numbered from 0 up to 1252. The graphs
are listed:

1.  in increasing order of number of nodes;

2.  for a fixed number of nodes, in increasing order of the number of
    edges;

3.  for fixed numbers of nodes and edges, in increasing order of the
    degree sequence, for example 111223 \< 112222;

4.  for fixed degree sequence, in increasing number of automorphisms.

## Usage

``` r
graph_from_atlas(n)

atlas(...)
```

## Arguments

- n:

  The id of the graph to create.

- ...:

  Passed to `graph_from_atlas()`.

## Value

An igraph graph.

## See also

Other deterministic constructors:
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
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Examples

``` r
## Some randomly picked graphs from the atlas
graph_from_atlas(sample(0:1252, 1))
#> IGRAPH f4fea30 U--- 7 6 -- Graph from the Atlas #282
#> + attr: name (g/c), n (g/n)
#> + edges from f4fea30:
#> [1] 1--5 1--4 2--3 3--6 6--7 3--7
graph_from_atlas(sample(0:1252, 1))
#> IGRAPH 5ff81e8 U--- 7 13 -- Graph from the Atlas #1073
#> + attr: name (g/c), n (g/n)
#> + edges from 5ff81e8:
#>  [1] 1--2 1--7 2--5 2--6 3--4 3--5 3--6 3--7 4--5 4--6 4--7 5--7 6--7
```
