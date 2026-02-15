# Is a degree sequence graphical?

Determine whether the given vertex degrees (in- and out-degrees for
directed graphs) can be realized by a graph.

## Usage

``` r
is_graphical(
  out.deg,
  in.deg = NULL,
  allowed.edge.types = c("simple", "loops", "multi", "all")
)
```

## Arguments

- out.deg:

  Integer vector, the degree sequence for undirected graphs, or the
  out-degree sequence for directed graphs.

- in.deg:

  `NULL` or an integer vector. For undirected graphs, it should be
  `NULL`. For directed graphs it specifies the in-degrees.

- allowed.edge.types:

  The allowed edge types in the graph. ‘simple’ means that neither loop
  nor multiple edges are allowed (i.e. the graph must be simple).
  ‘loops’ means that loop edges are allowed but mutiple edges are not.
  ‘multi’ means that multiple edges are allowed but loop edges are not.
  ‘all’ means that both loop edges and multiple edges are allowed.

## Value

A logical scalar.

## Details

The classical concept of graphicality assumes simple graphs. This
function can perform the check also when self-loops, multi-edges, or
both are allowed in the graph.

## Related documentation in the C library

[`is_graphical`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_graphical)

## References

Hakimi SL: On the realizability of a set of integers as degrees of the
vertices of a simple graph. *J SIAM Appl Math* 10:496-506, 1962.

PL Erdős, I Miklós and Z Toroczkai: A simple Havel-Hakimi type algorithm
to realize graphical degree sequences of directed graphs. *The
Electronic Journal of Combinatorics* 17(1):R66, 2010.

## See also

Other graphical degree sequences:
[`is_degseq()`](https://r.igraph.org/reference/is_degseq.md)

## Author

Tamás Nepusz <ntamas@gmail.com>

## Examples

``` r
g <- sample_gnp(100, 2 / 100)
is_degseq(degree(g))
#> [1] TRUE
is_graphical(degree(g))
#> [1] TRUE
```
