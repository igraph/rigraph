# Print a hierarchical random graph consensus tree to the screen

Consensus dendrograms (`igraphHRGConsensus` objects) are printed simply
by listing the children of each internal node of the dendrogram:

    HRG consensus tree:
    g1 -> 11 12 13 14 15 16 17 18 19 20
    g2 -> 1  2  3  4  5  6  7  8  9  10
    g3 -> g1 g2

The root of the dendrogram is `g3` (because it has no incoming edges),
and it has two subgroups, `g1` and `g2`.

## Usage

``` r
# S3 method for class 'igraphHRGConsensus'
print(x, ...)
```

## Arguments

- x:

  `igraphHRGConsensus` object to print.

- ...:

  Ignored.

## Value

The input object, invisibly, to allow method chaining.

## See also

Other hierarchical random graph functions:
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md),
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)
