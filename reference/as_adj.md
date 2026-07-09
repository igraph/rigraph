# Convert a graph to an adjacency matrix

**\[deprecated\]** We plan to remove `as_adj()` in favor of the more
explicitly named
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
so please use
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
instead.

## Usage

``` r
as_adj(
  graph,
  type = c("both", "upper", "lower"),
  weights = NULL,
  attr = deprecated(),
  edges = deprecated(),
  names = TRUE,
  sparse = igraph_opt("sparsematrices")
)
```

## Arguments

- graph:

  The graph to convert.

- type:

  Gives how to create the adjacency matrix for undirected graphs. It is
  ignored for directed graphs. Possible values: `upper`: the upper right
  triangle of the matrix is used, `lower`: the lower left triangle of
  the matrix is used. `both`: the whole matrix is used, a symmetric
  matrix is returned.

- weights:

  One of the following:

  - `NULL` (default): use the `weight` edge attribute if the graph has
    one, otherwise return a traditional (unweighted) adjacency matrix.

  - `NA`: explicitly unweighted, ignoring any `weight` edge attribute.

  - A numeric or logical vector of length
    [`ecount()`](https://r.igraph.org/reference/gsize.md): use these
    values directly as edge weights.

  - A character scalar: the name of an edge attribute whose values are
    used as weights. The attribute must be numeric or logical.

  If multiple edges share endpoints, the value of an arbitrarily chosen
  edge is included in the matrix.

- attr:

  **\[deprecated\]** Use `weights` instead. If supplied, the value is
  forwarded to `weights` as a character edge attribute name.

- edges:

  **\[deprecated\]** Logical scalar, whether to return the edge IDs in
  the matrix. For non-existant edges zero is returned.

- names:

  Logical constant, whether to assign row and column names to the
  matrix. These are only assigned if the `name` vertex attribute is
  present in the graph.

- sparse:

  Logical scalar, whether to create a sparse matrix. The ‘`Matrix`’
  package must be installed for creating sparse matrices.

## Related documentation in the C library

[`get_adjacency()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
