# gomory_hu_tree_impl basic

    Code
      gomory_hu_tree_impl(graph = g)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 1
      

---

    Code
      gomory_hu_tree_impl(graph = g, capacity = c(1, 2))
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 2
      

# gomory_hu_tree_impl errors

    Code
      gomory_hu_tree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxflow_impl basic

    Code
      maxflow_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $flow
      [1] 1 1
      
      $cut
      + 1/2 edge:
      [1] 2--3
      
      $partition1
      + 2/3 vertices:
      [1] 1 2
      
      $partition2
      + 1/3 vertex:
      [1] 3
      
      $stats
      $stats$nopush
      [1] 1
      
      $stats$norelabel
      [1] 0
      
      $stats$nogap
      [1] 0
      
      $stats$nogapnodes
      [1] 0
      
      $stats$nobfs
      [1] 1
      
      

---

    Code
      maxflow_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $flow
      [1] 1 1
      
      $cut
      + 1/2 edge:
      [1] 1--2
      
      $partition1
      + 1/3 vertex:
      [1] 1
      
      $partition2
      + 2/3 vertices:
      [1] 2 3
      
      $stats
      $stats$nopush
      [1] 1
      
      $stats$norelabel
      [1] 0
      
      $stats$nogap
      [1] 0
      
      $stats$nogapnodes
      [1] 0
      
      $stats$nobfs
      [1] 1
      
      

# maxflow_impl errors

    Code
      maxflow_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# residual_graph_impl basic

    Code
      residual_graph_impl(graph = g, capacity = c(1, 2), flow = c(1, 2))
    Output
      $residual
      IGRAPH D--- 3 0 -- 
      + edges:
      
      $residual_capacity
      numeric(0)
      

# residual_graph_impl errors

    Code
      residual_graph_impl(graph = NULL, capacity = c(1, 2), flow = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_residual_graph_impl basic

    Code
      reverse_residual_graph_impl(graph = g, capacity = c(1, 2), flow = c(1, 2))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 2->1 3->2

# reverse_residual_graph_impl errors

    Code
      reverse_residual_graph_impl(graph = NULL, capacity = c(1, 2), flow = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# st_mincut_impl basic

    Code
      st_mincut_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $cut
      + 1/2 edge:
      [1] 2--3
      
      $partition1
      + 2/3 vertices:
      [1] 1 2
      
      $partition2
      + 1/3 vertex:
      [1] 3
      

---

    Code
      st_mincut_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $cut
      + 1/2 edge:
      [1] 1--2
      
      $partition1
      + 1/3 vertex:
      [1] 1
      
      $partition2
      + 2/3 vertices:
      [1] 2 3
      

# st_mincut_impl errors

    Code
      st_mincut_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# dominator_tree_impl basic

    Code
      dominator_tree_impl(graph = g, root = 1)
    Output
      $dom
      [1] 0 1 2
      
      $domtree
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3
      
      $leftout
      + 0/3 vertices:
      

---

    Code
      dominator_tree_impl(graph = g, root = 1, mode = "in")
    Output
      $dom
      [1]  0 -1 -1
      
      $domtree
      IGRAPH D--- 3 0 -- 
      + edges:
      
      $leftout
      + 2/3 vertices:
      [1] 2 3
      

# dominator_tree_impl errors

    Code
      dominator_tree_impl(graph = NULL, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_cuts_impl basic

    Code
      all_st_cuts_impl(graph = g, source = 1, target = 3)
    Output
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      $cuts[[2]]
      + 1/2 edge:
      [1] 2->3
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      $partition1s[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      

# all_st_cuts_impl errors

    Code
      all_st_cuts_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_mincuts_impl basic

    Code
      all_st_mincuts_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      $cuts[[2]]
      + 1/2 edge:
      [1] 2->3
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      $partition1s[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      

---

    Code
      all_st_mincuts_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      

# all_st_mincuts_impl errors

    Code
      all_st_mincuts_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_connectivity_impl basic

    Code
      edge_connectivity_impl(graph = g)
    Output
      [1] 2

# vertex_connectivity_impl basic

    Code
      vertex_connectivity_impl(graph = g)
    Output
      [1] 2

