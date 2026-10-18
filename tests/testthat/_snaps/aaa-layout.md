# layout_random_impl basic

    Code
      layout_random_impl(graph = g)
    Output
                  [,1]       [,2]
      [1,]  0.91714717  0.7003783
      [2,] -0.84358557  0.6509057
      [3,] -0.08120892 -0.8259847

# layout_random_impl errors

    Code
      layout_random_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_circle_impl basic

    Code
      layout_circle_impl(graph = g)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

---

    Code
      layout_circle_impl(graph = g, order = 1:3)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

# layout_circle_impl errors

    Code
      layout_circle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_star_impl basic

    Code
      round(layout_star_impl(graph = g), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]   -1    0

---

    Code
      round(layout_star_impl(graph = g, center = 1, order = 3:1), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]   -1    0
      [3,]    1    0

# layout_star_impl errors

    Code
      layout_star_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_impl basic

    Code
      layout_grid_impl(graph = g)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

---

    Code
      layout_grid_impl(graph = g, width = 2)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

# layout_grid_impl errors

    Code
      layout_grid_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_3d_impl basic

    Code
      layout_grid_3d_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

---

    Code
      layout_grid_3d_impl(graph = g, width = 2, height = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

# layout_grid_3d_impl errors

    Code
      layout_grid_3d_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# roots_for_tree_layout_impl basic

    Code
      roots_for_tree_layout_impl(graph = g, mode = "out", heuristic = 1)
    Output
      + 1/3 vertex:
      [1] 2

# roots_for_tree_layout_impl errors

    Code
      roots_for_tree_layout_impl(graph = NULL, mode = "out", heuristic = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_random_3d_impl basic

    Code
      layout_random_3d_impl(graph = g)
    Output
                  [,1]       [,2]      [,3]
      [1,]  0.91714717  0.7003783 0.7338074
      [2,] -0.84358557  0.6509057 0.4644714
      [3,] -0.08120892 -0.8259847 0.5240391

# layout_random_3d_impl errors

    Code
      layout_random_3d_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sphere_impl basic

    Code
      layout_sphere_impl(graph = g)
    Output
                 [,1]      [,2] [,3]
      [1,]  0.0000000 0.0000000   -1
      [2,] -0.4861377 0.8738822    0
      [3,]  0.0000000 0.0000000    1

---

    Code
      layout_sphere_impl(graph = g)
    Output
                 [,1]       [,2] [,3]
      [1,]  0.0000000  0.0000000 -1.0
      [2,] -0.2461774  0.8302992 -0.5
      [3,] -0.9468790 -0.3215901  0.0
      [4,]  0.5001161 -0.7070246  0.5
      [5,]  0.0000000  0.0000000  1.0

# layout_sphere_impl errors

    Code
      layout_sphere_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sugiyama_impl basic

    Code
      layout_sugiyama_impl(graph = g)
    Output
      $res
           [,1] [,2]
      [1,]  0.0    1
      [2,]  0.5    0
      [3,]  1.0    1
      
      $extd_graph
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $extd_to_orig_eids
      [1] 1 2
      

---

    Code
      layout_sugiyama_impl(graph = g, layers = 1:3, hgap = 2, vgap = 2, maxiter = 10,
      weights = c(1, 2))
    Output
      $res
           [,1] [,2]
      [1,]    0    0
      [2,]    0    2
      [3,]    0    4
      
      $extd_graph
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $extd_to_orig_eids
      [1] 1 2
      

# layout_sugiyama_impl errors

    Code
      layout_sugiyama_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_mds_impl basic

    Code
      layout_mds_impl(graph = g)
    Output
           [,1]         [,2]
      [1,]    1 2.807594e-08
      [2,]    0 0.000000e+00
      [3,]   -1 2.807594e-08

---

    Code
      layout_mds_impl(graph = g, dist = matrix(1:9, nrow = 3), dim = 3)
    Output
                [,1]        [,2]     [,3]
      [1,] -2.907521  2.32638426 1.444979
      [2,] -3.900013 -1.63291106 2.258035
      [3,]  3.975674  0.09951448 3.271816

# layout_mds_impl errors

    Code
      layout_mds_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_bipartite_impl basic

    Code
      layout_bipartite_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
           [,1] [,2]
      [1,]  0.0    0
      [2,]  0.5    1
      [3,]  1.0    0

---

    Code
      layout_bipartite_impl(graph = g, types = c(TRUE, FALSE, TRUE), hgap = 2, vgap = 2,
      maxiter = 10)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    2
      [3,]    2    0

# layout_bipartite_impl errors

    Code
      layout_bipartite_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_gem_impl basic

    Code
      layout_gem_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2))
    Output
                [,1]      [,2]
      [1,] 200.18284 -69.23950
      [2,]  86.00346  64.12806
      [3,]  66.22930 -92.94294

---

    Code
      layout_gem_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE,
      maxiter = 10, temp_max = 2, temp_min = 0.1, temp_init = 1)
    Output
                 [,1]       [,2]
      [1,]  1.0114521 -0.1206363
      [2,] -0.2178589  2.9621162
      [3,] -0.7089555 -3.8896500

# layout_gem_impl errors

    Code
      layout_gem_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_davidson_harel_impl basic

    Code
      layout_davidson_harel_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2))
    Output
               [,1]      [,2]
      [1,] 1.152116 0.9424808
      [2,] 2.474361 2.5195497
      [3,] 3.849187 4.0402661

---

    Code
      layout_davidson_harel_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2),
      use_seed = TRUE, maxiter = 10, fineiter = 5, cool_fact = 0.5, weight_node_dist = 2,
      weight_border = 1, weight_edge_lengths = 0.1, weight_edge_crossings = 0.2,
      weight_node_edge_dist = 0.3)
    Output
                [,1]      [,2]
      [1,] -6.609493 -2.155221
      [2,] -8.660255 -3.797365
      [3,] -6.485087 -5.224752

# layout_davidson_harel_impl errors

    Code
      layout_davidson_harel_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_impl basic

    Code
      layout_umap_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

---

    Code
      layout_umap_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE,
      distances = 1:3, min_dist = 0.1, epochs = 10, distances_are_weights = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_umap_impl errors

    Code
      layout_umap_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_3d_impl basic

    Code
      layout_umap_3d_impl(graph = g, res = matrix(0, nrow = 3, ncol = 3), use_seed = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

---

    Code
      layout_umap_3d_impl(graph = g, res = matrix(0, nrow = 3, ncol = 3), use_seed = TRUE,
      distances = 1:3, min_dist = 0.1, epochs = 10, distances_are_weights = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

# layout_umap_3d_impl errors

    Code
      layout_umap_3d_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_compute_weights_impl basic

    Code
      layout_umap_compute_weights_impl(graph = g, distances = 1:2, weights = 1:3)
    Output
      [1] 1 1

# layout_umap_compute_weights_impl errors

    Code
      layout_umap_compute_weights_impl(graph = NULL, distances = 1:3, weights = 1:3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_align_impl basic

    Code
      layout_align_impl(graph = g, layout = matrix(0, nrow = 3, ncol = 2))
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_align_impl errors

    Code
      layout_align_impl(graph = NULL, layout = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_merge_dla_impl basic

    Code
      layout_merge_dla_impl(graphs = list(g1, g2), coords = list(coords1, coords2))
    Output
                [,1]       [,2]
      [1,] -2.279507  0.0000000
      [2,]  0.000000  0.0000000
      [3,]  2.279507  0.0000000
      [4,] -6.893133 -0.8307751
      [5,] -4.613626 -0.8307751
      [6,] -2.334119 -0.8307751

