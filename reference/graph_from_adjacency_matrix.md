# Create graphs from adjacency matrices

`graph_from_adjacency_matrix()` is a flexible function for creating
`igraph` graphs from adjacency matrices.

## Usage

``` r
graph_from_adjacency_matrix(
  adjmatrix,
  mode = c("directed", "undirected", "max", "min", "upper", "lower", "plus"),
  weighted = NULL,
  diag = TRUE,
  add.colnames = NULL,
  add.rownames = NA
)

from_adjacency(...)
```

## Arguments

- adjmatrix:

  A square adjacency matrix. From igraph version 0.5.1 this can be a
  sparse matrix created with the `Matrix` package.

- mode:

  Character scalar, specifies how igraph should interpret the supplied
  matrix. See also the `weighted` argument, the interpretation depends
  on that too. Possible values are: `directed`, `undirected`, `upper`,
  `lower`, `max`, `min`, `plus`. See details below.

- weighted:

  This argument specifies whether to create a weighted graph from an
  adjacency matrix. If it is `NULL` then an unweighted graph is created
  and the elements of the adjacency matrix gives the number of edges
  between the vertices. If it is a character constant then for every
  non-zero matrix entry an edge is created and the value of the entry is
  added as an edge attribute named by the `weighted` argument. If it is
  `TRUE` then a weighted graph is created and the name of the edge
  attribute will be `weight`. See also details below.

- diag:

  Logical scalar, whether to include the diagonal of the matrix in the
  calculation. If this is `FALSE` then the diagonal is zerod out first.

- add.colnames:

  Character scalar, whether to add the column names as vertex
  attributes. If it is `NULL` (the default) then, if present, column
  names are added as vertex attribute ‘name’. If `NA` or `FALSE` then
  they will not be added. If a character constant, then it gives the
  name of the vertex attribute to add.

- add.rownames:

  Character scalar, whether to add the row names as vertex attributes.
  Possible values the same as the previous argument. By default row
  names are not added. If ‘`add.rownames`’ and ‘`add.colnames`’ specify
  the same vertex attribute, then the former is ignored.

- ...:

  Passed to `graph_from_adjacency_matrix()`.

## Value

An igraph graph object.

## Details

The order of the vertices are preserved, i.e. the vertex corresponding
to the first row will be vertex 0 in the graph, etc.

`graph_from_adjacency_matrix()` operates in two main modes, depending on
the `weighted` argument.

If this argument is `NULL` then an unweighted graph is created and an
element of the adjacency matrix gives the number of edges to create
between the two corresponding vertices. The details depend on the value
of the `mode` argument:

- "directed":

  The graph will be directed and a matrix element gives the number of
  edges between two vertices.

- "undirected":

  This is exactly the same as `max`, for convenience. Note that it is
  *not* checked whether the matrix is symmetric.

- "max":

  An undirected graph will be created and `max(A(i,j), A(j,i))` gives
  the number of edges.

- "upper":

  An undirected graph will be created, only the upper right triangle
  (including the diagonal) is used for the number of edges.

- "lower":

  An undirected graph will be created, only the lower left triangle
  (including the diagonal) is used for creating the edges.

- "min":

  An undirected graph will be created with `min(A(i,j), A(j,i))` edges
  between vertex `i` and `j`.

- "plus":

  An undirected graph will be created with `A(i,j)+A(j,i)` edges between
  vertex `i` and `j`.

If the `weighted` argument is not `NULL` then the elements of the matrix
give the weights of the edges (if they are not zero). The details depend
on the value of the `mode` argument:

- "directed":

  The graph will be directed and a matrix element gives the edge
  weights.

- "undirected":

  First we check that the matrix is symmetric. It is an error if not.
  Then only the upper triangle is used to create a weighted undirected
  graph.

- "max":

  An undirected graph will be created and `max(A(i,j), A(j,i))` gives
  the edge weights.

- "upper":

  An undirected graph will be created, only the upper right triangle
  (including the diagonal) is used (for the edge weights).

- "lower":

  An undirected graph will be created, only the lower left triangle
  (including the diagonal) is used for creating the edges.

- "min":

  An undirected graph will be created, `min(A(i,j), A(j,i))` gives the
  edge weights.

- "plus":

  An undirected graph will be created, `A(i,j)+A(j,i)` gives the edge
  weights.

## See also

[`make_graph()`](https://r.igraph.org/reference/make_graph.md) and
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
for other ways to create graphs.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g1 <- sample(
  x = 0:1, size = 100, replace = TRUE,
  prob = c(0.9, 0.1)
) %>%
  matrix(ncol = 10) %>%
  graph_from_adjacency_matrix()

g2 <- sample(
  x = 0:5, size = 100, replace = TRUE,
  prob = c(0.9, 0.02, 0.02, 0.02, 0.02, 0.02)
) %>%
  matrix(ncol = 10) %>%
  graph_from_adjacency_matrix(weighted = TRUE)
E(g2)$weight
#>  [1] 4 3 2 2 2 4 2 5 2 2 2 2

## various modes for weighted graphs, with some tests
non_zero_sort <- function(x) sort(x[x != 0])
adj_matrix <- matrix(runif(100), 10)
adj_matrix[adj_matrix < 0.5] <- 0
g3 <- graph_from_adjacency_matrix(
  (adj_matrix + t(adj_matrix)) / 2,
  weighted = TRUE,
  mode = "undirected"
)

g4 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "max"
)
expected_g4_weights <- non_zero_sort(
  pmax(adj_matrix, t(adj_matrix))[upper.tri(adj_matrix, diag = TRUE)]
)
actual_g4_weights <- sort(E(g4)$weight)
all(expected_g4_weights == actual_g4_weights)
#> [1] TRUE

g5 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "min"
)
expected_g5_weights <- non_zero_sort(
  pmin(adj_matrix, t(adj_matrix))[upper.tri(adj_matrix, diag = TRUE)]
)
actual_g5_weights <- sort(E(g5)$weight)
all(expected_g5_weights == actual_g5_weights)
#> [1] TRUE

g6 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "upper"
)
expected_g6_weights <- non_zero_sort(adj_matrix[upper.tri(adj_matrix, diag = TRUE)])
actual_g6_weights <- sort(E(g6)$weight)
all(expected_g6_weights == actual_g6_weights)
#> [1] TRUE

g7 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "lower"
)
expected_g7_weights <- non_zero_sort(adj_matrix[lower.tri(adj_matrix, diag = TRUE)])
actual_g7_weights <- sort(E(g7)$weight)
all(expected_g7_weights == actual_g7_weights)
#> [1] TRUE

g8 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "plus"
)
halve_diag <- function(x) {
  diag(x) <- diag(x) / 2
  x
}
expected_g8_weights <- non_zero_sort(
  halve_diag(adj_matrix + t(adj_matrix))[lower.tri(adj_matrix, diag = TRUE)]
)
actual_g8_weights <- sort(E(g8)$weight)
all(expected_g8_weights == actual_g8_weights)
#> [1] TRUE

g9 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  mode = "plus",
  diag = FALSE
)
zero_diag <- function(x) {
  diag(x) <- 0
}
expected_g9_weights <- non_zero_sort((zero_diag(adj_matrix + t(adj_matrix)))[lower.tri(adj_matrix)])
actual_g9_weights <- sort(E(g9)$weight)
all(expected_g9_weights == actual_g9_weights)
#> [1] TRUE

## row/column names
rownames(adj_matrix) <- sample(letters, nrow(adj_matrix))
colnames(adj_matrix) <- seq(ncol(adj_matrix))
g10 <- graph_from_adjacency_matrix(
  adj_matrix,
  weighted = TRUE,
  add.rownames = "code"
)
summary(g10)
#> IGRAPH cb27157 DNW- 10 51 -- 
#> + attr: name (v/c), code (v/c), weight (e/n)
```
