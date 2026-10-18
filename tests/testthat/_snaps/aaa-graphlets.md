# graphlets_impl basic

    Code
      graphlets_impl(graph = g)
    Output
      $cliques
      $cliques[[1]]
      + 2/3 vertices:
      [1] 2 3
      
      $cliques[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      
      $Mu
      [1] 0.6665667 0.3332333
      

---

    Code
      graphlets_impl(graph = g, weights = c(3, 4), niter = 10)
    Output
      $cliques
      $cliques[[1]]
      + 2/3 vertices:
      [1] 2 3
      
      $cliques[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      
      $Mu
      [1] 1.333233 0.999900
      

# graphlets_impl errors

    Code
      graphlets_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

