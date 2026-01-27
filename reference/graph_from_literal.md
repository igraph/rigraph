# Creating (small) graphs via a simple interface

This function is useful if you want to create a small (named) graph
quickly, it works for both directed and undirected graphs.

## Usage

``` r
graph_from_literal(..., simplify = TRUE)

from_literal(...)
```

## Arguments

- ...:

  For `graph_from_literal()` the formulae giving the structure of the
  graph, see details below. For `from_literal()` all arguments are
  passed to `graph_from_literal()`.

- simplify:

  Logical scalar, whether to call
  [`simplify()`](https://r.igraph.org/reference/simplify.md) on the
  created graph. By default the graph is simplified, loop and multiple
  edges are removed.

## Value

An igraph graph

## Details

`graph_from_literal()` is very handy for creating small graphs quickly.
You need to supply one or more R expressions giving the structure of the
graph. The expressions consist of vertex names and edge operators. An
edge operator is a sequence of ‘`-`’ and ‘`+`’ characters, the former is
for the edges and the latter is used for arrow heads. The edges can be
arbitrarily long, i.e. you may use as many ‘`-`’ characters to “draw”
them as you like.

If all edge operators consist of only ‘`-`’ characters then the graph
will be undirected, whereas a single ‘`+`’ character implies a directed
graph.

Let us see some simple examples. Without arguments the function creates
an empty graph:

      graph_from_literal()

A simple undirected graph with two vertices called ‘A’ and ‘B’ and one
edge only:

      graph_from_literal(A-B)

Remember that the length of the edges does not matter, so we could have
written the following, this creates the same graph:

      graph_from_literal( A-----B )

If you have many disconnected components in the graph, separate them
with commas. You can also give isolate vertices.

      graph_from_literal( A--B, C--D, E--F, G--H, I, J, K )

The ‘`:`’ operator can be used to define vertex sets. If an edge
operator connects two vertex sets then every vertex from the first set
will be connected to every vertex in the second set. The following form
creates a full graph, including loop edges:

      graph_from_literal( A:B:C:D -- A:B:C:D )

In directed graphs, edges will be created only if the edge operator
includes a arrow head (‘+’) *at the end* of the edge:

      graph_from_literal( A -+ B -+ C )
      graph_from_literal( A +- B -+ C )
      graph_from_literal( A +- B -- C )

Thus in the third example no edge is created between vertices `B` and
`C`.

Mutual edges can be also created with a simple edge operator:

      graph_from_literal( A +-+ B +---+ C ++ D + E)

Note again that the length of the edge operators is arbitrary, ‘`+`’,
‘`++`’ and ‘`+-----+`’ have exactly the same meaning.

If the vertex names include spaces or other special characters then you
need to quote them:

      graph_from_literal( "this is" +- "a silly" -+ "graph here" )

You can include any character in the vertex names this way, even ‘+’ and
‘-’ characters.

See more examples below.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md)

## Examples

``` r
# A simple undirected graph
g <- graph_from_literal(
  Alice - Bob - Cecil - Alice,
  Daniel - Cecil - Eugene,
  Cecil - Gordon
)
g
#> IGRAPH 6398330 UN-- 6 6 -- 
#> + attr: name (v/c)
#> + edges from 6398330 (vertex names):
#> [1] Alice--Bob    Alice--Cecil  Bob  --Cecil  Cecil--Daniel Cecil--Eugene
#> [6] Cecil--Gordon

# Another undirected graph, ":" notation
g2 <- graph_from_literal(Alice - Bob:Cecil:Daniel, Cecil:Daniel - Eugene:Gordon)
g2
#> IGRAPH b71f93f UN-- 6 7 -- 
#> + attr: name (v/c)
#> + edges from b71f93f (vertex names):
#> [1] Alice --Bob    Alice --Cecil  Alice --Daniel Cecil --Eugene Cecil --Gordon
#> [6] Daniel--Eugene Daniel--Gordon

# A directed graph
g3 <- graph_from_literal(
  Alice +-+ Bob --+ Cecil +-- Daniel,
  Eugene --+ Gordon:Helen
)
g3
#> IGRAPH 4c0259d DN-- 7 6 -- 
#> + attr: name (v/c)
#> + edges from 4c0259d (vertex names):
#> [1] Alice ->Bob    Bob   ->Alice  Bob   ->Cecil  Daniel->Cecil  Eugene->Gordon
#> [6] Eugene->Helen 

# A graph with isolate vertices
g4 <- graph_from_literal(Alice -- Bob -- Daniel, Cecil:Gordon, Helen)
g4
#> IGRAPH 19f1827 UN-- 6 2 -- 
#> + attr: name (v/c)
#> + edges from 19f1827 (vertex names):
#> [1] Alice--Bob    Bob  --Daniel
V(g4)$name
#> [1] "Alice"  "Bob"    "Daniel" "Cecil"  "Gordon" "Helen" 

# "Arrows" can be arbitrarily long
g5 <- graph_from_literal(Alice +---------+ Bob)
g5
#> IGRAPH cf5afce DN-- 2 2 -- 
#> + attr: name (v/c)
#> + edges from cf5afce (vertex names):
#> [1] Alice->Bob   Bob  ->Alice

# Special vertex names
g6 <- graph_from_literal("+" -- "-", "*" -- "/", "%%" -- "%/%")
g6
#> IGRAPH 08f3ef7 UN-- 6 3 -- 
#> + attr: name (v/c)
#> + edges from 08f3ef7 (vertex names):
#> [1] + ---   * --/   %%--%/%
```
