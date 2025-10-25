# A graph with subgraphs that are each a random graph.

**\[deprecated\]**

`interconnected.islands.game()` was renamed to
[`sample_islands()`](https://r.igraph.org/reference/sample_islands.md)
to create a more consistent API.

## Usage

``` r
interconnected.islands.game(islands.n, islands.size, islands.pin, n.inter)
```

## Arguments

- islands.n:

  The number of islands in the graph.

- islands.size:

  The size of islands in the graph.

- islands.pin:

  The probability to create each possible edge into each island.

- n.inter:

  The number of edges to create between two islands.
