# Random citation graphs

**\[deprecated\]**

`lastcit.game()` was renamed to
[`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md)
to create a more consistent API.

## Usage

``` r
lastcit.game(
  n,
  edges = 1,
  agebins = n/7100,
  pref = (1:(agebins + 1))^-3,
  directed = TRUE
)
```

## Arguments

- n:

  Number of vertices.

- edges:

  Number of edges per step.

- agebins:

  Number of aging bins.

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
