# Convert between directed and undirected graphs

`as_directed()` converts an undirected graph to directed,
`as_undirected()` does the opposite, it converts a directed graph to
undirected.

## Usage

``` r
as_directed(graph, mode = c("mutual", "arbitrary", "random", "acyclic"))

as_undirected(
  graph,
  mode = c("collapse", "each", "mutual"),
  edge.attr.comb = igraph_opt("edge.attr.comb")
)
```

## Arguments

- graph:

  The graph to convert.

- mode:

  Character constant, defines the conversion algorithm. For
  `as_directed()` it can be `mutual` or `arbitrary`. For
  `as_undirected()` it can be `each`, `collapse` or `mutual`. See
  details below.

- edge.attr.comb:

  Specifies what to do with edge attributes, if `mode="collapse"` or
  `mode="mutual"`. In these cases many edges might be mapped to a single
  one in the new graph, and their attributes are combined. Please see
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details on this.

## Value

A new graph object.

## Details

Conversion algorithms for `as_directed()`:

- "arbitrary":

  The number of edges in the graph stays the same, an arbitrarily
  directed edge is created for each undirected edge, but the direction
  of the edge is deterministic (i.e. it always points the same way if
  you call the function multiple times).

- "mutual":

  Two directed edges are created for each undirected edge, one in each
  direction.

- "random":

  The number of edges in the graph stays the same, and a randomly
  directed edge is created for each undirected edge. You will get
  different results if you call the function multiple times with the
  same graph.

- "acyclic":

  The number of edges in the graph stays the same, and a directed edge
  is created for each undirected edge such that the resulting graph is
  guaranteed to be acyclic. This is achieved by ensuring that edges
  always point from a lower index vertex to a higher index. Note that
  the graph may include cycles of length 1 if the original graph
  contained loop edges.

Conversion algorithms for `as_undirected()`:

- "each":

  The number of edges remains constant, an undirected edge is created
  for each directed one, this version might create graphs with multiple
  edges.

- "collapse":

  One undirected edge will be created for each pair of vertices which
  are connected with at least one directed edge, no multiple edges will
  be created.

- "mutual":

  One undirected edge will be created for each pair of mutual edges.
  Non-mutual edges are ignored. This mode might create multiple edges if
  there are more than one mutual edge pairs between the same pair of
  vertices.

## See also

[`simplify()`](https://r.igraph.org/reference/simplify.md) for removing
multiple and/or loop edges from a graph.

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`to_directed()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_to_directed).

## Examples

``` r
g <- make_ring(10)
as_directed(g, "mutual")
#> IGRAPH 9f9d39a D--- 10 20 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 9f9d39a:
#>  [1]  1-> 2  2-> 3  3-> 4  4-> 5  5-> 6  6-> 7  7-> 8  8-> 9  9->10  1->10
#> [11]  2-> 1  3-> 2  4-> 3  5-> 4  6-> 5  7-> 6  8-> 7  9-> 8 10-> 9 10-> 1
g2 <- make_star(10)
as_undirected(g)
#> IGRAPH 7a5153b U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 7a5153b:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10

# Combining edge attributes
g3 <- make_ring(10, directed = TRUE, mutual = TRUE)
E(g3)$weight <- seq_len(ecount(g3))
ug3 <- as_undirected(g3)
print(ug3, e = TRUE)
#> IGRAPH e39146e U-W- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), weight (e/n)
#> + edges from e39146e:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 1--10 9--10
if (FALSE) { # rlang::is_interactive()
x11(width = 10, height = 5)
layout(rbind(1:2))
plot(g3, layout = layout_in_circle, edge.label = E(g3)$weight)
plot(ug3, layout = layout_in_circle, edge.label = E(ug3)$weight)
}

g4 <- make_graph(c(
  1, 2, 3, 2, 3, 4, 3, 4, 5, 4, 5, 4,
  6, 7, 7, 6, 7, 8, 7, 8, 8, 7, 8, 9, 8, 9,
  9, 8, 9, 8, 9, 9, 10, 10, 10, 10
))
E(g4)$weight <- seq_len(ecount(g4))
ug4 <- as_undirected(g4,
  mode = "mutual",
  edge.attr.comb = list(weight = length)
)
print(ug4, e = TRUE)
#> IGRAPH 341dd49 U-W- 10 7 -- 
#> + attr: weight (e/n)
#> + edges from 341dd49:
#> [1]  6-- 7  7-- 8  8-- 9  8-- 9  9-- 9 10--10 10--10
```
