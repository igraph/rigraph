# Convert a graph to an edge list

Sometimes it is useful to work with a standard representation of a
graph, like an edge list.

## Usage

``` r
as_edgelist(graph, names = TRUE)
```

## Arguments

- graph:

  The graph to convert.

- names:

  Whether to return a character matrix containing vertex names (i.e. the
  `name` vertex attribute) if they exist or numeric vertex ids.

## Value

A `ecount(graph)` by 2 numeric matrix.

## Details

`as_edgelist()` returns the list of edges in a graph.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

[`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md),
[`read_graph()`](https://r.igraph.org/reference/read_graph.md)

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Examples

``` r
g <- sample_gnp(10, 2 / 10)
as_edgelist(g)
#>       [,1] [,2]
#>  [1,]    1    2
#>  [2,]    1    5
#>  [3,]    3    6
#>  [4,]    5    6
#>  [5,]    4    7
#>  [6,]    5    8
#>  [7,]    7    8
#>  [8,]    2   10
#>  [9,]    3   10

V(g)$name <- LETTERS[seq_len(gorder(g))]
as_edgelist(g)
#>       [,1] [,2]
#>  [1,] "A"  "B" 
#>  [2,] "A"  "E" 
#>  [3,] "C"  "F" 
#>  [4,] "E"  "F" 
#>  [5,] "D"  "G" 
#>  [6,] "E"  "H" 
#>  [7,] "G"  "H" 
#>  [8,] "B"  "J" 
#>  [9,] "C"  "J" 
```
