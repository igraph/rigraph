# Create an extended chordal ring graph

**\[deprecated\]**

`graph.extended.chordal.ring()` was renamed to
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md)
to create a more consistent API.

## Usage

``` r
graph.extended.chordal.ring(n, w, directed = FALSE)
```

## Arguments

- n:

  The number of vertices.

- w:

  A matrix which specifies the extended chordal ring. See details below.

- directed:

  Logical scalar, whether or not to create a directed graph.

## Related documentation in the C library

[`extended_chordal_ring()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_extended_chordal_ring)
