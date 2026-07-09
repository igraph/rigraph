# Create a lattice graph

**\[deprecated\]**

`graph.lattice()` was renamed to
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md) to
create a more consistent API.

## Usage

``` r
graph.lattice(
  dimvector = NULL,
  length = NULL,
  dim = NULL,
  nei = 1,
  directed = FALSE,
  mutual = FALSE,
  periodic = FALSE,
  circular = deprecated()
)
```

## Arguments

- dimvector:

  A vector giving the size of the lattice in each dimension.

- length:

  Integer constant, for regular lattices, the size of the lattice in
  each dimension.

- dim:

  Integer constant, the dimension of the lattice.

- nei:

  The distance within which (inclusive) the neighbors on the lattice
  will be connected. This parameter is not used right now.

- directed:

  Whether to create a directed lattice.

- mutual:

  Logical, if `TRUE` directed lattices will be mutually connected.

- periodic:

  Logical vector, Boolean vector, defines whether the generated lattice
  is periodic along each dimension. This parameter may also be scalar
  boolen value which will be extended to boolean vector with dimvector
  length.

- circular:

  Deprecated, use `periodic` instead.

## Related documentation in the C library

[`square_lattice()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_square_lattice)
