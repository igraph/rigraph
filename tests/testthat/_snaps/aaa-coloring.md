# is_perfect_impl basic

    Code
      is_perfect_impl(graph = g)
    Output
      [1] TRUE

# is_perfect_impl errors

    Code
      is_perfect_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vertex_coloring_greedy_impl basic

    Code
      vertex_coloring_greedy_impl(graph = g)
    Output
      [1] 2 1 2

---

    Code
      vertex_coloring_greedy_impl(graph = g, heuristic = "dsatur")
    Output
      [1] 2 1 2

# vertex_coloring_greedy_impl errors

    Code
      vertex_coloring_greedy_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_vertex_coloring_impl basic

    Code
      is_vertex_coloring_impl(graph = g, types = c(1, 2, 3))
    Output
      [1] TRUE

# is_vertex_coloring_impl errors

    Code
      is_vertex_coloring_impl(graph = NULL, types = c(1, 2, 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_coloring_impl basic

    Code
      is_bipartite_coloring_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      [1] TRUE

# is_bipartite_coloring_impl errors

    Code
      is_bipartite_coloring_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_edge_coloring_impl basic

    Code
      is_edge_coloring_impl(graph = g, types = c(1, 2))
    Output
      [1] TRUE

---

    Code
      is_edge_coloring_impl(graph = g)
    Output
      [1] TRUE

# is_edge_coloring_impl errors

    Code
      is_edge_coloring_impl(graph = NULL, types = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

