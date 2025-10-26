# Kautz graphs

Kautz graphs are labeled graphs representing the overlap of strings.

## Usage

``` r
make_kautz_graph(m, n)

kautz_graph(...)
```

## Arguments

- m:

  Integer scalar, the size of the alphabet. See details below.

- n:

  Integer scalar, the length of the labels. See details below.

- ...:

  Passed to `make_kautz_graph()`.

## Value

A graph object.

## Details

A Kautz graph is a labeled graph, vertices are labeled by strings of
length `n+1` above an alphabet with `m+1` letters, with the restriction
that every two consecutive letters in the string must be different.
There is a directed edge from a vertex `v` to another vertex `w` if it
is possible to transform the string of `v` into the string of `w` by
removing the first letter and appending a letter to it.

Kautz graphs have some interesting properties, see e.g. Wikipedia for
details.

## See also

[`make_de_bruijn_graph()`](https://r.igraph.org/reference/make_de_bruijn_graph.md),
[`make_line_graph()`](https://r.igraph.org/reference/make_line_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>, the first version in R was
written by Vincent Matossian.

## Examples

``` r
make_line_graph(make_kautz_graph(2, 1))
#> IGRAPH 95e50f4 D--- 12 24 -- Line graph
#> + attr: name (g/c)
#> + edges from 95e50f4:
#>  [1]  5-> 1  9-> 1  5-> 2  9-> 2  6-> 3 10-> 3  6-> 4 10-> 4  1-> 5 11-> 5
#> [11]  1-> 6 11-> 6  2-> 7 12-> 7  2-> 8 12-> 8  3-> 9  7-> 9  3->10  7->10
#> [21]  4->11  8->11  4->12  8->12
make_kautz_graph(2, 2)
#> IGRAPH 8c65265 D--- 12 24 -- Kautz graph 2-2
#> + attr: name (g/c), m (g/n), n (g/n)
#> + edges from 8c65265:
#>  [1]  1-> 5  1-> 6  2-> 7  2-> 8  3-> 9  3->10  4->11  4->12  5-> 1  5-> 2
#> [11]  6-> 3  6-> 4  7-> 9  7->10  8->11  8->12  9-> 1  9-> 2 10-> 3 10-> 4
#> [21] 11-> 5 11-> 6 12-> 7 12-> 8
```
