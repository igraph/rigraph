# Average nearest neighbor degree

**\[deprecated\]**

`graph.knn()` was renamed to
[`knn()`](https://r.igraph.org/reference/knn.md) to create a more
consistent API.

## Usage

``` r
graph.knn(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  neighbor.degree.mode = c("all", "out", "in", "total"),
  weights = NULL
)
```

## Arguments

- graph:

  The input graph. It may be directed.

- vids:

  The vertices for which the calculation is performed. Normally it
  includes all vertices. Note, that if not all vertices are given here,
  then both ‘`knn`’ and ‘`knnk`’ will be calculated based on the given
  vertices only.

- mode:

  Character constant to indicate the type of neighbors to consider in
  directed graphs. `out` considers out-neighbors, `in` considers
  in-neighbors and `all` ignores edge directions.

- neighbor.degree.mode:

  The type of degree to average in directed graphs. `out` averages
  out-degrees, `in` averages in-degrees and `all` ignores edge
  directions for the degree calculation.

- weights:

  Weight vector. If the graph has a `weight` edge attribute, then this
  is used by default. If this argument is given, then vertex strength
  (see [`strength()`](https://r.igraph.org/reference/strength.md)) is
  used instead of vertex degree. But note that `knnk` is still given in
  the function of the normal vertex degree. Weights are are used to
  calculate a weighted degree (also called
  [`strength()`](https://r.igraph.org/reference/strength.md)) instead of
  the degree.
