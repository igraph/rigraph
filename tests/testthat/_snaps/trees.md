# subgraph.edges deprecation

    Code
      subgraph.edges(g, edges, delete.vertices = FALSE)
    Condition
      Warning:
      `subgraph.edges()` was deprecated in igraph 2.1.0.
      i Please use `subgraph_from_edges()` instead.
      Warning:
      Calling `subgraph_from_edges()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: subgraph_from_edges(graph, edges, delete.vertices)
      i Use instead: subgraph_from_edges(graph, edges, delete_vertices = )
      Warning:
      The `eids` argument of `subgraph_from_edges()` is deprecated as of igraph 3.0.0.
      i Please use the `edges` argument instead.
    Output
      IGRAPH U--- 13 11 -- 
      + attr: name_1 (g/c), name_2 (g/c), loops_1 (g/l), loops_2 (g/l)
      + edges:
       [1]  1-- 2  1-- 8  3-- 6  3-- 8  4-- 5  5-- 7  6-- 7  9--11  9--13 10--13
      [11] 12--13

