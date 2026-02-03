# Are two vertices adjacent?

**\[deprecated\]**

`are.connected()` was renamed to
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md) to
create a more consistent API.

## Usage

``` r
are.connected(graph, v1, v2)
```

## Arguments

- graph:

  The graph.

- v1:

  The first vertex, tail in directed graphs.

- v2:

  The second vertex, head in directed graphs.

## Related documentation in the C library

[[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_are_adjacent),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
