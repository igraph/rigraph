# Creating igraph graphs from data frames or vice-versa

This function creates an igraph graph from one or two data frames
containing the (symbolic) edge list and edge/vertex attributes.

## Usage

``` r
as_data_frame(x, what = c("edges", "vertices", "both"))

graph_from_data_frame(d, directed = TRUE, vertices = NULL)

from_data_frame(...)
```

## Arguments

- x:

  An igraph object.

- what:

  Character constant, whether to return info about vertices, edges, or
  both. The default is ‘edges’.

- d:

  A data frame containing a symbolic edge list in the first two columns.
  Additional columns are considered as edge attributes. Since version
  0.7 this argument is coerced to a data frame with `as.data.frame`.

- directed:

  Logical scalar, whether or not to create a directed graph.

- vertices:

  A data frame with vertex metadata, or `NULL`. See details below. Since
  version 0.7 this argument is coerced to a data frame with
  `as.data.frame`, if not `NULL`.

- ...:

  Passed to `graph_from_data_frame()`.

## Value

An igraph graph object for `graph_from_data_frame()`, and either a data
frame or a list of two data frames named `edges` and `vertices` for
`as.data.frame`.

## Details

`graph_from_data_frame()` creates igraph graphs from one or two data
frames. It has two modes of operation, depending whether the `vertices`
argument is `NULL` or not.

If `vertices` is `NULL`, then the first two columns of `d` are used as a
symbolic edge list and additional columns as edge attributes. The names
of the attributes are taken from the names of the columns.

If `vertices` is not `NULL`, then it must be a data frame giving vertex
metadata. The first column of `vertices` is assumed to contain symbolic
vertex names, this will be added to the graphs as the ‘`name`’ vertex
attribute. Other columns will be added as additional vertex attributes.
If `vertices` is not `NULL` then the symbolic edge list given in `d` is
checked to contain only vertex names listed in `vertices`.

Typically, the data frames are exported from some spreadsheet software
like Excel and are imported into R via
[`read.table()`](https://rdrr.io/r/utils/read.table.html),
[`read.delim()`](https://rdrr.io/r/utils/read.table.html) or
[`read.csv()`](https://rdrr.io/r/utils/read.table.html).

All edges in the data frame are included in the graph, which may include
multiple parallel edges and loops.

`as_data_frame()` converts the igraph graph into one or more data
frames, depending on the `what` argument.

If the `what` argument is `edges` (the default), then the edges of the
graph and also the edge attributes are returned. The edges will be in
the first two columns, named `from` and `to`. (This also denotes edge
direction for directed graphs.) For named graphs, the vertex names will
be included in these columns, for other graphs, the numeric vertex ids.
The edge attributes will be in the other columns. It is not a good idea
to have an edge attribute named `from` or `to`, because then the column
named in the data frame will not be unique. The edges are listed in the
order of their numeric ids.

If the `what` argument is `vertices`, then vertex attributes are
returned. Vertices are listed in the order of their numeric vertex ids.

If the `what` argument is `both`, then both vertex and edge data is
returned, in a list with named entries `vertices` and `edges`.

## Note

For `graph_from_data_frame()` `NA` elements in the first two columns ‘d’
are replaced by the string “NA” before creating the graph. This means
that all `NA`s will correspond to a single vertex.

`NA` elements in the first column of ‘vertices’ are also replaced by the
string “NA”, but the rest of ‘vertices’ is not touched. In other words,
vertex names (=the first column) cannot be `NA`, but other vertex
attributes can.

## Related documentation in the C library

[`get_edgelist`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`add_vertices`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_add_vertices),
[`empty`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
for another way to create graphs,
[`read.table()`](https://rdrr.io/r/utils/read.table.html) to read in
tables from files.

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

Other biadjacency:
[`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## A simple example with a couple of actors
## The typical case is that these tables are read in from files....
actors <- data.frame(
  name = c(
    "Alice", "Bob", "Cecil", "David",
    "Esmeralda"
  ),
  age = c(48, 33, 45, 34, 21),
  gender = c("F", "M", "F", "M", "F")
)
relations <- data.frame(
  from = c(
    "Bob", "Cecil", "Cecil", "David",
    "David", "Esmeralda"
  ),
  to = c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
  same.dept = c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
  friendship = c(4, 5, 5, 2, 1, 1), advice = c(4, 5, 5, 4, 2, 3)
)
g <- graph_from_data_frame(relations, directed = TRUE, vertices = actors)
print(g, e = TRUE, v = TRUE)
#> IGRAPH 1b91f01 DN-- 5 6 -- 
#> + attr: name (v/c), age (v/n), gender (v/c), same.dept (e/l),
#> | friendship (e/n), advice (e/n)
#> + edges from 1b91f01 (vertex names):
#> [1] Bob      ->Alice Cecil    ->Bob   Cecil    ->Alice David    ->Alice
#> [5] David    ->Bob   Esmeralda->Alice

## The opposite operation
as_data_frame(g, what = "vertices")
#>                name age gender
#> Alice         Alice  48      F
#> Bob             Bob  33      M
#> Cecil         Cecil  45      F
#> David         David  34      M
#> Esmeralda Esmeralda  21      F
as_data_frame(g, what = "edges")
#>        from    to same.dept friendship advice
#> 1       Bob Alice     FALSE          4      4
#> 2     Cecil   Bob     FALSE          5      5
#> 3     Cecil Alice      TRUE          5      5
#> 4     David Alice     FALSE          2      4
#> 5     David   Bob     FALSE          1      2
#> 6 Esmeralda Alice      TRUE          1      3
```
