# Creating a graph from LCF notation

**\[deprecated\]**

`graph.lcf()` was renamed to
[`graph_from_lcf()`](https://r.igraph.org/reference/graph_from_lcf.md)
to create a more consistent API.

## Usage

``` r
graph.lcf(n, shifts, repeats = 1)
```

## Arguments

- n:

  Integer, the number of vertices in the graph. If `NULL` (default), it
  is set to `len(shifts) * repeats`.

- shifts:

  Integer vector, the shifts.

- repeats:

  Integer constant, how many times to repeat the shifts.

## Related documentation in the C library

[`lcf_vector`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_lcf_vector)
