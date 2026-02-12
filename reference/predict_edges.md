# Predict edges based on a hierarchical random graph model

`predict_edges()` uses a hierarchical random graph model to predict
missing edges from a network. This is done by sampling hierarchical
models around the optimum model, proportionally to their likelihood. The
MCMC sampling is stated from
[`hrg()`](https://r.igraph.org/reference/hrg.md), if it is given and the
`start` argument is set to `TRUE`. Otherwise a HRG is fitted to the
graph first.

## Usage

``` r
predict_edges(
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
  object. `predict_edges()` allow this to be `NULL` as well, then a HRG
  is fitted to the graph first, from a random starting point.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- num.samples:

  Number of samples to use for consensus generation or missing edge
  prediction.

- num.bins:

  Number of bins for the edge probabilities. Give a higher number for a
  more accurate prediction.

## Value

A list with entries:

- edges:

  The predicted edges, in a two-column matrix of vertex ids.

- prob:

  Probabilities of these edges, according to the fitted model.

- hrg:

  The (supplied or fitted) hierarchical random graph model.

## References

A. Clauset, C. Moore, and M.E.J. Newman. Hierarchical structure and the
prediction of missing links in networks. *Nature* 453, 98–101 (2008);

A. Clauset, C. Moore, and M.E.J. Newman. Structural Inference of
Hierarchies in Networks. In E. M. Airoldi et al. (Eds.): ICML 2006 Ws,
*Lecture Notes in Computer Science* 4503, 1–13. Springer-Verlag, Berlin
Heidelberg (2007).

## See also

Other hierarchical random graph functions:
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md),
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`print.igraphHRGConsensus()`](https://r.igraph.org/reference/print.igraphHRGConsensus.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)

## Examples

``` r
if (FALSE) { # rlang::is_interactive()

## A graph with two dense groups
g <- sample_gnp(10, p = 1 / 2) + sample_gnp(10, p = 1 / 2)
hrg <- fit_hrg(g)
hrg

## The consensus tree for it
consensus_tree(g, hrg = hrg, start = TRUE)

## Prediction of missing edges
g2 <- make_full_graph(4) + (make_full_graph(4) - path(1, 2))
predict_edges(g2)
}
```
