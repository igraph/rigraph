# Create a consensus tree from several hierarchical random graph models

**\[deprecated\]**

`hrg.consensus()` was renamed to
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md)
to create a more consistent API.

## Usage

``` r
hrg.consensus(graph, hrg = NULL, start = FALSE, num.samples = 10000)
```

## Arguments

- graph:

  The graph the models were fitted to.

- hrg:

  A hierarchical random graph model, in the form of an `igraphHRG`
  object.
  [`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md)
  allows this to be `NULL` as well, then a HRG is fitted to the graph
  first, from a random starting point.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- num.samples:

  Number of samples to use for consensus generation or missing edge
  prediction.

## Related documentation in the C library

[`hrg_consensus()`](https://igraph.org/c/html/latest/igraph-HRG.html#igraph_hrg_consensus)
