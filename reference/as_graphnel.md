# Convert igraph graphs to graphNEL objects from the graph package

The graphNEL class is defined in the `graph` package, it is another way
to represent graphs. These functions are provided to convert between the
igraph and the graphNEL objects.

## Usage

``` r
as_graphnel(graph)
```

## Arguments

- graph:

  An igraph graph object.

## Value

`as_graphnel()` returns a graphNEL graph object.

## Details

`as_graphnel()` converts an igraph graph to a graphNEL graph. It
converts all graph/vertex/edge attributes. If the igraph graph has a
vertex attribute ‘`name`’, then it will be used to assign vertex names
in the graphNEL graph. Otherwise numeric igraph vertex IDs will be used
for this purpose.

## Related documentation in the C library

[`get_edgelist()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`is_directed()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`has_multiple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_has_multiple),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)
for the other direction,
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
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Examples

``` r
## Undirected
g <- make_ring(10)
V(g)$name <- letters[1:10]
GNEL <- as_graphnel(g)
g2 <- graph_from_graphnel(GNEL)
g2
#> ── <igraph> Ring graph ────────────────────────────────────────────── d4d68dd ──
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
#> ── <igraph> In-star ───────────────────────────────────────────────── 1748f70 ──
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
