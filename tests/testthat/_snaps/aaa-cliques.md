# is_clique_impl basic

    Code
      is_clique_impl(graph = g, candidate = 1:2)
    Output
      [1] TRUE

---

    Code
      is_clique_impl(graph = g, candidate = 1:2, directed = TRUE)
    Output
      [1] TRUE

# is_clique_impl errors

    Code
      is_clique_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# cliques_impl basic

    Code
      cliques_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      
      [[2]]
      + 1/3 vertex:
      [1] 3
      
      [[3]]
      + 2/3 vertices:
      [1] 2 3
      
      [[4]]
      + 1/3 vertex:
      [1] 1
      
      [[5]]
      + 2/3 vertices:
      [1] 1 2
      

---

    Code
      cliques_impl(graph = g, min = 2, max = 2)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      
      [[2]]
      + 2/3 vertices:
      [1] 1 2
      

# cliques_impl errors

    Code
      cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_size_hist_impl basic

    Code
      clique_size_hist_impl(graph = g)
    Output
      [1] 3 2

---

    Code
      clique_size_hist_impl(graph = g, min_size = 2, max_size = 2)
    Output
      [1] 0 2

# clique_size_hist_impl errors

    Code
      clique_size_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_cliques_impl basic

    Code
      largest_cliques_impl(graph = g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_cliques_impl errors

    Code
      largest_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximal_cliques_hist_impl basic

    Code
      maximal_cliques_hist_impl(graph = g)
    Output
      [1] 0 2

---

    Code
      maximal_cliques_hist_impl(graph = g, min_size = 2, max_size = 2)
    Output
      [1] 0 2

# maximal_cliques_hist_impl errors

    Code
      maximal_cliques_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_number_impl basic

    Code
      clique_number_impl(graph = g)
    Output
      [1] 2

# clique_number_impl errors

    Code
      clique_number_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_cliques_impl basic

    Code
      weighted_cliques_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      
      [[2]]
      + 1/3 vertex:
      [1] 3
      
      [[3]]
      + 2/3 vertices:
      [1] 2 3
      
      [[4]]
      + 1/3 vertex:
      [1] 1
      
      [[5]]
      + 2/3 vertices:
      [1] 1 2
      

---

    Code
      weighted_cliques_impl(graph = g, vertex_weights = c(1, 2, 3), min_weight = 1,
      max_weight = 3, maximal = TRUE)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      

# weighted_cliques_impl errors

    Code
      weighted_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_weighted_cliques_impl basic

    Code
      largest_weighted_cliques_impl(graph = g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

---

    Code
      largest_weighted_cliques_impl(graph = g, vertex_weights = c(1, 2, 3))
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_weighted_cliques_impl errors

    Code
      largest_weighted_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_clique_number_impl basic

    Code
      weighted_clique_number_impl(graph = g)
    Output
      [1] 2

---

    Code
      weighted_clique_number_impl(graph = g, vertex_weights = c(1, 2, 3))
    Output
      [1] 5

# weighted_clique_number_impl errors

    Code
      weighted_clique_number_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_independent_vertex_set_impl basic

    Code
      is_independent_vertex_set_impl(graph = g, candidate = 1:2)
    Output
      [1] FALSE

# is_independent_vertex_set_impl errors

    Code
      is_independent_vertex_set_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_complete_impl basic

    Code
      is_complete_impl(graph = g)
    Output
      [1] FALSE

# is_complete_impl errors

    Code
      is_complete_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximal_cliques_impl basic

    Code
      maximal_cliques_impl(graph = g, min_size = 1, max_size = 0)
    Output
      [[1]]
      + 4/4 vertices:
      [1] 1 2 4 3
      

# independent_vertex_sets_impl basic

    Code
      independent_vertex_sets_impl(graph = g, min_size = 1, max_size = 0)
    Output
      [[1]]
      + 1/5 vertex:
      [1] 1
      
      [[2]]
      + 1/5 vertex:
      [1] 2
      
      [[3]]
      + 1/5 vertex:
      [1] 3
      
      [[4]]
      + 1/5 vertex:
      [1] 4
      
      [[5]]
      + 1/5 vertex:
      [1] 5
      
      [[6]]
      + 2/5 vertices:
      [1] 1 3
      
      [[7]]
      + 2/5 vertices:
      [1] 1 4
      
      [[8]]
      + 2/5 vertices:
      [1] 2 4
      
      [[9]]
      + 2/5 vertices:
      [1] 2 5
      
      [[10]]
      + 2/5 vertices:
      [1] 3 5
      

# cliques_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of cliques found:", length(clique_data), "\n")
    Output
      
      Number of cliques found: 5 
    Code
      cat("First clique:\n")
    Output
      First clique:
    Code
      print(clique_data[[1]])
    Output
      [1] 2 3 4

# cliques_callback_closure_impl errors

    Code
      cliques_callback_closure_impl(graph = g, min_size = 3, max_size = 4, callback = "not a function")
    Condition
      Error in `cliques_callback_closure_impl()`:
      ! `callback` must be a function

# maximal_cliques_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of maximal cliques found:", length(clique_data), "\n")
    Output
      
      Number of maximal cliques found: 3 
    Code
      if (length(clique_data) > 0) {
        cat("First maximal clique:\n")
        print(clique_data[[1]])
      }
    Output
      First maximal clique:
      [1] 2 1 4

# maximal_cliques_callback_closure_impl errors

    Code
      maximal_cliques_callback_closure_impl(graph = g, min_size = 3, max_size = 0,
        callback = "not a function")
    Condition
      Error in `maximal_cliques_callback_closure_impl()`:
      ! `callback` must be a function

