# unfold_tree_impl basic

    Code
      unfold_tree_impl(graph = g, roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

---

    Code
      unfold_tree_impl(graph = g, mode = "in", roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

# unfold_tree_impl errors

    Code
      unfold_tree_impl(graph = NULL, roots = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_tree_impl basic

    Code
      is_tree_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_tree_impl(graph = g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $root
      + 1/3 vertex:
      [1] 1
      

# is_tree_impl errors

    Code
      is_tree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_forest_impl basic

    Code
      is_forest_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_forest_impl(graph = g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $roots
      + 1/3 vertex:
      [1] 1
      

# is_forest_impl errors

    Code
      is_forest_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_prufer_impl basic

    Code
      to_prufer_impl(graph = g)
    Output
      [1] 2

# to_prufer_impl errors

    Code
      to_prufer_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# random_spanning_tree_impl basic

    Code
      random_spanning_tree_impl(graph = g, vid = 1)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

# random_spanning_tree_impl errors

    Code
      random_spanning_tree_impl(graph = NULL, vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

