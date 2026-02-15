# Predict edges based on a hierarchical random graph model

**\[deprecated\]**

`hrg.predict()` was renamed to
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md) to
create a more consistent API.

## Usage

``` r
hrg.predict(
  graph,
  hrg = NULL,
  start = FALSE,
  num.samples = 10000,
  num.bins = 25
)
```

## Arguments

- graph:

  The graph to fit the model to. Edge directions are ignored in directed
  graphs.

- hrg:

  A hierarchical random graph model, in the form of an `igraphHRG`
  object.
  [`predict_edges()`](https://r.igraph.org/reference/predict_edges.md)
  allow this to be `NULL` as well, then a HRG is fitted to the graph
  first, from a random starting point.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- num.samples:

  Number of samples to use for consensus generation or missing edge
  prediction.

- num.bins:

  Number of bins for the edge probabilities. Give a higher number for a
  more accurate prediction.

## Related documentation in the C library

[`hrg_predict`](https://igraph.org/c/html/0.10.17/igraph-HRG.html#igraph_hrg_predict),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
