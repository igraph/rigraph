# Check if a degree sequence is valid for a multi-graph

`is_degseq()` checks whether the given vertex degrees (in- and
out-degrees for directed graphs) can be realized by a graph. Note that
the graph does not have to be simple, it may contain loop and multiple
edges. For undirected graphs, it also checks whether the sum of degrees
is even. For directed graphs, the function checks whether the lengths of
the two degree vectors are equal and whether their sums are also equal.
These are known sufficient and necessary conditions for a degree
sequence to be valid.

## Usage

``` r
is_degseq(out.deg, in.deg = NULL)
```

## Arguments

- out.deg:

  Integer vector, the degree sequence for undirected graphs, or the
  out-degree sequence for directed graphs.

- in.deg:

  `NULL` or an integer vector. For undirected graphs, it should be
  `NULL`. For directed graphs it specifies the in-degrees.

## Value

A logical scalar.

## Related documentation in the C library

[[`is_graphical()`](https://r.igraph.org/reference/is_graphical.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_graphical)

## References

Z Király, Recognizing graphic degree sequences and generating all
realizations. TR-2011-11, Egerváry Research Group, H-1117, Budapest,
Hungary. ISSN 1587-4451 (2012).

B. Cloteaux, Is This for Real? Fast Graphicality Testing, *Comput. Sci.
Eng.* 17, 91 (2015).

A. Berger, A note on the characterization of digraphic sequences,
*Discrete Math.* 314, 38 (2014).

G. Cairns and S. Mendan, Degree Sequence for Graphs with Loops (2013).

## See also

Other graphical degree sequences:
[`is_graphical()`](https://r.igraph.org/reference/is_graphical.md)

## Author

Tamás Nepusz <ntamas@gmail.com> and Szabolcs Horvát <szhorvat@gmail.com>

## Examples

``` r
g <- sample_gnp(100, 2 / 100)
is_degseq(degree(g))
#> [1] TRUE
is_graphical(degree(g))
#> [1] TRUE
```
