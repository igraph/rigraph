# subgraph.edges deprecation

    Code
      subgraph.edges(g, edges, delete.vertices = FALSE)
    Condition
      Warning:
      `subgraph.edges()` was deprecated in igraph 2.1.0.
      i Please use `subgraph_from_edges()` instead.
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected
      i 13 vertices * 11 edges
      
      -- Attributes ------------------------------------------------------------------
      -> graph:  name_1 <chr>, name_2 <chr>, loops_1 <lgl>, loops_2 <lgl>
      
      -- Edges -----------------------------------------------------------------------
       [1] 1 -- 2    1 -- 8    3 -- 6    3 -- 8    4 -- 5    5 -- 7    6 -- 7   
       [8] 9 -- 11   9 -- 13   10 -- 13  12 -- 13 

