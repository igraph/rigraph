# Convert graphNEL objects from the graph package to igraph

The graphNEL class is defined in the `graph` package, it is another way
to represent graphs. `graph_from_graphnel()` takes a graphNEL graph and
converts it to an igraph graph. It handles all graph/vertex/edge
attributes. If the graphNEL graph has a vertex attribute called ‘`name`’
it will be used as igraph vertex attribute ‘`name`’ and the graphNEL
vertex names will be ignored.

## Usage

``` r
graph_from_graphnel(graphNEL, name = TRUE, weight = TRUE, unlist.attrs = TRUE)
```

## Arguments

- graphNEL:

  The graphNEL graph.

- name:

  Logical scalar, whether to add graphNEL vertex names as an igraph
  vertex attribute called ‘`name`’.

- weight:

  Logical scalar, whether to add graphNEL edge weights as an igraph edge
  attribute called ‘`weight`’. (graphNEL graphs are always weighted.)

- unlist.attrs:

  Logical scalar. graphNEL attribute query functions return the values
  of the attributes in R lists, if this argument is `TRUE` (the default)
  these will be converted to atomic vectors, whenever possible, before
  adding them to the igraph graph.

## Value

`graph_from_graphnel()` returns an igraph graph object.

## Details

Because graphNEL graphs poorly support multiple edges, the edge
attributes of the multiple edges are lost: they are all replaced by the
attributes of the first of the multiple edges.

## Related documentation in the C library

[`get_edgelist()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`adjlist()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_adjlist),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md) for the
other direction,
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md) and
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md)
for other graph representations.

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md)

## Examples

``` r
## Undirected
g <- make_ring(10)
V(g)$name <- letters[1:10]
GNEL <- as_graphnel(g)
g2 <- graph_from_graphnel(GNEL)
g2
#> ── <igraph> Ring graph ────────────────────────────────────────────── bae369c ──
#> ℹ undirected · named · weighted
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> → vertex: name <chr>
#> → edge:   weight <dbl>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#>  [1] a ─ b  a ─ j  b ─ c  c ─ d  d ─ e  e ─ f  f ─ g  g ─ h  h ─ i  i ─ j 

## Directed
g3 <- make_star(10, mode = "in")
V(g3)$name <- letters[1:10]
GNEL2 <- as_graphnel(g3)
g4 <- graph_from_graphnel(GNEL2)
g4
#> ── <igraph> In-star ───────────────────────────────────────────────── b63977e ──
#> ℹ directed · named · weighted
#> ℹ 10 vertices · 9 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mode <chr>, center <dbl>
#> → vertex: name <chr>
#> → edge:   weight <dbl>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#> [1] b → a  c → a  d → a  e → a  f → a  g → a  h → a  i → a  j → a 
```
