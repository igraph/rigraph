# Print graphs to the terminal

These functions attempt to print a graph to the terminal in a human
readable form.

## Usage

``` r
# S3 method for class 'igraph'
print(
  x,
  full = igraph_opt("print.full"),
  graph.attributes = igraph_opt("print.graph.attributes"),
  vertex.attributes = igraph_opt("print.vertex.attributes"),
  edge.attributes = igraph_opt("print.edge.attributes"),
  names = TRUE,
  max.lines = igraph_opt("auto.print.lines"),
  id = igraph_opt("print.id"),
  ...
)

# S3 method for class 'igraph'
summary(object, ...)
```

## Arguments

- x:

  The graph to print.

- full:

  Logical scalar, whether to print the graph structure itself as well.

- graph.attributes:

  Logical constant, whether to print graph attributes.

- vertex.attributes:

  Logical constant, whether to print vertex attributes.

- edge.attributes:

  Logical constant, whether to print edge attributes.

- names:

  Logical constant, whether to print symbolic vertex names (i.e. the
  `name` vertex attribute) or vertex ids.

- max.lines:

  The maximum number of lines to use. The rest of the output will be
  truncated.

- id:

  Whether to print the graph ID.

- ...:

  Additional agruments.

- object:

  The graph of which the summary will be printed.

## Value

All these functions return the graph invisibly.

## Details

`summary.igraph` prints the number of vertices, edges and whether the
graph is directed.

`print_all()` prints the same information, and also lists the edges, and
optionally graph, vertex and/or edge attributes.

`print.igraph()` behaves either as `summary.igraph` or `print_all()`
depending on the `full` argument. See also the ‘print.full’ igraph
option and
[`igraph_opt()`](https://r.igraph.org/reference/igraph_options.md).

The graph summary printed by `summary.igraph` (and `print.igraph()` and
`print_all()`) consists of one or more lines. The first line contains
the basic properties of the graph, and the rest contains its attributes.
Here is an example, a small star graph with weighted directed edges and
named vertices:

        IGRAPH badcafe DNW- 10 9 -- In-star
        + attr: name (g/c), mode (g/c), center (g/n), name (v/c),
          weight (e/n) 

The first line always starts with `IGRAPH`, showing you that the object
is an igraph graph. Then a seven character code is printed, this the
first seven characters of the unique id of the graph. See
[`graph_id()`](https://r.igraph.org/reference/graph_id.md) for more.
Then a four letter long code string is printed. The first letter
distinguishes between directed (‘`D`’) and undirected (‘`U`’) graphs.
The second letter is ‘`N`’ for named graphs, i.e. graphs with the `name`
vertex attribute set. The third letter is ‘`W`’ for weighted graphs,
i.e. graphs with the `weight` edge attribute set. The fourth letter is
‘`B`’ for bipartite graphs, i.e. for graphs with the `type` vertex
attribute set.

This is followed by the number of vertices and edges, then two dashes.

Finally, after two dashes, the name of the graph is printed, if it has
one, i.e. if the `name` graph attribute is set.

From the second line, the attributes of the graph are listed, separated
by a comma. After the attribute names, the kind of the attribute – graph
(‘`g`’), vertex (‘`v`’) or edge (‘`e`’) – is denoted, and the type of
the attribute as well, character (‘`c`’), numeric (‘`n`’), logical
(‘`l`’), or other (‘`x`’).

As of igraph 0.4 `print_all()` and `print.igraph()` use the `max.print`
option, see [`base::options()`](https://rdrr.io/r/base/options.html) for
details.

As of igraph 1.1.1, the `str.igraph` function is defunct, use
`print_all()`.

## Related documentation in the C library

[[`degree()`](https://r.igraph.org/reference/degree.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_degree),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
g
#> IGRAPH 4e1302a U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 4e1302a:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
summary(g)
#> IGRAPH 4e1302a U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
```
