# Functions to find weighted cliques, i.e. vertex-weighted complete subgraphs in a graph

These functions find all, the largest or all the maximal weighted
cliques in an undirected graph. The weight of a clique is the sum of the
weights of its vertices.

## Usage

``` r
weighted_cliques(
  graph,
  vertex.weights = NULL,
  min.weight = 0,
  max.weight = 0,
  maximal = FALSE
)
```

## Arguments

- graph:

  The input graph, directed graphs will be considered as undirected
  ones, multiple edges and loops are ignored.

- vertex.weights:

  Vertex weight vector. If the graph has a `weight` vertex attribute,
  then this is used by default. If the graph does not have a `weight`
  vertex attribute and this argument is `NULL`, then every vertex is
  assumed to have a weight of 1. Note that the current implementation of
  the weighted clique finder supports positive integer weights only.

- min.weight:

  Numeric constant, lower limit on the weight of the cliques to find.
  `NULL` means no limit, i.e. it is the same as 0.

- max.weight:

  Numeric constant, upper limit on the weight of the cliques to find.
  `NULL` means no limit.

- maximal:

  Specifies whether to look for all weighted cliques (`FALSE`) or only
  the maximal ones (`TRUE`).

## Value

`weighted_cliques()` and
[`largest_weighted_cliques()`](https://r.igraph.org/reference/cliques.md)
return a list containing numeric vectors of vertex IDs. Each list
element is a weighted clique, i.e. a vertex sequence of class
[igraph.vs](https://r.igraph.org/reference/V.md).

[`weighted_clique_num()`](https://r.igraph.org/reference/cliques.md)
returns an integer scalar.

## Details

`weighted_cliques()` finds all complete subgraphs in the input graph,
obeying the weight limitations given in the `min` and `max` arguments.

[`largest_weighted_cliques()`](https://r.igraph.org/reference/cliques.md)
finds all largest weighted cliques in the input graph. A clique is
largest if there is no other clique whose total weight is larger than
the weight of this clique.

[`weighted_clique_num()`](https://r.igraph.org/reference/cliques.md)
calculates the weight of the largest weighted clique(s).

## See also

Other cliques: [`cliques()`](https://r.igraph.org/reference/cliques.md),
[`is_complete()`](https://r.igraph.org/reference/is_complete.md),
[`ivs()`](https://r.igraph.org/reference/ivs.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Related documentation in the C library

[`weighted_cliques()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_weighted_cliques).

## Examples

``` r
g <- make_graph("zachary")
V(g)$weight <- 1
V(g)[c(1, 2, 3, 4, 14)]$weight <- 3
weighted_cliques(g)
#> [[1]]
#> + 1/34 vertex, from a7b93db:
#> [1] 34
#> 
#> [[2]]
#> + 1/34 vertex, from a7b93db:
#> [1] 33
#> 
#> [[3]]
#> + 2/34 vertices, from a7b93db:
#> [1] 33 34
#> 
#> [[4]]
#> + 1/34 vertex, from a7b93db:
#> [1] 8
#> 
#> [[5]]
#> + 1/34 vertex, from a7b93db:
#> [1] 9
#> 
#> [[6]]
#> + 2/34 vertices, from a7b93db:
#> [1]  9 33
#> 
#> [[7]]
#> + 3/34 vertices, from a7b93db:
#> [1]  9 33 34
#> 
#> [[8]]
#> + 2/34 vertices, from a7b93db:
#> [1]  9 34
#> 
#> [[9]]
#> + 1/34 vertex, from a7b93db:
#> [1] 32
#> 
#> [[10]]
#> + 2/34 vertices, from a7b93db:
#> [1] 32 33
#> 
#> [[11]]
#> + 3/34 vertices, from a7b93db:
#> [1] 32 33 34
#> 
#> [[12]]
#> + 2/34 vertices, from a7b93db:
#> [1] 32 34
#> 
#> [[13]]
#> + 1/34 vertex, from a7b93db:
#> [1] 22
#> 
#> [[14]]
#> + 1/34 vertex, from a7b93db:
#> [1] 20
#> 
#> [[15]]
#> + 2/34 vertices, from a7b93db:
#> [1] 20 34
#> 
#> [[16]]
#> + 1/34 vertex, from a7b93db:
#> [1] 18
#> 
#> [[17]]
#> + 1/34 vertex, from a7b93db:
#> [1] 13
#> 
#> [[18]]
#> + 1/34 vertex, from a7b93db:
#> [1] 7
#> 
#> [[19]]
#> + 1/34 vertex, from a7b93db:
#> [1] 28
#> 
#> [[20]]
#> + 2/34 vertices, from a7b93db:
#> [1] 28 34
#> 
#> [[21]]
#> + 1/34 vertex, from a7b93db:
#> [1] 11
#> 
#> [[22]]
#> + 1/34 vertex, from a7b93db:
#> [1] 6
#> 
#> [[23]]
#> + 2/34 vertices, from a7b93db:
#> [1]  6 11
#> 
#> [[24]]
#> + 2/34 vertices, from a7b93db:
#> [1] 6 7
#> 
#> [[25]]
#> + 1/34 vertex, from a7b93db:
#> [1] 31
#> 
#> [[26]]
#> + 2/34 vertices, from a7b93db:
#> [1]  9 31
#> 
#> [[27]]
#> + 3/34 vertices, from a7b93db:
#> [1]  9 31 33
#> 
#> [[28]]
#> + 4/34 vertices, from a7b93db:
#> [1]  9 31 33 34
#> 
#> [[29]]
#> + 3/34 vertices, from a7b93db:
#> [1]  9 31 34
#> 
#> [[30]]
#> + 2/34 vertices, from a7b93db:
#> [1] 31 33
#> 
#> [[31]]
#> + 3/34 vertices, from a7b93db:
#> [1] 31 33 34
#> 
#> [[32]]
#> + 2/34 vertices, from a7b93db:
#> [1] 31 34
#> 
#> [[33]]
#> + 1/34 vertex, from a7b93db:
#> [1] 29
#> 
#> [[34]]
#> + 2/34 vertices, from a7b93db:
#> [1] 29 32
#> 
#> [[35]]
#> + 3/34 vertices, from a7b93db:
#> [1] 29 32 34
#> 
#> [[36]]
#> + 2/34 vertices, from a7b93db:
#> [1] 29 34
#> 
#> [[37]]
#> + 1/34 vertex, from a7b93db:
#> [1] 12
#> 
#> [[38]]
#> + 1/34 vertex, from a7b93db:
#> [1] 10
#> 
#> [[39]]
#> + 2/34 vertices, from a7b93db:
#> [1] 10 34
#> 
#> [[40]]
#> + 1/34 vertex, from a7b93db:
#> [1] 5
#> 
#> [[41]]
#> + 2/34 vertices, from a7b93db:
#> [1]  5 11
#> 
#> [[42]]
#> + 2/34 vertices, from a7b93db:
#> [1] 5 7
#> 
#> [[43]]
#> + 1/34 vertex, from a7b93db:
#> [1] 30
#> 
#> [[44]]
#> + 2/34 vertices, from a7b93db:
#> [1] 30 33
#> 
#> [[45]]
#> + 3/34 vertices, from a7b93db:
#> [1] 30 33 34
#> 
#> [[46]]
#> + 2/34 vertices, from a7b93db:
#> [1] 30 34
#> 
#> [[47]]
#> + 1/34 vertex, from a7b93db:
#> [1] 26
#> 
#> [[48]]
#> + 2/34 vertices, from a7b93db:
#> [1] 26 32
#> 
#> [[49]]
#> + 1/34 vertex, from a7b93db:
#> [1] 27
#> 
#> [[50]]
#> + 2/34 vertices, from a7b93db:
#> [1] 27 30
#> 
#> [[51]]
#> + 3/34 vertices, from a7b93db:
#> [1] 27 30 34
#> 
#> [[52]]
#> + 2/34 vertices, from a7b93db:
#> [1] 27 34
#> 
#> [[53]]
#> + 1/34 vertex, from a7b93db:
#> [1] 25
#> 
#> [[54]]
#> + 2/34 vertices, from a7b93db:
#> [1] 25 26
#> 
#> [[55]]
#> + 3/34 vertices, from a7b93db:
#> [1] 25 26 32
#> 
#> [[56]]
#> + 2/34 vertices, from a7b93db:
#> [1] 25 28
#> 
#> [[57]]
#> + 2/34 vertices, from a7b93db:
#> [1] 25 32
#> 
#> [[58]]
#> + 1/34 vertex, from a7b93db:
#> [1] 24
#> 
#> [[59]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 26
#> 
#> [[60]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 30
#> 
#> [[61]]
#> + 3/34 vertices, from a7b93db:
#> [1] 24 30 33
#> 
#> [[62]]
#> + 4/34 vertices, from a7b93db:
#> [1] 24 30 33 34
#> 
#> [[63]]
#> + 3/34 vertices, from a7b93db:
#> [1] 24 30 34
#> 
#> [[64]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 28
#> 
#> [[65]]
#> + 3/34 vertices, from a7b93db:
#> [1] 24 28 34
#> 
#> [[66]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 33
#> 
#> [[67]]
#> + 3/34 vertices, from a7b93db:
#> [1] 24 33 34
#> 
#> [[68]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 34
#> 
#> [[69]]
#> + 1/34 vertex, from a7b93db:
#> [1] 23
#> 
#> [[70]]
#> + 2/34 vertices, from a7b93db:
#> [1] 23 33
#> 
#> [[71]]
#> + 3/34 vertices, from a7b93db:
#> [1] 23 33 34
#> 
#> [[72]]
#> + 2/34 vertices, from a7b93db:
#> [1] 23 34
#> 
#> [[73]]
#> + 1/34 vertex, from a7b93db:
#> [1] 21
#> 
#> [[74]]
#> + 2/34 vertices, from a7b93db:
#> [1] 21 33
#> 
#> [[75]]
#> + 3/34 vertices, from a7b93db:
#> [1] 21 33 34
#> 
#> [[76]]
#> + 2/34 vertices, from a7b93db:
#> [1] 21 34
#> 
#> [[77]]
#> + 1/34 vertex, from a7b93db:
#> [1] 19
#> 
#> [[78]]
#> + 2/34 vertices, from a7b93db:
#> [1] 19 33
#> 
#> [[79]]
#> + 3/34 vertices, from a7b93db:
#> [1] 19 33 34
#> 
#> [[80]]
#> + 2/34 vertices, from a7b93db:
#> [1] 19 34
#> 
#> [[81]]
#> + 1/34 vertex, from a7b93db:
#> [1] 17
#> 
#> [[82]]
#> + 2/34 vertices, from a7b93db:
#> [1]  6 17
#> 
#> [[83]]
#> + 3/34 vertices, from a7b93db:
#> [1]  6  7 17
#> 
#> [[84]]
#> + 2/34 vertices, from a7b93db:
#> [1]  7 17
#> 
#> [[85]]
#> + 1/34 vertex, from a7b93db:
#> [1] 16
#> 
#> [[86]]
#> + 2/34 vertices, from a7b93db:
#> [1] 16 33
#> 
#> [[87]]
#> + 3/34 vertices, from a7b93db:
#> [1] 16 33 34
#> 
#> [[88]]
#> + 2/34 vertices, from a7b93db:
#> [1] 16 34
#> 
#> [[89]]
#> + 1/34 vertex, from a7b93db:
#> [1] 15
#> 
#> [[90]]
#> + 2/34 vertices, from a7b93db:
#> [1] 15 33
#> 
#> [[91]]
#> + 3/34 vertices, from a7b93db:
#> [1] 15 33 34
#> 
#> [[92]]
#> + 2/34 vertices, from a7b93db:
#> [1] 15 34
#> 
#> [[93]]
#> + 1/34 vertex, from a7b93db:
#> [1] 14
#> 
#> [[94]]
#> + 2/34 vertices, from a7b93db:
#> [1] 14 34
#> 
#> [[95]]
#> + 1/34 vertex, from a7b93db:
#> [1] 4
#> 
#> [[96]]
#> + 2/34 vertices, from a7b93db:
#> [1]  4 14
#> 
#> [[97]]
#> + 2/34 vertices, from a7b93db:
#> [1]  4 13
#> 
#> [[98]]
#> + 2/34 vertices, from a7b93db:
#> [1] 4 8
#> 
#> [[99]]
#> + 1/34 vertex, from a7b93db:
#> [1] 3
#> 
#> [[100]]
#> + 2/34 vertices, from a7b93db:
#> [1] 3 4
#> 
#> [[101]]
#> + 3/34 vertices, from a7b93db:
#> [1]  3  4 14
#> 
#> [[102]]
#> + 3/34 vertices, from a7b93db:
#> [1] 3 4 8
#> 
#> [[103]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 14
#> 
#> [[104]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 10
#> 
#> [[105]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 29
#> 
#> [[106]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 28
#> 
#> [[107]]
#> + 2/34 vertices, from a7b93db:
#> [1] 3 9
#> 
#> [[108]]
#> + 3/34 vertices, from a7b93db:
#> [1]  3  9 33
#> 
#> [[109]]
#> + 2/34 vertices, from a7b93db:
#> [1] 3 8
#> 
#> [[110]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 33
#> 
#> [[111]]
#> + 1/34 vertex, from a7b93db:
#> [1] 2
#> 
#> [[112]]
#> + 2/34 vertices, from a7b93db:
#> [1] 2 3
#> 
#> [[113]]
#> + 3/34 vertices, from a7b93db:
#> [1] 2 3 4
#> 
#> [[114]]
#> + 4/34 vertices, from a7b93db:
#> [1]  2  3  4 14
#> 
#> [[115]]
#> + 4/34 vertices, from a7b93db:
#> [1] 2 3 4 8
#> 
#> [[116]]
#> + 3/34 vertices, from a7b93db:
#> [1]  2  3 14
#> 
#> [[117]]
#> + 3/34 vertices, from a7b93db:
#> [1] 2 3 8
#> 
#> [[118]]
#> + 2/34 vertices, from a7b93db:
#> [1] 2 4
#> 
#> [[119]]
#> + 3/34 vertices, from a7b93db:
#> [1]  2  4 14
#> 
#> [[120]]
#> + 3/34 vertices, from a7b93db:
#> [1] 2 4 8
#> 
#> [[121]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 14
#> 
#> [[122]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 31
#> 
#> [[123]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 18
#> 
#> [[124]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 20
#> 
#> [[125]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 22
#> 
#> [[126]]
#> + 2/34 vertices, from a7b93db:
#> [1] 2 8
#> 
#> [[127]]
#> + 1/34 vertex, from a7b93db:
#> [1] 1
#> 
#> [[128]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 2
#> 
#> [[129]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 2 3
#> 
#> [[130]]
#> + 4/34 vertices, from a7b93db:
#> [1] 1 2 3 4
#> 
#> [[131]]
#> + 5/34 vertices, from a7b93db:
#> [1]  1  2  3  4 14
#> 
#> [[132]]
#> + 5/34 vertices, from a7b93db:
#> [1] 1 2 3 4 8
#> 
#> [[133]]
#> + 4/34 vertices, from a7b93db:
#> [1]  1  2  3 14
#> 
#> [[134]]
#> + 4/34 vertices, from a7b93db:
#> [1] 1 2 3 8
#> 
#> [[135]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 2 4
#> 
#> [[136]]
#> + 4/34 vertices, from a7b93db:
#> [1]  1  2  4 14
#> 
#> [[137]]
#> + 4/34 vertices, from a7b93db:
#> [1] 1 2 4 8
#> 
#> [[138]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 14
#> 
#> [[139]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 18
#> 
#> [[140]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 20
#> 
#> [[141]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 22
#> 
#> [[142]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 2 8
#> 
#> [[143]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 3
#> 
#> [[144]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 3 4
#> 
#> [[145]]
#> + 4/34 vertices, from a7b93db:
#> [1]  1  3  4 14
#> 
#> [[146]]
#> + 4/34 vertices, from a7b93db:
#> [1] 1 3 4 8
#> 
#> [[147]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  3 14
#> 
#> [[148]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 3 9
#> 
#> [[149]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 3 8
#> 
#> [[150]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 4
#> 
#> [[151]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  4 14
#> 
#> [[152]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  4 13
#> 
#> [[153]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 4 8
#> 
#> [[154]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 14
#> 
#> [[155]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 5
#> 
#> [[156]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  5 11
#> 
#> [[157]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 5 7
#> 
#> [[158]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 12
#> 
#> [[159]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 6
#> 
#> [[160]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  6 11
#> 
#> [[161]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 6 7
#> 
#> [[162]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 11
#> 
#> [[163]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 7
#> 
#> [[164]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 13
#> 
#> [[165]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 18
#> 
#> [[166]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 20
#> 
#> [[167]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 22
#> 
#> [[168]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 32
#> 
#> [[169]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 9
#> 
#> [[170]]
#> + 2/34 vertices, from a7b93db:
#> [1] 1 8
#> 
weighted_cliques(g, maximal = TRUE)
#> [[1]]
#> + 3/34 vertices, from a7b93db:
#> [1] 32 33 34
#> 
#> [[2]]
#> + 2/34 vertices, from a7b93db:
#> [1] 20 34
#> 
#> [[3]]
#> + 4/34 vertices, from a7b93db:
#> [1]  9 31 33 34
#> 
#> [[4]]
#> + 3/34 vertices, from a7b93db:
#> [1] 29 32 34
#> 
#> [[5]]
#> + 2/34 vertices, from a7b93db:
#> [1] 10 34
#> 
#> [[6]]
#> + 3/34 vertices, from a7b93db:
#> [1] 27 30 34
#> 
#> [[7]]
#> + 3/34 vertices, from a7b93db:
#> [1] 25 26 32
#> 
#> [[8]]
#> + 2/34 vertices, from a7b93db:
#> [1] 25 28
#> 
#> [[9]]
#> + 2/34 vertices, from a7b93db:
#> [1] 24 26
#> 
#> [[10]]
#> + 4/34 vertices, from a7b93db:
#> [1] 24 30 33 34
#> 
#> [[11]]
#> + 3/34 vertices, from a7b93db:
#> [1] 24 28 34
#> 
#> [[12]]
#> + 3/34 vertices, from a7b93db:
#> [1] 23 33 34
#> 
#> [[13]]
#> + 3/34 vertices, from a7b93db:
#> [1] 21 33 34
#> 
#> [[14]]
#> + 3/34 vertices, from a7b93db:
#> [1] 19 33 34
#> 
#> [[15]]
#> + 3/34 vertices, from a7b93db:
#> [1]  6  7 17
#> 
#> [[16]]
#> + 3/34 vertices, from a7b93db:
#> [1] 16 33 34
#> 
#> [[17]]
#> + 3/34 vertices, from a7b93db:
#> [1] 15 33 34
#> 
#> [[18]]
#> + 2/34 vertices, from a7b93db:
#> [1] 14 34
#> 
#> [[19]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 10
#> 
#> [[20]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 29
#> 
#> [[21]]
#> + 2/34 vertices, from a7b93db:
#> [1]  3 28
#> 
#> [[22]]
#> + 3/34 vertices, from a7b93db:
#> [1]  3  9 33
#> 
#> [[23]]
#> + 2/34 vertices, from a7b93db:
#> [1]  2 31
#> 
#> [[24]]
#> + 5/34 vertices, from a7b93db:
#> [1]  1  2  3  4 14
#> 
#> [[25]]
#> + 5/34 vertices, from a7b93db:
#> [1] 1 2 3 4 8
#> 
#> [[26]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 18
#> 
#> [[27]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 20
#> 
#> [[28]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  2 22
#> 
#> [[29]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 3 9
#> 
#> [[30]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  4 13
#> 
#> [[31]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  5 11
#> 
#> [[32]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 5 7
#> 
#> [[33]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 12
#> 
#> [[34]]
#> + 3/34 vertices, from a7b93db:
#> [1]  1  6 11
#> 
#> [[35]]
#> + 3/34 vertices, from a7b93db:
#> [1] 1 6 7
#> 
#> [[36]]
#> + 2/34 vertices, from a7b93db:
#> [1]  1 32
#> 
largest_weighted_cliques(g)
#> [[1]]
#> + 5/34 vertices, from a7b93db:
#> [1]  1  2  3  4 14
#> 
weighted_clique_num(g)
#> [1] 15
```
