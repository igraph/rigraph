# Create a hierarchical random graph from an igraph graph

`hrg()` creates a HRG from an igraph graph. The igraph graph must be a
directed binary tree, with \\n-1\\ internal and \\n\\ leaf vertices. The
`prob` argument contains the HRG probability labels for each vertex;
these are ignored for leaf vertices.

## Usage

``` r
hrg(graph, prob)
```

## Arguments

- graph:

  The igraph graph to create the HRG from.

- prob:

  A vector of probabilities, one for each vertex, in the order of vertex
  ids.

## Value

`hrg()` returns an `igraphHRG` object.

## See also

Other hierarchical random graph functions:
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md),
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`print.igraphHRGConsensus()`](https://r.igraph.org/reference/print.igraphHRGConsensus.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)

## Related documentation in the C library

[`hrg_create()`](https://igraph.org/c/html/latest/igraph-HRG.html#igraph_hrg_create).
