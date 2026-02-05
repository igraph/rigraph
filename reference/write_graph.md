# Writing the graph to a file in some format

`write_graph()` is a general function for exporting graphs to foreign
file formats. The recommended formats for data exchange are GraphML and
GML.

## Usage

``` r
write_graph(
  graph,
  file,
  format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "gml", "dot",
    "leda"),
  ...
)
```

## Arguments

- graph:

  The graph to export.

- file:

  A connection or a string giving the file name to write the graph to.

- format:

  Character string giving the file format. Right now `pajek`, `graphml`,
  `dot`, `gml`, `edgelist`, `lgl`, `ncol`, `leda` and `dimacs` are
  implemented. As of igraph 0.4 this argument is case insensitive.

- ...:

  Other, format specific arguments, see below.

## Value

A \`NULL“, invisibly.

## Edge list format

The `edgelist` format is a simple text file, with one edge per line, the
two zero-based numerical vertex IDs separated by a space character. Note
that vertices are indexed starting with zero. The file is sorted by the
first and the second column. This format has no additional arguments.

## NCOL format

This format is a plain text edge list in which vertices are referred to
by name rather than numerical ID. Edge weights may be optionally
written. Additional parameters:

- names:

  The name of a vertex attribute to take vertex names from or `NULL` to
  use zero-based numerical IDs.

- weights:

  The name of an edge attribute to take edge weights from or `NULL` to
  omit edge weights.

## Pajek format

The `pajek` format is provided for interoperability with the Pajek
software only. Since the format does not have a formal specification, it
is not recommended for general data exchange or archival.

## LGL format

The .lgl format is used by the Large Graph Layout visualization software
(<https://lgl.sourceforge.net>), it can describe undirected optionally
weighted graphs.

- names:

  The name of a vertex attribute to use for vertex names, or NULL to use
  numeric IDs.

- weights:

  The name of an edge attribute to use for edge weights, or NULL to omit
  weights.

- isolates:

  Logical, whether to include isolated vertices in the file. Default is
  FALSE.

## DIMACS format

This is a line-oriented text file (ASCII) format. The first character of
each line defines the type of the line. If the first character is c the
line is a comment line and it is ignored. There is one problem line (p
in the file), it must appear before any node and arc descriptor lines.
The problem line has three fields separated by spaces: the problem type
(max or edge), the number of vertices, and number of edges in the graph.
In MAX problems, exactly two node identification lines are expected (n),
one for the source, and one for the target vertex. These have two
fields: the ID of the vertex and the type of the vertex, either s ( =
source) or t ( = target). Arc lines start with a and have three fields:
the source vertex, the target vertex and the edge capacity. In EDGE
problems, there may be a node line (n) for each node. It specifies the
node index and an integer node label. Nodes for which no explicit label
was specified will use their index as label. In EDGE problems, each edge
is specified as an edge line (e).

- source:

  Numeric ID of the source vertex.

- target:

  Numeric ID of the target vertex.

- capacity:

  The name of an edge attribute to use for edge capacities, or NULL to
  use the "capacity" attribute if it exists.

## GML format

GML is a quite general textual format.

- id:

  Optional numeric vertex IDs to use.

- creator:

  Optional string specifying the creator of the file.

## GraphML format

GraphML is an XML-based file format for representing various types of
graphs. When a numerical attribute value is NaN, it will be omitted from
the file. This function assumes that non-ASCII characters in attribute
names and string attribute values are UTF-8 encoded. If this is not the
case, the resulting XML file will be invalid. Control characters, i.e.
character codes up to and including 31 (with the exception of tab, cr
and lf), are not allowed.

- prefixAttr:

  Logical, whether to prefix attribute names to ensure uniqueness across
  vertex/edge/graph attributes. Default is TRUE.

## LEDA format

This function writes a graph to an output stream in LEDA format. See
<https://www.algorithmic-solutions.info/leda_guide/graphs/leda_native_graph_fileformat.html>.
The support for the LEDA format is very basic at the moment; igraph
writes only the LEDA graph section which supports one selected vertex
and edge attribute and no layout information or visual attributes.

- vertex.attr:

  Name of vertex attribute to include in the file.

- edge.attr:

  Name of edge attribute to include in the file.

## DOT format

DOT is the format used by the widely known GraphViz software, see
<https://www.graphviz.org> for details. The grammar of the DOT format
can be found here: <https://www.graphviz.org/doc/info/lang.html>. This
is only a preliminary implementation, no visualization information is
written. This format is meant solely for interoperability with Graphviz.
It is not recommended for data exchange or archival.

## Related documentation in the C library

[`write_graph_edgelist()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_edgelist),
[`write_graph_pajek()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_pajek),
[`write_graph_graphml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_graphml),
[`write_graph_gml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_gml),
[`write_graph_dot()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_dot),
[`write_graph_leda()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_write_graph_leda),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Adai AT, Date SV, Wieland S, Marcotte EM. LGL: creating a map of protein
function with an algorithm for visualizing very large biological
networks. *J Mol Biol.* 2004 Jun 25;340(1):179-90.

## See also

[`read_graph()`](https://r.igraph.org/reference/read_graph.md)

Foreign format readers
[`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md),
[`read_graph()`](https://r.igraph.org/reference/read_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
file <- tempfile(fileext = ".txt")
write_graph(g, file, "edgelist")
if (!interactive()) {
  unlink(file)
}
```
