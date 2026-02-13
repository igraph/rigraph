# Reading foreign file formats

The `read_graph()` function is able to read graphs in various
representations from a file, or from a http connection. Various formats
are supported.

## Usage

``` r
read_graph(
  file,
  format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml",
    "dl"),
  ...
)
```

## Arguments

- file:

  The connection to read from. This can be a local file, or a `http` or
  `ftp` connection. It can also be a character string with the file name
  or URI.

- format:

  Character constant giving the file format. Right now `edgelist`,
  `pajek`, `ncol`, `lgl`, `graphml`, `dimacs`, `graphdb`, `gml` and `dl`
  are supported, the default is `edgelist`. As of igraph 0.4 this
  argument is case insensitive.

- ...:

  Additional arguments, see below.

## Value

A graph object.

## Details

The `read_graph()` function may have additional arguments depending on
the file format (the `format` argument). See the details separately for
each file format, below.

## Edge list format

This format is a simple text file with numeric vertex IDs defining the
edges. There is no need to have newline characters between the edges, a
simple space will also do. Vertex IDs contained in the file are assumed
to start at zero.

Additional arguments:

- n:

  The number of vertices in the graph. If it is smaller than or equal to
  the largest integer in the file, then it is ignored; so it is safe to
  set it to zero (the default).

- directed:

  Logical scalar, whether to create a directed graph. The default value
  is `TRUE`.

## Pajek format

Currently igraph only supports Pajek network files, with a `.net`
extension, but not Pajek project files with a `.paj` extension. Only
network data is supported; permutations, hierarchies, clusters and
vectors are not.

## NCOL format

Additional arguments:

- predef:

  Names of the vertices in the file. If `character(0)` (the default) is
  given here then vertex IDs will be assigned to vertex names in the
  order of their appearance in the .ncol file. If it is not
  `character(0)` and some unknown vertex names are found in the .ncol
  file then new vertex ids will be assigned to them.

- names:

  Logical value, if `TRUE` (the default) the symbolic names of the
  vertices will be added to the graph as a vertex attribute called
  “name”.

- weights:

  Whether to add the weights of the edges to the graph as an edge
  attribute called “weight”. `"yes"` adds the weights (even if they are
  not present in the file, in this case they are assumed to be zero).
  `"no"` does not add any edge attribute. `"auto"` (the default) adds
  the attribute if and only if there is at least one explicit edge
  weight in the input file.

- directed:

  Whether to create a directed graph (default: `FALSE`). As this format
  was originally used only for undirected graphs there is no information
  in the file about the directedness of the graph.

## GraphML format

GraphML is an XML-based file format for representing various types of
graphs. Currently only the most basic import functionality is
implemented in igraph: it can read GraphML files without nested graphs
and hyperedges.

- index:

  Integer, specifies which graph to read from a GraphML file containing
  multiple graphs. Defaults to 0 for the first graph.

## LGL format

The .lgl format is used by the Large Graph Layout visualization software
(<https://lgl.sourceforge.net>), it can describe undirected optionally
weighted graphs

- names:

  Logical, whether to add vertex names as a vertex attribute called
  "name". Default is TRUE.

- weights:

  Whether to add the weights of the edges to the graph as an edge
  attribute called “weight”. `"yes"` adds the weights (even if they are
  not present in the file, in this case they are assumed to be zero).
  `"no"` does not add any edge attribute. `"auto"` (the default) adds
  the attribute if and only if there is at least one explicit edge
  weight in the input file.

- directed:

  Logical, whether to create a directed graph. Default is FALSE.

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

- directed:

  Logical, whether to create a directed graph. Default is TRUE.

## DL format

This is a simple textual file format used by UCINET. See
<http://www.analytictech.com/networks/dataentry.htm> for examples. All
the forms described here are supported by igraph. Vertex names and edge
weights are also supported and they are added as attributes. (If an
attribute handler is attached.) Note the specification does not mention
whether the format is case sensitive or not. For igraph DL files are
case sensitive, i.e. Larry and larry are not the same.

- directed:

  Logical, whether to create a directed graph. Default is TRUE.

## GML format

GML is a quite general textual format. For the specifics of the
implementation, see the linked documentation of the cClibrary.

## GraphDB format

This is a binary format, used in the ARG Graph Database for isomorphism
testing. For more information, see
<https://mivia.unisa.it/datasets/graph-database/arg-database/>

- directed:

  Logical, whether to create a directed graph. Default is TRUE.

## Related documentation in the C library

[`read_graph_pajek()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_pajek),
[`read_graph_graphml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphml),
[`read_graph_gml()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_gml),
[`read_graph_dl()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_dl),
[`read_graph_graphdb()`](https://igraph.org/c/html/0.10.17/igraph-Foreign.html#igraph_read_graph_graphdb),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`write_graph()`](https://r.igraph.org/reference/write_graph.md)

Foreign format readers
[`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md),
[`write_graph()`](https://r.igraph.org/reference/write_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
