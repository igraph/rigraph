# feedback_arc_set_impl basic

    Code
      feedback_arc_set_impl(graph = g)
    Output
      + 0/2 edges:

---

    Code
      feedback_arc_set_impl(graph = g, algo = "exact_ip")
    Output
      + 0/2 edges:

# feedback_arc_set_impl errors

    Code
      feedback_arc_set_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# feedback_vertex_set_impl basic

    Code
      feedback_vertex_set_impl(graph = g)
    Output
      + 0/3 vertices:

# feedback_vertex_set_impl errors

    Code
      feedback_vertex_set_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_dag_impl basic

    Code
      is_dag_impl(graph = g)
    Output
      [1] FALSE

# is_dag_impl errors

    Code
      is_dag_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_acyclic_impl basic

    Code
      is_acyclic_impl(graph = g)
    Output
      [1] TRUE

# is_acyclic_impl errors

    Code
      is_acyclic_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# find_cycle_impl basic

    Code
      find_cycle_impl(graph = g)
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

---

    Code
      find_cycle_impl(graph = g, mode = "in")
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

# find_cycle_impl errors

    Code
      find_cycle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simple_cycles_impl basic

    Code
      simple_cycles_impl(graph = g)
    Output
      $vertices
      list()
      
      $edges
      list()
      

---

    Code
      simple_cycles_impl(graph = g, mode = "in", min_cycle_length = 2,
        max_cycle_length = 3)
    Output
      $vertices
      list()
      
      $edges
      list()
      

# simple_cycles_impl errors

    Code
      simple_cycles_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_eulerian_impl basic

    Code
      is_eulerian_impl(graph = g)
    Output
      $has_path
      [1] TRUE
      
      $has_cycle
      [1] FALSE
      

# is_eulerian_impl errors

    Code
      is_eulerian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_path_impl basic

    Code
      eulerian_path_impl(graph = g)
    Output
      $epath
      + 2/2 edges:
      [1] 1--2 2--3
      
      $vpath
      + 3/3 vertices:
      [1] 1 2 3
      

# eulerian_path_impl errors

    Code
      eulerian_path_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_cycle_impl basic

    Code
      eulerian_cycle_impl(graph = g1)
    Condition
      Error in `eulerian_cycle_impl()`:
      ! The graph does not have an Eulerian cycle. Input problem has no solution
      Source: <file>:<line>

---

    Code
      eulerian_cycle_impl(graph = g2)
    Output
      $epath
      + 4/4 edges:
      [1] 1--2 2--3 3--4 1--4
      
      $vpath
      + 5/4 vertices:
      [1] 1 2 3 4 1
      

# eulerian_cycle_impl errors

    Code
      eulerian_cycle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# fundamental_cycles_impl basic

    Code
      fundamental_cycles_impl(graph = g, start = 1)
    Output
      list()

---

    Code
      fundamental_cycles_impl(graph = g, start = 1, bfs_cutoff = 2, weights = c(1, 2))
    Output
      list()

# fundamental_cycles_impl errors

    Code
      fundamental_cycles_impl(graph = NULL, start = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# minimum_cycle_basis_impl basic

    Code
      minimum_cycle_basis_impl(graph = g)
    Output
      list()

---

    Code
      minimum_cycle_basis_impl(graph = g, bfs_cutoff = 2, complete = FALSE,
        use_cycle_order = FALSE, weights = c(1, 2))
    Output
      list()

# minimum_cycle_basis_impl errors

    Code
      minimum_cycle_basis_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simple_cycles_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of cycles found:", length(cycle_data), "\n")
    Output
      
      Number of cycles found: 1 
    Code
      cat("First cycle:\n")
    Output
      First cycle:
    Code
      print(cycle_data[[1]])
    Output
      $vertices
      [1] 1 2 3 4
      
      $edges
      [1] 1 2 3 4
      

# simple_cycles_callback_closure_impl errors

    Code
      simple_cycles_callback_closure_impl(graph = g, mode = "out", min_cycle_length = -
        1, max_cycle_length = -1, callback = "not a function")
    Condition
      Error in `simple_cycles_callback_closure_impl()`:
      ! `callback` must be a function

