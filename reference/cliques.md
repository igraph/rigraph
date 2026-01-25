# Functions to find cliques, i.e. complete subgraphs in a graph

These functions find all, the largest or all the maximal cliques in an
undirected graph. The size of the largest clique can also be calculated.

Tests if all pairs within a set of vertices are adjacent, i.e. whether
they form a clique. An empty set and singleton set are considered to be
a clique.

## Usage

``` r
cliques(graph, min = 0, max = 0)

largest_cliques(graph)

max_cliques(graph, min = NULL, max = NULL, subset = NULL, file = NULL)

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

`cliques()`, `largest_cliques()` and `clique_num()` return a list
containing numeric vectors of vertex ids. Each list element is a clique,
i.e. a vertex sequence of class
[igraph.vs](https://r.igraph.org/reference/V.md).

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

## Related documentation in the C library

[`cliques()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_cliques),
[`largest_cliques()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_largest_cliques),
[`clique_number()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_clique_number),
[`largest_weighted_cliques()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_largest_weighted_cliques),
[`weighted_clique_number()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_weighted_clique_number),
[`maximal_cliques_hist()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_maximal_cliques_hist),
[`clique_size_hist()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_clique_size_hist),
[`is_clique()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_is_clique).

## Examples

``` r
# this usually contains cliques of size six
g <- sample_gnp(100, 0.3)
clique_num(g)
#> [1] 7
cliques(g, min = 6)
#> [[1]]
#> + 6/100 vertices, from 93216dd:
#> [1] 27 34 39 62 63 97
#> 
#> [[2]]
#> + 6/100 vertices, from 93216dd:
#> [1] 27 39 62 63 76 97
#> 
#> [[3]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 27 39 63 76 97
#> 
#> [[4]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 18 27 63 76 97
#> 
#> [[5]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 32 63 76 81 97
#> 
#> [[6]]
#> + 6/100 vertices, from 93216dd:
#> [1]  3 40 63 69 78 97
#> 
#> [[7]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 32 63 78 81 97
#> 
#> [[8]]
#> + 6/100 vertices, from 93216dd:
#> [1]   8  22  93  95  96 100
#> 
#> [[9]]
#> + 6/100 vertices, from 93216dd:
#> [1]  1 56 58 93 97 98
#> 
#> [[10]]
#> + 6/100 vertices, from 93216dd:
#> [1] 13 23 49 56 58 80
#> 
#> [[11]]
#> + 6/100 vertices, from 93216dd:
#> [1] 10 13 23 49 56 80
#> 
#> [[12]]
#> + 6/100 vertices, from 93216dd:
#> [1] 13 23 30 49 56 80
#> 
#> [[13]]
#> + 6/100 vertices, from 93216dd:
#> [1]  2  4 21 32 78 81
#> 
#> [[14]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 21 32 78 81 97
#> 
#> [[15]]
#> + 6/100 vertices, from 93216dd:
#> [1]  8 21 32 44 67 68
#> 
#> [[16]]
#> + 6/100 vertices, from 93216dd:
#> [1] 24 25 52 59 88 97
#> 
#> [[17]]
#> + 6/100 vertices, from 93216dd:
#> [1] 37 62 66 73 79 97
#> 
#> [[18]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 66 78 81 97
#> 
#> [[19]]
#> + 6/100 vertices, from 93216dd:
#> [1] 14 40 63 78 81 97
#> 
#> [[20]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 32 63 78 81
#> 
#> [[21]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4 14 32 63 78 81 97
#> 
#> [[22]]
#> + 6/100 vertices, from 93216dd:
#> [1] 14 32 63 78 81 97
#> 
#> [[23]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 63 78 81 97
#> 
#> [[24]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 32 63 78 97
#> 
#> [[25]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 32 78 81 97
#> 
#> [[26]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4 14 32 63 81 97
#> 
#> [[27]]
#> + 6/100 vertices, from 93216dd:
#> [1]  6 27 34 39 63 97
#> 
#> [[28]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 27 39 63 76
#> 
#> [[29]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4  6 27 39 63 76 97
#> 
#> [[30]]
#> + 6/100 vertices, from 93216dd:
#> [1]  6 27 39 63 76 97
#> 
#> [[31]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 18 27 63 76
#> 
#> [[32]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4  6 18 27 63 76 97
#> 
#> [[33]]
#> + 6/100 vertices, from 93216dd:
#> [1]  6 18 27 63 76 97
#> 
#> [[34]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 27 63 76 97
#> 
#> [[35]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 39 63 76 97
#> 
#> [[36]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 18 63 76 97
#> 
#> [[37]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 27 39 63 97
#> 
#> [[38]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 18 27 63 97
#> 
#> [[39]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 27 39 76 97
#> 
#> [[40]]
#> + 6/100 vertices, from 93216dd:
#> [1]  4  6 18 27 76 97
#> 
largest_cliques(g)
#> [[1]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4 97 14 81 78 63 32
#> 
#> [[2]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4 97 76 63  6 27 18
#> 
#> [[3]]
#> + 7/100 vertices, from 93216dd:
#> [1]  4 97 76 63  6 27 39
#> 

# To have a bit less maximal cliques, about 100-200 usually
g <- sample_gnp(100, 0.03)
max_cliques(g)
#> [[1]]
#> + 1/100 vertex, from 6d78293:
#> [1] 27
#> 
#> [[2]]
#> + 1/100 vertex, from 6d78293:
#> [1] 51
#> 
#> [[3]]
#> + 1/100 vertex, from 6d78293:
#> [1] 87
#> 
#> [[4]]
#> + 1/100 vertex, from 6d78293:
#> [1] 21
#> 
#> [[5]]
#> + 1/100 vertex, from 6d78293:
#> [1] 84
#> 
#> [[6]]
#> + 1/100 vertex, from 6d78293:
#> [1] 11
#> 
#> [[7]]
#> + 2/100 vertices, from 6d78293:
#> [1] 41 30
#> 
#> [[8]]
#> + 2/100 vertices, from 6d78293:
#> [1] 16 36
#> 
#> [[9]]
#> + 2/100 vertices, from 6d78293:
#> [1] 91 73
#> 
#> [[10]]
#> + 2/100 vertices, from 6d78293:
#> [1] 44 48
#> 
#> [[11]]
#> + 2/100 vertices, from 6d78293:
#> [1] 44 14
#> 
#> [[12]]
#> + 2/100 vertices, from 6d78293:
#> [1] 94 54
#> 
#> [[13]]
#> + 2/100 vertices, from 6d78293:
#> [1] 96  7
#> 
#> [[14]]
#> + 2/100 vertices, from 6d78293:
#> [1] 35 58
#> 
#> [[15]]
#> + 2/100 vertices, from 6d78293:
#> [1] 17 97
#> 
#> [[16]]
#> + 2/100 vertices, from 6d78293:
#> [1] 62 37
#> 
#> [[17]]
#> + 2/100 vertices, from 6d78293:
#> [1] 1 9
#> 
#> [[18]]
#> + 2/100 vertices, from 6d78293:
#> [1] 29  2
#> 
#> [[19]]
#> + 2/100 vertices, from 6d78293:
#> [1] 65 60
#> 
#> [[20]]
#> + 2/100 vertices, from 6d78293:
#> [1]  9 56
#> 
#> [[21]]
#> + 2/100 vertices, from 6d78293:
#> [1] 40 93
#> 
#> [[22]]
#> + 2/100 vertices, from 6d78293:
#> [1] 54 14
#> 
#> [[23]]
#> + 2/100 vertices, from 6d78293:
#> [1] 30 86
#> 
#> [[24]]
#> + 2/100 vertices, from 6d78293:
#> [1] 30 72
#> 
#> [[25]]
#> + 2/100 vertices, from 6d78293:
#> [1] 30 34
#> 
#> [[26]]
#> + 2/100 vertices, from 6d78293:
#> [1] 31 86
#> 
#> [[27]]
#> + 2/100 vertices, from 6d78293:
#> [1] 31 69
#> 
#> [[28]]
#> + 2/100 vertices, from 6d78293:
#> [1] 31 36
#> 
#> [[29]]
#> + 2/100 vertices, from 6d78293:
#> [1] 32 60
#> 
#> [[30]]
#> + 2/100 vertices, from 6d78293:
#> [1] 32 49
#> 
#> [[31]]
#> + 2/100 vertices, from 6d78293:
#> [1] 33 49
#> 
#> [[32]]
#> + 2/100 vertices, from 6d78293:
#> [1] 33  5
#> 
#> [[33]]
#> + 2/100 vertices, from 6d78293:
#> [1] 34 90
#> 
#> [[34]]
#> + 2/100 vertices, from 6d78293:
#> [1] 34 85
#> 
#> [[35]]
#> + 2/100 vertices, from 6d78293:
#> [1] 34 10
#> 
#> [[36]]
#> + 2/100 vertices, from 6d78293:
#> [1] 36 72
#> 
#> [[37]]
#> + 2/100 vertices, from 6d78293:
#> [1] 36 50
#> 
#> [[38]]
#> + 2/100 vertices, from 6d78293:
#> [1] 36 28
#> 
#> [[39]]
#> + 2/100 vertices, from 6d78293:
#> [1] 36 20
#> 
#> [[40]]
#> + 2/100 vertices, from 6d78293:
#> [1] 37 69
#> 
#> [[41]]
#> + 2/100 vertices, from 6d78293:
#> [1] 37  6
#> 
#> [[42]]
#> + 2/100 vertices, from 6d78293:
#> [1] 38 45
#> 
#> [[43]]
#> + 3/100 vertices, from 6d78293:
#> [1] 38 26 63
#> 
#> [[44]]
#> + 2/100 vertices, from 6d78293:
#> [1] 38  2
#> 
#> [[45]]
#> + 2/100 vertices, from 6d78293:
#> [1] 39 83
#> 
#> [[46]]
#> + 2/100 vertices, from 6d78293:
#> [1] 39 58
#> 
#> [[47]]
#> + 2/100 vertices, from 6d78293:
#> [1] 42 68
#> 
#> [[48]]
#> + 2/100 vertices, from 6d78293:
#> [1] 42 55
#> 
#> [[49]]
#> + 2/100 vertices, from 6d78293:
#> [1] 43 67
#> 
#> [[50]]
#> + 2/100 vertices, from 6d78293:
#> [1] 43  2
#> 
#> [[51]]
#> + 2/100 vertices, from 6d78293:
#> [1] 45 50
#> 
#> [[52]]
#> + 2/100 vertices, from 6d78293:
#> [1] 45 22
#> 
#> [[53]]
#> + 2/100 vertices, from 6d78293:
#> [1] 46 80
#> 
#> [[54]]
#> + 2/100 vertices, from 6d78293:
#> [1] 46 75
#> 
#> [[55]]
#> + 2/100 vertices, from 6d78293:
#> [1] 46 71
#> 
#> [[56]]
#> + 2/100 vertices, from 6d78293:
#> [1] 46 60
#> 
#> [[57]]
#> + 2/100 vertices, from 6d78293:
#> [1] 47 82
#> 
#> [[58]]
#> + 2/100 vertices, from 6d78293:
#> [1] 47 61
#> 
#> [[59]]
#> + 2/100 vertices, from 6d78293:
#> [1] 47  4
#> 
#> [[60]]
#> + 2/100 vertices, from 6d78293:
#> [1] 49 89
#> 
#> [[61]]
#> + 2/100 vertices, from 6d78293:
#> [1] 49 88
#> 
#> [[62]]
#> + 2/100 vertices, from 6d78293:
#> [1] 49 59
#> 
#> [[63]]
#> + 2/100 vertices, from 6d78293:
#> [1] 49 53
#> 
#> [[64]]
#> + 2/100 vertices, from 6d78293:
#> [1] 50 82
#> 
#> [[65]]
#> + 2/100 vertices, from 6d78293:
#> [1] 52 81
#> 
#> [[66]]
#> + 2/100 vertices, from 6d78293:
#> [1] 52 18
#> 
#> [[67]]
#> + 2/100 vertices, from 6d78293:
#> [1] 53 70
#> 
#> [[68]]
#> + 2/100 vertices, from 6d78293:
#> [1] 53  7
#> 
#> [[69]]
#> + 2/100 vertices, from 6d78293:
#> [1] 55 80
#> 
#> [[70]]
#> + 2/100 vertices, from 6d78293:
#> [1] 55 64
#> 
#> [[71]]
#> + 2/100 vertices, from 6d78293:
#> [1] 56 79
#> 
#> [[72]]
#> + 2/100 vertices, from 6d78293:
#> [1] 56  7
#> 
#> [[73]]
#> + 2/100 vertices, from 6d78293:
#> [1] 57 98
#> 
#> [[74]]
#> + 2/100 vertices, from 6d78293:
#> [1] 57 93
#> 
#> [[75]]
#> + 2/100 vertices, from 6d78293:
#> [1] 57 64
#> 
#> [[76]]
#> + 2/100 vertices, from 6d78293:
#> [1] 58 95
#> 
#> [[77]]
#> + 2/100 vertices, from 6d78293:
#> [1] 58 75
#> 
#> [[78]]
#> + 2/100 vertices, from 6d78293:
#> [1] 58 22
#> 
#> [[79]]
#> + 2/100 vertices, from 6d78293:
#> [1] 58 18
#> 
#> [[80]]
#> + 2/100 vertices, from 6d78293:
#> [1] 59 24
#> 
#> [[81]]
#> + 2/100 vertices, from 6d78293:
#> [1] 59 22
#> 
#> [[82]]
#> + 2/100 vertices, from 6d78293:
#> [1] 61 98
#> 
#> [[83]]
#> + 3/100 vertices, from 6d78293:
#> [1] 61 97 12
#> 
#> [[84]]
#> + 3/100 vertices, from 6d78293:
#> [1]  61  97 100
#> 
#> [[85]]
#> + 2/100 vertices, from 6d78293:
#> [1] 61 25
#> 
#> [[86]]
#> + 2/100 vertices, from 6d78293:
#> [1] 63 90
#> 
#> [[87]]
#> + 2/100 vertices, from 6d78293:
#> [1] 63 79
#> 
#> [[88]]
#> + 2/100 vertices, from 6d78293:
#> [1] 63 23
#> 
#> [[89]]
#> + 2/100 vertices, from 6d78293:
#> [1] 66 77
#> 
#> [[90]]
#> + 2/100 vertices, from 6d78293:
#> [1] 66 76
#> 
#> [[91]]
#> + 2/100 vertices, from 6d78293:
#> [1] 66 69
#> 
#> [[92]]
#> + 2/100 vertices, from 6d78293:
#> [1] 66 26
#> 
#> [[93]]
#> + 2/100 vertices, from 6d78293:
#> [1]  67 100
#> 
#> [[94]]
#> + 2/100 vertices, from 6d78293:
#> [1] 68 98
#> 
#> [[95]]
#> + 2/100 vertices, from 6d78293:
#> [1] 68 82
#> 
#> [[96]]
#> + 2/100 vertices, from 6d78293:
#> [1] 68 25
#> 
#> [[97]]
#> + 2/100 vertices, from 6d78293:
#> [1] 70 92
#> 
#> [[98]]
#> + 2/100 vertices, from 6d78293:
#> [1] 70 85
#> 
#> [[99]]
#> + 2/100 vertices, from 6d78293:
#> [1] 71 73
#> 
#> [[100]]
#> + 2/100 vertices, from 6d78293:
#> [1] 71 26
#> 
#> [[101]]
#> + 2/100 vertices, from 6d78293:
#> [1] 72 10
#> 
#> [[102]]
#> + 2/100 vertices, from 6d78293:
#> [1] 73 82
#> 
#> [[103]]
#> + 2/100 vertices, from 6d78293:
#> [1] 73 78
#> 
#> [[104]]
#> + 2/100 vertices, from 6d78293:
#> [1] 73 24
#> 
#> [[105]]
#> + 2/100 vertices, from 6d78293:
#> [1] 73 15
#> 
#> [[106]]
#> + 2/100 vertices, from 6d78293:
#> [1] 73  7
#> 
#> [[107]]
#> + 2/100 vertices, from 6d78293:
#> [1] 74 83
#> 
#> [[108]]
#> + 2/100 vertices, from 6d78293:
#> [1] 74 82
#> 
#> [[109]]
#> + 2/100 vertices, from 6d78293:
#> [1] 74 81
#> 
#> [[110]]
#> + 2/100 vertices, from 6d78293:
#> [1] 74 15
#> 
#> [[111]]
#> + 2/100 vertices, from 6d78293:
#> [1] 75 93
#> 
#> [[112]]
#> + 2/100 vertices, from 6d78293:
#> [1] 75 77
#> 
#> [[113]]
#> + 2/100 vertices, from 6d78293:
#> [1] 75 23
#> 
#> [[114]]
#> + 2/100 vertices, from 6d78293:
#> [1] 75 19
#> 
#> [[115]]
#> + 2/100 vertices, from 6d78293:
#> [1] 76 78
#> 
#> [[116]]
#> + 2/100 vertices, from 6d78293:
#> [1] 77 13
#> 
#> [[117]]
#> + 2/100 vertices, from 6d78293:
#> [1] 79  6
#> 
#> [[118]]
#> + 2/100 vertices, from 6d78293:
#> [1] 79  4
#> 
#> [[119]]
#> + 2/100 vertices, from 6d78293:
#> [1] 80 24
#> 
#> [[120]]
#> + 2/100 vertices, from 6d78293:
#> [1] 80 20
#> 
#> [[121]]
#> + 2/100 vertices, from 6d78293:
#> [1] 80 13
#> 
#> [[122]]
#> + 2/100 vertices, from 6d78293:
#> [1] 81 99
#> 
#> [[123]]
#> + 2/100 vertices, from 6d78293:
#> [1] 82 12
#> 
#> [[124]]
#> + 2/100 vertices, from 6d78293:
#> [1] 85  4
#> 
#> [[125]]
#> + 2/100 vertices, from 6d78293:
#> [1] 86 93
#> 
#> [[126]]
#> + 2/100 vertices, from 6d78293:
#> [1] 86 14
#> 
#> [[127]]
#> + 2/100 vertices, from 6d78293:
#> [1] 86  5
#> 
#> [[128]]
#> + 2/100 vertices, from 6d78293:
#> [1] 86  3
#> 
#> [[129]]
#> + 2/100 vertices, from 6d78293:
#> [1] 88 22
#> 
#> [[130]]
#> + 2/100 vertices, from 6d78293:
#> [1] 88 14
#> 
#> [[131]]
#> + 2/100 vertices, from 6d78293:
#> [1] 88  4
#> 
#> [[132]]
#> + 2/100 vertices, from 6d78293:
#> [1] 89 90
#> 
#> [[133]]
#> + 2/100 vertices, from 6d78293:
#> [1] 90 92
#> 
#> [[134]]
#> + 2/100 vertices, from 6d78293:
#> [1]  95 100
#> 
#> [[135]]
#> + 2/100 vertices, from 6d78293:
#> [1] 97 28
#> 
#> [[136]]
#> + 2/100 vertices, from 6d78293:
#> [1] 97 15
#> 
#> [[137]]
#> + 2/100 vertices, from 6d78293:
#> [1] 97 10
#> 
#> [[138]]
#> + 2/100 vertices, from 6d78293:
#> [1] 98  6
#> 
#> [[139]]
#> + 2/100 vertices, from 6d78293:
#> [1] 98  5
#> 
#> [[140]]
#> + 2/100 vertices, from 6d78293:
#> [1] 99 24
#> 
#> [[141]]
#> + 2/100 vertices, from 6d78293:
#> [1] 100  26
#> 
#> [[142]]
#> + 2/100 vertices, from 6d78293:
#> [1] 2 3
#> 
#> [[143]]
#> + 2/100 vertices, from 6d78293:
#> [1]  3 28
#> 
#> [[144]]
#> + 2/100 vertices, from 6d78293:
#> [1] 6 8
#> 
#> [[145]]
#> + 2/100 vertices, from 6d78293:
#> [1]  8 20
#> 
#> [[146]]
#> + 2/100 vertices, from 6d78293:
#> [1] 19 28
#> 

# Check that all returned vertex sets are indeed cliques
all(sapply(max_cliques(g), function (c) is_clique(g, c)))
#> [1] TRUE
```
