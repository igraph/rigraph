# Convert a graph to a long data frame

A long data frame contains all metadata about both the vertices and
edges of the graph. It contains one row for each edge, and all metadata
about that edge and its incident vertices are included in that row. The
names of the columns that contain the metadata of the incident vertices
are prefixed with `from_` and `to_`. The first two columns are always
named `from` and `to` and they contain the numeric ids of the incident
vertices. The rows are listed in the order of numeric vertex ids.

## Usage

``` r
as_long_data_frame(graph)
```

## Arguments

- graph:

  Input graph

## Value

A long data frame.

## See also

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Examples

``` r
g <- make_(
  ring(10),
  with_vertex_(name = letters[1:10], color = "red"),
  with_edge_(weight = 1:10, color = "green")
)
as_long_data_frame(g)
#>    from to weight color from_name from_color to_name to_color
#> 1     1  2      1 green         a        red       b      red
#> 2     2  3      2 green         b        red       c      red
#> 3     3  4      3 green         c        red       d      red
#> 4     4  5      4 green         d        red       e      red
#> 5     5  6      5 green         e        red       f      red
#> 6     6  7      6 green         f        red       g      red
#> 7     7  8      7 green         g        red       h      red
#> 8     8  9      8 green         h        red       i      red
#> 9     9 10      9 green         i        red       j      red
#> 10    1 10     10 green         a        red       j      red
```
