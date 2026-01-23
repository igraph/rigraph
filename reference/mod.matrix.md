# Modularity of a community structure of a graph

**\[deprecated\]**

`mod.matrix()` was renamed to
[`modularity_matrix()`](https://r.igraph.org/reference/modularity.igraph.md)
to create a more consistent API.

## Usage

``` r
mod.matrix(graph, membership, weights = NULL, resolution = 1, directed = TRUE)
```

## Arguments

- membership:

  Numeric vector, one value for each vertex, the membership vector of
  the community structure.

- weights:

  If not `NULL` then a numeric vector giving edge weights.

- resolution:

  The resolution parameter. Must be greater than or equal to 0. Set it
  to 1 to use the classical definition of modularity.

- directed:

  Whether to use the directed or undirected version of modularity.
  Ignored for undirected graphs.
