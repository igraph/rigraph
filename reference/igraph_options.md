# Parameters for the igraph package

igraph has some parameters which (usually) affect the behavior of many
functions. These can be set for the whole session via
`igraph_options()`.

## Usage

``` r
igraph_options(...)

igraph_opt(x, default = NULL)
```

## Arguments

- ...:

  A list may be given as the only argument, or any number of arguments
  may be in the `name=value` form, or no argument at all may be given.
  See the Value and Details sections for explanation.

- x:

  A character string holding an option name.

- default:

  If the specified option is not set in the options list, this value is
  returned. This facilitates retrieving an option and checking whether
  it is set and setting it separately if not.

## Value

`igraph_options()` returns a list with the old values of the updated
parameters, invisibly. Without any arguments, it returns the values of
all options.

For `igraph_opt()`, the current value set for option `x`, or `NULL` if
the option is unset.

## Details

The parameter values set via a call to the `igraph_options()` function
will remain in effect for the rest of the session, affecting the
subsequent behaviour of the other functions of the `igraph` package for
which the given parameters are relevant.

This offers the possibility of customizing the functioning of the
`igraph` package, for instance by insertions of appropriate calls to
`igraph_options()` in a load hook for package igraph.

The currently used parameters in alphabetical order:

- add.params:

  Logical scalar, whether to add model parameter to the graphs that are
  created by the various graph constructors. By default it is `TRUE`.

- add.vertex.names:

  Logical scalar, whether to add vertex names to node level indices,
  like degree, betweenness scores, etc. By default it is `TRUE`.

- annotate.plot:

  Logical scalar, whether to annotate igraph plots with the graph's name
  (`name` graph attribute, if present) as `main`, and with the number of
  vertices and edges as `xlab`. Defaults to `FALSE`.

- dend.plot.type:

  The plotting function to use when plotting community structure
  dendrograms via
  [`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md).
  Possible values are ‘auto’ (the default), ‘phylo’, ‘hclust’ and
  ‘dendrogram’. See
  [`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md)
  for details.

- edge.attr.comb:

  Specifies what to do with the edge attributes if the graph is
  modified. The default value is
  `list(weight="sum", name="concat", "ignore")`. See
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details on this.

- print.edge.attributes:

  Logical constant, whether to print edge attributes when printing
  graphs. Defaults to `FALSE`.

- print.full:

  Logical scalar, whether
  [`print.igraph()`](https://r.igraph.org/reference/print.igraph.md)
  should show the graph structure as well, or only a summary of the
  graph.

- print.graph.attributes:

  Logical constant, whether to print graph attributes when printing
  graphs. Defaults to `FALSE`.

- print.vertex.attributes:

  Logical constant, whether to print vertex attributes when printing
  graphs. Defaults to `FALSE`.

- return.vs.es:

  Whether functions that return a set or sequence of vertices/edges
  should return formal vertex/edge sequence objects. This option was
  introduced in igraph version 1.0.0 and defaults to TRUE. If your
  package requires the old behavior, you can set it to FALSE in the
  `.onLoad` function of your package, without affecting other packages.

- sparsematrices:

  Whether to use the `Matrix` package for (sparse) matrices. It is
  recommended, if the user works with larger graphs.

- verbose:

  Logical constant, whether igraph functions should talk more than
  minimal. E.g. if `TRUE` then some functions will use progress bars
  while computing. Defaults to `FALSE`.

- vertex.attr.comb:

  Specifies what to do with the vertex attributes if the graph is
  modified. The default value is `list(name="concat", "ignore")`. See
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details on this.

## See also

`igraph_options()` is similar to
[`options()`](https://rdrr.io/r/base/options.html) and `igraph_opt()` is
similar to [`getOption()`](https://rdrr.io/r/base/options.html).

Other igraph options:
[`with_igraph_opt()`](https://r.igraph.org/reference/with_igraph_opt.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
oldval <- igraph_opt("verbose")
igraph_options(verbose = TRUE)
layout_with_kk(make_ring(10))
#> Make graph external pointer.
#> Materializing 'from' vector.
#> Materializing 'to' vector.
#>             [,1]         [,2]
#>  [1,]  1.1483519 -0.003216317
#>  [2,]  0.9291475  0.676715503
#>  [3,]  0.3521535  1.097946790
#>  [4,] -0.3622379  1.099581508
#>  [5,] -0.9411536  0.680995251
#>  [6,] -1.1634674  0.002073742
#>  [7,] -0.9442631 -0.677858079
#>  [8,] -0.3672691 -1.099089365
#>  [9,]  0.3471224 -1.100724083
#> [10,]  0.9260381 -0.682137826
igraph_options(verbose = oldval)

oldval <- igraph_options(verbose = TRUE, sparsematrices = FALSE)
make_ring(10)[]
#> Make graph external pointer.
#> Materializing 'from' vector.
#> Materializing 'to' vector.
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0    1    0    0    0    0    0    0    0     1
#>  [2,]    1    0    1    0    0    0    0    0    0     0
#>  [3,]    0    1    0    1    0    0    0    0    0     0
#>  [4,]    0    0    1    0    1    0    0    0    0     0
#>  [5,]    0    0    0    1    0    1    0    0    0     0
#>  [6,]    0    0    0    0    1    0    1    0    0     0
#>  [7,]    0    0    0    0    0    1    0    1    0     0
#>  [8,]    0    0    0    0    0    0    1    0    1     0
#>  [9,]    0    0    0    0    0    0    0    1    0     1
#> [10,]    1    0    0    0    0    0    0    0    1     0
igraph_options(oldval)
igraph_opt("verbose")
#> [1] FALSE
```
