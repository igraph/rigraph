# Functions to find cliques, i.e. complete subgraphs in a graph

These functions find all, the largest or all the maximal cliques in an
undirected graph. The size of the largest clique can also be calculated.

Tests if all pairs within a set of vertices are adjacent, i.e. whether
they form a clique. An empty set and singleton set are considered to be
a clique.

## Usage

``` r
cliques(graph, min = NULL, max = NULL, ..., callback = NULL)

largest_cliques(graph)

max_cliques(
  graph,
  min = NULL,
  max = NULL,
  subset = NULL,
  file = NULL,
  ...,
  callback = NULL
)

count_max_cliques(graph, min = NULL, max = NULL, subset = NULL)

clique_num(graph)

largest_weighted_cliques(graph, vertex.weights = NULL)

weighted_clique_num(graph, vertex.weights = NULL)

clique_size_counts(graph, min = 0, max = 0, maximal = FALSE)

is_clique(graph, candidate, directed = FALSE)
```

## Arguments

- graph:

  The input graph.

- min:

  Numeric constant, lower limit on the size of the cliques to find.
  `NULL` means no limit, i.e. it is the same as 0.

- max:

  Numeric constant, upper limit on the size of the cliques to find.
  `NULL` means no limit.

- ...:

  These dots are for future extensions and must be empty.

- callback:

  Optional function to call for each clique found. If provided, the
  function should accept one argument: `clique` (integer vector of
  vertex IDs in the clique, 1-based indexing). The function should
  return `FALSE` to continue the search or `TRUE` to stop it. If `NULL`
  (the default), all cliques are collected and returned as a list.

  **Important limitation:** Callback functions must NOT call any igraph
  functions (including simple queries like
  [`vcount()`](https://r.igraph.org/reference/gorder.md) or
  [`ecount()`](https://r.igraph.org/reference/gsize.md)). Doing so will
  cause R to crash due to reentrancy issues. Extract any needed graph
  information before calling the function with a callback, or use
  collector mode (the default) and process results afterward.

- subset:

  If not `NULL`, then it must be a vector of vertex ids, numeric or
  symbolic if the graph is named. The algorithm is run from these
  vertices only, so only a subset of all maximal cliques is returned.
  See the Eppstein paper for details. This argument makes it possible to
  easily parallelize the finding of maximal cliques.

- file:

  If not `NULL`, then it must be a file name, i.e. a character scalar.
  The output of the algorithm is written to this file. (If it exists,
  then it will be overwritten.) Each clique will be a separate line in
  the file, given with the numeric ids of its vertices, separated by
  whitespace.

- vertex.weights:

  Vertex weight vector. If the graph has a `weight` vertex attribute,
  then this is used by default. If the graph does not have a `weight`
  vertex attribute and this argument is `NULL`, then every vertex is
  assumed to have a weight of 1. Note that the current implementation of
  the weighted clique finder supports positive integer weights only.

- maximal:

  Specifies whether to look for all weighted cliques (`FALSE`) or only
  the maximal ones (`TRUE`).

- candidate:

  The vertex set to test for being a clique.

- directed:

  Whether to consider edge directions.

## Value

`cliques()` returns a list containing numeric vectors of vertex ids if
`callback` is `NULL`. Each list element is a clique, i.e. a vertex
sequence of class [igraph.vs](https://r.igraph.org/reference/V.md). If
`callback` is provided, returns `NULL` invisibly.

`largest_cliques()` and `clique_num()` return a list containing numeric
vectors of vertex ids. Each list element is a clique, i.e. a vertex
sequence of class [igraph.vs](https://r.igraph.org/reference/V.md).

`max_cliques()` returns `NULL`, invisibly, if its `file` argument is not
`NULL`. The output is written to the specified file in this case.

`clique_num()` and `count_max_cliques()` return an integer scalar.

`clique_size_counts()` returns a numeric vector with the clique sizes
such that the i-th item belongs to cliques of size i. Trailing zeros are
currently truncated, but this might change in future versions.

`is_clique()` returns `TRUE` if the candidate vertex set forms a clique.

## Details

`cliques()` find all complete subgraphs in the input graph, obeying the
size limitations given in the `min` and `max` arguments.

`largest_cliques()` finds all largest cliques in the input graph. A
clique is largest if there is no other clique including more vertices.

`max_cliques()` finds all maximal cliques in the input graph. A clique
is maximal if it cannot be extended to a larger clique. The largest
cliques are always maximal, but a maximal clique is not necessarily the
largest.

`count_max_cliques()` counts the maximal cliques.

`clique_num()` calculates the size of the largest clique(s).

`clique_size_counts()` returns a numeric vector representing a histogram
of clique sizes, between the given minimum and maximum clique size.

`is_clique()` tests whether all pairs within a vertex set are connected.

## Related documentation in the C library

[`cliques()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_cliques),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`largest_cliques()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_largest_cliques),
[`clique_number()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_clique_number),
[`largest_weighted_cliques()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_largest_weighted_cliques),
[`weighted_clique_number()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_weighted_clique_number),
[`clique_size_hist()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_clique_size_hist),
[`maximal_cliques_hist()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_maximal_cliques_hist),
[`is_clique()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_is_clique)

## References

For maximal cliques the following algorithm is implemented: David
Eppstein, Maarten Loffler, Darren Strash: Listing All Maximal Cliques in
Sparse Graphs in Near-optimal Time. <https://arxiv.org/abs/1006.5440>

## See also

Other cliques:
[`is_complete()`](https://r.igraph.org/reference/is_complete.md),
[`ivs()`](https://r.igraph.org/reference/ivs.md),
[`weighted_cliques()`](https://r.igraph.org/reference/weighted_cliques.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Examples

``` r
# this usually contains cliques of size six
g <- sample_gnp(100, 0.3)
clique_num(g)
#> [1] 6
cliques(g, min = 6)
#> [[1]]
#> + 6/100 vertices, from 37c43be:
#> [1]  6  7 20 76 87 94
#> 
#> [[2]]
#> + 6/100 vertices, from 37c43be:
#> [1]  7 20 28 53 76 94
#> 
#> [[3]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 24 50 57 87 93
#> 
#> [[4]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 15 31 40 56 63
#> 
#> [[5]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 31 40 56 63 97
#> 
#> [[6]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 13 68 69 75 97
#> 
#> [[7]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 13 56 68 75 97
#> 
#> [[8]]
#> + 6/100 vertices, from 37c43be:
#> [1] 56 63 68 81 82 97
#> 
#> [[9]]
#> + 6/100 vertices, from 37c43be:
#> [1] 15 28 31 66 85 93
#> 
#> [[10]]
#> + 6/100 vertices, from 37c43be:
#> [1]  3 38 50 68 96 99
#> 
#> [[11]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 28 72 79 94
#> 
#> [[12]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 54 72 79 94
#> 
#> [[13]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 63 79 94 97
#> 
#> [[14]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 63 77 94 97
#> 
#> [[15]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 13 14 33 79 97
#> 
#> [[16]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 17 63 77 97
#> 
#> [[17]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 14 18 60 63 97
#> 
#> [[18]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 24 46 57 84 91
#> 
#> [[19]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 24 46 47 57 91
#> 
largest_cliques(g)
#> [[1]]
#> + 6/100 vertices, from 37c43be:
#> [1]  3 99 50 96 68 38
#> 
#> [[2]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 28 72 79 94
#> 
#> [[3]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 54 79 72 94
#> 
#> [[4]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 97 17 63 77
#> 
#> [[5]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 97 79 13 33
#> 
#> [[6]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 97 79 63 94
#> 
#> [[7]]
#> + 6/100 vertices, from 37c43be:
#> [1]  5 14 97 77 94 63
#> 
#> [[8]]
#> + 6/100 vertices, from 37c43be:
#> [1]  6  7 94 87 20 76
#> 
#> [[9]]
#> + 6/100 vertices, from 37c43be:
#> [1]  7 53 94 28 76 20
#> 
#> [[10]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 97 13 68 75 56
#> 
#> [[11]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 97 13 68 75 69
#> 
#> [[12]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 97 63 14 60 18
#> 
#> [[13]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 97 63 40 56 31
#> 
#> [[14]]
#> + 6/100 vertices, from 37c43be:
#> [1]  8 15 63 56 40 31
#> 
#> [[15]]
#> + 6/100 vertices, from 37c43be:
#> [1] 15 93 31 85 28 66
#> 
#> [[16]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 93 50 87 57 24
#> 
#> [[17]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 46 91 57 24 84
#> 
#> [[18]]
#> + 6/100 vertices, from 37c43be:
#> [1] 17 46 91 57 24 47
#> 
#> [[19]]
#> + 6/100 vertices, from 37c43be:
#> [1] 56 97 82 68 81 63
#> 

# To have a bit less maximal cliques, about 100-200 usually
g <- sample_gnp(100, 0.03)
max_cliques(g)
#> [[1]]
#> + 1/100 vertex, from d873f77:
#> [1] 49
#> 
#> [[2]]
#> + 1/100 vertex, from d873f77:
#> [1] 64
#> 
#> [[3]]
#> + 1/100 vertex, from d873f77:
#> [1] 28
#> 
#> [[4]]
#> + 1/100 vertex, from d873f77:
#> [1] 27
#> 
#> [[5]]
#> + 1/100 vertex, from d873f77:
#> [1] 56
#> 
#> [[6]]
#> + 1/100 vertex, from d873f77:
#> [1] 35
#> 
#> [[7]]
#> + 1/100 vertex, from d873f77:
#> [1] 4
#> 
#> [[8]]
#> + 2/100 vertices, from d873f77:
#> [1] 89 80
#> 
#> [[9]]
#> + 2/100 vertices, from d873f77:
#> [1] 38 57
#> 
#> [[10]]
#> + 2/100 vertices, from d873f77:
#> [1] 70  1
#> 
#> [[11]]
#> + 2/100 vertices, from d873f77:
#> [1] 12 31
#> 
#> [[12]]
#> + 2/100 vertices, from d873f77:
#> [1] 93 22
#> 
#> [[13]]
#> + 2/100 vertices, from d873f77:
#> [1] 21 63
#> 
#> [[14]]
#> + 2/100 vertices, from d873f77:
#> [1] 73 50
#> 
#> [[15]]
#> + 2/100 vertices, from d873f77:
#> [1] 96 31
#> 
#> [[16]]
#> + 2/100 vertices, from d873f77:
#> [1] 25 23
#> 
#> [[17]]
#> + 2/100 vertices, from d873f77:
#> [1] 99 94
#> 
#> [[18]]
#> + 2/100 vertices, from d873f77:
#> [1] 32 75
#> 
#> [[19]]
#> + 2/100 vertices, from d873f77:
#> [1] 100  39
#> 
#> [[20]]
#> + 2/100 vertices, from d873f77:
#> [1] 44 16
#> 
#> [[21]]
#> + 2/100 vertices, from d873f77:
#> [1] 62 61
#> 
#> [[22]]
#> + 2/100 vertices, from d873f77:
#> [1] 36  2
#> 
#> [[23]]
#> + 2/100 vertices, from d873f77:
#> [1] 50 87
#> 
#> [[24]]
#> + 2/100 vertices, from d873f77:
#> [1] 51  3
#> 
#> [[25]]
#> + 2/100 vertices, from d873f77:
#> [1] 33 85
#> 
#> [[26]]
#> + 2/100 vertices, from d873f77:
#> [1] 33 65
#> 
#> [[27]]
#> + 2/100 vertices, from d873f77:
#> [1] 34 98
#> 
#> [[28]]
#> + 2/100 vertices, from d873f77:
#> [1] 34 58
#> 
#> [[29]]
#> + 2/100 vertices, from d873f77:
#> [1] 37 88
#> 
#> [[30]]
#> + 2/100 vertices, from d873f77:
#> [1] 37 85
#> 
#> [[31]]
#> + 2/100 vertices, from d873f77:
#> [1] 37 65
#> 
#> [[32]]
#> + 2/100 vertices, from d873f77:
#> [1] 39 72
#> 
#> [[33]]
#> + 2/100 vertices, from d873f77:
#> [1] 39 57
#> 
#> [[34]]
#> + 2/100 vertices, from d873f77:
#> [1] 39 46
#> 
#> [[35]]
#> + 2/100 vertices, from d873f77:
#> [1] 40 66
#> 
#> [[36]]
#> + 2/100 vertices, from d873f77:
#> [1] 40 61
#> 
#> [[37]]
#> + 2/100 vertices, from d873f77:
#> [1] 40 60
#> 
#> [[38]]
#> + 2/100 vertices, from d873f77:
#> [1] 40 31
#> 
#> [[39]]
#> + 2/100 vertices, from d873f77:
#> [1] 41 82
#> 
#> [[40]]
#> + 2/100 vertices, from d873f77:
#> [1] 41 18
#> 
#> [[41]]
#> + 2/100 vertices, from d873f77:
#> [1] 41  8
#> 
#> [[42]]
#> + 2/100 vertices, from d873f77:
#> [1] 42 79
#> 
#> [[43]]
#> + 2/100 vertices, from d873f77:
#> [1] 42 76
#> 
#> [[44]]
#> + 2/100 vertices, from d873f77:
#> [1] 43 97
#> 
#> [[45]]
#> + 2/100 vertices, from d873f77:
#> [1] 43 74
#> 
#> [[46]]
#> + 2/100 vertices, from d873f77:
#> [1] 43 58
#> 
#> [[47]]
#> + 2/100 vertices, from d873f77:
#> [1] 43 46
#> 
#> [[48]]
#> + 2/100 vertices, from d873f77:
#> [1] 45 30
#> 
#> [[49]]
#> + 2/100 vertices, from d873f77:
#> [1] 45 10
#> 
#> [[50]]
#> + 2/100 vertices, from d873f77:
#> [1] 47 19
#> 
#> [[51]]
#> + 2/100 vertices, from d873f77:
#> [1] 47  9
#> 
#> [[52]]
#> + 2/100 vertices, from d873f77:
#> [1] 47  6
#> 
#> [[53]]
#> + 2/100 vertices, from d873f77:
#> [1] 48 29
#> 
#> [[54]]
#> + 2/100 vertices, from d873f77:
#> [1] 48  5
#> 
#> [[55]]
#> + 2/100 vertices, from d873f77:
#> [1] 52 95
#> 
#> [[56]]
#> + 2/100 vertices, from d873f77:
#> [1] 52  6
#> 
#> [[57]]
#> + 2/100 vertices, from d873f77:
#> [1] 53 87
#> 
#> [[58]]
#> + 2/100 vertices, from d873f77:
#> [1] 53  9
#> 
#> [[59]]
#> + 2/100 vertices, from d873f77:
#> [1] 54 69
#> 
#> [[60]]
#> + 2/100 vertices, from d873f77:
#> [1] 54 24
#> 
#> [[61]]
#> + 2/100 vertices, from d873f77:
#> [1] 54  8
#> 
#> [[62]]
#> + 2/100 vertices, from d873f77:
#> [1] 55 78
#> 
#> [[63]]
#> + 2/100 vertices, from d873f77:
#> [1] 55 67
#> 
#> [[64]]
#> + 2/100 vertices, from d873f77:
#> [1] 55 26
#> 
#> [[65]]
#> + 2/100 vertices, from d873f77:
#> [1] 57 80
#> 
#> [[66]]
#> + 2/100 vertices, from d873f77:
#> [1] 57 69
#> 
#> [[67]]
#> + 2/100 vertices, from d873f77:
#> [1] 57  3
#> 
#> [[68]]
#> + 2/100 vertices, from d873f77:
#> [1] 58 90
#> 
#> [[69]]
#> + 2/100 vertices, from d873f77:
#> [1] 58 79
#> 
#> [[70]]
#> + 2/100 vertices, from d873f77:
#> [1] 58 59
#> 
#> [[71]]
#> + 2/100 vertices, from d873f77:
#> [1] 59 85
#> 
#> [[72]]
#> + 2/100 vertices, from d873f77:
#> [1] 60 86
#> 
#> [[73]]
#> + 2/100 vertices, from d873f77:
#> [1] 61 80
#> 
#> [[74]]
#> + 2/100 vertices, from d873f77:
#> [1] 61 75
#> 
#> [[75]]
#> + 2/100 vertices, from d873f77:
#> [1] 61 23
#> 
#> [[76]]
#> + 2/100 vertices, from d873f77:
#> [1] 63 78
#> 
#> [[77]]
#> + 2/100 vertices, from d873f77:
#> [1] 63 77
#> 
#> [[78]]
#> + 2/100 vertices, from d873f77:
#> [1] 63 19
#> 
#> [[79]]
#> + 2/100 vertices, from d873f77:
#> [1] 65 20
#> 
#> [[80]]
#> + 2/100 vertices, from d873f77:
#> [1] 65 16
#> 
#> [[81]]
#> + 2/100 vertices, from d873f77:
#> [1] 66 15
#> 
#> [[82]]
#> + 2/100 vertices, from d873f77:
#> [1] 66 13
#> 
#> [[83]]
#> + 2/100 vertices, from d873f77:
#> [1] 67 30
#> 
#> [[84]]
#> + 2/100 vertices, from d873f77:
#> [1] 67 16
#> 
#> [[85]]
#> + 2/100 vertices, from d873f77:
#> [1] 68 92
#> 
#> [[86]]
#> + 2/100 vertices, from d873f77:
#> [1] 68 85
#> 
#> [[87]]
#> + 2/100 vertices, from d873f77:
#> [1] 68 24
#> 
#> [[88]]
#> + 2/100 vertices, from d873f77:
#> [1] 68  2
#> 
#> [[89]]
#> + 2/100 vertices, from d873f77:
#> [1] 69  7
#> 
#> [[90]]
#> + 2/100 vertices, from d873f77:
#> [1] 71 87
#> 
#> [[91]]
#> + 2/100 vertices, from d873f77:
#> [1] 71 13
#> 
#> [[92]]
#> + 2/100 vertices, from d873f77:
#> [1] 71 11
#> 
#> [[93]]
#> + 2/100 vertices, from d873f77:
#> [1] 72 88
#> 
#> [[94]]
#> + 2/100 vertices, from d873f77:
#> [1] 72 78
#> 
#> [[95]]
#> + 2/100 vertices, from d873f77:
#> [1] 72  9
#> 
#> [[96]]
#> + 2/100 vertices, from d873f77:
#> [1] 74 84
#> 
#> [[97]]
#> + 2/100 vertices, from d873f77:
#> [1] 74 26
#> 
#> [[98]]
#> + 2/100 vertices, from d873f77:
#> [1] 75 90
#> 
#> [[99]]
#> + 2/100 vertices, from d873f77:
#> [1] 75 26
#> 
#> [[100]]
#> + 2/100 vertices, from d873f77:
#> [1] 76 87
#> 
#> [[101]]
#> + 2/100 vertices, from d873f77:
#> [1] 77 90
#> 
#> [[102]]
#> + 2/100 vertices, from d873f77:
#> [1] 77 87
#> 
#> [[103]]
#> + 2/100 vertices, from d873f77:
#> [1] 77 29
#> 
#> [[104]]
#> + 2/100 vertices, from d873f77:
#> [1] 77  9
#> 
#> [[105]]
#> + 2/100 vertices, from d873f77:
#> [1] 78 92
#> 
#> [[106]]
#> + 2/100 vertices, from d873f77:
#> [1] 78 13
#> 
#> [[107]]
#> + 2/100 vertices, from d873f77:
#> [1] 78  7
#> 
#> [[108]]
#> + 3/100 vertices, from d873f77:
#> [1] 81 17 84
#> 
#> [[109]]
#> + 2/100 vertices, from d873f77:
#> [1] 81  5
#> 
#> [[110]]
#> + 2/100 vertices, from d873f77:
#> [1] 82 86
#> 
#> [[111]]
#> + 2/100 vertices, from d873f77:
#> [1] 82 19
#> 
#> [[112]]
#> + 2/100 vertices, from d873f77:
#> [1] 83 22
#> 
#> [[113]]
#> + 2/100 vertices, from d873f77:
#> [1] 83 13
#> 
#> [[114]]
#> + 2/100 vertices, from d873f77:
#> [1] 84 97
#> 
#> [[115]]
#> + 2/100 vertices, from d873f77:
#> [1] 84 24
#> 
#> [[116]]
#> + 2/100 vertices, from d873f77:
#> [1] 84 22
#> 
#> [[117]]
#> + 2/100 vertices, from d873f77:
#> [1] 84 14
#> 
#> [[118]]
#> + 2/100 vertices, from d873f77:
#> [1] 85 26
#> 
#> [[119]]
#> + 2/100 vertices, from d873f77:
#> [1] 86 92
#> 
#> [[120]]
#> + 2/100 vertices, from d873f77:
#> [1] 86 90
#> 
#> [[121]]
#> + 2/100 vertices, from d873f77:
#> [1] 87 15
#> 
#> [[122]]
#> + 2/100 vertices, from d873f77:
#> [1] 90 94
#> 
#> [[123]]
#> + 2/100 vertices, from d873f77:
#> [1] 90 22
#> 
#> [[124]]
#> + 2/100 vertices, from d873f77:
#> [1] 91 14
#> 
#> [[125]]
#> + 2/100 vertices, from d873f77:
#> [1] 91 13
#> 
#> [[126]]
#> + 2/100 vertices, from d873f77:
#> [1] 94 98
#> 
#> [[127]]
#> + 2/100 vertices, from d873f77:
#> [1] 94 17
#> 
#> [[128]]
#> + 2/100 vertices, from d873f77:
#> [1] 95 26
#> 
#> [[129]]
#> + 2/100 vertices, from d873f77:
#> [1] 97 23
#> 
#> [[130]]
#> + 2/100 vertices, from d873f77:
#> [1] 98 23
#> 
#> [[131]]
#> + 2/100 vertices, from d873f77:
#> [1] 98  5
#> 
#> [[132]]
#> + 3/100 vertices, from d873f77:
#> [1]  2 13 26
#> 
#> [[133]]
#> + 2/100 vertices, from d873f77:
#> [1]  3 26
#> 
#> [[134]]
#> + 2/100 vertices, from d873f77:
#> [1]  6 26
#> 
#> [[135]]
#> + 2/100 vertices, from d873f77:
#> [1]  6 14
#> 
#> [[136]]
#> + 2/100 vertices, from d873f77:
#> [1] 10 31
#> 
#> [[137]]
#> + 2/100 vertices, from d873f77:
#> [1] 10 11
#> 
#> [[138]]
#> + 2/100 vertices, from d873f77:
#> [1] 15 30
#> 
#> [[139]]
#> + 2/100 vertices, from d873f77:
#> [1] 16 26
#> 
#> [[140]]
#> + 2/100 vertices, from d873f77:
#> [1] 18 20
#> 
#> [[141]]
#> + 2/100 vertices, from d873f77:
#> [1] 19 23
#> 

# Check that all returned vertex sets are indeed cliques
all(sapply(max_cliques(g), function (c) is_clique(g, c)))
#> [1] TRUE
```
