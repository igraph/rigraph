# Fit a hierarchical random graph model

**\[deprecated\]**

`hrg.fit()` was renamed to
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md) to create a
more consistent API.

## Usage

``` r
hrg.fit(graph, hrg = NULL, start = FALSE, steps = 0)
```

## Arguments

- graph:

  The graph to fit the model to. Edge directions are ignored in directed
  graphs.

- hrg:

  A hierarchical random graph model, in the form of an `igraphHRG`
  object. [`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md)
  allows this to be `NULL`, in which case a random starting point is
  used for the fitting.

- start:

  Logical, whether to start the fitting/sampling from the supplied
  `igraphHRG` object, or from a random starting point.

- steps:

  The number of MCMC steps to make. If this is zero, then the MCMC
  procedure is performed until convergence.
