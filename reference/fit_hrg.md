# Fit a hierarchical random graph model

`fit_hrg()` fits a HRG to a given graph. It takes the specified `steps`
number of MCMC steps to perform the fitting, or a convergence criteria
if the specified number of steps is zero. `fit_hrg()` can start from a
given HRG, if this is given in the
[`hrg()`](https://r.igraph.org/reference/hrg.md) argument and the
`start` argument is `TRUE`. It can be converted to the `hclust` class
using [`as.hclust()`](https://rdrr.io/r/stats/as.hclust.html) provided
in this package.

## Usage

``` r
fit_hrg(graph, hrg = NULL, start = FALSE, steps = 0)
```

## Arguments

- graph:

  The graph to fit the model to. Edge directions are ignored in directed
  graphs.

- hrg:

  A hierarchical random graph model, in the form of an `igraphHRG`
  object. `fit_hrg()` allows this to be `NULL`, in which case a random
  starting point is used for the fitting.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- steps:

  The number of MCMC steps to make. If this is zero, then the MCMC
  procedure is performed until convergence.

## Value

`fit_hrg()` returns an `igraphHRG` object. This is a list with the
following members:

- left:

  Vector that contains the left children of the internal tree vertices.
  The first vertex is always the root vertex, so the first element of
  the vector is the left child of the root vertex. Internal vertices are
  denoted with negative numbers, starting from -1 and going down, i.e.
  the root vertex is -1. Leaf vertices are denoted by non-negative
  number, starting from zero and up.

- right:

  Vector that contains the right children of the vertices, with the same
  encoding as the `left` vector.

- prob:

  The connection probabilities attached to the internal vertices, the
  first number belongs to the root vertex (i.e. internal vertex -1), the
  second to internal vertex -2, etc.

- edges:

  The number of edges in the subtree below the given internal vertex.

- vertices:

  The number of vertices in the subtree below the given internal vertex,
  including itself.

## Related documentation in the C library

[`hrg_fit()`](https://igraph.org/c/html/0.10.17/igraph-HRG.html#igraph_hrg_fit),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

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
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg-methods`](https://r.igraph.org/reference/hrg-methods.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
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
summary(as.hclust(hrg))

## The consensus tree for it
consensus_tree(g, hrg = hrg, start = TRUE)

## Prediction of missing edges
g2 <- make_full_graph(4) + (make_full_graph(4) - path(1, 2))
predict_edges(g2)
}
```
