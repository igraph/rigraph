# Create a lattice graph

`make_lattice()` is a flexible function, it can create lattices of
arbitrary dimensions, periodic or aperiodic ones. It has two forms. In
the first form you only supply `dimvector`, but not `length` and `dim`.
In the second form you omit `dimvector` and supply `length` and `dim`.

## Usage

``` r
make_lattice(
  dimvector = NULL,
  length = NULL,
  dim = NULL,
  nei = 1,
  directed = FALSE,
  mutual = FALSE,
  periodic = FALSE,
  circular = deprecated()
)

lattice(
  dimvector = NULL,
  length = NULL,
  dim = NULL,
  nei = 1,
  directed = FALSE,
  mutual = FALSE,
  periodic = FALSE,
  circular = deprecated()
)
```

## Arguments

- dimvector:

  A vector giving the size of the lattice in each dimension.

- length:

  Integer constant, for regular lattices, the size of the lattice in
  each dimension.

- dim:

  Integer constant, the dimension of the lattice.

- nei:

  The distance within which (inclusive) the neighbors on the lattice
  will be connected. This parameter is not used right now.

- directed:

  Whether to create a directed lattice.

- mutual:

  Logical, if `TRUE` directed lattices will be mutually connected.

- periodic:

  Logical vector, Boolean vector, defines whether the generated lattice
  is periodic along each dimension. This parameter may also be scalar
  boolen value which will be extended to boolean vector with dimvector
  length.

- circular:

  Deprecated, use `periodic` instead.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Related documentation in the C library

[`square_lattice()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_square_lattice).

## Examples

``` r
make_lattice(c(5, 5, 5))
#> IGRAPH 963eade U--- 125 300 -- Lattice graph
#> + attr: name (g/c), dimvector (g/n), nei (g/n), mutual (g/l), circular
#> | (g/l)
#> + edges from 963eade:
#>  [1]  1-- 2  1-- 6  1--26  2-- 3  2-- 7  2--27  3-- 4  3-- 8  3--28  4-- 5
#> [11]  4-- 9  4--29  5--10  5--30  6-- 7  6--11  6--31  7-- 8  7--12  7--32
#> [21]  8-- 9  8--13  8--33  9--10  9--14  9--34 10--15 10--35 11--12 11--16
#> [31] 11--36 12--13 12--17 12--37 13--14 13--18 13--38 14--15 14--19 14--39
#> [41] 15--20 15--40 16--17 16--21 16--41 17--18 17--22 17--42 18--19 18--23
#> [51] 18--43 19--20 19--24 19--44 20--25 20--45 21--22 21--46 22--23 22--47
#> [61] 23--24 23--48 24--25 24--49 25--50 26--27 26--31 26--51 27--28 27--32
#> + ... omitted several edges
make_lattice(length = 5, dim = 3)
#> IGRAPH 8f65aff U--- 125 300 -- Lattice graph
#> + attr: name (g/c), dimvector (g/n), nei (g/n), mutual (g/l), circular
#> | (g/l)
#> + edges from 8f65aff:
#>  [1]  1-- 2  1-- 6  1--26  2-- 3  2-- 7  2--27  3-- 4  3-- 8  3--28  4-- 5
#> [11]  4-- 9  4--29  5--10  5--30  6-- 7  6--11  6--31  7-- 8  7--12  7--32
#> [21]  8-- 9  8--13  8--33  9--10  9--14  9--34 10--15 10--35 11--12 11--16
#> [31] 11--36 12--13 12--17 12--37 13--14 13--18 13--38 14--15 14--19 14--39
#> [41] 15--20 15--40 16--17 16--21 16--41 17--18 17--22 17--42 18--19 18--23
#> [51] 18--43 19--20 19--24 19--44 20--25 20--45 21--22 21--46 22--23 22--47
#> [61] 23--24 23--48 24--25 24--49 25--50 26--27 26--31 26--51 27--28 27--32
#> + ... omitted several edges
```
