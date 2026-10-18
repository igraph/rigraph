# compare_communities_impl basic

    Code
      compare_communities_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2))
    Output
      [1] 0

---

    Code
      compare_communities_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2), method = "nmi")
    Output
      [1] 1

---

    Code
      compare_communities_impl(comm1 = comm1, comm2 = comm2, method = "vi")
    Output
      [1] 0.5493061

# compare_communities_impl errors

    Code
      compare_communities_impl(comm1 = "a", comm2 = c(2, 1, 2))
    Condition
      Warning in `compare_communities_impl()`:
      NAs introduced by coercion
      Error in `compare_communities_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# modularity_impl basic

    Code
      modularity_impl(graph = g, membership = c(1, 2, 1))
    Output
      [1] -0.5

---

    Code
      modularity_impl(graph = g, membership = c(1, 2, 1), weights = c(1, 2),
      resolution = 0.5, directed = FALSE)
    Output
      [1] -0.25

# modularity_impl errors

    Code
      modularity_impl(graph = NULL, membership = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# modularity_matrix_impl basic

    Code
      modularity_matrix_impl(graph = g)
    Output
            [,1] [,2]  [,3]
      [1,] -0.25  0.5 -0.25
      [2,]  0.50 -1.0  0.50
      [3,] -0.25  0.5 -0.25

---

    Code
      modularity_matrix_impl(graph = g, weights = c(1, 2), resolution = 0.5,
      directed = FALSE)
    Output
                  [,1]  [,2]       [,3]
      [1,] -0.08333333  0.75 -0.1666667
      [2,]  0.75000000 -0.75  1.5000000
      [3,] -0.16666667  1.50 -0.3333333

# modularity_matrix_impl errors

    Code
      modularity_matrix_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_fluid_communities_impl basic

    Code
      community_fluid_communities_impl(graph = g, no_of_communities = 2)
    Output
      [1] 1 0 0

# community_fluid_communities_impl errors

    Code
      community_fluid_communities_impl(graph = NULL, no_of_communities = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_label_propagation_impl basic

    Code
      community_label_propagation_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      community_label_propagation_impl(graph = g, mode = "in", weights = c(1, 2),
      initial = 1:3, fixed = c(TRUE, FALSE, TRUE))
    Output
      [1] 0 1 1

# community_label_propagation_impl errors

    Code
      community_label_propagation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_multilevel_impl basic

    Code
      community_multilevel_impl(graph = g)
    Output
      $membership
      [1] 0 0 0
      
      $memberships
           [,1] [,2] [,3]
      [1,]    0    0    0
      
      $modularity
      [1] 0
      

---

    Code
      community_multilevel_impl(graph = g, weights = c(1, 2), resolution = 0.5)
    Output
      $membership
      [1] 0 0 0
      
      $memberships
           [,1] [,2] [,3]
      [1,]    0    0    0
      
      $modularity
      [1] 0.5
      

# community_multilevel_impl errors

    Code
      community_multilevel_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_optimal_modularity_impl basic

    Code
      community_optimal_modularity_impl(graph = g)
    Output
      $modularity
      [1] 0
      
      $membership
      [1] 0 0 0
      

---

    Code
      community_optimal_modularity_impl(graph = g, weights = c(1, 2))
    Output
      $modularity
      [1] 1.850372e-17
      
      $membership
      [1] 0 0 0
      

# community_optimal_modularity_impl errors

    Code
      community_optimal_modularity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_leiden_impl basic

    Code
      community_leiden_impl(graph = g, weights = c(1, 2), vertex_weights = c(1, 2, 3),
      resolution = 0.5, beta = 0.1, start = TRUE, n_iterations = 1, membership = 1:3)
    Output
      $membership
      [1] 0 1 2
      
      $nb_clusters
      [1] 3
      
      $quality
      [1] -1.166667
      

# community_leiden_impl errors

    Code
      community_leiden_impl(graph = NULL, resolution = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# split_join_distance_impl basic

    Code
      split_join_distance_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2))
    Output
      $distance12
      [1] 0
      
      $distance21
      [1] 0
      

# split_join_distance_impl errors

    Code
      split_join_distance_impl(comm1 = "a", comm2 = c(2, 1, 2))
    Condition
      Warning in `split_join_distance_impl()`:
      NAs introduced by coercion
      Error in `split_join_distance_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# community_infomap_impl basic

    Code
      community_infomap_impl(graph = g)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.512987
      

---

    Code
      community_infomap_impl(graph = g, e_weights = c(1, 2), v_weights = c(1, 2, 3),
      nb_trials = 2)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.462254
      

# community_infomap_impl errors

    Code
      community_infomap_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_walktrap_impl basic

    Code
      community_walktrap_impl(graph = g, steps = 4)
    Output
      $merges
           [,1] [,2]
      [1,]    4    5
      [2,]    1    2
      [3,]    3    6
      [4,]    0    7
      [5,]    8    9
      
      $modularity
      [1] -0.17346939 -0.07142857  0.03061224  0.19387755  0.35714286  0.00000000
      
      $membership
      [1] 0 0 0 1 1 1
      

# community_fastgreedy_impl basic

    Code
      community_fastgreedy_impl(graph = g)
    Output
      $merges
           [,1] [,2]
      [1,]    2    1
      [2,]    0    6
      [3,]    5    4
      [4,]    3    8
      [5,]    9    7
      
      $modularity
      [1] -1.734694e-01 -7.142857e-02  9.183673e-02  1.938776e-01  3.571429e-01
      [6]  5.551115e-17
      
      $membership
      [1] 1 1 1 0 0 0
      

# community_edge_betweenness_impl basic

    Code
      community_edge_betweenness_impl(graph = g, directed = FALSE)
    Output
      $removed_edges
      [1] 6 0 1 2 3 4 5
      
      $edge_betweenness
      [1] 9 1 2 1 1 2 1
      
      $merges
           [,1] [,2]
      [1,]    5    3
      [2,]    6    4
      [3,]    2    0
      [4,]    8    1
      [5,]    7    9
      
      $bridges
      [1] 7 6 4 3 1
      
      $modularity
      [1] -0.17346939 -0.09183673  0.09183673  0.17346939  0.35714286  0.00000000
      
      $membership
      [1] 0 0 0 1 1 1
      

# community_leading_eigenvector_callback_closure_impl basic

    Code
      cat("Result class:\n")
    Output
      Result class:
    Code
      print(class(result))
    Output
      [1] "igraph.eigenc"
    Code
      cat("\nMembership length:\n")
    Output
      
      Membership length:
    Code
      print(length(result$membership))
    Output
      [1] 34
    Code
      cat("\nModularity:\n")
    Output
      
      Modularity:
    Code
      print(result$modularity)
    Output
      [1] 0.3934089
    Code
      cat("\nMerges dimensions:\n")
    Output
      
      Merges dimensions:
    Code
      print(dim(result$merges))
    Output
      [1] 3 2

# community_leading_eigenvector_callback_closure_impl with start

    Code
      cat("Result with start membership:\n")
    Output
      Result with start membership:
    Code
      cat("Membership length:\n")
    Output
      Membership length:
    Code
      print(length(result$membership))
    Output
      [1] 34
    Code
      cat("\nModularity:\n")
    Output
      
      Modularity:
    Code
      print(result$modularity)
    Output
      [1] 0.2217291

# community_leading_eigenvector_callback_closure_impl errors

    Code
      community_leading_eigenvector_callback_closure_impl(graph = g, start = TRUE)
    Condition
      Error in `community_leading_eigenvector_callback_closure_impl()`:
      ! Supplied memberhsip vector length does not match number of vertices. Invalid value
      Source: <file>:<line>

# community_voronoi_impl basic

    Code
      community_voronoi_impl(graph = g)
    Output
      $membership
       [1] 3 3 3 3 0 3 2 2 1 1
      
      $generators
      + 4/10 vertices:
      [1] 2 9 7 1
      
      $modularity
      [1] 0.2222222
      

# community_voronoi_impl errors

    Code
      community_voronoi_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

