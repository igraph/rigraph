# Random citation graphs

**\[deprecated\]**

`citing.cited.type.game()` was renamed to
[`sample_cit_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
to create a more consistent API.

## Usage

``` r
citing.cited.type.game(
  n,
  edges = 1,
  types = rep(0, n),
  pref = matrix(1, nrow = length(types), ncol = length(types)),
  directed = TRUE,
  attr = TRUE
)
```

## Arguments

- n:

  Number of vertices.

- edges:

  Number of edges per step.

- types:

  Vector of length ‘`n`’, the types of the vertices. Types are numbered
  from zero.

- pref:

  Vector
  ([`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md)
  and
  [`sample_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
  or matrix
  ([`sample_cit_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md))
  giving the (unnormalized) citation probabilities for the different
  vertex types.

- directed:

  Logical scalar, whether to generate directed networks.

- attr:

  Logical scalar, whether to add the vertex types to the generated graph
  as a vertex attribute called ‘`type`’.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
