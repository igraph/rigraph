# closeness_impl basic

    Code
      closeness_impl(graph = g)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_impl(graph = g, mode = "in", normalized = TRUE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_impl(graph = g, vids = V(g), mode = c("out", "in", "all", "total"))
    Output
      $res
      [1] 0.1666667 0.1666667 0.1666667 0.1666667 0.1666667
      
      $reachable_count
      [1] 4 4 4 4 4
      
      $all_reachable
      [1] TRUE
      

# closeness_impl errors

    Code
      closeness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# closeness_cutoff_impl basic

    Code
      closeness_cutoff_impl(graph = g, cutoff = 2)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_cutoff_impl(graph = g, mode = "in", normalized = TRUE, cutoff = 1)
    Output
      $res
      [1] 1 1 1
      
      $reachable_count
      [1] 1 2 1
      
      $all_reachable
      [1] FALSE
      

# closeness_cutoff_impl errors

    Code
      closeness_cutoff_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_cutoff_impl basic

    Code
      betweenness_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 0 1 0

# betweenness_cutoff_impl errors

    Code
      betweenness_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_subset_impl basic

    Code
      betweenness_subset_impl(graph = g)
    Output
      [1] 0 1 0

# betweenness_subset_impl errors

    Code
      betweenness_subset_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_impl basic

    Code
      edge_betweenness_impl(graph = g)
    Output
      [1] 2 2

---

    Code
      edge_betweenness_impl(graph = g, directed = FALSE)
    Output
      [1] 4 4 4 4

# edge_betweenness_impl errors

    Code
      edge_betweenness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_cutoff_impl basic

    Code
      edge_betweenness_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 2 2

# edge_betweenness_cutoff_impl errors

    Code
      edge_betweenness_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_subset_impl basic

    Code
      edge_betweenness_subset_impl(graph = g)
    Output
      [1] 2 2

# edge_betweenness_subset_impl errors

    Code
      edge_betweenness_subset_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# harmonic_centrality_cutoff_impl basic

    Code
      harmonic_centrality_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 1.5 2.0 1.5

# harmonic_centrality_cutoff_impl errors

    Code
      harmonic_centrality_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_impl basic

    Code
      personalized_pagerank_impl(graph = g)
    Output
      $vector
      [1] 0.2567568 0.4864865 0.2567568
      
      $value
      [1] 1
      
      $options
      NULL
      

---

    Code
      personalized_pagerank_impl(graph = g, algo = "arpack", damping = 0.9)
    Output
      $vector
      [1] 0.2543860 0.4912281 0.2543860
      
      $value
      [1] 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LR"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# personalized_pagerank_impl errors

    Code
      personalized_pagerank_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_vs_impl basic

    Code
      personalized_pagerank_vs_impl(graph = g, reset_vids = 1)
    Output
      [1] 0.3452703 0.4594595 0.1952703

---

    Code
      personalized_pagerank_vs_impl(graph = g, algo = "arpack", reset_vids = 1,
        details = TRUE)
    Output
      $vector
      [1] 0.3452703 0.4594595 0.1952703
      
      $value
      [1] 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LR"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# personalized_pagerank_vs_impl errors

    Code
      personalized_pagerank_vs_impl(graph = NULL, reset_vids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxdegree_impl basic

    Code
      maxdegree_impl(graph = g)
    Output
      [1] 2

---

    Code
      maxdegree_impl(graph = g, mode = "in", loops = FALSE)
    Output
      [1] 2

# maxdegree_impl errors

    Code
      maxdegree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigenvector_centrality_impl basic

    Code
      eigenvector_centrality_impl(graph = g)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

---

    Code
      eigenvector_centrality_impl(graph = g, directed = TRUE, scale = FALSE)
    Output
      $vector
      [1] 0.5000000 0.7071068 0.5000000
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# eigenvector_centrality_impl errors

    Code
      eigenvector_centrality_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hub_and_authority_scores_impl basic

    Code
      hub_and_authority_scores_impl(graph = g)
    Output
      $hub
      [1] 1 1 1 1 1
      
      $authority
      [1] 1 1 1 1 1
      
      $value
      [1] 16
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

---

    Code
      hub_and_authority_scores_impl(graph = g, scale = FALSE)
    Output
      $hub
      [1] 0.4472136 0.4472136 0.4472136 0.4472136 0.4472136
      
      $authority
      [1] 0.4472136 0.4472136 0.4472136 0.4472136 0.4472136
      
      $value
      [1] 16
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

# hub_and_authority_scores_impl errors

    Code
      hub_and_authority_scores_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# strength_impl basic

    Code
      strength_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      strength_impl(graph = g, mode = "in", loops = FALSE)
    Output
      [1] 1 2 1

# strength_impl errors

    Code
      strength_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_impl basic

    Code
      centralization_impl(scores = c(1, 2, 3))
    Output
      [1] Inf

---

    Code
      centralization_impl(scores = c(1, 2, 3), theoretical_max = 2, normalized = FALSE)
    Output
      [1] 3

# centralization_impl errors

    Code
      centralization_impl(scores = package_version("1.2.3"))
    Condition
      Error in `centralization_impl()`:
      ! 'list' object cannot be coerced to type 'double'

# centralization_degree_impl basic

    Code
      centralization_degree_impl(graph = g)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 0.3333333
      
      $theoretical_max
      [1] 6
      

---

    Code
      centralization_degree_impl(graph = g, mode = "in", loops = FALSE, normalized = FALSE)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_degree_impl errors

    Code
      centralization_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_degree_tmax_impl basic

    Code
      centralization_degree_tmax_impl(nodes = 3, loops = TRUE)
    Output
      [1] 6

---

    Code
      centralization_degree_tmax_impl(nodes = 3, mode = "in", loops = FALSE)
    Output
      [1] 4

# centralization_degree_tmax_impl errors

    Code
      centralization_degree_tmax_impl(nodes = -1, loops = TRUE)
    Condition
      Error in `centralization_degree_tmax_impl()`:
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# centralization_betweenness_impl basic

    Code
      centralization_betweenness_impl(graph = g)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 2
      

---

    Code
      centralization_betweenness_impl(graph = g, directed = FALSE, normalized = FALSE)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_betweenness_impl errors

    Code
      centralization_betweenness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_betweenness_tmax_impl basic

    Code
      centralization_betweenness_tmax_impl(nodes = 3, directed = TRUE)
    Output
      [1] 4

---

    Code
      centralization_betweenness_tmax_impl(nodes = 3, directed = FALSE)
    Output
      [1] 2

# centralization_betweenness_tmax_impl errors

    Code
      centralization_betweenness_tmax_impl(nodes = -1, directed = TRUE)
    Condition
      Error in `centralization_betweenness_tmax_impl()`:
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# centralization_closeness_impl basic

    Code
      centralization_closeness_impl(graph = g)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 0.6666667
      

---

    Code
      centralization_closeness_impl(graph = g, mode = "in", normalized = FALSE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 0.6666667
      
      $theoretical_max
      [1] 0.6666667
      

# centralization_closeness_impl errors

    Code
      centralization_closeness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_closeness_tmax_impl basic

    Code
      centralization_closeness_tmax_impl(nodes = 3)
    Output
      [1] 1.333333

---

    Code
      centralization_closeness_tmax_impl(nodes = 3, mode = "in")
    Output
      [1] 1.333333

# centralization_closeness_tmax_impl errors

    Code
      centralization_closeness_tmax_impl(nodes = -1)
    Condition
      Error in `centralization_closeness_tmax_impl()`:
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# centralization_eigenvector_centrality_impl basic

    Code
      centralization_eigenvector_centrality_impl(graph = g)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      
      $centralization
      [1] 0.5857864
      
      $theoretical_max
      [1] 1
      

---

    Code
      centralization_eigenvector_centrality_impl(graph = g, directed = TRUE,
        normalized = FALSE)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      
      $centralization
      [1] 0.5857864
      
      $theoretical_max
      [1] 1
      

# centralization_eigenvector_centrality_impl errors

    Code
      centralization_eigenvector_centrality_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_eigenvector_centrality_tmax_impl basic

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = 3)
    Output
      [1] 1

---

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = 3, directed = TRUE)
    Output
      [1] 2

# centralization_eigenvector_centrality_tmax_impl errors

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = -1)
    Condition
      Error in `centralization_eigenvector_centrality_tmax_impl()`:
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# constraint_impl errors

    Code
      constraint_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_impl basic

    Code
      betweenness_impl(graph = g, vids = V(g), directed = FALSE)
    Output
      [1] 6 0 0 0 0

# harmonic_centrality_impl basic

    Code
      harmonic_centrality_impl(graph = g, vids = V(g), mode = c("out", "in", "all",
        "total"))
    Output
      [1] 4.0 2.5 2.5 2.5 2.5

# pagerank_impl basic

    Code
      pagerank_impl(graph = g, vids = V(g), directed = TRUE, damping = 0.85)
    Output
      $vector
      [1] 0.2 0.2 0.2 0.2 0.2
      
      $value
      [1] 1
      
      $options
      NULL
      

# hub_score_impl basic

    Code
      out
    Output
      $value
      [1] 4
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

# authority_score_impl basic

    Code
      out
    Output
      $value
      [1] 4
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

