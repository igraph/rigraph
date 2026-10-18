# empty_impl basic

    Code
      empty_impl()
    Output
      IGRAPH D--- 0 0 -- 
      + edges:

---

    Code
      empty_impl(n = 5, directed = FALSE)
    Output
      IGRAPH U--- 5 0 -- 
      + edges:

# empty_impl errors

    Code
      empty_impl(n = -1)
    Condition
      Error in `empty_impl()`:
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# add_edges_impl basic

    Code
      add_edges_impl(graph = g, edges = c(1, 2, 2, 3))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# add_edges_impl errors

    Code
      add_edges_impl(graph = NULL, edges = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# copy_impl basic

    Code
      copy_impl(from = g)
    Output
      IGRAPH D--- 2 0 -- 
      + edges:

# copy_impl errors

    Code
      copy_impl(from = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_vertices_idx_impl basic

    Code
      delete_vertices_idx_impl(graph = g, vertices = 1)
    Output
      $graph
      IGRAPH D--- 2 0 -- 
      + edges:
      
      $idx
      [1] 0 1 2
      
      $invidx
      [1] 1 2
      

# delete_vertices_idx_impl errors

    Code
      delete_vertices_idx_impl(graph = NULL, vertices = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vcount_impl basic

    Code
      vcount_impl(graph = g)
    Output
      [1] 4

# vcount_impl errors

    Code
      vcount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_impl basic

    Code
      degree_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      degree_impl(graph = g, mode = "in")
    Output
      [1] 0 0 0

# degree_impl errors

    Code
      degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_eids_between_impl basic

    Code
      get_all_eids_between_impl(graph = g, from = 1, to = 2)
    Output
      + 0/0 edges:

# get_all_eids_between_impl errors

    Code
      get_all_eids_between_impl(graph = NULL, from = 1, to = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# invalidate_cache_impl basic

    Code
      invalidate_cache_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# invalidate_cache_impl errors

    Code
      invalidate_cache_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# ecount_impl basic

    Code
      ecount_impl(graph = g)
    Output
      [1] 0

---

    Code
      ecount_impl(graph = g)
    Output
      [1] 3

# ecount_impl errors

    Code
      ecount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_directed_impl basic

    Code
      is_directed_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_directed_impl(graph = g)
    Output
      [1] FALSE

# is_directed_impl errors

    Code
      is_directed_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edges_impl basic

    Code
      edges_impl(graph = g, eids = E(g))
    Output
      + 6/4 vertices:
      [1] 1 2 2 3 3 4

---

    Code
      edges_impl(graph = g, eids = c(1, 3))
    Output
      + 4/4 vertices:
      [1] 1 2 3 4

# edges_impl errors

    Code
      edges_impl(graph = NULL, eids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# add_vertices_impl basic

    Code
      vcount(g_new)
    Output
      [1] 5

# add_vertices_impl errors

    Code
      add_vertices_impl(graph = NULL, nv = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_edges_impl basic

    Code
      ecount(g_new)
    Output
      [1] 1

# delete_edges_impl errors

    Code
      delete_edges_impl(graph = NULL, edges = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_vertices_impl basic

    Code
      vcount(g_new)
    Output
      [1] 2

# delete_vertices_impl errors

    Code
      delete_vertices_impl(graph = NULL, vertices = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# incident_impl basic

    Code
      incident_impl(graph = g, vid = 2, mode = "out")
    Output
      + 1/3 edge:
      [1] 2->3

---

    Code
      incident_impl(graph = g, vid = 2, mode = "in")
    Output
      + 1/3 edge:
      [1] 1->2

---

    Code
      incident_impl(graph = g, vid = 2, mode = "all")
    Output
      + 2/3 edges:
      [1] 1->2 2->3

# incident_impl errors

    Code
      incident_impl(graph = NULL, vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_eid_impl basic

    Code
      get_eid_impl(graph = g, from = 1, to = 2)
    Output
      + 1/4 edge:
      [1] 1->2

# get_eid_impl errors

    Code
      get_eid_impl(graph = NULL, from = 1, to = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

---

    Code
      get_eid_impl(graph = g, from = c(1, 2), to = 2)
    Condition
      Error:
      ! `from` must specify exactly one vertex

---

    Code
      get_eid_impl(graph = g, from = 1, to = integer(0))
    Condition
      Error:
      ! `to` must specify exactly one vertex

