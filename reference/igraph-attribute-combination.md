# How igraph functions handle attributes when the graph changes

Many times, when the structure of a graph is modified, vertices/edges
map of the original graph map to vertices/edges in the newly created
(modified) graph. For example
[`simplify()`](https://r.igraph.org/reference/simplify.md) maps multiple
edges to single edges. igraph provides a flexible mechanism to specify
what to do with the vertex/edge attributes in these cases.

## Details

The functions that support the combination of attributes have one or two
extra arguments called `vertex.attr.comb` and/or `edge.attr.comb` that
specify how to perform the mapping of the attributes. E.g.
[`contract()`](https://r.igraph.org/reference/contract.md) contracts
many vertices into a single one, the attributes of the vertices can be
combined and stores as the vertex attributes of the new graph.

The specification of the combination of (vertex or edge) attributes can
be given as

1.  a character scalar,

2.  a function object or

3.  a list of character scalars and/or function objects.

If it is a character scalar, then it refers to one of the predefined
combinations, see their list below.

If it is a function, then the given function is expected to perform the
combination. It will be called once for each new vertex/edge in the
graph, with a single argument: the attribute values of the vertices that
map to that single vertex.

The third option, a list can be used to specify different combination
methods for different attributes. A named entry of the list corresponds
to the attribute with the same name. An unnamed entry (i.e. if the name
is the empty string) of the list specifies the default combination
method. I.e.

    list(weight="sum", "ignore")

specifies that the weight of the new edge should be sum of the weights
of the corresponding edges in the old graph; and that the rest of the
attributes should be ignored (=dropped).

## Predefined combination functions

The following combination behaviors are predefined:

- "ignore":

  The attribute is ignored and dropped.

- "sum":

  The sum of the attributes is calculated. This does not work for
  character attributes and works for complex attributes only if they
  have a `sum` generic defined. (E.g. it works for sparse matrices from
  the `Matrix` package, because they have a `sum` method.)

- "prod":

  The product of the attributes is calculated. This does not work for
  character attributes and works for complex attributes only if they
  have a `prod` function defined.

- "min":

  The minimum of the attributes is calculated and returned. For
  character and complex attributes the standard R `min` function is
  used.

- "max":

  The maximum of the attributes is calculated and returned. For
  character and complex attributes the standard R `max` function is
  used.

- "random":

  Chooses one of the supplied attribute values, uniformly randomly. For
  character and complex attributes this is implemented by calling
  `sample`.

- "first":

  Always chooses the first attribute value. It is implemented by calling
  the [`head()`](https://rdrr.io/r/utils/head.html) function.

- "last":

  Always chooses the last attribute value. It is implemented by calling
  the [`tail()`](https://rdrr.io/r/utils/head.html) function.

- "mean":

  The mean of the attributes is calculated and returned. For character
  and complex attributes this simply calls the
  [`mean()`](https://rdrr.io/r/base/mean.html) function.

- "median":

  The median of the attributes is selected. Calls the R
  [`median()`](https://rdrr.io/r/stats/median.html) function for all
  attribute types.

- "concat":

  Concatenate the attributes, using the
  [`c()`](https://rdrr.io/r/base/c.html) function. This results almost
  always a complex attribute.

- "rename":

  Keep clashing attributes side-by-side under disambiguated names by
  appending `_1`, `_2`, ... suffixes. For example, if two graphs each
  have an attribute called `group`, the resulting graph will have
  attributes `group_1` and `group_2`, corresponding to the first and
  second input graph, respectively. This is the default for the graph
  operators [`union()`](https://r.igraph.org/reference/union.md),
  [`intersection()`](https://r.igraph.org/reference/intersection.md),
  [`compose()`](https://r.igraph.org/reference/compose.md) and
  [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)
  and preserves their historical behaviour. Only those operators accept
  `"rename"`; [`simplify()`](https://r.igraph.org/reference/simplify.md)
  and [`contract()`](https://r.igraph.org/reference/contract.md) will
  reject it because the rename strategy has no per-element
  interpretation when many input values collapse into one.

## See also

[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md) on how to
use graph/vertex/edge attributes in general.
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
on igraph parameters.

Vertex, edge and graph attributes:
[`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md),
[`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md),
[`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md),
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md),
[`edge_attr<-()`](https://r.igraph.org/reference/edge_attr-set.md),
[`edge_attr_names()`](https://r.igraph.org/reference/edge_attr_names.md),
[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md),
[`graph_attr<-()`](https://r.igraph.org/reference/graph_attr-set.md),
[`graph_attr_names()`](https://r.igraph.org/reference/graph_attr_names.md),
[`igraph-dollar`](https://r.igraph.org/reference/igraph-dollar.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md),
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
[`vertex_attr<-()`](https://r.igraph.org/reference/vertex_attr-set.md),
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r

g <- make_graph(c(1, 2, 1, 2, 1, 2, 2, 3, 3, 4))
E(g)$weight <- 1:5

## print attribute values with the graph
igraph_options(print.graph.attributes = TRUE)
igraph_options(print.vertex.attributes = TRUE)
igraph_options(print.edge.attributes = TRUE)

## new attribute is the sum of the old ones
simplify(g, edge.attr.comb = "sum")
#> ── <igraph> ───────────────────────────────────────────────────────── 1e49ba6 ──
#> ℹ directed · weighted
#> ℹ 4 vertices · 3 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → edge:   weight <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  2 → 3  3 → 4 

## collect attributes into a string
simplify(g, edge.attr.comb = toString)
#> ── <igraph> ───────────────────────────────────────────────────────── 27cfec4 ──
#> ℹ directed · weighted
#> ℹ 4 vertices · 3 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → edge:   weight <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  2 → 3  3 → 4 

## concatenate them into a vector, this creates a complex
## attribute
simplify(g, edge.attr.comb = "concat")
#> ── <igraph> ───────────────────────────────────────────────────────── c67db7d ──
#> ℹ directed · weighted
#> ℹ 4 vertices · 3 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → edge:   weight <list>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  2 → 3  3 → 4 

E(g)$name <- letters[seq_len(ecount(g))]

## both attributes are collected into strings
simplify(g, edge.attr.comb = toString)
#> ── <igraph> ───────────────────────────────────────────────────────── cedba83 ──
#> ℹ directed · weighted
#> ℹ 4 vertices · 3 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → edge:   weight <chr>, name <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  2 → 3  3 → 4 

## harmonic average of weights, names are dropped
simplify(g, edge.attr.comb = list(
  weight = function(x) length(x) / sum(1 / x),
  name = "ignore"
))
#> ── <igraph> ───────────────────────────────────────────────────────── 125fb60 ──
#> ℹ directed · weighted
#> ℹ 4 vertices · 3 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → edge:   weight <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  2 → 3  3 → 4 
```
