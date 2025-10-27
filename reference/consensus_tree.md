# Create a consensus tree from several hierarchical random graph models

`consensus_tree()` creates a consensus tree from several fitted
hierarchical random graph models, using phylogeny methods. If the
[`hrg()`](https://r.igraph.org/reference/hrg.md) argument is given and
`start` is set to `TRUE`, then it starts sampling from the given HRG.
Otherwise it optimizes the HRG log-likelihood first, and then samples
starting from the optimum.

## Usage

``` r
consensus_tree(graph, hrg = NULL, start = FALSE, num.samples = 10000)
```

## Arguments

- graph:

  The graph the models were fitted to.

- hrg:

  A hierarchical random graph model, in the form of an `igraphHRG`
  object. `consensus_tree()` allows this to be `NULL` as well, then a
  HRG is fitted to the graph first, from a random starting point.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- num.samples:

  Number of samples to use for consensus generation or missing edge
  prediction.

## Value

`consensus_tree()` returns a list of two objects. The first is an
`igraphHRGConsensus` object, the second is an `igraphHRG` object. The
`igraphHRGConsensus` object has the following members:

- parents:

  For each vertex, the id of its parent vertex is stored, or zero, if
  the vertex is the root vertex in the tree. The first n vertex ids
  (from 0) refer to the original vertices of the graph, the other ids
  refer to vertex groups.

- weights:

  Numeric vector, counts the number of times a given tree split occurred
  in the generated network samples, for each internal vertices. The
  order is the same as in the `parents` vector.

## See also

Other hierarchical random graph functions:
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`print.igraphHRGConsensus()`](https://r.igraph.org/reference/print.igraphHRGConsensus.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)

## Related documentation in the C library

[`hrg_consensus()`](https://igraph.org/c/html/latest/igraph-HRG.html#igraph_hrg_consensus).
