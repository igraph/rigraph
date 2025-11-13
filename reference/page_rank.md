# The Page Rank algorithm

Calculates the Google PageRank for the specified vertices.

## Usage

``` r
page_rank(
  graph,
  algo = c("prpack", "arpack"),
  vids = V(graph),
  directed = TRUE,
  damping = 0.85,
  personalized = NULL,
  weights = NULL,
  options = NULL
)
```

## Arguments

- graph:

  The graph object.

- algo:

  Character scalar, which implementation to use to carry out the
  calculation. The default is `"prpack"`, which uses the PRPACK library
  (<https://github.com/dgleich/prpack>) to calculate PageRank scores by
  solving a set of linear equations. This is a new implementation in
  igraph version 0.7, and the suggested one, as it is the most stable
  and the fastest for all but small graphs. `"arpack"` uses the ARPACK
  library, the default implementation from igraph version 0.5 until
  version 0.7. It computes PageRank scores by solving an eingevalue
  problem.

- vids:

  The vertices of interest.

- directed:

  Logical, if true directed paths will be considered for directed
  graphs. It is ignored for undirected graphs.

- damping:

  The damping factor (‘d’ in the original paper).

- personalized:

  Optional vector giving a probability distribution to calculate
  personalized PageRank. For personalized PageRank, the probability of
  jumping to a node when abandoning the random walk is not uniform, but
  it is given by this vector. The vector should contains an entry for
  each vertex and it will be rescaled to sum up to one.

- weights:

  A numerical vector or `NULL`. This argument can be used to give edge
  weights for calculating the weighted PageRank of vertices. If this is
  `NULL` and the graph has a `weight` edge attribute then that is used.
  If `weights` is a numerical vector then it used, even if the graph has
  a `weights` edge attribute. If this is `NA`, then no edge weights are
  used (even if the graph has a `weight` edge attribute. This function
  interprets edge weights as connection strengths. In the random surfer
  model, an edge with a larger weight is more likely to be selected by
  the surfer.

- options:

  A named list, to override some ARPACK options. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.
  This argument is ignored if the PRPACK implementation is used.

## Value

A named list with entries:

- vector:

  A numeric vector with the PageRank scores.

- value:

  When using the ARPACK method, the eigenvalue corresponding to the
  eigenvector with the PageRank scores is returned here. It is expected
  to be exactly one, and can be used to check that ARPACK has
  successfully converged to the expected eingevector. When using the
  PRPACK method, it is always set to 1.0.

- options:

  Some information about the underlying ARPACK calculation. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.
  This entry is `NULL` if not the ARPACK implementation was used.

## Details

For the explanation of the PageRank algorithm, see the following
webpage:
[http://infolab.stanford.edu/~backrub/google.html](http://infolab.stanford.edu/~backrub/google.md),
or the following reference:

Sergey Brin and Larry Page: The Anatomy of a Large-Scale Hypertextual
Web Search Engine. Proceedings of the 7th World-Wide Web Conference,
Brisbane, Australia, April 1998.

The `page_rank()` function can use either the PRPACK library or ARPACK
(see [`arpack()`](https://r.igraph.org/reference/arpack.md)) to perform
the calculation.

Please note that the PageRank of a given vertex depends on the PageRank
of all other vertices, so even if you want to calculate the PageRank for
only some of the vertices, all of them must be calculated. Requesting
the PageRank for only some of the vertices does not result in any
performance increase at all.

## References

Sergey Brin and Larry Page: The Anatomy of a Large-Scale Hypertextual
Web Search Engine. Proceedings of the 7th World-Wide Web Conference,
Brisbane, Australia, April 1998.

## See also

Other centrality scores:
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`degree()`](https://r.igraph.org/reference/degree.md)

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Related documentation in the C library

[`personalized_pagerank()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_personalized_pagerank).

## Examples

``` r
g <- sample_gnp(20, 5 / 20, directed = TRUE)
page_rank(g)$vector
#>  [1] 0.05066669 0.05153582 0.04121790 0.05855531 0.02499356 0.04992431
#>  [7] 0.05059918 0.03329834 0.04703836 0.03494381 0.05429140 0.10395030
#> [13] 0.04927266 0.05448965 0.06751537 0.05321759 0.07238569 0.03922930
#> [19] 0.04145030 0.02142447

g2 <- make_star(10)
page_rank(g2)$vector
#>  [1] 0.49008499 0.05665722 0.05665722 0.05665722 0.05665722 0.05665722
#>  [7] 0.05665722 0.05665722 0.05665722 0.05665722

# Personalized PageRank
g3 <- make_ring(10)
page_rank(g3)$vector
#>  [1] 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1
reset <- seq(vcount(g3))
page_rank(g3, personalized = reset)$vector
#>  [1] 0.08305627 0.07206568 0.07367581 0.08203783 0.09368592 0.10631408
#>  [7] 0.11796217 0.12632419 0.12793432 0.11694373
```
