# Applies a set of constructor modifiers to an already constructed graph.

This is a helper function for the common parts of
[`make_()`](https://r.igraph.org/reference/make_.md) and
[`sample_()`](https://r.igraph.org/reference/sample_.md).

## Usage

``` r
.apply_modifiers(graph, mods)
```

## Arguments

- graph:

  The graph to apply the modifiers to

- mods:

  The modifiers to apply

## Value

The modified graph

## Related documentation in the C library

[`simplify`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
