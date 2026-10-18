# isoclass_impl basic

    Code
      isoclass_impl(graph = g)
    Output
      [1] 2

# isoclass_impl errors

    Code
      isoclass_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_impl basic

    Code
      isomorphic_impl(graph1 = g1, graph2 = g2)
    Output
      [1] TRUE

# isomorphic_impl errors

    Code
      isomorphic_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_subgraph_impl basic

    Code
      isoclass_subgraph_impl(graph = g, vids = c(1, 2, 3))
    Output
      [1] 2

# isoclass_subgraph_impl errors

    Code
      isoclass_subgraph_impl(graph = NULL, vids = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_create_impl basic

    Code
      isoclass_create_impl(size = 3, number = 1)
    Output
      IGRAPH D--- 3 1 -- 
      + edge:
      [1] 2->1

---

    Code
      isoclass_create_impl(size = 3, number = 1, directed = FALSE)
    Output
      IGRAPH U--- 3 1 -- 
      + edge:
      [1] 1--2

# isoclass_create_impl errors

    Code
      isoclass_create_impl(size = "a", number = 1)
    Condition
      Warning in `isoclass_create_impl()`:
      NAs introduced by coercion
      Error in `isoclass_create_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# isomorphic_vf2_impl basic

    Code
      isomorphic_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      isomorphic_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# isomorphic_vf2_impl errors

    Code
      isomorphic_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_isomorphisms_vf2_impl basic

    Code
      count_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [1] 2

---

    Code
      count_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [1] 1

# count_isomorphisms_vf2_impl errors

    Code
      count_isomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_isomorphisms_vf2_impl basic

    Code
      get_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_isomorphisms_vf2_impl errors

    Code
      get_isomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_impl basic

    Code
      subisomorphic_impl(graph1 = g1, graph2 = g2)
    Output
      [1] TRUE

# subisomorphic_impl errors

    Code
      subisomorphic_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_vf2_impl basic

    Code
      subisomorphic_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      subisomorphic_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# subisomorphic_vf2_impl errors

    Code
      subisomorphic_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_subisomorphisms_vf2_impl basic

    Code
      count_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [1] 2

---

    Code
      count_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2,
        3), vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [1] 1

# count_subisomorphisms_vf2_impl errors

    Code
      count_subisomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_subisomorphisms_vf2_impl basic

    Code
      get_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2,
        3), vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_subisomorphisms_vf2_impl errors

    Code
      get_subisomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# canonical_permutation_impl basic

    Code
      canonical_permutation_impl(graph = g)
    Output
      $labeling
      [1] 2 3 1
      
      $info
      $info$nof_nodes
      [1] 3
      
      $info$nof_leaf_nodes
      [1] 3
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 1
      
      $info$max_level
      [1] 1
      
      $info$group_size
      [1] "2"
      
      

---

    Code
      canonical_permutation_impl(graph = g, colors = c(1, 2, 3), sh = "fl")
    Output
      $labeling
      [1] 1 2 3
      
      $info
      $info$nof_nodes
      [1] 1
      
      $info$nof_leaf_nodes
      [1] 1
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 0
      
      $info$max_level
      [1] 0
      
      $info$group_size
      [1] "1"
      
      

# canonical_permutation_impl errors

    Code
      canonical_permutation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# permute_vertices_impl basic

    Code
      permute_vertices_impl(graph = g, permutation = 3:1)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 2--3 1--2

# permute_vertices_impl errors

    Code
      permute_vertices_impl(graph = NULL, permutation = 3:1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_bliss_impl basic

    Code
      isomorphic_bliss_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      
      $info1
      $info1$nof_nodes
      [1] 3
      
      $info1$nof_leaf_nodes
      [1] 3
      
      $info1$nof_bad_nodes
      [1] 0
      
      $info1$nof_canupdates
      [1] 1
      
      $info1$max_level
      [1] 1
      
      $info1$group_size
      [1] "2"
      
      
      $info2
      $info2$nof_nodes
      [1] 3
      
      $info2$nof_leaf_nodes
      [1] 3
      
      $info2$nof_bad_nodes
      [1] 0
      
      $info2$nof_canupdates
      [1] 1
      
      $info2$max_level
      [1] 1
      
      $info2$group_size
      [1] "2"
      
      

---

    Code
      isomorphic_bliss_impl(graph1 = g1, graph2 = g2, colors1 = c(1, 2, 3), colors2 = c(
        1, 2, 3), sh = "fl")
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      
      $info1
      $info1$nof_nodes
      [1] 1
      
      $info1$nof_leaf_nodes
      [1] 1
      
      $info1$nof_bad_nodes
      [1] 0
      
      $info1$nof_canupdates
      [1] 0
      
      $info1$max_level
      [1] 0
      
      $info1$group_size
      [1] "1"
      
      
      $info2
      $info2$nof_nodes
      [1] 1
      
      $info2$nof_leaf_nodes
      [1] 1
      
      $info2$nof_bad_nodes
      [1] 0
      
      $info2$nof_canupdates
      [1] 0
      
      $info2$max_level
      [1] 0
      
      $info2$group_size
      [1] "1"
      
      

# isomorphic_bliss_impl errors

    Code
      isomorphic_bliss_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_automorphisms_impl basic

    Code
      count_automorphisms_impl(graph = g)
    Output
      $nof_nodes
      [1] 3
      
      $nof_leaf_nodes
      [1] 3
      
      $nof_bad_nodes
      [1] 0
      
      $nof_canupdates
      [1] 1
      
      $max_level
      [1] 1
      
      $group_size
      [1] "2"
      

---

    Code
      count_automorphisms_impl(graph = g, colors = c(1, 2, 3), sh = "fl")
    Output
      $nof_nodes
      [1] 1
      
      $nof_leaf_nodes
      [1] 1
      
      $nof_bad_nodes
      [1] 0
      
      $nof_canupdates
      [1] 0
      
      $max_level
      [1] 0
      
      $group_size
      [1] "1"
      

# count_automorphisms_impl errors

    Code
      count_automorphisms_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# automorphism_group_impl basic

    Code
      automorphism_group_impl(graph = g)
    Output
      [[1]]
      + 3/3 vertices:
      [1] 3 2 1
      

---

    Code
      automorphism_group_impl(graph = g, colors = c(1, 2, 3), sh = "fl", details = TRUE)
    Output
      $generators
      list()
      
      $info
      $info$nof_nodes
      [1] 1
      
      $info$nof_leaf_nodes
      [1] 1
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 0
      
      $info$max_level
      [1] 0
      
      $info$group_size
      [1] "1"
      
      

# automorphism_group_impl errors

    Code
      automorphism_group_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_and_colorize_impl basic

    Code
      simplify_and_colorize_impl(graph = g)
    Output
      $res
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_color
      [1] 0 0 0
      
      $edge_color
      [1] 1 1
      

# simplify_and_colorize_impl errors

    Code
      simplify_and_colorize_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_count_impl basic

    Code
      graph_count_impl(n = 3)
    Output
      [1] 4

---

    Code
      graph_count_impl(n = 3, directed = TRUE)
    Output
      [1] 16

# graph_count_impl errors

    Code
      graph_count_impl(n = "a")
    Condition
      Warning in `graph_count_impl()`:
      NAs introduced by coercion
      Error in `graph_count_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# get_isomorphisms_vf2_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of isomorphisms found:", length(iso_data), "\n")
    Output
      
      Number of isomorphisms found: 2 
    Code
      cat("First isomorphism:\n")
    Output
      First isomorphism:
    Code
      print(iso_data[[1]])
    Output
      $map12
      [1] 1 2 3 4 5
      
      $map21
      [1] 1 2 3 4 5
      

# get_isomorphisms_vf2_callback_closure_impl errors

    Code
      get_isomorphisms_vf2_callback_closure_impl(graph1 = g1, graph2 = g2,
        vertex_color1 = NULL, vertex_color2 = NULL, edge_color1 = NULL, edge_color2 = NULL,
        callback = "not a function")
    Condition
      Error in `get_isomorphisms_vf2_callback_closure_impl()`:
      ! `callback` must be a function

# get_subisomorphisms_vf2_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of subisomorphisms found:", length(subiso_data), "\n")
    Output
      
      Number of subisomorphisms found: 2 
    Code
      cat("First subisomorphism:\n")
    Output
      First subisomorphism:
    Code
      print(subiso_data[[1]])
    Output
      $map12
      [1] 1 2 3 0 0
      
      $map21
      [1] 1 2 3
      

# get_subisomorphisms_vf2_callback_closure_impl errors

    Code
      get_subisomorphisms_vf2_callback_closure_impl(graph1 = g1, graph2 = g2,
        vertex_color1 = NULL, vertex_color2 = NULL, edge_color1 = NULL, edge_color2 = NULL,
        callback = "not a function")
    Condition
      Error in `get_subisomorphisms_vf2_callback_closure_impl()`:
      ! `callback` must be a function

# subisomorphic_lad_impl errors

    Code
      subisomorphic_lad_impl(pattern = NULL, target = g, domains = list(), induced = FALSE,
      time_limit = 0)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

---

    Code
      subisomorphic_lad_impl(pattern = g, target = g, domains = "not a list",
        induced = FALSE, time_limit = 0)
    Condition
      Error:
      ! `domains` must be a list or NULL

