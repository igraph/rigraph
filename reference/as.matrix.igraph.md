# Convert igraph objects to adjacency or edge list matrices

Get adjacency or edgelist representation of the network stored as an
`igraph` object.

## Usage

``` r
# S3 method for class 'igraph'
as.matrix(x, matrix.type = c("adjacency", "edgelist"), ...)
```

## Arguments

- x:

  object of class `igraph`, the network

- matrix.type:

  character, type of matrix to return, currently "adjacency" or
  "edgelist" are supported

- ...:

  other arguments to/from other methods

## Value

Depending on the value of `matrix.type` either a square adjacency matrix
or a two-column numeric matrix representing the edgelist.

## Details

If `matrix.type` is `"edgelist"`, then a two-column numeric edge list
matrix is returned. The value of `attrname` is ignored.

If `matrix.type` is `"adjacency"`, then a square adjacency matrix is
returned. For adjacency matrices, you can use the `attr` keyword
argument to use the values of an edge attribute in the matrix cells. See
the documentation of
[as_adjacency_matrix](https://r.igraph.org/reference/as_adjacency_matrix.md)
for more details.

Other arguments passed through `...` are passed to either
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
or [`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md)
depending on the value of `matrix.type`.

## Related documentation in the C library

[`get_edgelist`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`get_adjacency`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

Other conversion:
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Author

Michal Bojanowski, originally from the `intergraph` package

## Examples

``` r
g <- make_graph("zachary")
as.matrix(g, "adjacency")
#> 34 x 34 sparse Matrix of class "dgCMatrix"
#>                                                                          
#>  [1,] . 1 1 1 1 1 1 1 1 . 1 1 1 1 . . . 1 . 1 . 1 . . . . . . . . . 1 . .
#>  [2,] 1 . 1 1 . . . 1 . . . . . 1 . . . 1 . 1 . 1 . . . . . . . . 1 . . .
#>  [3,] 1 1 . 1 . . . 1 1 1 . . . 1 . . . . . . . . . . . . . 1 1 . . . 1 .
#>  [4,] 1 1 1 . . . . 1 . . . . 1 1 . . . . . . . . . . . . . . . . . . . .
#>  [5,] 1 . . . . . 1 . . . 1 . . . . . . . . . . . . . . . . . . . . . . .
#>  [6,] 1 . . . . . 1 . . . 1 . . . . . 1 . . . . . . . . . . . . . . . . .
#>  [7,] 1 . . . 1 1 . . . . . . . . . . 1 . . . . . . . . . . . . . . . . .
#>  [8,] 1 1 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#>  [9,] 1 . 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 . 1 1
#> [10,] . . 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
#> [11,] 1 . . . 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [12,] 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [13,] 1 . . 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [14,] 1 1 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
#> [15,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [16,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [17,] . . . . . 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [18,] 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [19,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [20,] 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
#> [21,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [22,] 1 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#> [23,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [24,] . . . . . . . . . . . . . . . . . . . . . . . . . 1 . 1 . 1 . . 1 1
#> [25,] . . . . . . . . . . . . . . . . . . . . . . . . . 1 . 1 . . . 1 . .
#> [26,] . . . . . . . . . . . . . . . . . . . . . . . 1 1 . . . . . . 1 . .
#> [27,] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 . . . 1
#> [28,] . . 1 . . . . . . . . . . . . . . . . . . . . 1 1 . . . . . . . . 1
#> [29,] . . 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1 . 1
#> [30,] . . . . . . . . . . . . . . . . . . . . . . . 1 . . 1 . . . . . 1 1
#> [31,] . 1 . . . . . . 1 . . . . . . . . . . . . . . . . . . . . . . . 1 1
#> [32,] 1 . . . . . . . . . . . . . . . . . . . . . . . 1 1 . . 1 . . . 1 1
#> [33,] . . 1 . . . . . 1 . . . . . 1 1 . . 1 . 1 . 1 1 . . . . . 1 1 1 . 1
#> [34,] . . . . . . . . 1 1 . . . 1 1 1 . . 1 1 1 . 1 1 . . 1 1 1 1 1 1 1 .
as.matrix(g, "edgelist")
#>       [,1] [,2]
#>  [1,]    1    2
#>  [2,]    1    3
#>  [3,]    1    4
#>  [4,]    1    5
#>  [5,]    1    6
#>  [6,]    1    7
#>  [7,]    1    8
#>  [8,]    1    9
#>  [9,]    1   11
#> [10,]    1   12
#> [11,]    1   13
#> [12,]    1   14
#> [13,]    1   18
#> [14,]    1   20
#> [15,]    1   22
#> [16,]    1   32
#> [17,]    2    3
#> [18,]    2    4
#> [19,]    2    8
#> [20,]    2   14
#> [21,]    2   18
#> [22,]    2   20
#> [23,]    2   22
#> [24,]    2   31
#> [25,]    3    4
#> [26,]    3    8
#> [27,]    3   28
#> [28,]    3   29
#> [29,]    3   33
#> [30,]    3   10
#> [31,]    3    9
#> [32,]    3   14
#> [33,]    4    8
#> [34,]    4   13
#> [35,]    4   14
#> [36,]    5    7
#> [37,]    5   11
#> [38,]    6    7
#> [39,]    6   11
#> [40,]    6   17
#> [41,]    7   17
#> [42,]    9   31
#> [43,]    9   33
#> [44,]    9   34
#> [45,]   10   34
#> [46,]   14   34
#> [47,]   15   33
#> [48,]   15   34
#> [49,]   16   33
#> [50,]   16   34
#> [51,]   19   33
#> [52,]   19   34
#> [53,]   20   34
#> [54,]   21   33
#> [55,]   21   34
#> [56,]   23   33
#> [57,]   23   34
#> [58,]   24   26
#> [59,]   24   28
#> [60,]   24   33
#> [61,]   24   34
#> [62,]   24   30
#> [63,]   25   26
#> [64,]   25   28
#> [65,]   25   32
#> [66,]   26   32
#> [67,]   27   30
#> [68,]   27   34
#> [69,]   28   34
#> [70,]   29   32
#> [71,]   29   34
#> [72,]   30   33
#> [73,]   30   34
#> [74,]   31   33
#> [75,]   31   34
#> [76,]   32   33
#> [77,]   32   34
#> [78,]   33   34
# use edge attribute "weight"
E(g)$weight <- rep(1:10, length.out = ecount(g))
as.matrix(g, "adjacency", sparse = FALSE, attr = "weight")
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]    0    1    2    3    4    5    6    7    8     0     9    10     1
#>  [2,]    1    0    7    8    0    0    0    9    0     0     0     0     0
#>  [3,]    2    7    0    5    0    0    0    6    1    10     0     0     0
#>  [4,]    3    8    5    0    0    0    0    3    0     0     0     0     4
#>  [5,]    4    0    0    0    0    0    6    0    0     0     7     0     0
#>  [6,]    5    0    0    0    0    0    8    0    0     0     9     0     0
#>  [7,]    6    0    0    0    6    8    0    0    0     0     0     0     0
#>  [8,]    7    9    6    3    0    0    0    0    0     0     0     0     0
#>  [9,]    8    0    1    0    0    0    0    0    0     0     0     0     0
#> [10,]    0    0   10    0    0    0    0    0    0     0     0     0     0
#> [11,]    9    0    0    0    7    9    0    0    0     0     0     0     0
#> [12,]   10    0    0    0    0    0    0    0    0     0     0     0     0
#> [13,]    1    0    0    4    0    0    0    0    0     0     0     0     0
#> [14,]    2   10    2    5    0    0    0    0    0     0     0     0     0
#> [15,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [16,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [17,]    0    0    0    0    0   10    1    0    0     0     0     0     0
#> [18,]    3    1    0    0    0    0    0    0    0     0     0     0     0
#> [19,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [20,]    4    2    0    0    0    0    0    0    0     0     0     0     0
#> [21,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [22,]    5    3    0    0    0    0    0    0    0     0     0     0     0
#> [23,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [24,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [25,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [26,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [27,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [28,]    0    0    7    0    0    0    0    0    0     0     0     0     0
#> [29,]    0    0    8    0    0    0    0    0    0     0     0     0     0
#> [30,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [31,]    0    4    0    0    0    0    0    0    2     0     0     0     0
#> [32,]    6    0    0    0    0    0    0    0    0     0     0     0     0
#> [33,]    0    0    9    0    0    0    0    0    3     0     0     0     0
#> [34,]    0    0    0    0    0    0    0    0    4     5     0     0     0
#>       [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25]
#>  [1,]     2     0     0     0     3     0     4     0     5     0     0     0
#>  [2,]    10     0     0     0     1     0     2     0     3     0     0     0
#>  [3,]     2     0     0     0     0     0     0     0     0     0     0     0
#>  [4,]     5     0     0     0     0     0     0     0     0     0     0     0
#>  [5,]     0     0     0     0     0     0     0     0     0     0     0     0
#>  [6,]     0     0     0    10     0     0     0     0     0     0     0     0
#>  [7,]     0     0     0     1     0     0     0     0     0     0     0     0
#>  [8,]     0     0     0     0     0     0     0     0     0     0     0     0
#>  [9,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [10,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [11,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [12,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [13,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [14,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [15,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [16,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [17,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [18,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [19,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [20,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [21,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [22,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [23,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [24,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [25,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [26,]     0     0     0     0     0     0     0     0     0     0     8     3
#> [27,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [28,]     0     0     0     0     0     0     0     0     0     0     9     4
#> [29,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [30,]     0     0     0     0     0     0     0     0     0     0     2     0
#> [31,]     0     0     0     0     0     0     0     0     0     0     0     0
#> [32,]     0     0     0     0     0     0     0     0     0     0     0     5
#> [33,]     0     7     9     0     0     1     0     4     0     6    10     0
#> [34,]     6     8    10     0     0     2     3     5     0     7     1     0
#>       [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34]
#>  [1,]     0     0     0     0     0     0     6     0     0
#>  [2,]     0     0     0     0     0     4     0     0     0
#>  [3,]     0     0     7     8     0     0     0     9     0
#>  [4,]     0     0     0     0     0     0     0     0     0
#>  [5,]     0     0     0     0     0     0     0     0     0
#>  [6,]     0     0     0     0     0     0     0     0     0
#>  [7,]     0     0     0     0     0     0     0     0     0
#>  [8,]     0     0     0     0     0     0     0     0     0
#>  [9,]     0     0     0     0     0     2     0     3     4
#> [10,]     0     0     0     0     0     0     0     0     5
#> [11,]     0     0     0     0     0     0     0     0     0
#> [12,]     0     0     0     0     0     0     0     0     0
#> [13,]     0     0     0     0     0     0     0     0     0
#> [14,]     0     0     0     0     0     0     0     0     6
#> [15,]     0     0     0     0     0     0     0     7     8
#> [16,]     0     0     0     0     0     0     0     9    10
#> [17,]     0     0     0     0     0     0     0     0     0
#> [18,]     0     0     0     0     0     0     0     0     0
#> [19,]     0     0     0     0     0     0     0     1     2
#> [20,]     0     0     0     0     0     0     0     0     3
#> [21,]     0     0     0     0     0     0     0     4     5
#> [22,]     0     0     0     0     0     0     0     0     0
#> [23,]     0     0     0     0     0     0     0     6     7
#> [24,]     8     0     9     0     2     0     0    10     1
#> [25,]     3     0     4     0     0     0     5     0     0
#> [26,]     0     0     0     0     0     0     6     0     0
#> [27,]     0     0     0     0     7     0     0     0     8
#> [28,]     0     0     0     0     0     0     0     0     9
#> [29,]     0     0     0     0     0     0    10     0     1
#> [30,]     0     7     0     0     0     0     0     2     3
#> [31,]     0     0     0     0     0     0     0     4     5
#> [32,]     6     0     0    10     0     0     0     6     7
#> [33,]     0     0     0     0     2     4     6     0     8
#> [34,]     0     8     9     1     3     5     7     8     0
```
