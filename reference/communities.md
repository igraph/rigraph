# Functions to deal with the result of network community detection

igraph community detection functions return their results as an object
from the `communities` class. This manual page describes the operations
of this class.

## Usage

``` r
membership(communities)

# S3 method for class 'communities'
print(x, ...)

# S3 method for class 'communities'
modularity(x, ...)

# S3 method for class 'communities'
length(x)

sizes(communities)

algorithm(communities)

merges(communities)

crossing(communities, graph)

code_len(communities)

is_hierarchical(communities)

# S3 method for class 'communities'
as.dendrogram(object, hang = -1, use.modularity = FALSE, ...)

# S3 method for class 'communities'
as.hclust(x, hang = -1, use.modularity = FALSE, ...)

cut_at(communities, no, steps)

show_trace(communities)

# S3 method for class 'communities'
plot(
  x,
  y,
  col = membership(x),
  mark.groups = communities(x),
  edge.color = c("black", "red")[crossing(x, y) + 1],
  ...
)

communities(x)
```

## Arguments

- communities, x, object:

  A `communities` object, the result of an igraph community detection
  function.

- ...:

  Additional arguments. `plot.communities` passes these to
  [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md). The
  other functions silently ignore them.

- graph:

  An igraph graph object, corresponding to `communities`.

- hang:

  Numeric scalar indicating how the height of leaves should be computed
  from the heights of their parents; see
  [`plot.hclust()`](https://rdrr.io/r/stats/hclust.html).

- use.modularity:

  Logical scalar, whether to use the modularity values to define the
  height of the branches.

- no:

  Integer scalar, the desired number of communities. If too low or two
  high, then an error message is given. Exactly one of `no` and `steps`
  must be supplied.

- steps:

  The number of merge operations to perform to produce the communities.
  Exactly one of `no` and `steps` must be supplied.

- y:

  An igraph graph object, corresponding to the communities in `x`.

- col:

  A vector of colors, in any format that is accepted by the regular R
  plotting methods. This vector gives the colors of the vertices
  explicitly.

- mark.groups:

  A list of numeric vectors. The communities can be highlighted using
  colored polygons. The groups for which the polygons are drawn are
  given here. The default is to use the groups given by the communities.
  Supply `NULL` here if you do not want to highlight any groups.

- edge.color:

  The colors of the edges. By default the edges within communities are
  colored green and other edges are red.

- membership:

  Numeric vector, one value for each vertex, the membership vector of
  the community structure. Might also be `NULL` if the community
  structure is given in another way, e.g. by a merge matrix.

- algorithm:

  If not `NULL` (meaning an unknown algorithm), then a character scalar,
  the name of the algorithm that produced the community structure.

- merges:

  If not `NULL`, then the merge matrix of the hierarchical community
  structure. See `merges()` below for more information on its format.

- modularity:

  Numeric scalar or vector, the modularity value of the community
  structure. It can also be `NULL`, if the modularity of the (best)
  split is not available.

## Value

[`print()`](https://rdrr.io/r/base/print.html) returns the `communities`
object itself, invisibly.

`length` returns an integer scalar.

`sizes()` returns a numeric vector.

`membership()` returns a numeric vector, one number for each vertex in
the graph that was the input of the community detection.

[`modularity()`](https://r.igraph.org/reference/modularity.igraph.md)
returns a numeric scalar.

`algorithm()` returns a character scalar.

`crossing()` returns a logical vector.

`is_hierarchical()` returns a logical scalar.

`merges()` returns a two-column numeric matrix.

`cut_at()` returns a numeric vector, the membership vector of the
vertices.

[`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html) returns a
[dendrogram](https://rdrr.io/r/stats/dendrogram.html) object.

`show_trace()` returns a character vector.

`code_len()` returns a numeric scalar for communities found with the
InfoMAP method and `NULL` for other methods.

[`plot()`](https://rdrr.io/r/graphics/plot.default.html) for
`communities` objects returns `NULL`, invisibly.

## Details

Community structure detection algorithms try to find dense subgraphs in
directed or undirected graphs, by optimizing some criteria, and usually
using heuristics.

igraph implements a number of community detection methods (see them
below), all of which return an object of the class `communities`.
Because the community structure detection algorithms are different,
`communities` objects do not always have the same structure.
Nevertheless, they have some common operations, these are documented
here.

The [`print()`](https://rdrr.io/r/base/print.html) generic function is
defined for `communities`, it prints a short summary.

The `length` generic function call be called on `communities` and
returns the number of communities.

The `sizes()` function returns the community sizes, in the order of
their ids.

`membership()` gives the division of the vertices, into communities. It
returns a numeric vector, one value for each vertex, the id of its
community. Community ids start from one. Note that some algorithms
calculate the complete (or incomplete) hierarchical structure of the
communities, and not just a single partitioning. For these algorithms
typically the membership for the highest modularity value is returned,
but see also the manual pages of the individual algorithms.

`communities()` is also the name of a function, that returns a list of
communities, each identified by their vertices. The vertices will have
symbolic names if the `add.vertex.names` igraph option is set, and the
graph itself was named. Otherwise numeric vertex ids are used.

[`modularity()`](https://r.igraph.org/reference/modularity.igraph.md)
gives the modularity score of the partitioning. (See
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md)
for details. For algorithms that do not result a single partitioning,
the highest modularity value is returned.

`algorithm()` gives the name of the algorithm that was used to calculate
the community structure.

`crossing()` returns a logical vector, with one value for each edge,
ordered according to the edge ids. The value is `TRUE` iff the edge
connects two different communities, according to the (best) membership
vector, as returned by `membership()`.

`is_hierarchical()` checks whether a hierarchical algorithm was used to
find the community structure. Some functions only make sense for
hierarchical methods (e.g. `merges()`, `cut_at()` and
[`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html)).

`merges()` returns the merge matrix for hierarchical methods. An error
message is given, if a non-hierarchical method was used to find the
community structure. You can check this by calling `is_hierarchical()`
on the `communities` object.

`cut_at()` cuts the merge tree of a hierarchical community finding
method, at the desired place and returns a membership vector. The
desired place can be expressed as the desired number of communities or
as the number of merge steps to make. The function gives an error
message, if called with a non-hierarchical method.

[`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html) converts a
hierarchical community structure to a `dendrogram` object. It only works
for hierarchical methods, and gives an error message to others. See
[`stats::dendrogram()`](https://rdrr.io/r/stats/dendrogram.html) for
details.

[`stats::as.hclust()`](https://rdrr.io/r/stats/as.hclust.html) is
similar to [`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html),
but converts a hierarchical community structure to a `hclust` object.

[`ape::as.phylo()`](https://rdrr.io/pkg/ape/man/as.phylo.html) converts
a hierarchical community structure to a `phylo` object, you will need
the `ape` package for this.

`show_trace()` works (currently) only for communities found by the
leading eigenvector method
([`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)),
and returns a character vector that gives the steps performed by the
algorithm while finding the communities.

`code_len()` is defined for the InfoMAP method
([`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md)
and returns the code length of the partition.

It is possibly to call the
[`plot()`](https://rdrr.io/r/graphics/plot.default.html) function on
`communities` objects. This will plot the graph (and uses
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)
internally), with the communities shown. By default it colores the
vertices according to their communities, and also marks the vertex
groups corresponding to the communities. It passes additional arguments
to [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
please see that and also
[igraph.plotting](https://r.igraph.org/reference/plot.common.md) on how
to change the plot.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

See
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md)
for plotting community structure dendrograms.

See [`compare()`](https://r.igraph.org/reference/compare.md) for
comparing two community structures on the same graph.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`compare()`](https://r.igraph.org/reference/compare.md),
[`groups()`](https://r.igraph.org/reference/groups.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
karate <- make_graph("Zachary")
wc <- cluster_walktrap(karate)
modularity(wc)
#> [1] 0.3532216
membership(wc)
#>  [1] 1 1 2 1 5 5 5 1 2 2 5 1 1 2 3 3 5 1 3 1 3 1 3 4 4 4 3 4 2 3 2 2 3 3
plot(wc, karate)

```
