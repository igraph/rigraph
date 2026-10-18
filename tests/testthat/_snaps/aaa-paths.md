# get_shortest_path_impl basic

    Code
      get_shortest_path_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_impl errors

    Code
      get_shortest_path_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_bellman_ford_impl basic

    Code
      get_shortest_path_bellman_ford_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_bellman_ford_impl errors

    Code
      get_shortest_path_bellman_ford_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_dijkstra_impl basic

    Code
      get_shortest_path_dijkstra_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_dijkstra_impl errors

    Code
      get_shortest_path_dijkstra_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_impl basic

    Code
      get_all_shortest_paths_impl(graph = g, from = 1, to = 3)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $nrgeo
      [1] 1 1 1
      

# get_all_shortest_paths_impl errors

    Code
      get_all_shortest_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_dijkstra_impl basic

    Code
      get_all_shortest_paths_dijkstra_impl(graph = g, from = 1, to = 3)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $nrgeo
      [1] 1 1 1
      

# get_all_shortest_paths_dijkstra_impl errors

    Code
      get_all_shortest_paths_dijkstra_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# voronoi_impl basic

    Code
      voronoi_impl(graph = g, generators = 1)
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

---

    Code
      voronoi_impl(graph = g, generators = 1, mode = "in", tiebreaker = "first")
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

---

    Code
      voronoi_impl(graph = g, generators = c(1, 5), mode = c("out", "in", "all"))
    Output
      $membership
       [1] 0 0 0 1 1 1 1 1 0 0
      
      $distances
       [1] 0 1 2 1 0 1 2 3 2 1
      

# voronoi_impl errors

    Code
      voronoi_impl(graph = NULL, generators = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_simple_paths_impl basic

    Code
      get_all_simple_paths_impl(graph = g, from = 1, to = 3)
    Output
      + 3/3 vertices:
      [1] 1 2 3

# get_all_simple_paths_impl errors

    Code
      get_all_simple_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_k_shortest_paths_impl basic

    Code
      get_k_shortest_paths_impl(graph = g, from = 1, to = 3, k = 2)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      

# get_k_shortest_paths_impl errors

    Code
      get_k_shortest_paths_impl(graph = NULL, from = 1, to = 3, k = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_path_impl basic

    Code
      get_widest_path_impl(graph = g, from = 1, to = 3, weights = c(1, 2))
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_widest_path_impl errors

    Code
      get_widest_path_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_paths_impl basic

    Code
      get_widest_paths_impl(graph = g, from = 1, to = 3, weights = c(1, 2))
    Output
      $vertices
      $vertices[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $edges
      $edges[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $parents
      [1] -1  0  1
      
      $inbound_edges
      [1] -1  0  1
      

# get_widest_paths_impl errors

    Code
      get_widest_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# path_length_hist_impl basic

    Code
      path_length_hist_impl(graph = g)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

---

    Code
      path_length_hist_impl(graph = g, directed = FALSE)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

# path_length_hist_impl errors

    Code
      path_length_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eccentricity_dijkstra_impl basic

    Code
      eccentricity_dijkstra_impl(graph = g)
    Output
      [1] 2 1 2

---

    Code
      eccentricity_dijkstra_impl(graph = g, mode = "in")
    Output
      [1] 2 1 2

# eccentricity_dijkstra_impl errors

    Code
      eccentricity_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_center_dijkstra_impl basic

    Code
      graph_center_dijkstra_impl(graph = g)
    Output
      + 1/3 vertex:
      [1] 2

---

    Code
      graph_center_dijkstra_impl(graph = g, mode = "in")
    Output
      + 1/3 vertex:
      [1] 2

# graph_center_dijkstra_impl errors

    Code
      graph_center_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# radius_dijkstra_impl basic

    Code
      radius_dijkstra_impl(graph = g)
    Output
      [1] 1

---

    Code
      radius_dijkstra_impl(graph = g, mode = "in")
    Output
      [1] 1

# radius_dijkstra_impl errors

    Code
      radius_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_impl basic

    Code
      pseudo_diameter_impl(graph = g, start_vid = 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_impl(graph = g, start_vid = 1, directed = FALSE, unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_impl errors

    Code
      pseudo_diameter_impl(graph = NULL, start_vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_dijkstra_impl basic

    Code
      pseudo_diameter_dijkstra_impl(graph = g, start_vid = 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_dijkstra_impl(graph = g, start_vid = 1, directed = FALSE,
        unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_dijkstra_impl errors

    Code
      pseudo_diameter_dijkstra_impl(graph = NULL, start_vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vertex_path_from_edge_path_impl basic

    Code
      vertex_path_from_edge_path_impl(graph = g, start = 1, edge_path = c(1, 2))
    Output
      + 3/3 vertices:
      [1] 1 2 3

---

    Code
      vertex_path_from_edge_path_impl(graph = g, start = 1, edge_path = c(1), mode = "in")
    Output
      + 2/3 vertices:
      [1] 1 2

# vertex_path_from_edge_path_impl errors

    Code
      vertex_path_from_edge_path_impl(graph = NULL, start = 1, edge_path = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# girth_impl basic

    Code
      result$girth
    Output
      [1] 5

# girth_impl errors

    Code
      girth_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# distances_impl basic

    Code
      distances_impl(graph = g, from = V(g), to = V(g), mode = c("out", "in", "all",
        "total"))
    Output
           [,1] [,2] [,3] [,4] [,5]
      [1,]    0    1    2    2    1
      [2,]    1    0    1    2    2
      [3,]    2    1    0    1    2
      [4,]    2    2    1    0    1
      [5,]    1    2    2    1    0

# diameter_impl basic

    Code
      diameter_impl(graph = g, directed = FALSE, unconnected = TRUE)
    Output
      $res
      [1] 5
      
      $from
      [1] 0
      
      $to
      [1] 5
      
      $vertex_path
      [1] 0 1 2 3 4 5
      
      $edge_path
      [1] 0 1 2 3 4
      

# get_shortest_paths_impl basic

    Code
      get_shortest_paths_impl(graph = g, from = 1, to = 3, mode = c("out", "in",
        "all", "total"))
    Output
      $vertices
      $vertices[[1]]
      + 3/5 vertices:
      [1] 1 2 3
      
      
      $edges
      $edges[[1]]
      + 2/5 edges:
      [1] 1--2 2--3
      
      
      $parents
      [1] -1  0  1 -2  0
      
      $inbound_edges
      [1] -1  0  1 -1  4
      

# eccentricity_impl basic

    Code
      eccentricity_impl(graph = g, vids = V(g), mode = c("out", "in", "all"))
    Output
      [1] 2 2 2 2 2

# radius_impl basic

    Code
      radius_impl(graph = g, mode = c("out", "in", "all"))
    Output
      [1] 2

# graph_center_impl basic

    Code
      graph_center_impl(graph = g, mode = c("out", "in", "all"))
    Output
      + 1/5 vertex:
      [1] 1

