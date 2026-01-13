# Eigenvalues and eigenvectors of the adjacency matrix of a graph

**\[deprecated\]**

`graph.eigen()` was renamed to
[`spectrum()`](https://r.igraph.org/reference/spectrum.md) to create a
more consistent API.

## Usage

``` r
graph.eigen(
  graph,
  algorithm = c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"),
  which = list(),
  options = arpack_defaults()
)
```

## Arguments

- graph:

  The input graph, can be directed or undirected.

- algorithm:

  The algorithm to use. Currently only `arpack` is implemented, which
  uses the ARPACK solver. See also
  [`arpack()`](https://r.igraph.org/reference/arpack.md).

- which:

  A list to specify which eigenvalues and eigenvectors to calculate. By
  default the leading (i.e. largest magnitude) eigenvalue and the
  corresponding eigenvector is calculated.

- options:

  Options for the ARPACK solver. See
  [`arpack_defaults()`](https://r.igraph.org/reference/arpack.md).

## Related documentation in the C library
