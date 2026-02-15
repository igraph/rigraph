# Greedy vertex coloring

`greedy_vertex_coloring()` finds a coloring for the vertices of a graph
based on a simple greedy algorithm.

## Usage

``` r
greedy_vertex_coloring(graph, heuristic = c("colored_neighbors", "dsatur"))
```

## Arguments

- graph:

  The graph object to color.

- heuristic:

  The selection heuristic for the next vertex to consider. Possible
  values are: “colored_neighbors” selects the vertex with the largest
  number of already colored neighbors. “dsatur” selects the vertex with
  the largest number of unique colors in its neighborhood, i.e. its
  "saturation degree"; when there are several maximum saturation degree
  vertices, the one with the most uncolored neighbors will be selected.

## Value

A numeric vector where item `i` contains the color index associated to
vertex `i`.

## Details

The goal of vertex coloring is to assign a "color" (represented as a
positive integer) to each vertex of the graph such that neighboring
vertices never have the same color. This function solves the problem by
considering the vertices one by one according to a heuristic, always
choosing the smallest color that differs from that of already colored
neighbors. The coloring obtained this way is not necessarily minimum but
it can be calculated in linear time.

## Related documentation in the C library

[`vertex_coloring_greedy`](https://igraph.org/c/html/0.10.17/igraph-Coloring.html#igraph_vertex_coloring_greedy),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## Examples

``` r
g <- make_graph("petersen")
col <- greedy_vertex_coloring(g)
plot(g, vertex.color = col)

```
