# Check if a degree sequence is valid for a multi-graph

**\[deprecated\]**

`is.degree.sequence()` was renamed to
[`is_degseq()`](https://r.igraph.org/reference/is_degseq.md) to create a
more consistent API.

## Usage

``` r
is.degree.sequence(out.deg, in.deg = NULL)
```

## Arguments

- out.deg:

  Integer vector, the degree sequence for undirected graphs, or the
  out-degree sequence for directed graphs.

- in.deg:

  `NULL` or an integer vector. For undirected graphs, it should be
  `NULL`. For directed graphs it specifies the in-degrees.
