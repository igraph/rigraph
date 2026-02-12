# The Page Rank algorithm

**\[deprecated\]**

`page.rank()` was renamed to
[`page_rank()`](https://r.igraph.org/reference/page_rank.md) to create a
more consistent API.

## Usage

``` r
page.rank(
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
