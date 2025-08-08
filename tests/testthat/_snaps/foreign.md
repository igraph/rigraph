# reading graph in NCOL format

    Code
      read_graph(ncol_path, "ncol")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# reading graph in LGL format

    Code
      read_graph(lgl_path, "lgl")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# reading graph, unused argument

    Code
      read_graph(lgl_path, "lgl", useless = 1)
    Condition
      Error in `read.graph.lgl()`:
      ! unused argument (useless = 1)

# reading graph in unsupported format

    Code
      read_graph("bla", format = "blop")
    Condition
      Error in `read_graph()`:
      ! `format` must be one of "edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml", or "dl", not "blop".

# writing graph in unsupported format

    Code
      write_graph(g, file, format = "blop")
    Condition
      Error in `write_graph()`:
      ! `format` must be one of "edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "gml", "dot", or "leda", not "blop".

# graph_from_graphdb works

    Code
      g <- graph_from_graphdb(nodes = 1000)

---

    Code
      g <- graph_from_graphdb()
    Condition
      Error in `graph_from_graphdb()`:
      ! Either `nodes`' or ``url`' must be non-null.

---

    Code
      g <- graph_from_graphdb(nodes = 10, prefix = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid prefix.
      i Must be one of iso, si6, mcs10, mcs30, mcs50, mcs70, and mcs90.

---

    Code
      g <- graph_from_graphdb(nodes = 10, type = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid graph type.
      i Must be one of r001, r005, r01, r02, m2D, m2Dr2, m2Dr4, m2Dr6, m3D, m3Dr2, m3Dr4, m3Dr6, m4D, m4Dr2, m4Dr4, m4Dr6, b03, b03m, ..., b09, and b09m.

# read/write from/to string works

    Code
      write_graph(g, file = "", format = "graphml")
    Output
      <?xml version="1.0" encoding="UTF-8"?>
      <graphml xmlns="http://graphml.graphdrawing.org/xmlns"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://graphml.graphdrawing.org/xmlns
               http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd">
      <!-- Created by igraph -->
        <key id="g_name" for="graph" attr.name="name" attr.type="string"/>
        <key id="g_mutual" for="graph" attr.name="mutual" attr.type="boolean"/>
        <key id="g_circular" for="graph" attr.name="circular" attr.type="boolean"/>
        <graph id="G" edgedefault="undirected">
          <data key="g_name">Ring graph</data>
          <data key="g_mutual">false</data>
          <data key="g_circular">true</data>
          <node id="n0">
          </node>
          <node id="n1">
          </node>
          <node id="n2">
          </node>
          <node id="n3">
          </node>
          <node id="n4">
          </node>
          <node id="n5">
          </node>
          <node id="n6">
          </node>
          <node id="n7">
          </node>
          <node id="n8">
          </node>
          <node id="n9">
          </node>
          <edge source="n0" target="n1">
          </edge>
          <edge source="n1" target="n2">
          </edge>
          <edge source="n2" target="n3">
          </edge>
          <edge source="n3" target="n4">
          </edge>
          <edge source="n4" target="n5">
          </edge>
          <edge source="n5" target="n6">
          </edge>
          <edge source="n6" target="n7">
          </edge>
          <edge source="n7" target="n8">
          </edge>
          <edge source="n8" target="n9">
          </edge>
          <edge source="n0" target="n9">
          </edge>
        </graph>
      </graphml>

