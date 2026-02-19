# De Bruijn graphs

De Bruijn graphs are labeled graphs representing the overlap of strings.

## Usage

``` r
make_de_bruijn_graph(m, n)

de_bruijn_graph(m, n)
```

## Arguments

- m:

  Integer scalar, the size of the alphabet. See details below.

- n:

  Integer scalar, the length of the labels. See details below.

## Value

A graph object.

## Details

A de Bruijn graph represents relationships between strings. An alphabet
of `m` letters are used and strings of length `n` are considered. A
vertex corresponds to every possible string and there is a directed edge
from vertex `v` to vertex `w` if the string of `v` can be transformed
into the string of `w` by removing its first letter and appending a
letter to it.

Please note that the graph will have `m` to the power `n` vertices and
even more edges, so probably you don't want to supply too big numbers
for `m` and `n`.

De Bruijn graphs have some interesting properties, please see another
source, e.g. Wikipedia for details.

## Related documentation in the C library

[`de_bruijn`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_de_bruijn)

## See also

[`make_kautz_graph()`](https://r.igraph.org/reference/make_kautz_graph.md),
[`make_line_graph()`](https://r.igraph.org/reference/make_line_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# de Bruijn graphs can be created recursively by line graphs as well
g <- make_de_bruijn_graph(2, 1)
make_de_bruijn_graph(2, 2)
#> IGRAPH 39debaf D--- 4 8 -- De-Bruijn graph 2-2
#> + attr: name (g/c), m (g/n), n (g/n)
#> + edges from 39debaf:
#> [1] 1->1 1->2 2->3 2->4 3->1 3->2 4->3 4->4
make_line_graph(g)
#> IGRAPH 97ef683 D--- 4 8 -- Line graph
#> + attr: name (g/c)
#> + edges from 97ef683:
#> [1] 1->1 3->1 1->2 3->2 2->3 4->3 2->4 4->4
```
