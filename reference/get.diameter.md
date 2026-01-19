# Diameter of a graph

**\[deprecated\]**

`get.diameter()` was renamed to
[`get_diameter()`](https://r.igraph.org/reference/diameter.md) to create
a more consistent API.

## Usage

``` r
get.diameter(graph, directed = TRUE, unconnected = TRUE, weights = NULL)
```

## Arguments

- graph:

  The graph to analyze.

- directed:

  Logical, whether directed or undirected paths are to be considered.
  This is ignored for undirected graphs.

- unconnected:

  Logical, what to do if the graph is unconnected. If FALSE, the
  function will return a number that is one larger the largest possible
  diameter, which is always the number of vertices. If TRUE, the
  diameters of the connected components will be calculated and the
  largest one will be returned.

- weights:

  Optional positive weight vector for calculating weighted distances. If
  the graph has a `weight` edge attribute, then this is used by default.
