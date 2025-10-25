# Community structure dendrogram plots

Plot a hierarchical community structure as a dendrogram.

## Usage

``` r
plot_dendrogram(x, mode = igraph_opt("dend.plot.type"), ...)

# S3 method for class 'communities'
plot_dendrogram(
  x,
  mode = igraph_opt("dend.plot.type"),
  ...,
  use.modularity = FALSE,
  palette = categorical_pal(8)
)
```

## Arguments

- x:

  An object containing the community structure of a graph. See
  [`communities()`](https://r.igraph.org/reference/communities.md) for
  details.

- mode:

  Which dendrogram plotting function to use. See details below.

- ...:

  Additional arguments to supply to the dendrogram plotting function.

- use.modularity:

  Logical scalar, whether to use the modularity values to define the
  height of the branches.

- palette:

  The color palette to use for colored plots.

## Value

Returns whatever the return value was from the plotting function,
`plot.phylo`, `plot.dendrogram` or `plot.hclust`.

## Details

`plot_dendrogram()` supports three different plotting functions,
selected via the `mode` argument. By default the plotting function is
taken from the `dend.plot.type` igraph option, and it has for possible
values:

- `auto` Choose automatically between the plotting functions. As
  `plot.phylo` is the most sophisticated, that is choosen, whenever the
  `ape` package is available. Otherwise `plot.hclust` is used.

- `phylo` Use `plot.phylo` from the `ape` package.

- `hclust` Use `plot.hclust` from the `stats` package.

- `dendrogram` Use `plot.dendrogram` from the `stats` package.

The different plotting functions take different sets of arguments. When
using `plot.phylo` (`mode="phylo"`), we have the following syntax:

        plot_dendrogram(x, mode="phylo", colbar = palette(),
                edge.color = NULL, use.edge.length = FALSE, \dots)

The extra arguments not documented above:

- `colbar` Color bar for the edges.

- `edge.color` Edge colors. If `NULL`, then the `colbar` argument is
  used.

- `use.edge.length` Passed to `plot.phylo`.

- `dots` Attitional arguments to pass to `plot.phylo`.

The syntax for `plot.hclust` (`mode="hclust"`):

        plot_dendrogram(x, mode="hclust", rect = 0, colbar = palette(),
                hang = 0.01, ann = FALSE, main = "", sub = "", xlab = "",
                ylab = "", \dots)

The extra arguments not documented above:

- `rect` A numeric scalar, the number of groups to mark on the
  dendrogram. The dendrogram is cut into exactly `rect` groups and they
  are marked via the `rect.hclust` command. Set this to zero if you
  don't want to mark any groups.

- `colbar` The colors of the rectangles that mark the vertex groups via
  the `rect` argument.

- `hang` Where to put the leaf nodes, this corresponds to the `hang`
  argument of `plot.hclust`.

- `ann` Whether to annotate the plot, the `ann` argument of
  `plot.hclust`.

- `main` The main title of the plot, the `main` argument of
  `plot.hclust`.

- `sub` The sub-title of the plot, the `sub` argument of `plot.hclust`.

- `xlab` The label on the horizontal axis, passed to `plot.hclust`.

- `ylab` The label on the vertical axis, passed to `plot.hclust`.

- `dots` Attitional arguments to pass to `plot.hclust`.

The syntax for `plot.dendrogram` (`mode="dendrogram"`):

        plot_dendrogram(x, \dots)

The extra arguments are simply passed to
[`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html).

## See also

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
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
karate <- make_graph("Zachary")
fc <- cluster_fast_greedy(karate)
plot_dendrogram(fc)

```
