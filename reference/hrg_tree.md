# Create an igraph graph from a hierarchical random graph model

`hrg_tree()` creates the corresponsing igraph tree of a hierarchical
random graph model.

## Usage

``` r
hrg_tree(hrg)
```

## Arguments

- hrg:

  A hierarchical random graph model.

## Value

An igraph graph with a vertex attribute called `"probability"`.

## See also

Other hierarchical random graph functions:
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md),
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`print.igraphHRGConsensus()`](https://r.igraph.org/reference/print.igraphHRGConsensus.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)

## Related documentation in the C library

[`from_hrg_dendrogram()`](https://igraph.org/c/html/0.10.17/igraph-HRG.html#igraph_from_hrg_dendrogram).
