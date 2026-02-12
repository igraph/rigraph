# Random citation graphs

**\[deprecated\]**

`cited.type.game()` was renamed to
[`sample_cit_types()`](https://r.igraph.org/reference/sample_last_cit.md)
to create a more consistent API.

## Usage

``` r
cited.type.game(
  n,
  edges = 1,
  types = rep(0, n),
  pref = rep(1, length(types)),
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
