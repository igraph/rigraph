# Applies a set of constructor modifiers to an already constructed graph.

This is a helper function for the common parts of
[`make_()`](https://r.igraph.org/reference/make_.md) and
[`sample_()`](https://r.igraph.org/reference/sample_.md).

## Usage

``` r
.apply_modifiers(graph, mods, call = rlang::caller_env())
```

## Arguments

- graph:

  The graph to apply the modifiers to

- mods:

  The modifiers to apply

## Value

The modified graph

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`simplify()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`is_simple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_simple),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
